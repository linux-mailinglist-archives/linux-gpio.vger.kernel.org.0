Return-Path: <linux-gpio+bounces-30436-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 441B8D11696
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 10:08:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8F2D301F004
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 09:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915C034678B;
	Mon, 12 Jan 2026 09:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rdBWZ5Kp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5456B30BF60
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 09:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768208919; cv=none; b=IZ5RIoOVBUMHF4haCVCoDEjoPfHIjF+xaKaADs6TV2I75oKaqSdPnle4lut4+GgRsqTSMrokMxRreahEgGt5RTnVtPrJ/KiiasTgIl1y7FOrd8YyPik8kf8hq/3ccMHwJ+h0SoRT2cGwL4tEE0ziprCpKd7MZoM9gi9Fq/hcgHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768208919; c=relaxed/simple;
	bh=aNusfbvcvvIrZ1GK6+N/BWnHjCznHNoKX1GEoskKxrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+jMHYZvUxkpHJreXXTXKsaCFZwZa7FPmy87Y70Vz9ROWz5fsZTy362YlsomBnWaE0ywuXbKUJ/FO+rGGAY7BvFGfXJ7nSdhIEXD2tvza4FL5X6oAUFK0fmq0RBY7/69qB0tG1HIkewMiPZfZOXGf8MMEVYLMU0oFHLCMi2y+fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rdBWZ5Kp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19314C2BCB0
	for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 09:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768208919;
	bh=aNusfbvcvvIrZ1GK6+N/BWnHjCznHNoKX1GEoskKxrw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rdBWZ5KpxcbS00ewOLmz6VAc+OOKmUqd4MYWGLtm00Io/3Yei+jlv+kNP9Q0vdsOb
	 edfSASkvbc/gWY8nmaY2Jj0OjaSNAlRYniK/ApsqCWGIoSm1rSwQNomse/Y8kK9PwY
	 9fK1LpyqJng2uyWvtJoHtzXpxMoPWdWryEAxO+Drt6FRu+LeNlD4omI+l+jga+Y98t
	 gSNiUppaEZd8ROLEV1T8mUS3jQ2JcldlKpm941SCK3wzEcc+AiTU+s4dybHV9IxsSb
	 av8ri27WpDQhLEcGNkVC6sL707k1MmpdjObys2j7sl7neUqYOKqqqs4wn637/vDV15
	 tBfj/lw8836yw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59b7882e605so5185132e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2026 01:08:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJwQGMCV15cq5vDpEbC2Ke/MLNVnKn1VVXMTDsZK9NmpolDKF5Y+oveCz7mE2AgULEl3ejuNYywFkl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2W1UNcustlohccl0LqZNvnMdv3C3DUvRhyxfdSl+XiXt4Y1FY
	hPneX9u8WTKGGOkqp7QP9AQzP7agPWTqICqNq32eaxwRdl52RWx8XFXMoCSVnbLx8HZyK739UO6
	dGtP81bHicnNJTfeC1bxut3NXN9bExVXXfBnIE8x7zg==
X-Google-Smtp-Source: AGHT+IGTR9k5RSHNIpBJL834Ww0X8J1ZdzRZ6Hp2uk9hnACvGJbrlxz/VASX4yp2KTPlt556o88PPVY7jr7CQVZ9CaA=
X-Received: by 2002:a2e:a590:0:b0:383:213c:fc61 with SMTP id
 38308e7fff4ca-383213cff5cmr24069241fa.31.1768208917628; Mon, 12 Jan 2026
 01:08:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com> <aWGSQYCXP4R08koQ@venus>
In-Reply-To: <aWGSQYCXP4R08koQ@venus>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 12 Jan 2026 10:08:25 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mf0tRxRrh7tn5OaDn3a47N_qvUcjO=zqbTi-GhY-Y9hOg@mail.gmail.com>
X-Gm-Features: AZwV_QhDDYd3G5smy1ZRDQbejdmCu0WGBNa60Ja3hID1ca2J3AnWia5Ug7Yy3bU
Message-ID: <CAMRc=Mf0tRxRrh7tn5OaDn3a47N_qvUcjO=zqbTi-GhY-Y9hOg@mail.gmail.com>
Subject: Re: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 10, 2026 at 12:55=E2=80=AFAM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Tue, Jan 06, 2026 at 10:00:11AM +0100, Bartosz Golaszewski wrote:
> > The GPIO controller is configured as non-sleeping but it uses generic
> > pinctrl helpers which use a mutex for synchronization.
> >
> > This can cause the following lockdep splat with shared GPIOs enabled on
> > boards which have multiple devices using the same GPIO:
> >

[snip]

> >
> > Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
> > Cc: stable@vger.kernel.org
> > Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Closes: https://lore.kernel.org/all/d035fc29-3b03-4cd6-b8ec-001f93540bc=
6@samsung.com/
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
> >  drivers/gpio/gpio-rockchip.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.=
c
> > index 47174eb3ba76..bae2061f15fc 100644
> > --- a/drivers/gpio/gpio-rockchip.c
> > +++ b/drivers/gpio/gpio-rockchip.c
> > @@ -593,6 +593,7 @@ static int rockchip_gpiolib_register(struct rockchi=
p_pin_bank *bank)
> >       gc->ngpio =3D bank->nr_pins;
> >       gc->label =3D bank->name;
> >       gc->parent =3D bank->dev;
> > +     gc->can_sleep =3D true;
>
> This means all operations are marked as can_sleep, even though
> pinctrl operations are only used for the direction setting.
> I.e. the common get/set operations always worked in atomic mode,
> but now complain. See for example:
>
> https://lore.kernel.org/all/20260108-media-synopsys-hdmirx-fix-gpio-cansl=
eep-v1-1-3570518d8bab@kernel.org/
>
> It's not a big issue for the hdmirx driver specifically, but I wonder
> how many more (less often tested) rockchip drivers use GPIOs from their
> IRQ handler.
>
> Considering setting or getting the GPIO from atomic context is much
> more common than changing the direction - is there some way to
> describe the sleep behavior in a more specific way in the GPIO
> controller?
>

No, there's no such switch at the moment. This is because there are
paths that we can take, where we *do* end up setting direction from
gpiod_set_value(). For instance:

gpiod_set_value()
  gpiod_set_value_nocheck()
    gpio_set_open_drain_value_commit()
      gpiochip_direction_output()

I'm afraid, for correctness, it has to be either sleeping, or not. I
would love - at some point - to make pinctrl mostly lockless with
SRCU, like we did with GPIO. That would solve this issue correctly.
But until then, I'm afraid we need to keep a chip-global switch for
sleeping.

Bartosz

