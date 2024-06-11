Return-Path: <linux-gpio+bounces-7371-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD072904475
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 21:22:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BE071F232D9
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 19:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37F68004E;
	Tue, 11 Jun 2024 19:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="h+yPVw8g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3177F49B
	for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 19:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718133773; cv=none; b=ZCu8d+QdBsHYkprhS5+DRIVkTV89yBr+1dAj5XeICVmfUoebvCe7BcBEvck6cFbPR8GKQLnlHhquEcYTEWsBtZc/PFbIsqcT//p3Tldti4tr+EjU+hT7yLiHipjAOeQOiro/1jTdXMzh0/aEogMVivswJYOvaMO5zAZk6j3VQ/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718133773; c=relaxed/simple;
	bh=g32DqZ4Zw2NT9rCy5U0Tm8ZCkQUe0pbtli78Z4pIEI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxfCK/Cx7+mL3lhGcGq72x3zmjwJxJ+90hGIYqw9jeBaeHRjRfBvHa6FCn3vfyZ3PrKrgsGLvXUmGbnWv/F9vtDHOU/DSFnaL09kGLG2GgWCBdE8B0g5TC4Q5aXuOFgqYQXfH24N9Cpo2pYnTrCJs+Zp4SH7DuOUE1eJ6n48mM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=h+yPVw8g; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52c8c0d73d3so3177469e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 12:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718133769; x=1718738569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9RP9lrgWPxfxWq9LmJMbygDqOUO8YvAmutBVOITuNW4=;
        b=h+yPVw8gDiKJTLAWZDffzAhvdWiLfg6+3TMi31DIwRwvX+X8O2VIyplrfSWBaE3lhW
         RG2q17UN1dpmt5zUTLy2KtIp4LNYwBtQhOU7TeCmguz5/biWr7bEanr0WA/awvjNfc/v
         X/egyIsPkqihJCJ43Xhs3lBiuhwDDAfras25hVeJja6+rDoqMjoaix8DL8TG5ISXvuNH
         417C3bxcvsSp+8ELv+piywygCtLmQ8ArEKtSEUdujRrOAgzTGyHxITZvlD+LHCYQv8hX
         BnHzYz7ORdMhmy+QjkpeCtraKw5nlvQXZPUtbzDfRhqn3N0TL8TSipd0NNpeM7N8Kt5J
         zKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718133769; x=1718738569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RP9lrgWPxfxWq9LmJMbygDqOUO8YvAmutBVOITuNW4=;
        b=alnyRz3udj6Whn9tCeZWzUOLvchYRxT5Qjds0G9jdcvqMphe/UzF5zntuf8Ylp7vY0
         4Thc+9g5Dtso2AweeslJuY5yVjzE6s4/9dPznI4QGgVw1vwatGkeF52KbUA4QVhX0Sqh
         tbEtnA4u/uFLrtFaYrLuDCbNAIgoqT/3GCJ1YuYqUFAY1tjbZPt6dsgpitU9Wlt6b0pG
         YtMvjGccMfrHbXDC8whATdxqNusVV604cRlSMbyVaDb56AsECPBqZXn7c8XuSSGqrOXn
         ZQm0MIozgGHNxJAPhB+10u0jjRlkGlT+b8T+nmcbgnMqpBH7YaVXsIkdHyfpEbRaK4X1
         bcYw==
X-Forwarded-Encrypted: i=1; AJvYcCUTm9zlBhjatjN+xgpECKeczl5Zthl2gyaDbffROk3X5hXvzMSyNp14VsXxOxDpJb7qvAcpm/+c8wT3SosmEoNANx9BKYIY2JH5oA==
X-Gm-Message-State: AOJu0Yx9rf4n6JLdVKWv7JdGMQvHGTmMsX+6Duox1GOhdbrKum9uQQ0R
	HYBoUWUzIawX5yhmlkEJHQCAwPEPr36ZbVZ7G9JHAZMVEChZn84yMK3EF9ZphUs5rxtxwKGX2Z1
	8CcD5zIcWhb6Ki3FBYzr9lvkozlUVsIfvZt4JjUZnzEuWV4Cd
X-Google-Smtp-Source: AGHT+IG/zzFcnEDvVaiNZ7/Ob7cxnQKiX8tR6SELrnFYKmUKk20ciCp2uYjvABIXIQOKgQdU/2gqoFnEkWJDwM0GxG0=
X-Received: by 2002:a05:6512:3d15:b0:52c:96d1:dc79 with SMTP id
 2adb3069b0e04-52c96d1de3emr1740750e87.14.1718133769435; Tue, 11 Jun 2024
 12:22:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610160155.5ca7e0d7@dellmb> <20240611110305.0f0c5b1f@dellmb>
