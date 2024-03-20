Return-Path: <linux-gpio+bounces-4493-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF2D881518
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Mar 2024 17:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCB931C2090B
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Mar 2024 16:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782CC53E1B;
	Wed, 20 Mar 2024 16:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="Ix4wJh5x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BF152F78
	for <linux-gpio@vger.kernel.org>; Wed, 20 Mar 2024 16:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710950481; cv=none; b=NcW3yAKodrSQEYaMFiL7rAjaFEZzuFw+m6sGNURjeYSKVaFhGVuRmr4cMAdIdnZi4qol2u1BxlqT7fnhrzrG0yDiYFaBPrQ1z6ey5QZFmfCwiiWQ2o965uE8FFHfoiwpDlBAqlkXN1wnZz+tbcWyCTd42kEFWm4ZYM3QwkBn5ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710950481; c=relaxed/simple;
	bh=hkHEmKLNdlzQgU14qNN6/uWqPRZtcwoaOO6X4qaBbN8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ngvd+/Ur8rp7/HWXU0H7PR0YdkU2fSu/c/d5sE5/666cF701KPuKZ50ZrgP1uuoccdXfeRrhq68CaG1pFDasOL7Dq97pGq+1Vbt1V92NW0cYZ3QGlO+4KtJzLF9gwIJYv5NJV6z/Fr7gDXg9yIEAk37e5OJxKp5JBWHWN3FztEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=Ix4wJh5x; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4V0Cxl07wnzDqZ0;
	Wed, 20 Mar 2024 16:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1710950475; bh=hkHEmKLNdlzQgU14qNN6/uWqPRZtcwoaOO6X4qaBbN8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ix4wJh5x+9kO0egvvVGTgZeDqrumVCtFN9pETFK3maZtY6jQNQaEK/5VtAYv+viHz
	 koAdhMwpK2VlI+FCPMQgkZgmEce6jPdN5cyeAs8RTBOSGH7QXIPUxYgbt24qy7/6Co
	 uL8w6gk+MYE9vH9Tefb7BdBnWw+8JC70ETJHXUSM=
X-Riseup-User-ID: 2787AFB544DA390E878F41A02E7335D746CCDD71D5E28A7DE920FB7CEC59401A
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4V0CxW4mVVzJt50;
	Wed, 20 Mar 2024 16:01:03 +0000 (UTC)
Date: Wed, 20 Mar 2024 09:00:46 -0700
From: orbea <orbea@riseup.net>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [PATCH] bindings: cxx: link using the libtool archives
Message-ID: <20240320090046.19dc31f5@Akita>
In-Reply-To: <CAMRc=MezeyGEgVm54HYwPRvdid=r66YEv9dh647jYLuYTAWd9Q@mail.gmail.com>
References: <20240320134957.7928-1-orbea@riseup.net>
	<CAMRc=MezeyGEgVm54HYwPRvdid=r66YEv9dh647jYLuYTAWd9Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 20 Mar 2024 16:18:38 +0100
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
> > --- =20
>=20
> Thanks,
>=20
> Could you use your real name for the sake of code attribution (if we
> need a license change later on or whatever)?
>=20
> Bart

If its possible I would really prefer to not, my change is trivial and
I do not think it is significant enough to claim copyright.

So that I could easily link to it in the Gentoo issue I also made an
github PR which is gpg signed if that helps?

https://github.com/brgl/libgpiod/pull/65

