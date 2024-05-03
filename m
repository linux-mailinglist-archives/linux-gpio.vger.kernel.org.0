Return-Path: <linux-gpio+bounces-6023-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8C98BA5E4
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 06:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97B7D1F226CB
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 04:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4501F951;
	Fri,  3 May 2024 04:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ms2dZ6qY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B21114F62
	for <linux-gpio@vger.kernel.org>; Fri,  3 May 2024 04:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714709174; cv=none; b=ak7g9MqUDgDZI0uJK6RL0YLvM8743OveTbxpSUn87V9uBhaDSSjycYYoQ7q8rjs5lxmMJUPqktKay5Iati3oLP0ZTfInipJxpmdXlTkXQh4druVwNv4FoalnmYd1p2MDdrck8FxMEIRba0FwhL8B7tD5vI6pP2+H0l7l967cPXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714709174; c=relaxed/simple;
	bh=jmDjjQ8L0nC9WWkn5Cx65rtl/J3kKthuHYnOOsansfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TcU/TtTA1HVMZQvb+Ja1nEvWj3Diab06QzdiJfzldepiyUfX/3CF+btbefYretk10ITFFjkS5yt6xwwmBeCl9BFSkR7toX4HEmffVt8XCqRLQWjQGyM7iOtT6o2TUsSWqDLq5OPEqyuwNMr/m5YTdZDZFCNNPvToAFgF+x8Ygwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ms2dZ6qY; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e1fa1f1d9bso21353431fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 02 May 2024 21:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714709170; x=1715313970; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PXQyUjbHynvM6KgiR6KwKTuOztlmJYtLW2yS/umw78=;
        b=ms2dZ6qY5gf06tJtEOEcHqgoRwdvXQlpP6D9+H9DiYMYHQnYoViJzA0uI4qYg/YuY8
         fY7fmzC1H9hRPN6/MAgL8wZu3gyCUvTpK4BhkNeSpEs/7KlwMYuXHfugobf96T408J+k
         8YydIBqNfKurpmSpLcnythL8mX91m3hx15oUWZ5Xbza/q9w6TUeAD2yGh8suy1q8yTsO
         uyOxmjtX+RgmrLuZuXb21AyG2U2K1elzwEsC42GFz90rAUWry2rEjfqiGcDXpSgEJASc
         budELi26+KUj7px7qg0Of9yspEfzjoYqxFNgTFXYmq88s6BsBanFZkboeUwBLgGw79Dh
         CPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714709171; x=1715313971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8PXQyUjbHynvM6KgiR6KwKTuOztlmJYtLW2yS/umw78=;
        b=DGsxNrV1eQCQ1xYHU5UH8eJovS+40dNnglAPxSuFpyCYLrWeXZZEcThNf8Q6+LIJC5
         sVd7eNMHK8dwGOTK6BnRLS1L7NptCzOWgPx0l5UX2GXUoU+WmAxPUkSDYKhvswXS1hla
         mWqYtXevcHAoXbF+p2wEOmknhRmjBCbDS1HEvKyZT+yl2EoIlaty1yQBNIhPHtcFItSd
         LaW/KPYJutxKeWzOJSm09kinfqwVz0/UG29gaIrF3oGLFyvFQD/W0Ivoog+HfELKnkf2
         djhYkGhqVn4TsaRNz3gDgl1HVbF6UYT2PgshCV0Qq0ww1ZHC2poEeYf6qwZD0qVcNQGR
         5GJw==
X-Forwarded-Encrypted: i=1; AJvYcCUmDaLgWVQDp8TOfkG1dn1CRXS8ExkGIAOfqWQr0cnw4UuNqvzhSmfuJLNdiv1E6/KBLKBuuYRByVc+ViBChAHxrHo94mOJN5Fl3Q==
X-Gm-Message-State: AOJu0YxaJktMl6lJlZlbvweXjHWc2YxRtiIdBRpXJCdawkle/N4nt/g3
	UJz3qjYO0UhvcI1Yvpd6INmWGAGZhnU0sMlmXbNH/GR7L5rI1HDbHoESOMSKwJTCcQDXjGEYsnC
	8CiE1QLto9Ij1ML99ZDWFjOAuo7E=
