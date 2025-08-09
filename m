Return-Path: <linux-gpio+bounces-24105-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5958BB1F403
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Aug 2025 12:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A5421639D8
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Aug 2025 10:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5918C2405E7;
	Sat,  9 Aug 2025 10:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fitt2TNv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66044199385;
	Sat,  9 Aug 2025 10:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754733730; cv=none; b=WIOd8olA1sPdR2kBZzT50EW5iohxYgQ0pz301Agac8eem8BsytGUHAsvRy703+rHNNd43dhhG0S8rVQeGbq5G3mRI4psPB1yqcaS4B9hbRd1s8EFXbbrE5uogaR1f3Xh2Gn5lAzPQFZXWDjLoz7j+xwA1sHSw0frfY0px/e5GSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754733730; c=relaxed/simple;
	bh=rWnVsumdqjPqNv0KYemo0Q9clJgfsIbPT7/Dqu4N7Jw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZULuNide+0qTUZkc4OoEsKzVfsgOtq37Vq7NNCPsip92Y+SS7kwJkzbZSnmSY/qkUKF/AEWYYY+ZOvje71EaKWw3JMpIElPdrcCwxA1g5t2tnxkeYSsxHGZlBKUvW4IsI6ao2ywFoYNFS+z37OdXccG15KQ5+hNiR/e2s++W44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fitt2TNv; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e8fe3aeffb6so2520505276.3;
        Sat, 09 Aug 2025 03:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754733727; x=1755338527; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSkMWknnYSUf2lZq1a4lCsdL5osmbnj812suMnHzavQ=;
        b=fitt2TNviqbuPevduMTzrQoU056MDie1O7LO3/QJXKGmh4MWuQ25owyPymnGtmo//Y
         2DEdZQZfrwoRLp+WhMvq0++IxUDVCgUTIlJLNZAjWdPL/VWMBs7a82OzfQ59FU0Lr9lw
         9DcLXoiK5Hk0hiyqF5lSzcLaoJoN5A/PWhQGQo2C1vinLHGesFWTHq9Rmm+CU7Ewa6N+
         3+8K4bTTIMXkaNVno77BpNhlH0NQGN/Q6Bh/f7tt6N2GnHKtJJ+xaSM0/+qtCWSzupSG
         Qi5sg/UqLRSXjF/grASbVGwVxOFL4AWFlexi0qtceGUo2Oy1IV77mviumVyDsAYHvm5b
         I8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754733727; x=1755338527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zSkMWknnYSUf2lZq1a4lCsdL5osmbnj812suMnHzavQ=;
        b=hR889OQyHkq0u3kV/LV7OBQzpbr9HGAb4+Lx3z/uafoZVocAwxWnodYjvAnfqXJOM+
         ZFOBvEcRX2rjmoBewk1s6di6QeEZ4T+rFpLsdpCuJnVZrrbelO4PkDSTl4g8smQJVT2N
         tBOxTVDKN3MESXnJlOB/GDXEKUPXsg7IU8XEzqfihCqIjQ9clJ9NwnToEGq/NKWou9JX
         vn3q8lxZvdpWRrPyRlOQyr6r5EOVF/K20sqWsXpUC/B9NrAS8ybQovA62t6huu2aF83Z
         uKqdvZddBAP8CaUenLYumKZDEIp9SzxKFwnvJEL8ptceNapqgHAzcZvvB9E6C2IDWkNu
         GNxw==
X-Forwarded-Encrypted: i=1; AJvYcCV6nBFNm+U4VtHR5M0UuVEEOFo4fKSNiU6ducW2R+tdE6JVldkqhcIov6bU13js61t8t46uxGmyi/mPjALW@vger.kernel.org, AJvYcCW5jJgYbe73nqmqLkJU6HU1rNt60Dww8APR/Ap1kErmAC+8wdnbwd52KT37xXQHqImgXaXVppU6UuEA@vger.kernel.org, AJvYcCWKyNWDYSW5bURx66CkSDwkSh0x8G5h8gQpSKLtbUfP/ORsW/ANxhjSmXdfoKiv1y55XV2qoXKQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyDx1JBu7A+uh7lyeiFmzR4l3vFTqzzZFhJ7cPJ8mUAg7eyQ2zp
	tFXWWSdJ1dowk3ou/6jFx5Fxy8D+kdUN1FBIjWPU9PS8O4YXFPAkTJ9e3XqcuKl76rfUB+htLcz
	hND4bHJQRXWcxzwDD2YbXNjIAnTihFBw=
