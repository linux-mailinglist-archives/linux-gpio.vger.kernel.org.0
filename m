Return-Path: <linux-gpio+bounces-14023-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C019F7E34
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 16:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8EC416474C
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 15:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C488E154C04;
	Thu, 19 Dec 2024 15:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="M4dKOcvi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D618633E;
	Thu, 19 Dec 2024 15:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734622688; cv=none; b=MO9sFQh9QReTm9fhW8lMaXKzBuOIbjTTotVEwFBGORYEyDmlllJFiFiuGPxwcDK6eBhFC+h7QleNlPUjTsIYQBUvTweZOLG0Ep5bCGIlxC4bD2z1fRP1k+M+aRFqK/0Mro7tnYkiNV1uBgrVNFcIK0DB3ItadvOZraUyXkhOf7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734622688; c=relaxed/simple;
	bh=F3I3LZwiEPYm4JADuyHpAJfEZXwtoRIikDVilBor88s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D00at67/gVFLWIcqUhUbO1mUwDE/ujXLmKnPCGGk53NeHIJiderwcDKZdbFcYR2QU3oiQhuSpJT3abiFcBqjzds2GYz2A7UWZEp42LBXl15Z6P9yOTJCwDSK0oX72Wu7QHWNo9Cjorp7eN4TEcmmkDzQkAOZqZc7DQ7vkIIn08M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=M4dKOcvi; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7312140009;
	Thu, 19 Dec 2024 15:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734622684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EhM0eHXkZQ1nSAIj+E/P44/jiZAc3P/aSHP3V7PZYUc=;
	b=M4dKOcviglGDgu7/R/fEYPF8h+48nNQZkuo3q450xIvE50MYq+pZ3KJaUd9/GdkAx1zwxM
	JBAdfvlCogwPBbnvCowryBwCV6/mMkHhWcjCy2uAzgB6BrbHUTIdWiCP/XgSPnzH9tPMNb
	yAuoMSSBi9woF8o7v9pIV3koUachnPLAue3h+1CPchQL3klzhavRY0lJfxy6HIRMzDRBFa
	cJK2WPcZ2zk6pWZp9UCr42moMErgurzISnN46RJYjgAWZayul9Zdt2po34xo4FAEKFHLXd
	H0USjPCIaoOzcxw1UDLQeREuK7JJHrAYPRNYgxHGT6+h3/EpFtVwffjo72djqA==
Date: Thu, 19 Dec 2024 16:38:02 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH] gpio: pca953x: log an error when failing to get the
 reset GPIO
Message-ID: <20241219163802.01a6a7b4@booty>
In-Reply-To: <CAMRc=Mf7=9N1Wo642XnGJ+nzqBY8N3D_cHb3TnsG93y+KTqBKQ@mail.gmail.com>
References: <20241219-pca953x-log-no-reset-gpio-v1-1-9aa7bcc45ead@bootlin.com>
	<CAMRc=Mf7=9N1Wo642XnGJ+nzqBY8N3D_cHb3TnsG93y+KTqBKQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: luca.ceresoli@bootlin.com

Hi Bartosz,

+Cc: Steve (original author of the changed lines)

On Thu, 19 Dec 2024 15:41:45 +0100
Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> On Thu, Dec 19, 2024 at 10:39=E2=80=AFAM Luca Ceresoli
> <luca.ceresoli@bootlin.com> wrote:
> >
> > When the dirver fails getting this GPIO, it fails silently. Log an error
> > message to make debugging a lot easier by just reading dmesg.
> >
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >  drivers/gpio/gpio-pca953x.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> > index 272febc3230e90baf370811f498383b9fb12cc6f..be4c9981ebc404ad5c1e1b0=
ba9f9f948122de462 100644
> > --- a/drivers/gpio/gpio-pca953x.c
> > +++ b/drivers/gpio/gpio-pca953x.c
> > @@ -1088,7 +1088,8 @@ static int pca953x_probe(struct i2c_client *clien=
t)
> >                  */
> >                 reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GP=
IOD_OUT_LOW);
> >                 if (IS_ERR(reset_gpio))
> > -                       return PTR_ERR(reset_gpio);
> > +                       return dev_err_probe(dev, PTR_ERR(reset_gpio),
> > +                                            "Failed to get reset gpio\=
n");
> >         }
> >
> >         chip->client =3D client;
> >
> > --- =20
>=20
> Fixes: and Cc: stable tags?

I haven't been considering my patch a fix but rather an improvement.
However in case if you think it should be considered a bugfix, then
this should be the fixes line:

Fixes: 054ccdef8b28 ("gpio: pca953x: Add optional reset gpio control")

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

