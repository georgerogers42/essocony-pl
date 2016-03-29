package Essocony::Models::Pages;
use autodie;
use Moo;
use JSON;
use Essocony::Models::Page;
use namespace::clean;

has pat => (is => 'ro');
has pages => (is => 'lazy');
has page => (is => 'lazy');

sub _build_pages {
	my $self = shift;
	my $pat = $self->pat;
	my @pages;
	while(my $fname = <"$pat">) {
		open my $fh, "<", $fname;
		my @para;
		while(my $line = <$fh>) {
			last if $line eq "\n";
			push @para, $line;
		}
		my $meta = decode_json(join "", @para);
		my $contents = join "", <$fh>;
		push @pages, Essocony::Models::Page->new(%$meta, contents => $contents);
		close $fh;
	}
	return [sort { $b->posted <=> $a->posted } @pages];
}

sub _build_page {
	my $self = shift;
	my %pages;
	for my $page (@{$self->pages}) {
		$pages{$page->slug} = $page;
	}
	return \%pages;
}

1;
