Return-Path: <linux-gpio+bounces-33360-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6M6wH2cVtGlkgwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33360-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 14:47:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9532C2842E9
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 14:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 208AD31B6765
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 13:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E18D399036;
	Fri, 13 Mar 2026 13:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HW+KdP2q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6149396576
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 13:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408469; cv=none; b=eywrEMGX3MFozHM0Sz0/mebpoHY+bv4wuqUajVGrp3k2O2pwSYhIkU0mL85cZRja8rj/P+/wCjtXddeBdVVT2Y0z+hYo2D0xYsop7A4A0s99DAzVJ31rXtA7jhpQWmPVGIvMxHNGSs/jxsPe2Bru1No4ZXG9p7yQ/qDVQQvKMxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408469; c=relaxed/simple;
	bh=iiGCp4gCpHJpxXrAaRueWXFbUKqAWXYuSbsFhu4qGfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZL95dQnRjPKtY219E6dDyfefYuY5pyZ2cKctiqe/MngsjNe1glmUmgZvqlLZsz6d+5UW3h3KxWbCopKG/BNgNbnWGk8iB2G7jcuhHwGWXyG68cp9dGU1jk3e0RJUFDBLuNW+30mFE2UCrnfciOTftsNvj5/3YUs47T/AtfjbRW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HW+KdP2q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865C2C2BC9E
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 13:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773408469;
	bh=iiGCp4gCpHJpxXrAaRueWXFbUKqAWXYuSbsFhu4qGfc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HW+KdP2qxiOJOvnV/04JVuWzfxAqpgF4RCdDqvVH/GBFFwfGCxJrOIgK7tDZjaNmJ
	 19DfP5cpPO59olALavR9xVDLcGg8Nq5/h76aJ972ES15JtmZT+z+4Dr44v4cRe0RIF
	 sNEHdaEjogskzWGv18ZVjVeIrR6db3/2F6UAgF/vRKW54btF2Je6E+xszAOSHfstdx
	 q2GAZvXP7PD6FT5CVmaLfz4xwX9I7zwY+NFYx6r/1m69PWTKpZB5JPC3QHo/sScG9T
	 lLZICP+zNNwD2OEA8Jp84b5sX4Mt7zRUBMvh7AeKsz9pYTLaEoyluu6w/FHP5l01Ij
	 hq2TIKA3jK2LQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a159c1e65aso2120222e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 06:27:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+s3hjYPsUWbtC2Jqq9z9gzj2bDdw+dPvdxkIPr+KdByOA0MpPdhvxpmcP4WPpD6IcqRdKntB4Va3b@vger.kernel.org
X-Gm-Message-State: AOJu0YziMfpPM78Bwwv5BHGdaWZ9hLvlmidJ66XUV5zKSYoUa50Zo7+y
	xaOmjpBQn1zbXHIAmgDfcEBAXD1QTSjOzKaJHyPmtVHYL773mlja2wgLvnWglZDDZoCiCRkf0L9
	TC4EB+660ltFfBRtvf1jBPSx4w4vQR7CrG+1WBVcTJA==
X-Received: by 2002:a05:6512:40f:b0:5a1:2f7b:b5b0 with SMTP id
 2adb3069b0e04-5a162b25a0cmr843594e87.23.1773408468012; Fri, 13 Mar 2026
 06:27:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313-gpio-timberdale-swnode-v1-0-4df2e9b1dab5@oss.qualcomm.com>
 <20260313-gpio-timberdale-swnode-v1-2-4df2e9b1dab5@oss.qualcomm.com> <abPlPQMPZyOL_byn@ashevche-desk.local>
In-Reply-To: <abPlPQMPZyOL_byn@ashevche-desk.local>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 13 Mar 2026 14:27:36 +0100
X-Gmail-Original-Message-ID: <CAMRc=McJy2Fo4xarGmBtNpDi+7J8mvu_Q3G9wqddUaPhq8rbaQ@mail.gmail.com>
X-Gm-Features: AaiRm50cbaBuhenNoQJ6VRfGr2jj3DHHKLcZNv3C5-qqpuBqryLWQRY5e7xdrkI
Message-ID: <CAMRc=McJy2Fo4xarGmBtNpDi+7J8mvu_Q3G9wqddUaPhq8rbaQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpio: timberdale: use device properties
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33360-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9532C2842E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 11:21=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Mar 13, 2026 at 11:04:49AM +0100, Bartosz Golaszewski wrote:
> > The top-level MFD driver now passes the device properties to the GPIO
> > cell via the software node. Use generic device property accessors and
> > stop using platform data. We can ignore the "ngpios" property here now
> > as it will be retrieved internally by GPIO core.
>
> ...
>
> > +     err =3D device_property_read_u32(dev, "intel,gpio-base", &gc->bas=
e);
>
> In drivers/mfd/intel_quark_i2c_gpio.c we use 'gpio-base' and I prefer to =
have
> it common since it's Linux only property for now. Alternatively patch tha=
t to
> have a snps prefix.
>

So "gpio-base" and "snps,irq-base" for the properties?

> > +     if (err)
> > +             return err;
>
> ...
>
> >       err =3D devm_gpiochip_add_data(&pdev->dev, gc, tgpio);
> >       if (err)
> >               return err;
> >
> > +     if (gc->ngpio > 32)
> > +             return dev_err_probe(dev, -EINVAL, "Invalid number of pin=
s\n");
> > +
> >       /* make sure to disable interrupts */
> >       iowrite32(0x0, tgpio->membase + TGPIO_IER);
> >
> >       if (irq < 0 || tgpio->irq_base <=3D 0)
> >               return 0;
> >
> > -     for (i =3D 0; i < pdata->nr_pins; i++) {
> > +     for (i =3D 0; i < gc->ngpio; i++) {
> >               irq_set_chip_and_handler(tgpio->irq_base + i,
> >                       &timbgpio_irqchip, handle_simple_irq);
> >               irq_set_chip_data(tgpio->irq_base + i, tgpio);
>
> Shouldn't this be done in the respective callbacks before the
> devm_gpiochip_add_data() finishes? (Yes, it's not related to this
> patch, but it is related to seems racy driver initialisation.
>

Sure, let's not it but I'm not going to do this as part of this
series, let me clean up all the headers first.

Bart