X-Gm-Gg: ASbGncuaU0Oj/hOK0Up74bwCSVPCw0hFDPeyfbnV/SLY9v8YD4adAoR48h8DQGpvVpy
	eGCbovpqk3lu3iUFjA0zK7UeO8PkBQtw6y2SItvYUY8j1rz/0VosK5NHINoBrlvZqBHoAIKLVoJ
	fD5hKumTrdtqGQCR3j8Y/UiRtHbLkUhHx9zj+wvHRNwsNPb5jSyG2uXB+IBr00eSgTRBsN6wCsv
	yu+
X-Google-Smtp-Source: AGHT+IEq3XjX4upo2YSVsW6CpA715v2LsfL1aZ4Q6bj+CoEfkG4yHbTlEC9EYHJHqngVycka5L9ve6buivYpr3X1pW0=
X-Received: by 2002:a05:690c:338f:b0:71b:d6a0:976f with SMTP id
 00721157ae682-71bf0e5e808mr72142237b3.27.1754733726958; Sat, 09 Aug 2025
 03:02:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250808151822.536879-1-arnd@kernel.org> <20250808151822.536879-16-arnd@kernel.org>
In-Reply-To: <20250808151822.536879-16-arnd@kernel.org>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Sat, 9 Aug 2025 12:01:54 +0200
X-Gm-Features: Ac12FXx89RiUsC_ywdzagTtcyRhUd_jdTXMZ-cncEq7BwXm7L-XXN8b0kdvzu9I
Message-ID: <CAOiHx=mW8B2vQ7UhauPJpJ9KmtxTZ2-1MC3Vf2uNF9RaJ4WQ5A@mail.gmail.com>
Subject: Re: [PATCH 15/21] dsa: b53: hide legacy gpiolib usage on non-mips
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, 
	Kyle Hendry <kylehendrydev@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 8, 2025 at 5:23=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The MIPS bcm53xx platform still uses the legacy gpiolib interfaces based
> on gpio numbers, but other platforms do not.
>
> Hide these interfaces inside of the existing #ifdef block and use the
> modern interfaces in the common parts of the driver to allow building
> it when the gpio_set_value() is left out of the kernel.

Looks reasonable, but doesn't compile:

  CC      drivers/net/dsa/b53/b53_spi.o
In file included from drivers/net/dsa/b53/b53_spi.c:27:
drivers/net/dsa/b53/b53_priv.h:378:15: error: unknown type name 'gpio_desc'
  378 | static inline gpio_desc *b53_switch_get_reset_gpio(struct
b53_device *dev)
      |               ^~~~~~~~~
drivers/net/dsa/b53/b53_priv.h: In function 'b53_switch_get_reset_gpio':
drivers/net/dsa/b53/b53_priv.h:392:14: error: implicit declaration of
function 'gpio_is_valid'; did you mean 'uuid_is_valid'?
[-Wimplicit-function-declaration]
  392 |         if (!gpio_is_valid(gpio))
      |              ^~~~~~~~~~~~~
      |              uuid_is_valid
