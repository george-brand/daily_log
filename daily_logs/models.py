from django.db import models

# Create your models here.
class Topic(models.Model):
    """A topic the user logging."""
    text = models.CharField(max_length=200)
    date_added = models.DateTimeField(auto_now_add=True)

    def __string__(self):
        """Return a string representation of the model."""
        return self.text

class Entry(models.Model):
    """An entry in a specific topic."""
    topic = models.ForeignKey(Topic, on_delete=models.CASCADE)
    text = models.TextField()
    date_added = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name_plural = 'entries'

    def __string__(self):
        """Return a string representation of the model."""
        return self.text[:50] + "..."
        