X-Google-Smtp-Source: AGHT+IGniQoBgsUz/IlUNE1dnBD3fj9L81d4G/KPuH0XLQbRdM1h4FiziuAWwAvYCceMChDuWb/HLszFSosg+EJma/U=
X-Received: by 2002:a2e:7314:0:b0:2e0:298d:65ec with SMTP id
 o20-20020a2e7314000000b002e0298d65ecmr935292ljc.17.1714709170346; Thu, 02 May
 2024 21:06:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430115111.3453-1-kabel@kernel.org> <20240430115111.3453-4-kabel@kernel.org>
In-Reply-To: <20240430115111.3453-4-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 3 May 2024 07:05:34 +0300
Message-ID: <CAHp75VdV_JmbS1pM11Pf8S5vWU8X1FrKpw3aAtTHK0tsLua5fg@mail.gmail.com>
Subject: Re: [PATCH v8 3/9] platform: cznic: turris-omnia-mcu: Add support for
 MCU connected GPIOs
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 2:51=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> Add support for GPIOs connected to the MCU on the Turris Omnia board.
>
> This includes:
> - front button pin
> - enable pins for USB regulators
> - MiniPCIe / mSATA card presence pins in MiniPCIe port 0
> - LED output pins from WAN ethernet PHY, LAN switch and MiniPCIe ports
> - on board revisions 32+ also various peripheral resets and another
>   voltage regulator enable pin

...

> -int omnia_cmd_read(const struct i2c_client *client, u8 cmd, void *reply,
> -                  unsigned int len)
> +int omnia_cmd_write_read(const struct i2c_client *client,
> +                        void *cmd, unsigned int cmd_len,
> +                        void *reply, unsigned int reply_len)
>  {
>         struct i2c_msg msgs[2];
> -       int ret;
> +       int ret, num;
>
>         msgs[0].addr =3D client->addr;
>         msgs[0].flags =3D 0;
> -       msgs[0].len =3D 1;
> -       msgs[0].buf =3D &cmd;
> -       msgs[1].addr =3D client->addr;
> -       msgs[1].flags =3D I2C_M_RD;
> -       msgs[1].len =3D len;
> -       msgs[1].buf =3D reply;
> -
> -       ret =3D i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> +       msgs[0].len =3D cmd_len;
> +       msgs[0].buf =3D cmd;
> +       num =3D 1;
> +
> +       if (reply_len) {
> +               msgs[1].addr =3D client->addr;
> +               msgs[1].flags =3D I2C_M_RD;
> +               msgs[1].len =3D reply_len;
> +               msgs[1].buf =3D reply;
> +               num++;
> +       }
> +
> +       ret =3D i2c_transfer(client->adapter, msgs, num);
>         if (ret < 0)
>                 return ret;
> -       if (ret !=3D ARRAY_SIZE(msgs))
> +       if (ret !=3D num)
>                 return -EIO;
>
>         return 0;

Hold on, you are "patching" the code you just brought by the previous
patch?! No, just do from the beginning how it should be at the end.

...

> +#include <linux/devm-helpers.h>

Do you still need this?

...

> +#define FRONT_BUTTON_RELEASE_DELAY     50 /* ms */

Use proper unit suffix instead of a comment like many others do.

_MS here.

...

> +static const char * const omnia_mcu_gpio_templates[64] =3D {
> +       /* GPIOs with value read from the 16-bit wide status */
> +       [4]  =3D "gpio%u.MiniPCIe0 Card Detect",
> +       [5]  =3D "gpio%u.MiniPCIe0 mSATA Indicator",
> +       [6]  =3D "gpio%u.Front USB3 port over-current",
> +       [7]  =3D "gpio%u.Rear USB3 port over-current",
> +       [8]  =3D "gpio%u.Front USB3 port power",
> +       [9]  =3D "gpio%u.Rear USB3 port power",
> +       [12] =3D "gpio%u.Front Button",
> +
> +       /* GPIOs with value read from the 32-bit wide extended status */
> +       [16] =3D "gpio%u.SFP nDET",
> +       [28] =3D "gpio%u.MiniPCIe0 LED",
> +       [29] =3D "gpio%u.MiniPCIe1 LED",
> +       [30] =3D "gpio%u.MiniPCIe2 LED",
> +       [31] =3D "gpio%u.MiniPCIe0 PAN LED",
> +       [32] =3D "gpio%u.MiniPCIe1 PAN LED",
> +       [33] =3D "gpio%u.MiniPCIe2 PAN LED",
> +       [34] =3D "gpio%u.WAN PHY LED0",
> +       [35] =3D "gpio%u.WAN PHY LED1",
> +       [36] =3D "gpio%u.LAN switch p0 LED0",
> +       [37] =3D "gpio%u.LAN switch p0 LED1",
> +       [38] =3D "gpio%u.LAN switch p1 LED0",
> +       [39] =3D "gpio%u.LAN switch p1 LED1",
> +       [40] =3D "gpio%u.LAN switch p2 LED0",
> +       [41] =3D "gpio%u.LAN switch p2 LED1",
> +       [42] =3D "gpio%u.LAN switch p3 LED0",
> +       [43] =3D "gpio%u.LAN switch p3 LED1",
> +       [44] =3D "gpio%u.LAN switch p4 LED0",
> +       [45] =3D "gpio%u.LAN switch p4 LED1",
> +       [46] =3D "gpio%u.LAN switch p5 LED0",
> +       [47] =3D "gpio%u.LAN switch p5 LED1",
> +
> +       /* GPIOs with value read from the 16-bit wide extended control st=
atus */
> +       [48] =3D "gpio%u.eMMC nRESET",
> +       [49] =3D "gpio%u.LAN switch nRESET",
> +       [50] =3D "gpio%u.WAN PHY nRESET",
> +       [51] =3D "gpio%u.MiniPCIe0 nPERST",
> +       [52] =3D "gpio%u.MiniPCIe1 nPERST",
> +       [53] =3D "gpio%u.MiniPCIe2 nPERST",
> +       [54] =3D "gpio%u.WAN PHY SFP mux",
> +};

You may reduce the memory footprint of these just by doing "gpio%u."
part(s) outside. Here compiler won't compress this (as in the case of
repetitive string literals),

