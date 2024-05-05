Return-Path: <linux-gpio+bounces-6114-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5368BC05A
	for <lists+linux-gpio@lfdr.de>; Sun,  5 May 2024 14:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 242591C209B1
	for <lists+linux-gpio@lfdr.de>; Sun,  5 May 2024 12:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA7F19479;
	Sun,  5 May 2024 12:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="C4rEVt+b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86BC1862C
	for <linux-gpio@vger.kernel.org>; Sun,  5 May 2024 12:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714911914; cv=none; b=XPhB52FMhy2ydkKmChaCIUXuhjMEGNr0VfGUUN4LNGXpOOI8FcPEG8sA/Vn5pMB8T1Pp4GeEklWA5jh3DIXIVrbzahLomyrCluJ1XnYeYaS+gGv6DbHvc18m4iGICyp3STahdFyB2uCDm2nUxvm49A89q16FFpA8OOuzXevjVbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714911914; c=relaxed/simple;
	bh=yrQqbN5qDXhsCWhv8edlKrikJt0tdGrh2rwpISyK1Jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BBwpzsvwRWWb2SD9TrvZWouwAzqDVEM04rcAZqJqfJBEnJ29xWGe3ssRm/mpFGsxyuGIFLJDpIlZx4L7OFMx6F02miURkxzPMqnS314fQYZ6Vuy7Uu2QlSVTCK3Q/Qpqxs05scGaWIeZXaHvgmnGcCiIJwukcAF59qcOskJt73M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=C4rEVt+b; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51f1b378ca5so1664770e87.1
        for <linux-gpio@vger.kernel.org>; Sun, 05 May 2024 05:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1714911911; x=1715516711; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6d8pltQnbe1BNul8TKdyylJH57jCMCGH7OFNBm5Jck=;
        b=C4rEVt+b13HI8XC3SCWwlaVD4zD2doCRm2g4yQsdhiE5iO35klgZphT3h/u/RpisiH
         7yoHa2nHdEOY3AM9QPMEfwjhBcWkuohBcDXBmjZRy7WMQFknyy+Tq2iX3k0lYdMRCzni
         MlICsHei+6dF5hDf5vV8bz42G7ba8bx1+a5q+Jv5bjl8lPYmxLjzBeORfJBhwxGpcnXU
         ZAWIWIBYpuH+7RQ1oeEnZlm2xfWwU8467OEwzhv8rgeHCJ6Um7AYVyVcLeMPjVXVAvIP
         zXbkJHdqTIPNIN+JyGI5pfnir260CgZMod9PnvVN3ZJs/uXFGqpe6BwlVDQkVOeEvqei
         paig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714911911; x=1715516711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6d8pltQnbe1BNul8TKdyylJH57jCMCGH7OFNBm5Jck=;
        b=xE0tC7v3XPTLvXjt9Qk1eJso5d35h0X3Vd9U1ZpzCp+pO/jHz5XtM0JAD0HzMAsas9
         eJta39LBkco6F2tUatSkwYPoC9pZRNmyFDCjmDqqMgER1cQoKv9pmviBhHl+BGoZRBzj
         8Zp2WmHT6PMfvL6o8wx1UCOX7jDWJXLzC8wXPQMQEmVP8B/DgHBTPa424TNaA1OS9hKz
         U54OjA6+fMCYsdjREjTjDT9TNOSQOMVM1Q5wir3/+jeI+cthhxK+xyp5Nhn0SCWfoNv/
         h0q9C+l5F0cDtwFRqvq/7LLedc1HmZFJmh6XFusLFFs2WDszfS66YQHac5pFVt6DbNvX
         bO5w==
X-Forwarded-Encrypted: i=1; AJvYcCXTmeSiTY6oWvn/zYcfkdknNEQJTpzyLN8A7TKTODY4ulk/FCW80hg6pu2Xp7S3RHwlLfAG55Ph/ZGFqp0OnChc7z7fYLq+hzrpKw==
X-Gm-Message-State: AOJu0YxzhzrOxljdFwEFGd95/5w71xIT+ECs9Xs5ea/MqCy0TysRp1TZ
	wTG/k9M7JKF0TE/rh9wHIebmmWyZynM/EbastrV1Md436cVqiyHmEE6uPy/6yYa36nwUabuc5/a
	UQZS/lA/YY6jhLrtDM8yrwJI3rKKP36W55p2rCg==
