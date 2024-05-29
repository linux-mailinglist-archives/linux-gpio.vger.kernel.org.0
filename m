Return-Path: <linux-gpio+bounces-6835-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3234A8D3657
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 14:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0ECC2842F5
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 12:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E718F180A99;
	Wed, 29 May 2024 12:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="CrLHh3q0";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="L3g7PQcg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B973B295;
	Wed, 29 May 2024 12:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716985551; cv=none; b=A9gTQwh0CUxcW+AzzYg3eJjtLr/npJefCHngwCog34vuMmgvHxllgPeDSwBRJc/JVnku/JonQN0ou3Jbfo4d3YGtnw7RU+5W+J1yg5weGd9rpd/La1LmxxCkPg6L4FJjT9d+QZfy7exkO8hAooKNe6TCoP1a16oLzjESM9SG5ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716985551; c=relaxed/simple;
	bh=YsT4hWYjDMfeT9xNfMe8MpLKhiCzwhghKRZ21QGRRB0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MTtVMNstYSNqYz1tMgFXVcXXFHCTYST6pBFJrRWUUZrFuaKcQ6Mz2jlZLex5hD1JageSJF/cq3oEMZECl8F61un4l3nFyi1XJmaja7vuaIzu6CwW9XJikrZPpYoBpHkeTEk7RP2IoC98l/k511pB9AWad9KlbKFdt6Oboney/og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=CrLHh3q0; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=L3g7PQcg reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1716985549; x=1748521549;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=h6wCJKPuV/REwhmBnTwQxVGJNOOG4fA6mGSp2Sr+ZPc=;
  b=CrLHh3q0GiA27Yq3Rz71q7j3Jt1d4yVi7DAEtYBfvX7JUVRHKZ8YVpVl
   tlFpegPQDikiXP6bQtMyaVmPW/OxGLKKksg5ddmCAg0ujwsJ5JmjfBAhz
   t/0jTBHAn4+HM5MYPAOqh9IKe+nmgguH4Gax7TkX8+tz9XWuPC+eU6Brl
   6eDJUdqJeZ6MQ5F3/3f6H5+3OLuOcG4Jh/YpYavzoSkMLOsXteVEWMNPB
   tJcB+GHV9eNqLcLg4zE0s/7sstI7X3NS3rZ1iFUGvRPUBVtX+SOqjCV1K
   kbxcI4bPSBT1DsaZjqBurdtNUJ4hnqF49sAfbb0Tj0EglngIT3y9I38Ui
   g==;
X-CSE-ConnectionGUID: Ar+3VS9ZTJS5JUG7eF79tw==
X-CSE-MsgGUID: V/hwF2DLR9GTvQb6CgWydA==
X-IronPort-AV: E=Sophos;i="6.08,198,1712613600"; 
   d="scan'208";a="37128573"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 May 2024 14:25:46 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4FB6616557A;
	Wed, 29 May 2024 14:25:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1716985542;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=h6wCJKPuV/REwhmBnTwQxVGJNOOG4fA6mGSp2Sr+ZPc=;
	b=L3g7PQcgYa/GJ8z3NFpvhkYQk1wt+BnyRJiL0XUU2ekdnzeUSq2m84Ao+HOC1SE8q/Fnaf
	ydsAI0e0sMBH+6tiRko9WeYs49R+T8vQ10wOREW3X8SuFSDrGXH973sOzsDrLBRtb+KHHx
	5hXTDJCp+4PT/0Z0J+lzCi3mL2U4Cwdp7V8MhH2hNRBH7mRiSUaSaLZWNelgFgjTQ8IGhU
	AScHm9CZVj/ne1XlC1c1xLSBKp1gL18K6tIBUP0fosUYsaMoL/W6r/t8bmLFP7rRHeOsiQ
	RJ/S8YGJ5z/km+A6nJx9hXlV8NkpLAtHAi2OfIHQ3vNA44yQQEXXSHSzw7tZow==
Message-ID: <9e4cfa2afe16c6b4dd5db425d8248592daa737c2.camel@ew.tq-group.com>
Subject: Re: [PATCH 4/8] gpio: tqmx86: introduce _tqmx86_gpio_update_bits()
 helper
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@tq-group.com>, linux@ew.tq-group.com
Date: Wed, 29 May 2024 14:25:42 +0200
In-Reply-To: <28f4d8aa-917d-4666-b59d-bed3ebfab2e2@lunn.ch>
References: <cover.1716967982.git.matthias.schiffer@ew.tq-group.com>
	 <0a21e3f14742e9adcf29361f7f2867199cd0dd4a.1716967982.git.matthias.schiffer@ew.tq-group.com>
	 <28f4d8aa-917d-4666-b59d-bed3ebfab2e2@lunn.ch>
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

On Wed, 2024-05-29 at 14:19 +0200, Andrew Lunn wrote:
>=20
> On Wed, May 29, 2024 at 09:45:16AM +0200, Matthias Schiffer wrote:
> > Simplify a lot of code in the driver by introducing helpers for the
> > common RMW pattern. No tqmx86_gpio_update_bits() function with builtin
> > locking is added, as it would become redundant with the following fixes=
,
> > which further consolidate interrupt configuration register setup.
> >=20
> > No functional change intended.
> >=20
> > Fixes: b868db94a6a7 ("gpio: tqmx86: Add GPIO from for this IO controlle=
r")
> > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > ---
> >  drivers/gpio/gpio-tqmx86.c | 40 ++++++++++++++++++++++----------------
> >  1 file changed, 23 insertions(+), 17 deletions(-)
> >=20
> > diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
> > index 613ab9ef2e744..7a851e1730dd1 100644
> > --- a/drivers/gpio/gpio-tqmx86.c
> > +++ b/drivers/gpio/gpio-tqmx86.c
> > @@ -54,6 +54,17 @@ static void tqmx86_gpio_write(struct tqmx86_gpio_dat=
a *gd, unsigned int reg,
> >  	iowrite8(val, gd->io_base + reg);
> >  }
> > =20
> > +static void _tqmx86_gpio_update_bits(struct tqmx86_gpio_data *gd,
> > +				     unsigned int reg, u8 mask, u8 val)
>=20
> Why the _ prefix? This is a local function, it is static, so you don't
> have name space issues. Functions starting with _ are those you should
> not call without a good reason, there is generally a version without
> the _ prefix which is the real function to use. So i would drop the _.

My intention was to mark functions that need to be called while holding the=
 spinlock with a _
prefix. Should I just remove the prefix and add a comment instead?

Matthias


>=20
> This is also not a fix. Please read:
>=20
> https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
>=20
> and stick to the rules described there.
>=20
> I don't know how the GPIO tree works, but for netdev, about a week
> after fixes are merged, they appear in net-next. So you can then build
> on top of them for development work.
>=20
> 	Andrew

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

