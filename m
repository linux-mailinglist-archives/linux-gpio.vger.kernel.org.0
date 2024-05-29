Return-Path: <linux-gpio+bounces-6839-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D69668D36CF
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 14:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 139A81C2274D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 12:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB204C83;
	Wed, 29 May 2024 12:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="FLFBtbDx";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Ybwd9FSZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C666610799;
	Wed, 29 May 2024 12:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716987306; cv=none; b=FA8gvQYFbVPfRW8bb0VndRcOPTEtJokfYmr/QeM3jrOFANJ+qFX6kf6Dm7yR8N8C52HG2UczRa25ygH5CVfGcA+H2phgkqRB5R96sERRWetBCKm2YkQmbLh8tp9GlM3/qe7VO0x0/c4+gNfpYI42kCEVb6n7HnT7oiOurDeVMwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716987306; c=relaxed/simple;
	bh=cW3+J5g9mAKtQbuc3AqY2+EuRfTIIGpTTyo0Q29eH/I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V0N29KcPyFrZi1kC+pm9fpssmQuq8hJJTcYeEhVJLwZk5p4UihssjvKyFzU+6K8MpJFY9guEgK9eBwJ73H+uGvMIo45igo04oJur572Pr1aUHBqmc4uokr59MDoHrXuJyC16pLtkE6pDC7DQUhoyyYQ7RIMWOrT6aMxrD0IqVPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=FLFBtbDx; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Ybwd9FSZ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1716987302; x=1748523302;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=mg1ZMEN7i1mpW546Tn968v5+HhfztaRu+3KyyqxuRyo=;
  b=FLFBtbDxO068C1tqy8dRiiL8vgvKMJFugDBiqD7wPrljBDLvwtuqJ4Ge
   /vr8mSDDhOY9XZi88j4kkuvvk1B1wnd1QLiKT0QXD00HdP60uGbXJJB4L
   WZORq4o0tjokka25QSHSThsm1OldPBSrwBe4icDdd9Ex3qSEZ9dPOu194
   EliEt7GpdL5xC3KwUQJR80BP8us9jTGuqyxeZnI2PQfXwEbUtzzMtv8uL
   +KHKLQCbMANYk2ePX8mhbCTB1jcszU/t65FnPDjWVrp4GuE726ibi7AE2
   ok5q8eSLyPWTszh06wHx63TX7FnTDAVpLMlFHpZ/qsGOHfbvtFjH1hfpT
   g==;
X-CSE-ConnectionGUID: wwVPb7adTTOxqNzRc8Jp9g==
X-CSE-MsgGUID: yZeP8SNbRKicvpung8VlSg==
X-IronPort-AV: E=Sophos;i="6.08,198,1712613600"; 
   d="scan'208";a="37129201"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 May 2024 14:54:59 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 11B3E16588A;
	Wed, 29 May 2024 14:54:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1716987295;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mg1ZMEN7i1mpW546Tn968v5+HhfztaRu+3KyyqxuRyo=;
	b=Ybwd9FSZmODL030sd27we+lRoWjq9KTmmZFrsCQlkue3ZgnZ7AF0f7WTuwQLCu/3CmXCFS
	5lfxIVl5aiIxuJ6p16cxWN3+wq0Zh9VHEkgVdAxHngUgCPpoeEy62I2P0bMd8tS40xbcW4
	H82sXcgVn+nNnFFqBYqjzLy9HF5eWKVmSiHUIad3+SVd9c59dVUQm3NWK6Kf9zXutyoSTd
	GkF+J2Xp5woAcaQFrbaY8Kha3Dh7S9aJ0ascIEfzM0rKWz8T5HJ5ZaB6DuQcLDl9Eer7Ax
	fRHq6PBG31NxFwMOlOfPUTFIec6H9UHpP8NSNmjfv6jnd2bOQ+wBjfHsu7Rc5g==
