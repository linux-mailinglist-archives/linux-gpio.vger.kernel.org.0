Return-Path: <linux-gpio+bounces-4502-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D87D18859FF
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Mar 2024 14:35:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15F4E1C216D9
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Mar 2024 13:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1332984A41;
	Thu, 21 Mar 2024 13:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="kuqfWO6p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6565474D
	for <linux-gpio@vger.kernel.org>; Thu, 21 Mar 2024 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711028096; cv=none; b=griPV97Ow+K2jbOBjuAW+7auAsoPCyWepckT9J+TIo56c5PBtjLrgUi2sqNDHB/R+vjm6uxjuS/XDxtTNswpAQeXHbuycyd9hVUycpkpBbolQKM8v/1wRIDkWZ1HVEc5xXYP5t9iIlaYiQHv4ccBzNeU24o/suHYhyt0+IHaWtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711028096; c=relaxed/simple;
	bh=BvIKwH1KqwJgs3m/iARR9I1CcBzGEnDn6vllkNqgE2w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZNIHkElQVekWFXwWCpF9NnU+3iOtdRvHfeY+gaRkipzxRDWij2aJgNOIBS9CAKVOQYkQxiUk1lU56EXYfcNh9A3IEyeZnOGoZ1mqFyUEdGIQswQhFxAoQVcv6dt+eaZZQkXL0qUe+FSdRUf5b/f/XGmZC0XR6MMN5gOh8IZn3+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=kuqfWO6p; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4V0mfJ0dMXz9w8J;
	Thu, 21 Mar 2024 13:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1711028088; bh=BvIKwH1KqwJgs3m/iARR9I1CcBzGEnDn6vllkNqgE2w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kuqfWO6p80/ak20XlDJgjWc8uZM/5fmSoSwa+/1Zo9pSOwTtJAiJXHQUTLEgdvb8J
	 aj/44ufND7GudOwhmeSdAc+IP68hSOE/l9iZUm6uKL66kCS2AUx3WH2SXydrJpoULL
	 BjDgPI3GAnkFTWF1A3Zt+xSiLOc28DBEwTLz/rnU=
X-Riseup-User-ID: AA81B88C934B2C123CC7F3742630A77133A10846D6D73076FD0F95C49CE8D78E
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4V0mfH627YzJrS1;
	Thu, 21 Mar 2024 13:34:47 +0000 (UTC)
Date: Thu, 21 Mar 2024 06:34:46 -0700
From: orbea <orbea@riseup.net>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [PATCH] bindings: cxx: link using the libtool archives
Message-ID: <20240321063446.0cfd3229@Akita>
In-Reply-To: <CAMRc=Mc1JOf97jQKPL_k3u=NWJBf2aGGDPTw5kaem3t3SzSxig@mail.gmail.com>
References: <20240320134957.7928-1-orbea@riseup.net>
 <CAMRc=Mc1JOf97jQKPL_k3u=NWJBf2aGGDPTw5kaem3t3SzSxig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 20 Mar 2024 17:43:46 +0100
Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> On Wed, Mar 20, 2024 at 2:50=E2=80=AFPM <orbea@riseup.net> wrote:
> >
> > From: orbea <orbea@riseup.net>
> >
> > When linking with internal dependencies that were built with
> > libtool the most reliable method is to use the libtool archive
> > (.la) files.
> >
> > When building with slibtool it fails when it doesn't find the
> > -lgpiod linker flag, but if libgpiod is already installed to the
> > system it will be built using the system version instead of the
> > newly built libraries.
> >
> > Gentoo issue: https://bugs.gentoo.org/913899
> >
> > Signed-off-by: orbea <orbea@riseup.net>
> > ---
> >  bindings/cxx/Makefile.am          | 2 +-
> >  bindings/cxx/examples/Makefile.am | 2 +-
> >  bindings/cxx/tests/Makefile.am    | 6 +++---
> >  3 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/bindings/cxx/Makefile.am b/bindings/cxx/Makefile.am
> > index 1eafaa2..e2a89cf 100644
> > --- a/bindings/cxx/Makefile.am
> > +++ b/bindings/cxx/Makefile.am
> > @@ -24,8 +24,8 @@ libgpiodcxx_la_CXXFLAGS =3D -Wall -Wextra -g
> > -std=3Dgnu++17 libgpiodcxx_la_CXXFLAGS +=3D -fvisibility=3Dhidden
> > -I$(top_srcdir)/include/ libgpiodcxx_la_CXXFLAGS +=3D
> > $(PROFILING_CFLAGS) libgpiodcxx_la_LDFLAGS =3D -version-info $(subst
> > .,:,$(ABI_CXX_VERSION)) -libgpiodcxx_la_LDFLAGS +=3D -lgpiod
> > -L$(top_builddir)/lib libgpiodcxx_la_LDFLAGS +=3D $(PROFILING_LDFLAGS)
> > +libgpiodcxx_la_LIBADD =3D $(top_builddir)/lib/libgpiod.la
> >
> >  include_HEADERS =3D gpiod.hpp
> >
> > diff --git a/bindings/cxx/examples/Makefile.am
> > b/bindings/cxx/examples/Makefile.am index 64ced20..eca4d64 100644
> > --- a/bindings/cxx/examples/Makefile.am
> > +++ b/bindings/cxx/examples/Makefile.am
> > @@ -3,7 +3,7 @@
> >
> >  AM_CXXFLAGS =3D -I$(top_srcdir)/bindings/cxx/ -I$(top_srcdir)/include
> >  AM_CXXFLAGS +=3D -Wall -Wextra -g -std=3Dgnu++17
> > -AM_LDFLAGS =3D -lgpiodcxx -L$(top_builddir)/bindings/cxx/
> > +LDADD =3D $(top_builddir)/bindings/cxx/libgpiodcxx.la
> >
> >  noinst_PROGRAMS =3D \
> >         async_watch_line_value \
> > diff --git a/bindings/cxx/tests/Makefile.am
> > b/bindings/cxx/tests/Makefile.am index 02b5b6d..4d40d33 100644
> > --- a/bindings/cxx/tests/Makefile.am
> > +++ b/bindings/cxx/tests/Makefile.am
> > @@ -4,9 +4,9 @@
> >  AM_CXXFLAGS =3D -I$(top_srcdir)/bindings/cxx/ -I$(top_srcdir)/include
> >  AM_CXXFLAGS +=3D -I$(top_srcdir)/tests/gpiosim/
> >  AM_CXXFLAGS +=3D -Wall -Wextra -g -std=3Dgnu++17 $(CATCH2_CFLAGS)
> > -AM_LDFLAGS =3D -lgpiodcxx -L$(top_builddir)/bindings/cxx/
> > -AM_LDFLAGS +=3D -lgpiosim -L$(top_builddir)/tests/gpiosim/
> > -AM_LDFLAGS +=3D -pthread
> > +AM_LDFLAGS =3D -pthread
> > +LDADD =3D $(top_builddir)/bindings/cxx/libgpiodcxx.la
> > +LDADD +=3D $(top_builddir)/tests/gpiosim/libgiosim.la =20
>=20
> Please test your changes, this is a typo and it doesn't build. It
> should have been "libgpiosim".
>=20
> I fixed it up when applying.
>=20
> Thanks,
> Bartosz
>=20
> >
> >  noinst_PROGRAMS =3D gpiod-cxx-test
> >
> > --
> > 2.43.2
> >
> > =20

Thank you and apologies, I neglected to mention that I was having a
hard time getting the tests to build because the check2 in Gentoo
doesn't seem compatible with what you expect. Maybe its too new?

(Sending this twice because I forgot to CC the list)

