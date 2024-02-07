Return-Path: <linux-gpio+bounces-3055-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A1B84CA99
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Feb 2024 13:20:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5413A1F26E5C
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Feb 2024 12:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77C25A0F3;
	Wed,  7 Feb 2024 12:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fCFXyLqJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656B759B73
	for <linux-gpio@vger.kernel.org>; Wed,  7 Feb 2024 12:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707308391; cv=none; b=M1rLg7/3XCg/LLMqmlPqjqK6j/xysbMmSdyMpBfNFmM95rzhwPucJte9EVhh6nnoSFTsGDK/a6KVp0FJSBASz48RHVSh1Akd4LULDx80LaNFIiLBH36KwbQcGMzR2XI0rXn2Pgc3afIMoncYBjCOIQ+p3+CW4K74GSKTSpcHhqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707308391; c=relaxed/simple;
	bh=lGAcMND2NaDdmDU9b141DrAfpaiW5UmgS8bsTQ/HMhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uUkMXYGx+GfW/Ydl1+IOWNEk0a3zgR/8urLHq/U1SpIcaNSlialZ2PEZDY6Ixip+5PaZ0baW7HPPj8kxokJP6Z2XdC897D4HeVHiB8km3b6zAZxzcDW35V4mD5k6GMwtmuMuKOUkt1B7apG9QBMuV/4aQYC8/zV561XLGDFgEKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fCFXyLqJ; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4c02dfa01a8so216529e0c.1
        for <linux-gpio@vger.kernel.org>; Wed, 07 Feb 2024 04:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707308388; x=1707913188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEPUwWtoIq4EHAceeg/KJzDbLqtV6kKvWuN/Pm0FSrQ=;
        b=fCFXyLqJbXzGZIT988peHJyVmc6Qe4Pnuk9kYAl6+RXSbX91XtTblayHJidwX1AFoo
         0i5nHfSPWLLhxn44aInQuLtO+HkzIQRnPnVEbn37N6Md/Qs/lDotvuYRIgqQyb2N5NAn
         emkdOa1vRcBwy91C43hENlGEB5wgJdm8FBXnv1/mzPRLZC5Odha6Jk3TxH9y0F1aM5y3
         szqAgyni1UwhVyd4AlvC3ZNwWl/A5+wOwmGF9Tt8pTz1Ngcr5DOQeyWEpBGjb9Z7bAga
         NvPBGzhI9x1d0Q4JpibsEjwuY9eSEk/CBf1F3sxmHsuZobVE4j56RpfzJ2l9leAbRBLW
         IFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707308388; x=1707913188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEPUwWtoIq4EHAceeg/KJzDbLqtV6kKvWuN/Pm0FSrQ=;
        b=TyB0388d6AMEz1La499Jej9gF11+C+yJyw5/umfzxZYUaACYRH13UXZVAyZCjcugD8
         2mFZX4RHL3jF+iQ9suvPEnj5F1XiT3nptUXsYFLoGE3Ylqt87VbrpcXMzs4ozUcqzh+n
         n2tbnL6SVWvxlM7O69P9L7AEksyVCzNAk37Ugw2YRMbFxf1G7nWBC+qY01Uj8w5zf7fS
         B4s7XLo6SdTxpr9kF9M0lESeD9tXerJB4xYB8LuWfsEsUAXO/3K9mm3z2W1e7zgNqTRx
         Szq0IuTAjbsaewp8njlGEXJ3UHGWB1Zj+tSX2CY/Z+4DKL8+qKpTQoxHKB6dlEhFpzjw
         fQBg==
X-Gm-Message-State: AOJu0YxZHvUwLqAaAc3KNPcGktGj6WSlUySNBxBKtPP6IsB7EpxeleEl
	b+w4vrPWQrStmI3V0iwQ91HuA7GNdxNmBfwsRRm7ZY4h+jiOEcVj1+OB9nUZaAFyY69QVUrWnS9
	2VwrtSu5L6TLMDLsP/lsQ4lyFT2FNER+m919UDA==
X-Google-Smtp-Source: AGHT+IGn7YFHyXZ8ClynY1G1aKTCs/KL7ktljkC1ocYeF/oqDMUfq0IduSYo2+RYfwQpVbIezMdJ8iVYR0bQgyd/Fvc=
X-Received: by 2002:a67:cd95:0:b0:46d:2fcd:3522 with SMTP id
 r21-20020a67cd95000000b0046d2fcd3522mr1973497vsl.22.1707308388173; Wed, 07
 Feb 2024 04:19:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240201162758.50733-1-brgl@bgdev.pl> <CACRpkdbAw5NfSr8GSNiQhOzSi-tERyn=-ZroLfF-FRbsW2JviQ@mail.gmail.com>
 <2024020732-duchess-husband-8b1b@gregkh>
In-Reply-To: <2024020732-duchess-husband-8b1b@gregkh>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 7 Feb 2024 13:19:37 +0100
Message-ID: <CAMRc=MeWD-4xx9Y=P3ajO37XJAsBrZ2TyqNeCE8vkxXW1yXWVQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: set device type for GPIO chips
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 7, 2024 at 11:49=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Feb 07, 2024 at 11:45:39AM +0100, Linus Walleij wrote:
> > On Thu, Feb 1, 2024 at 5:28=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > It's useful to have the device type information for those sub-devices
> > > that are actually GPIO chips registered with GPIOLIB. While at it: us=
e
> > > the device type struct to setup the release callback which is the
> > > preferred way to use the device API.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > (...=3D
> > > +static struct device_type gpio_dev_type =3D {
>
> Can you make this structure const please?
>

I have, there's a v2 on the list already.

Thanks
Bart

> > > +       .name =3D "gpio_chip",
> > > +       .release =3D gpiodev_release,
> > > +};
> > > +       gdev->dev.type =3D &gpio_dev_type;
> > >         gdev->dev.bus =3D &gpio_bus_type;
> > >         gdev->dev.parent =3D gc->parent;
> >
> > Looks good to me (TM) but we should run this by Greg so he get the chan=
ce
> > to chime in, I doubt he will see it on LKML.
>
> Yes thanks, I wouldn't have caught it...
>
> greg k-h

