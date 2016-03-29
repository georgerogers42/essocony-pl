package Essocony::Models::Page;
use Moo;
use DateTime::Format::Pg;
use namespace::clean;

has title => (is => 'ro');
has slug => (is => 'ro');
has author => (is => 'ro');
has date => (is => 'ro');
has contents => (is => 'ro');

has posted => (is => 'lazy');

sub _build_posted {
	my $self = shift;
	DateTime::Format::Pg->parse_datetime($self->date);
}

1;
