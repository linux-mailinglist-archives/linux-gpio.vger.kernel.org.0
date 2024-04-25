Return-Path: <linux-gpio+bounces-5851-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C5C8B223A
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 15:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56CB6283514
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Apr 2024 13:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443B5149C66;
	Thu, 25 Apr 2024 13:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jUhexmaV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF3E149C4E
	for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 13:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714050421; cv=none; b=qzkWudxL1lKus7dX27rK34c0GyARa5SUHb+9FCKPFXyCf8ayUaj84w0QtmSnRqZtDZHzu8CeyzzjXfinx+967MkP3W61ZymQCIBGDqx0Ub62Pdumzoohc3jt8kll8mPBylhO/f3818DvYawLohaTQsoimRWYOBrnRJ+TkvAr8sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714050421; c=relaxed/simple;
	bh=iCLpk1XYOML5rjW/DzWQBTxUzuHTUhaSKVXX0JoQ3Fo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k6HOCURpr4F/fPq4pX0etOFKzznBDgFhqUmwy7iItxQ8eQTtYI/7yWtrwOF2GWEknFCZfGplNc4sog5zPerc0idX0k0odnLQOA9ksz56MGvkTZ9YpYEKDWjSneuISUeWXSgWPTwp3db+s8lpHzEIu/5fYf9QNyUvJRBnaBPZw3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jUhexmaV; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2dae975d0dcso21373591fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Apr 2024 06:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1714050416; x=1714655216; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXjxjK1s1trKrgIcuofImk0hlW/Fp+pJsvVfi+fABag=;
        b=jUhexmaVg3+VvIhtKVjrGJT/suS68SwbTxEHzojrrWp0Q55MrZoXxZyCbKkVrQ/6bx
         ju8IHHDJ5c/jMOr4UPeLE8+vJNyWBNEO7suLpacoeiDSHT9gIK7FpMFA0TrXiew1G7KO
         6lsNAlXIDfze8Ak2cecflHIHN/IHNF0/d1Y/wuD1w8LO3Kxsn2Ep5A0NYaQkvzEqapRp
         9EEsj6nrs8q2L6hMY8fbdrKg4mhWYIud31Z6gd+5fxlJp5ApmKL/W2nmqID5+74MScRb
         WIKNHmWi7NbNXKDdOJDdigtBTCZVOL2PRUeNwsTNAE/SkfdbxMeI3E97Y5alJTH7BoqX
         3jNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714050416; x=1714655216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXjxjK1s1trKrgIcuofImk0hlW/Fp+pJsvVfi+fABag=;
        b=W6HulztzO4xC91yOicgLrwoSWmHCKkWQ9VvhgpLCWp0QXQKP4Vbjt2NpWKXGOBfbFz
         N1TlFr9XdK4VX4KCa1m+grMK2QDssMm/dXb7jZYIAIiEtFmmnqt+N/n//GBGDJGYHTF1
         wJ7eZ0xl/sHLqgO7kRJTjMVNo1b79XVdIduKAYdi7ZAIYUom1QuFHSbjhrcdjEQxAypB
         FyOpr7NirQ6D9RqFbsmttdKn/BSX1HyWQOANvDRJAco9Io9+l3USGLUeeZWhaT8RAf04
         HHK1nlJWY0M0fJqrVmQwBssLEumy99geoBsFKYhbIJsCD5S+BUEw62cUAkriRzYoiZdu
         BdYA==
X-Forwarded-Encrypted: i=1; AJvYcCUc8wxvcbR37ibMDQs0LBVyDk+FWSlAijWI74WIp+JZ/6p+e0SgjaJlGEW45I/gsPCHlfCBznzliL7mR3qG7vN7cR+R+JcUrjkQHg==
X-Gm-Message-State: AOJu0YyJFBFek8Qj1IHj9OLL+6aj5V7jAxDQTTr1Fcx3R/S9OD4uXPYR
	MVTwZE2wpNN1JJWtKHo3DbuEDd+kkWPetcmDyMAGwIcMTQJelSwKiCmjTmTApS9+pJGbfUdcdtx
	cGympDUVXzw7veI6NSWGMLj5Hmf94GxOJj2fIYA==
X-Google-Smtp-Source: AGHT+IEOISNStsO/9+WhdVo2RtgV8uceX8S2G+eTOusKA26PiwFvCdNPq3Iw+sCaXY1CsixaLmp+nRqIEwhJ7bS+kyg=
X-Received: by 2002:a2e:90d4:0:b0:2dd:c2eb:66db with SMTP id
 o20-20020a2e90d4000000b002ddc2eb66dbmr913164ljg.14.1714050416212; Thu, 25 Apr
 2024 06:06:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423022814.3951048-1-haibo.chen@nxp.com> <CACRpkdaRxoEZT1_KyJ3QMDgBcciw1XUXKr=cEiPxbcwSnpmyiA@mail.gmail.com>
 <AS1PR04MB9502BE89834E7F9DA3E8D70B90112@AS1PR04MB9502.eurprd04.prod.outlook.com>
 <DU0PR04MB949691D7F68E2F32371B604F90102@DU0PR04MB9496.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB949691D7F68E2F32371B604F90102@DU0PR04MB9496.eurprd04.prod.outlook.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 25 Apr 2024 15:06:45 +0200