drivers/net/dsa/b53/b53_priv.h:395:15: error: implicit declaration of
function 'devm_gpiod_request_one' [-Wimplicit-function-declaration]
  395 |         ret =3D devm_gpiod_request_one(dev->dev, gpio,
      |               ^~~~~~~~~~~~~~~~~~~~~~
drivers/net/dsa/b53/b53_priv.h:396:38: error: 'GPIOF_OUT_INIT_HIGH'
undeclared (first use in this function); did you mean
'GPIOD_OUT_HIGH'?
  396 |                                      GPIOF_OUT_INIT_HIGH, "robo_res=
et");
      |                                      ^~~~~~~~~~~~~~~~~~~
      |                                      GPIOD_OUT_HIGH
drivers/net/dsa/b53/b53_priv.h:396:38: note: each undeclared
identifier is reported only once for each function it appears in
drivers/net/dsa/b53/b53_priv.h:400:16: error: returning 'struct
gpio_desc *' from a function with incompatible return type 'int *'
[-Wincompatible-pointer-types]
  400 |         return gpio_to_desc(gpio);
      |                ^~~~~~~~~~~~~~~~~~

>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/net/dsa/b53/b53_common.c | 17 +++++------------
>  drivers/net/dsa/b53/b53_priv.h   | 24 ++++++++++++++++++------
>  2 files changed, 23 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_c=
ommon.c
> index 9942fb6f7f4b..cb57bcc56c63 100644
> --- a/drivers/net/dsa/b53/b53_common.c
> +++ b/drivers/net/dsa/b53/b53_common.c
> @@ -19,7 +19,7 @@
>
>  #include <linux/delay.h>
>  #include <linux/export.h>
> -#include <linux/gpio.h>

this include is now needed for b53_priv.h.

> +#include <linux/gpio/consumer.h>
>  #include <linux/kernel.h>
>  #include <linux/math.h>
>  #include <linux/minmax.h>
> @@ -948,17 +948,17 @@ EXPORT_SYMBOL(b53_configure_vlan);
>
>  static void b53_switch_reset_gpio(struct b53_device *dev)
>  {
> -       int gpio =3D dev->reset_gpio;
> +       struct gpio_desc *gpio =3D dev->reset_gpio;
>
> -       if (gpio < 0)
> +       if (IS_ERR(gpio))
>                 return;
>
>         /* Reset sequence: RESET low(50ms)->high(20ms)
>          */
> -       gpio_set_value(gpio, 0);
> +       gpiod_set_value(gpio, 0);
>         mdelay(50);
>
> -       gpio_set_value(gpio, 1);
> +       gpiod_set_value(gpio, 1);
>         mdelay(20);
>
>         dev->current_page =3D 0xff;
> @@ -2925,7 +2925,6 @@ static int b53_switch_init(struct b53_device *dev)
>  {
>         u32 chip_id =3D dev->chip_id;
>         unsigned int i;
> -       int ret;
>
>         if (is63xx(dev))
>                 chip_id =3D BCM63XX_DEVICE_ID;
> @@ -3005,12 +3004,6 @@ static int b53_switch_init(struct b53_device *dev)
>                 return -ENOMEM;
>
>         dev->reset_gpio =3D b53_switch_get_reset_gpio(dev);
> -       if (dev->reset_gpio >=3D 0) {
> -               ret =3D devm_gpio_request_one(dev->dev, dev->reset_gpio,
> -                                           GPIOF_OUT_INIT_HIGH, "robo_re=
set");
> -               if (ret)
> -                       return ret;
> -       }
>
>         return 0;
>  }
> diff --git a/drivers/net/dsa/b53/b53_priv.h b/drivers/net/dsa/b53/b53_pri=
v.h
> index 458775f95164..16e82653a7c6 100644
> --- a/drivers/net/dsa/b53/b53_priv.h
> +++ b/drivers/net/dsa/b53/b53_priv.h
> @@ -136,7 +136,7 @@ struct b53_device {
>         u8 duplex_reg;
>         u8 jumbo_pm_reg;
>         u8 jumbo_size_reg;
> -       int reset_gpio;
> +       struct gpio_desc *reset_gpio;
>         u8 num_arl_bins;
>         u16 num_arl_buckets;
>         enum dsa_tag_protocol tag_protocol;
> @@ -375,22 +375,34 @@ static inline void b53_arl_from_entry_25(u64 *mac_v=
id,
>
>  #include <linux/bcm47xx_nvram.h>
>  #include <bcm47xx_board.h>
> -static inline int b53_switch_get_reset_gpio(struct b53_device *dev)
> +static inline gpio_desc *b53_switch_get_reset_gpio(struct b53_device *de=
v)

s/gpio_desc/struct gpio_desc/

>  {
>         enum bcm47xx_board board =3D bcm47xx_board_get();
> +       int gpio, ret;
>
>         switch (board) {
>         case BCM47XX_BOARD_LINKSYS_WRT300NV11:
>         case BCM47XX_BOARD_LINKSYS_WRT310NV1:
> -               return 8;
> +               gpio =3D 8;
> +               break;
>         default:
> -               return bcm47xx_nvram_gpio_pin("robo_reset");
> +               gpio =3D bcm47xx_nvram_gpio_pin("robo_reset");
>         }
> +
> +       if (!gpio_is_valid(gpio))
> +               return ERR_PTR(-EINVAL);
> +
> +       ret =3D devm_gpiod_request_one(dev->dev, gpio,

s/devm_gpiod_request_one/devm_gpio_request_one/

> +                                    GPIOF_OUT_INIT_HIGH, "robo_reset");
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       return gpio_to_desc(gpio);
>  }
>  #else
> -static inline int b53_switch_get_reset_gpio(struct b53_device *dev)
> +static inline struct gpio_desc *b53_switch_get_reset_gpio(struct b53_dev=
ice *dev)
>  {
> -       return -ENOENT;
> +       return ERR_PTR(-ENODEV);
>  }
>  #endif

Can't really test this (no matching hardware), but with the code issues fix=
ed

Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>

Best regards,
Jonas