In-Reply-To: <20240611110305.0f0c5b1f@dellmb>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Jun 2024 21:22:38 +0200
Message-ID: <CAMRc=McoyXp1v7fmOJffob4BWgrTV9he05JNTAx4JBBzOxV8sA@mail.gmail.com>
Subject: Re: how to request gpiochip line which is only valid as an interrupt?
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 11:03=E2=80=AFAM Marek Beh=C3=BAn <kabel@kernel.org=
> wrote:
>
> On Mon, 10 Jun 2024 16:01:55 +0200
> Marek Beh=C3=BAn <kabel@kernel.org> wrote:
>
> > Hello Bartosz,
> >
> > I would like to ask you if you could find some time to look at
> >
> >   [PATCH v11 6/8] platform: cznic: turris-omnia-mcu: Add support for
> >                   MCU provided TRNG
> >
> >   https://lore.kernel.org/soc/20240605161851.13911-7-kabel@kernel.org/
> >
> > Andy Shevchenko added you to that conversation asking you about how to
> > correctly do the following part:
> >
> >   irq =3D gpiod_to_irq(gpiochip_get_desc(&mcu->gc, irq_idx));
> >
> > I am writing this to give some more light into the problem. What is
> > going on:
> > - the turris-omnia-mcu driver provides a gpio chip with interrupts
> > - some lines are gpio + irq, but some lines are interrupt only
> > - later, after the gpiochip is registered, another part of the
> >   turris-omnia-mcu driver wants to use one interrupt only line
> >
> > To use the gpiod_to_irq() function, I need gpio descriptor for that
> > line. I can get that with gpiochip_get_desc(), since this is within the
> > driver, I have access to the gpiochip. But this is semantically a
> > little weird, because
> >
> >   1. gpiochip_get_desc() is supposed to be used by gpio driver, not
> >      consumer (and the trng part of the turris-omnia-mcu code is a
> >      consumer of the gpio)
> >
> >   2. reference counting?
> >
> > Looking at gpiolib, maybe the better function to use would be
> > gpiochip_request_own_desc(). This also is defined in
> > include/gpio/driver.c instead of include/gpio/consumer.c, but at least
> > it's name suggests that it is used by code that also owns the
> > gpiochip...
> >
> > One problem is that gpiochip_request_own_desc() won't work, because the
> > gpiochip initializes valid masks for both gpios and irqs, and the
> > gpiochip_request_own_desc() function calls gpiod_request_commit(),
> > which executes the following code
> >
> >   if (guard.gc->request) {
> >     offset =3D gpio_chip_hwgpio(desc);
> >     if (gpiochip_line_is_valid(guard.gc, offset))
> >       ret =3D guard.gc->request(guard.gc, offset);
> >     else
> >       ret =3D -EINVAL;
> >     ...
> >   }
> >
> > So if a gpiochip line is not valid GPIO, only valid IRQchip line, then
> > the GPIO cannot be requested, even for interrupts.
> >
> > What is the proper solution here?
> >
> > Thank you
> >
> > Marek
>
> Bart, Andy,
>
> it seems that if I write the mcu DT node interrupt property which
> refers to self, i.e.:
>
>   mcu: system-controller@2a {
>     ...
>
>     interrupts-extended =3D <&gpio1 11 IRQ_TYPE_NONE>,
>                           <&mcu 13 IRQ_TYPE_NONE>;
>     interrupt-names =3D "irq", "trng";
>
>     ...
>   };
>
> it seems to work and I can use
>
>   irq =3D fwnode_irq_get_byname(dev_fwnode(dev), "trng");
>
> even if this is called from the mcu probe method.
>
> Do you think this is a proper solution?
>
> I find it a little bit weird that the mcu DT node refers to itself in
> it's interrupt properties.
>
> Marek

Do I understand correctly that this is an I2C device visible under a
single address (and represented by a single device-tree node) that
registers with several kernel subsystems (among others: GPIO and RNG)?

If so then the interrupts should not be visible as a device property.
If you have access to the GPIO chip, can you simply call
gpiochip_lock_as_irq() and then request the interrupt? Users can still
read the value of this pin but won't be able to set direction to
output.

Bart