...

> +static const struct omnia_gpio {
> +       u8 cmd, ctl_cmd;
> +       u32 bit, ctl_bit;
> +       u32 int_bit;
> +       u16 feat, feat_mask;
> +} omnia_gpios[64] =3D {

It's much better to decouple definition and assignment and put
definition _before_ the macros that fill it.

> +};

...

> +               scoped_guard(mutex, &mcu->lock)
> +                       val =3D omnia_cmd_read_bit(mcu->client,
> +                                                CMD_GET_EXT_CONTROL_STAT=
US,
> +                                                EXT_CTL_PHY_SFP_AUTO);
> +
> +               if (val < 0)
> +                       return val;

I would move that under guard  for the sake of better readability
(usual pattern in place). It's anyway a slow path and one branch under
the mutex won't affect anything.

> +               if (val)
> +                       return GPIO_LINE_DIRECTION_IN;
> +
> +               return GPIO_LINE_DIRECTION_OUT;

...

> +       struct omnia_mcu *mcu =3D gpiochip_get_data(gc);
> +       u32 sts_bits, ext_sts_bits, ext_ctl_bits;
> +       int err, i;

> +       sts_bits =3D 0;
> +       ext_sts_bits =3D 0;
> +       ext_ctl_bits =3D 0;

Why not assign these inside the definition line?

...

> +       for_each_set_bit(i, mask, ARRAY_SIZE(omnia_gpios)) {
> +               if (omnia_gpios[i].cmd =3D=3D CMD_GET_STATUS_WORD)
> +                       __assign_bit(i, bits, sts_bits & omnia_gpios[i].b=
it);
> +               else if (omnia_gpios[i].cmd =3D=3D CMD_GET_EXT_STATUS_DWO=
RD)
> +                       __assign_bit(i, bits, ext_sts_bits &
> +                                             omnia_gpios[i].bit);

One line?

> +               else if (omnia_gpios[i].cmd =3D=3D CMD_GET_EXT_CONTROL_ST=
ATUS)
> +                       __assign_bit(i, bits, ext_ctl_bits &
> +                                             omnia_gpios[i].bit);

Ditto?

> +       }

...

> +       struct omnia_mcu *mcu =3D gpiochip_get_data(gc);
> +       u16 ext_ctl, ext_ctl_mask;
> +       u8 ctl, ctl_mask;
> +       int i;
> +
> +       ctl =3D 0;
> +       ctl_mask =3D 0;
> +       ext_ctl =3D 0;
> +       ext_ctl_mask =3D 0;

