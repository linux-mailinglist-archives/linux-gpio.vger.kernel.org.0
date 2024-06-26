Return-Path: <linux-gpio+bounces-7735-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0429184C6
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 16:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46FE71F22229
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 14:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A6C14AD0A;
	Wed, 26 Jun 2024 14:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxHJmEUT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA318F5C;
	Wed, 26 Jun 2024 14:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719413225; cv=none; b=WNdZIv86oMPRR145UoVePnwL3Rc8GMswEje56Ac0DwM8LnduxGEu+amywqJV6EMq5kPP1wV0DmkO/ydUM52C+b5izxRrBJecOa+tkbfkL5ZNNWm6xVULS3Tvt2PUqcleK71dkc436TFp4LA1T9OMsQABj6HZ9+ktsjIudmLJqY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719413225; c=relaxed/simple;
	bh=gZGCAVXaYCKRIlqK+JdusU6gg+o3Zug6BTXw0HCBkzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H7zAKcDzvY+xhttZn3a+Qr8kBxFHZGj7XSgee3nTLwEtvW0yckTEKWsi5np2e3JYM3O1nhTbIkjhovr/lA/pLI1HWNXFM/hlSq7vbTzxmIZoBxb2FVZaZLZbCntzyxW1NboN19n4CZe6ifR3YI8waNziQ7CTygREHEm9lkXvcIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxHJmEUT; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7201cb6cae1so1940140a12.2;
        Wed, 26 Jun 2024 07:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719413223; x=1720018023; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2kLoRtgOqS+4sF8A+JUt2FxtaDIYrhhuhT0FHKZKBZ0=;
        b=JxHJmEUTUIjOV3X8fy30Lyw2yzeJOGdEnzf2r8u1RnngKeQI3cpZVVfKW6hq5v4lb1
         LksK67511PDT2wQUvfdvtOj6b2rpkM+fkX/xBZzOxWnNgR4uDcsunh6iIlcLvSh6nOUt
         kAGQbt2Txd+6aE5fTbACf+IBrwMgCQnxz0OcLv0DNDJeFlWp+8Ykitk4tUS8pg2N7r89
         k2uyy73eDgi0GePCkX7Rk7dJk4wHGu3oH/lcYiJ6JKHF5b6mcul3+o+YdTTGq+icCPx5
         jDKycmkKYIuzDW5pDqc5uFWWc2DR5T50sjLDwORc93RIfffBQei1SgxVzVbtwy8DL+Ob
         3LSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719413223; x=1720018023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2kLoRtgOqS+4sF8A+JUt2FxtaDIYrhhuhT0FHKZKBZ0=;
        b=V+hE8P6q5AJCb0yvagZoESUo8YkUHMUYRnK+QTga1KfGkH5qm4BsKVwa6Ujf9tgBE7
         kk5l1HnXvlKRslr4kfL62U29GiTyEHRK/hBE39WXgoqWByw/gevf8KMDvIsmLBRMGxfH
         RPjfNvEIDi1kj8X0H3nFbD8dEqOr34lh6+RO/n8m5wAYi8/hvN8fjTU/IuiG6ADZI0Ch
         EL4AwlCMonBxKLxL7kcOFxp0S6nrEd4Ac+Xec03RP8Y4qVBnz2lkcAkrF0GFxJWoGeDG
         crT8GV5GfuovevvhdhuPv4liD1jChBRQYjMUrGIimDN03ePlDfIFgKURqWiK5mwNwere
         1lDg==
X-Forwarded-Encrypted: i=1; AJvYcCWUUfDvAiglJQ+P6+YVMDodoezZwRWeAtNvsMgUPyhrkfSGJzB+jEiHxM5inyDnAIUasWICAdVU0CNAhHNZx4ytHHhI6Wp1cfcgWgXP7XqAfaepXCWzGi0pcBdUsbNCXGcmv1/iwAOSAQ==
X-Gm-Message-State: AOJu0Ywqyhoznz7jRhqPYwariFCDyl3t6jpYqVA+JDmhjRmb16Y3szfE
	E3NoMokEYBW0479kas3QlNq+qqXylQk+6979beVqHPdwmKErSzwU3EuIT/978vBNlfBKjmHSQi5
	vt2AjbCyivCMMWiyv8Bodi2z5LUs=
