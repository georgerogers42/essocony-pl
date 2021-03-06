package Essocony::Controller::Pages;
use Mojo::Base 'Mojolicious::Controller';
use Essocony::Models::Pages;

my $pages = Essocony::Models::Pages->new(pat => "articles/pub/*.html");

# This action will render a template
sub home {
  my $self = shift;
  $self->render(title => "Mutt City", pages => $pages->pages);
}

sub page {
	my $self = shift;
	my $slug = $self->stash->{slug};
	my $page = $pages->page->{$slug};
	$self->render(title => "Mutt City: $slug", page => $page);
}

sub feed {
  my $self = shift;
  $self->render(json => $pages->data);
}

1;