Message-ID: <ad4dee46c4e0e508c54dd79bab7f45060099ef9b.camel@ew.tq-group.com>
Subject: Re: [PATCH 0/8] gpio-tqmx86 fixes
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andrew Lunn <andrew@lunn.ch>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Gregor Herburger
	 <gregor.herburger@tq-group.com>, linux@ew.tq-group.com
Date: Wed, 29 May 2024 14:54:54 +0200
In-Reply-To: <CAMRc=MeN+QzzSy1BwiD57Y3vTF9Ups=6dtWuFbPmxzOxic=arQ@mail.gmail.com>
References: <cover.1716967982.git.matthias.schiffer@ew.tq-group.com>
	 <CAMRc=MeN+QzzSy1BwiD57Y3vTF9Ups=6dtWuFbPmxzOxic=arQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 2024-05-29 at 14:08 +0200, Bartosz Golaszewski wrote:
> On Wed, May 29, 2024 at 9:46=E2=80=AFAM Matthias Schiffer
> <matthias.schiffer@ew.tq-group.com> wrote:
> >=20
> > This is the first series of improvements to the tqmx86 GPIO driver,
> > which fixes some long-standing bugs - in particular, IRQ_TYPE_EDGE_BOTH
> > can never have worked correctly.
> >=20
> > Other patches in the series are code cleanup, which is included as it
> > makes the actual fixes much nicer. I have included the same Fixes tag i=
n
> > all commits, as they will need to be cherry-picked together.
> >=20
> > A second series with new features (changing GPIO directions, support
> > more GPIOs on SMARC TQMx86 modules) will be submitted when the fixes
> > have been reviewed and merged.
> >=20
> > Gregor Herburger (1):
> >   gpio: tqmx86: fix typo in Kconfig label
> >=20
> > Matthias Schiffer (7):
> >   gpio: tqmx86: introduce shadow register for GPIO output value
> >   gpio: tqmx86: change tqmx86_gpio_write() order of arguments to match
> >     regmap API
> >   gpio: tqmx86: introduce _tqmx86_gpio_update_bits() helper
> >   gpio: tqmx86: add macros for interrupt configuration
> >   gpio: tqmx86: store IRQ triggers without offsetting index
> >   gpio: tqmx86: store IRQ trigger type and unmask status separately
> >   gpio: tqmx86: fix broken IRQ_TYPE_EDGE_BOTH interrupt type
> >=20
> >  drivers/gpio/Kconfig       |   2 +-
> >  drivers/gpio/gpio-tqmx86.c | 151 ++++++++++++++++++++++++++-----------
> >  2 files changed, 106 insertions(+), 47 deletions(-)
> >=20
> > --
> > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, =
Germany
> > Amtsgericht M=C3=BCnchen, HRB 105018
> > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan=
 Schneider
> > https://www.tq-group.com/
> >=20
>=20
> Hi Matthias!
>=20
> Not all patches in this series are fixes (as in: warrant being sent
> upstream outside of the merge window). Please split the series into
> two with the first one containing actual fixes to real bugs and the
> second for any refactoring and improvements.
>=20
> Bart


Hi Bartosz,

as explained in the cover letter, I've found that the fixes become much nic=
er to implement (and to
review) if they are based on the refactoring. I can leave out _tqmx86_gpio_=
update_bits for now, but
removing "add macros for interrupt configuration" and "store IRQ triggers w=
ithout offsetting index"
does make the actual fixes "store IRQ trigger type and unmask status separa=
tely" and "fix broken
IRQ_TYPE_EDGE_BOTH interrupt type" somewhat uglier.

That being said, you're the maintainer, and I will structure this series in=
 any way you prefer. I
can remove the mentioned refactoring, even though it makes the fixes less p=
leasant. Another option
would be that I can submit just the refactoring for -next for now, and leav=
e the fixes for a future
series. Let me know how you want to proceed.

Thanks,
Matthias

