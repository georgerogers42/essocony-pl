package Essocony::Controller::Pages;
use Mojo::Base 'Mojolicious::Controller';
use Essocony::Models::Pages;

my $pages = Essocony::Models::Pages->new(pat => "articles/*.html");

# This action will render a template
sub home {
  my $self = shift;

  $self->render(title => "Essocony", pages => $pages->pages);
}

1;