X-Google-Smtp-Source: AGHT+IGHC8sNZwgMzoG3QPzD5Yufu5CNex3JNhg27cIEDBNo3bkezg4pBrhViAS/E/M0FeLM7mdMlT2yKEfcduH5taI=
X-Received: by 2002:a05:6512:4027:b0:51d:d630:365c with SMTP id
 br39-20020a056512402700b0051dd630365cmr8601279lfb.4.1714911910873; Sun, 05
 May 2024 05:25:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240424185039.1707812-1-opendmb@gmail.com> <20240424185039.1707812-3-opendmb@gmail.com>
 <CACRpkda4v6Nu8V3MVamDpfs4qnc89e8Vd8fSyaNsqJQ40GQqZg@mail.gmail.com> <45b7742c-9cde-4238-9c2c-c75dfbe9d8f3@gmail.com>
In-Reply-To: <45b7742c-9cde-4238-9c2c-c75dfbe9d8f3@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 5 May 2024 14:25:00 +0200
Message-ID: <CAMRc=MfEVCDf8sn7C-cO_Y1xa4RehQj1tvRSRtC5aj0dF6uJWA@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpio: of: support gpio-ranges for multiple gpiochip devices
To: Doug Berger <opendmb@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Phil Elwell <phil@raspberrypi.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2024 at 10:21=E2=80=AFPM Doug Berger <opendmb@gmail.com> wro=
te:
>
> On 5/3/2024 1:25 AM, Linus Walleij wrote:
> > Hi Dough,
> >
> > thanks for your patch!
> Thanks for your review!
>
> >
> > I'm a bit confused here:
> "Communication is hard" and I may be confused about your confusion, but
> hopefully we can work it out.
>
> >
> > On Wed, Apr 24, 2024 at 8:51=E2=80=AFPM Doug Berger <opendmb@gmail.com>=
 wrote:
> >
> >
> >> +               /* Ignore ranges outside of this GPIO chip */
> >> +               if (pinspec.args[0] >=3D (chip->offset + chip->ngpio))
> >> +                       continue;
> >> +               if (pinspec.args[0] + pinspec.args[2] <=3D chip->offse=
t)
> >> +                       continue;
> >
> > Here pinspec.args[0] and [2] comes directly from the device tree.
> >
> > The documentation in Documentation/devicetree/bindings/gpio/gpio.txt
> > says:
> >
> >> 2.2) Ordinary (numerical) GPIO ranges
> >> -------------------------------------
> >>
> >> It is useful to represent which GPIOs correspond to which pins on whic=
h pin
> >> controllers. The gpio-ranges property described below represents this =
with
> >> a discrete set of ranges mapping pins from the pin controller local nu=
mber space
> >> to pins in the GPIO controller local number space.
> >>
> >> The format is: <[pin controller phandle], [GPIO controller offset],
> >>                  [pin controller offset], [number of pins]>;
> >>
> >> The GPIO controller offset pertains to the GPIO controller node contai=
ning the
> >> range definition.
> I think we are in agreement here. For extra clarity, I will add that in
> my understanding pinspec.args[0] corresponds to [GPIO controller offset]
> and pinspec.args[2] corresponds to [number of pins].
>
> >
> > So I do not understand how pinspec[0] and [2] can ever be compared
> > to something involving chip->offset which is a Linux-specific offset.
> >
> > It rather looks like you are trying to accomodate the Linux numberspace
> > in the ranges, which it was explicitly designed to avoid.
> The struct gpio_chip documentation in include/linux/gpio/driver.h says:
>
>  > * @offset: when multiple gpio chips belong to the same device this
>  > *    can be used as offset within the device so friendly names can
>  > *    be properly assigned.
>
> It is my understanding that this value represents the offset of a
> gpiochip relative to the GPIO controller device defined by the GPIO
> controller node in device tree. This puts it in the same number space as
> [GPIO controller offset]. I believe it was introduced for the specific
> purpose of translating [GPIO controller offset] values into
> Linux-specific offsets, which is why it is being reused for that purpose
> in this patch.
>
> For GPIO Controllers that contain a single gpiochip the 'offset' member
> is 0 and the device tree node offsets can be applied directly to the
> gpiochip. However, when a GPIO Controller contains multiple gpiochips,
> the device tree node offsets must be translated to each individual gpioch=
ip.
>
> >
> > I just don't get it.
> >
> > So NACK until I understand what is going on here.
> >
> > Yours,
> > Linus Walleij
> I hope it makes sense now, but if not please help me understand what I
> may be missing.
>
> Thanks,
>      Doug
>

Linus,

Please let me know if this is still a NAK, if so, I'll drop this
series from my tree at least for this release.

Bart

