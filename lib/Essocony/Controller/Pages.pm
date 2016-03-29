package Essocony::Controller::Pages;
use Mojo::Base 'Mojolicious::Controller';
use Essocony::Models::Pages;

my $pages = Essocony::Models::Pages->new(pat => "articles/*.html");

# This action will render a template
sub home {
  my $self = shift;

  $self->render(title => "Essocony", pages => $pages->pages);
}

sub page {
	my $self = shift;
	my $slug = $self->stash->{slug};
	my $page = $pages->page->{$slug};
	$self->render(title => "Essocony&mdash;$slug", page => $page);
}

1;