Assignments in the definition line?

...

> +       for_each_set_bit(i, mask, ARRAY_SIZE(omnia_gpios)) {
> +               if (omnia_gpios[i].ctl_cmd =3D=3D CMD_GENERAL_CONTROL) {
> +                       ctl_mask |=3D omnia_gpios[i].ctl_bit;
> +                       if (test_bit(i, bits))
> +                               ctl |=3D omnia_gpios[i].ctl_bit;
> +               } else if (omnia_gpios[i].ctl_cmd =3D=3D CMD_EXT_CONTROL)=
 {
> +                       ext_ctl_mask |=3D omnia_gpios[i].ctl_bit;
> +                       if (test_bit(i, bits))
> +                               ext_ctl |=3D omnia_gpios[i].ctl_bit;
> +               }
> +       }

...

> +/**
> + * omnia_mask_interleave - Interleaves the bytes from @rising and @falli=
ng
> + *     @dst: the destination u8 array of interleaved bytes
> + *     @rising: rising mask
> + *     @falling: falling mask
> + *
> + * Interleaves the little-endian bytes from @rising and @falling words.
> + *
> + * If @rising =3D (r0, r1, r2, r3) and @falling =3D (f0, f1, f2, f3), th=
e result is
> + * @dst =3D (r0, f0, r1, f1, r2, f2, r3, f3).
> + *
> + * The MCU receives interrupt mask and reports pending interrupt bitmap =
int this

an interrupt
a pending
int --> in ?

> + * interleaved format. The rationale behind it is that the low-indexed b=
its are
> + * more important - in many cases, the user will be interested only in
> + * interrupts with indexes 0 to 7, and so the system can stop reading af=
ter
> + * first 2 bytes (r0, f0), to save time on the slow I2C bus.
> + *
> + * Feel free to remove this function and its inverse, omnia_mask_deinter=
leave,
> + * and use an appropriate bitmap_* function once such a function exists.
> + */
> +static void omnia_mask_interleave(u8 *dst, u32 rising, u32 falling)
> +{
> +       for (int i =3D 0; i < sizeof(u32); ++i) {
> +               dst[2 * i] =3D rising >> (8 * i);
> +               dst[2 * i + 1] =3D falling >> (8 * i);
> +       }

I will look at this later on,

> +}

> +static void omnia_mask_deinterleave(const u8 *src, u32 *rising, u32 *fal=
ling)
> +{
> +       *rising =3D *falling =3D 0;
> +
> +       for (int i =3D 0; i < sizeof(u32); ++i) {
> +               *rising |=3D src[2 * i] << (8 * i);
> +               *falling |=3D src[2 * i + 1] << (8 * i);
> +       }
> +}

and into this.

...

> +static size_t omnia_irq_compute_pending_length(u32 rising, u32 falling)
> +{
> +       size_t rlen =3D 0, flen =3D 0;
> +
> +       if (rising)
> +               rlen =3D ((__fls(rising) >> 3) << 1) + 1;
> +
> +       if (falling)
> +               flen =3D ((__fls(falling) >> 3) << 1) + 2;
> +
> +       return max(rlen, flen);
> +}

I am not sure why you need this, but it can be done easily

x =3D ((__fls(falling | rising) >> 3) << 1) + 1;
if (falling)
  return x + 1;
return x;

and most likely you can drop minmax.h.

...

> +static const char * const front_button_modes[2] =3D { "mcu", "cpu" };

2 is not needed.

...

> -#include <linux/i2c.h>

??? That is exactly the point to have things done from the beginning.

> +#include <linux/bitops.h>
> +#include <linux/gpio/driver.h>
>  #include <linux/if_ether.h>
> +#include <linux/mutex.h>
>  #include <linux/types.h>
> +#include <linux/workqueue.h>
>  #include <asm/byteorder.h>

...

> +       err =3D omnia_cmd_read(client, cmd, &reply, (__fls(bits) >> 3) + =
1);

Perhaps a helper for this (__fls(x) >> 3 + (y)) ? It seems it's used
in a few places.


> +       if (err)
> +               return err;

--
With Best Regards,
Andy Shevchenko