Message-ID: <CAMRc=McQtohbuUSrhH8LiF6EWUzRKyHSObBv4D6VeE87NmdZQQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: vf610: always set GPIO to input mode when used as
 interrupt source
To: Bough Chen <haibo.chen@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 1:01=E2=80=AFPM Bough Chen <haibo.chen@nxp.com> wro=
te:
>
> > -----Original Message-----
> > From: Bough Chen
> > Sent: 2024=E5=B9=B44=E6=9C=8823=E6=97=A5 20:21
> > To: Linus Walleij <linus.walleij@linaro.org>
> > Cc: brgl@bgdev.pl; linux-gpio@vger.kernel.org; linux-kernel@vger.kernel=
.org;
> > imx@lists.linux.dev
> > Subject: RE: [PATCH] gpio: vf610: always set GPIO to input mode when us=
ed as
> > interrupt source
> >
> > > -----Original Message-----
> > > From: Linus Walleij <linus.walleij@linaro.org>
> > > Sent: 2024=E5=B9=B44=E6=9C=8823=E6=97=A5 19:41
> > > To: Bough Chen <haibo.chen@nxp.com>
> > > Cc: brgl@bgdev.pl; linux-gpio@vger.kernel.org;
> > > linux-kernel@vger.kernel.org; imx@lists.linux.dev
> > > Subject: Re: [PATCH] gpio: vf610: always set GPIO to input mode when
> > > used as interrupt source
> > >
> > > On Tue, Apr 23, 2024 at 4:28=E2=80=AFAM <haibo.chen@nxp.com> wrote:
> > >
> > > > From: Haibo Chen <haibo.chen@nxp.com>
> > > >
> > > > Though the default pin configuration is INPUT, but if the prior
> > > > stage does configure the pins as OUTPUT, then Linux will not
> > > > reconfigure the pin as INPUT.
> > > >
> > > > e.g. When use one pin as interrupt source, and set as low level
> > > > trigger, if prior stage already set this pin as OUTPUT low, then
> > > > will meet interrupt storm.
> > > >
> > > > So always set GPIO to input mode when used as interrupt source to
> > > > fix above case.
> > > >
> > > > Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> > > > ---
> > > >  drivers/gpio/gpio-vf610.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> > > > index 07e5e6323e86..305b0bcdee6f 100644
> > > > --- a/drivers/gpio/gpio-vf610.c
> > > > +++ b/drivers/gpio/gpio-vf610.c
> > > > @@ -214,7 +214,7 @@ static int vf610_gpio_irq_set_type(struct
> > > > irq_data *d,
> > > u32 type)
> > > >         else
> > > >                 irq_set_handler_locked(d, handle_edge_irq);
> > > >
> > > > -       return 0;
> > > > +       return port->gc.direction_input(&port->gc, d->hwirq);
> > >
> > > Just call vf610_gpio_direction_input() instead of indirecting through
> > > gc->direction_input(), no need to jump through the vtable and as
> > > Bartosz says: it just makes that struct vulnerable.
> >
> > Thanks for your quick review, I will do that in V2.
> >
> > >
> > > Second:
> > >
> > > In this patch also implement gc->get_direction() which is currently
> > > unimplemented. If you are going to change the direction of a GPIO
> > > randomly at runtime then the framework really likes to have a chance
> > > to know the current direction for obvious reasons.
> >
> > Yes, will implement gc->get_direction(), if we did this before, then fo=
r this case
> > we meet, framework will print out error log, save much debug time.
>
> Hi Linus,
>
> I implement gc->get_direction() today, for the case to request one gpio a=
s irq, gpio architecture will first
> call gpiochip_reqres_irq(), if the ROM or Uboot already config this gpio =
pin as OUTPUT mode, will get
> the following log:
>
> [    2.714889] gpio gpiochip3: (43850000.gpio): gpiochip_lock_as_irq: tri=
ed to flag a GPIO set as output for IRQ
> [    2.724816] gpio gpiochip3: (43850000.gpio): unable to lock HW IRQ 11 =
for IRQ
> [    2.731972] genirq: Failed to request resources for 2-0050 (irq 211) o=
n irqchip gpio-vf610
>
> Any suggested method to avoid this case? My previous method works because=
 driver lack of gc->get_direction().
>

Can you make the driver default all lines to input when the device is
being registered? Possibly also revert to input when the line is being
freed?

Bartosz

