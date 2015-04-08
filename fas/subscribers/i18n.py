# -*- coding: utf-8 -*-
#
# Copyright © 2014-2015 Xavier Lamien.
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
__author__ = 'Xavier Lamien <laxathom@fedoraproject.org>'

from pyramid.events import (
    subscriber,
    NewRequest
    )

from fas.util import _

# Prevent from being translated
ts = _


@subscriber(NewRequest)
def add_localizer(event):
    """ Update local on client's requests. """
    request = event.request
    localizer = request.localizer

    def auto_translate(*args, **kwargs):
        """ Translate strings on client's requests. """
        return localizer.translate(ts(*args, **kwargs))

    request.localizer = localizer
    request.translate = auto_translate