X-Google-Smtp-Source: AGHT+IHo4eMW/Tv0PeYlLc54oKnyKbqp6NUH4b4VhhPfWqWh1VrKqWYRw+yhSp+H9nvY650SzRfwq/O7QWR0Z+w5cr0=
X-Received: by 2002:a17:90a:fa82:b0:2c8:686c:b40b with SMTP id
 98e67ed59e1d1-2c8686cb4c6mr8536805a91.39.1719413223158; Wed, 26 Jun 2024
 07:47:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <TYCP286MB089577B47D70F0AB25ABA6F5BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
 <CACRpkdY=xAKNz5S+sbJXYRs9EoivJS_nZEtYHKc2m4UDkLvscA@mail.gmail.com>
In-Reply-To: <CACRpkdY=xAKNz5S+sbJXYRs9EoivJS_nZEtYHKc2m4UDkLvscA@mail.gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 26 Jun 2024 16:46:51 +0200
Message-ID: <CAOiHx=mQE+bo6urMea5_dX4Yh5f6=U_xD9KziL5V0PkP7za5yQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: mmio: do not calculate bgpio_bits via "ngpios"
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Shiji Yang <yangshiji66@outlook.com>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Asmaa Mnebhi <asmaa@nvidia.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org, 
	Mark Mentovai <mark@mentovai.com>, =?UTF-8?B?TMOzcsOhbmQgSG9ydsOhdGg=?= <lorand.horvath82@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Wed, 26 Jun 2024 at 14:06, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
>
> Hi Shiji,
>
> thanks for your patch!
>
> On Tue, Jun 25, 2024 at 3:22=E2=80=AFAM Shiji Yang <yangshiji66@outlook.c=
om> wrote:
>
> > bgpio_bits must be aligned with the data bus width. For example, on a
> > 32 bit big endian system and we only have 16 GPIOs. If we only assume
> > bgpio_bits=3D16 we can never control the GPIO because the base address
> > is the lowest address.
> >
> > low address                          high address
> > -------------------------------------------------
> > |   byte3   |   byte2   |   byte1   |   byte0   |
> > -------------------------------------------------
> > |    NaN    |    NaN    |  gpio8-15 |  gpio0-7  |
> > -------------------------------------------------
> >
> > Fixes: 55b2395e4e92 ("gpio: mmio: handle "ngpios" properly in bgpio_ini=
t()")
> > Fixes: https://github.com/openwrt/openwrt/issues/15739
> > Reported-by: Mark Mentovai <mark@mentovai.com>
> > Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
> > Suggested-By: Mark Mentovai <mark@mentovai.com>
> > Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
> > Tested-by: L=C3=B3r=C3=A1nd Horv=C3=A1th <lorand.horvath82@gmail.com>
>
> Commit  55b2395e4e92 also contains this:
>
> @@ -614,10 +616,15 @@ int bgpio_init(struct gpio_chip *gc, struct device =
*dev,
>         gc->parent =3D dev;
>         gc->label =3D dev_name(dev);
>         gc->base =3D -1;
> -       gc->ngpio =3D gc->bgpio_bits;
>         gc->request =3D bgpio_request;
>
> After this patch gc->ngpio will be unset for any GPIO chip that
> provides a ngpios property, so restore the above line too.

The patch only removes a line changing gc->bgpio_bits, not gc->ngpio.
gc->ngpio is untouched.

gc->ngpio will still be set by gpiochip_get_ngpios() if there is a
ngpio property. See the context of the patch:

> @@ -619,8 +619,6 @@ int bgpio_init(struct gpio_chip *gc, struct device *d=
ev,
>         ret =3D gpiochip_get_ngpios(gc, dev); <--
>         if (ret)
>                 gc->ngpio =3D gc->bgpio_bits; <- and if it fails, fallbac=
k to bgpio_bits

>
> But maybe a better fix is:
>
> + #include <linux/types.h>
> (...)
> +  else
> +               gc->bgpio_bits =3D round_up(gc->ngpio, sizeof(phys_addr_t=
) * 8);
>
> ?

bgpio only supports a single register worth of gpios, so the limit is
1 * sizeof(phys_addr_t) * 8. So this would force force bgpio_bits to
sizeof(phys_addr_t) * 8. And this will break any bgpio users where the
gpio registers are less than phys_addr_t wide. Like 32 bit registers
on a 64 bit system, or 16 bit registers on 32 bit.

Therefore I think the most sane thing is to keep gc->bgpio_bits at sz * 8.

The only potentially reasonable thing that could be added here is a
check that gc->ngpio is at most bgpio_bits. But that would be an
additional check, not a fix per se.

Best Regards,
Jonas

