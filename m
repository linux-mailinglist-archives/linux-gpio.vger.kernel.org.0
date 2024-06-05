Return-Path: <linux-gpio+bounces-7202-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 706A98FD5C2
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 20:30:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E35201F23AF9
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 18:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE61513A3E8;
	Wed,  5 Jun 2024 18:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRRXh8Lk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1879C152
	for <linux-gpio@vger.kernel.org>; Wed,  5 Jun 2024 18:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717612226; cv=none; b=JcaninmAEkvVY83Ve6k9KncW7hP8NrtHC+jk/nuzfsBn7KFL1Yz6QcuYbTwmb6Fo8eImP5DXRAoss307i8oePtweZNaZgm0KMJhNVOVMiwtDIR9KarFCFvjoXmsBivesINgzzmmPR1221favOSsQwB/OZgsyaxiFk/2MDI+ppP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717612226; c=relaxed/simple;
	bh=knuIzwrUBCD2fj4qrV0AwRahf0VJUpriA76uAO60oPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LdxeBTqMxL42/B5GCxQ43kc7zmqqwOLQYWo9r4pNFIIpQopUXa6Zr5ZBudU9MQDf568Nnu5qblT5zkOn27URZCOA2ZAfjv5tOF2CL/3uyIeVBE3KP8BIEYlIKGwV0BYk0mTds0Dnl/85E4wWNQZXKhpriLjnY6S79wWMqyLDRGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRRXh8Lk; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a68c8b90c85so17396666b.2
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jun 2024 11:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717612223; x=1718217023; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJBQrbKQAQ37XdPLyUEukmtRl60htx54rewpyFLxuRk=;
        b=kRRXh8LkHuGR9omKsLYwvNUDI10x74R0sgG138A6VaIshAuks4mznMT/94xXFzevDs
         MVkSjOFHwIvqccLM8Ckz8M39fjHENYVMWGnRp/56SMLLAohq/oB69J84kq9kvBdlFJ4o
         yoKMfFbu2zHOpzQ/k/w0bNogcD7+iZxzsG7mBwwim9KwagWIG5xg1NDuNuLUptfrx3jP
         KDj9iHgKVeiXz7taSwVe1MRVzewcxtPtTGJpFn0sR4uceECq82jFzgoLZWNgl92kBFhm
         N3b7H0dJ0MeEyey7nXey2/rs0knpwYD++pa00fuewqKVth/CqjybnMuyR/Gtwvw1onSO
         o4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717612223; x=1718217023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJBQrbKQAQ37XdPLyUEukmtRl60htx54rewpyFLxuRk=;
        b=fCFtTyWWrsJ2sHYFe82ILVpkoVfu8Rr6osy+saT8G7ROvyBPwm4TaBCll1qxXNhT7b
         UECsM3tATfDPg1SXjYzwsNaBtQmn2Wjrhtr6LWpPf3Pb1NmjwVXe/G+Myq6Y/JqaJbmJ
         mPjga1a0/VSLKEIayP4LSbi+muIs8LBVuR6/k89OqQTH2nD05r5RJZL3OMIlSVtwmwtw
         uLt5O1TG6uzPxjyDQLSKZ33BDrJ1NuldHHTOXscgnqe3vo+qxCvZ7jifw85bILk5HWRu
         RZ3w5HCRv1hWvtEavsa9cgXh0sUefcZKxKEdyNG9yTDVkAs8c1ZaC7svV2DR6HyOi3+e
         lXIg==
X-Forwarded-Encrypted: i=1; AJvYcCXB19MqXVU1AfnUCAhpi086AVqMBXC4XD5x0YrX1LjseZA2h29WzL7vXK9a0QwQ4Nwh7M/ebAMnwd/YgShWfDKg2WnBbcx+LePcBQ==
X-Gm-Message-State: AOJu0YzngehChb4eaZUjCzcMUkzue8nAEOzHpK7QFfib0trvwzvV1Qyb
	BMt3N5Q5vg9M7KkPjBfLjcSlJ7JatMp4hJAhd0hZWYpRVONuEml/oQkfmjYoqC4aa1msS+AzYak
	bVgPSQJK9NVAKN/Cf5rGDu7J+soQ=
X-Google-Smtp-Source: AGHT+IHfyveSIpI6MOKH1G87H3XlL3720J1mD/sqIT/RcdjboPMY1TH92Q4nPuzcM+N773kMvgshkQDbH83fBHfZ+YM=
X-Received: by 2002:a17:907:770c:b0:a67:7649:3c3c with SMTP id
 a640c23a62f3a-a69a000e966mr274260466b.56.1717612222988; Wed, 05 Jun 2024
 11:30:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605161851.13911-1-kabel@kernel.org> <20240605161851.13911-4-kabel@kernel.org>
In-Reply-To: <20240605161851.13911-4-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 5 Jun 2024 21:29:46 +0300
Message-ID: <CAHp75VfsUZ=1u4dk-YniFpOSwWVSo6Qg124RBJAikBwu2Hj1vw@mail.gmail.com>
Subject: Re: [PATCH v11 3/8] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 7:19=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org> =
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

> +#include <linux/array_size.h>
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/bug.h>
> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/devm-helpers.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/mutex.h>
> +#include <linux/sysfs.h>

> +#include <linux/turris-omnia-mcu-interface.h>

As per previous patch.

> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +#include <asm/unaligned.h>
> +
> +#include "turris-omnia-mcu.h"

...

> +struct omnia_gpio {
> +       u8 cmd, ctl_cmd, bit, ctl_bit, int_bit;
> +       bool has_int;
> +       u16 feat, feat_mask;
> +};

This is hard to follow, please make one field per line.

...

> +#define _DEF_GPIO(_cmd, _ctl_cmd, _bit, _ctl_bit, _int_bit, _feat, _feat=
_mask) \
> +       {                                                               \
> +               .cmd =3D _cmd,                                           =
 \
> +               .ctl_cmd =3D _ctl_cmd,                                   =
 \
> +               .bit =3D _bit,                                           =
 \
> +               .ctl_bit =3D _ctl_bit,                                   =
 \
> +               .int_bit =3D _int_bit,                                   =
 \

> +               .has_int =3D (_int_bit) !=3D -1,                         =
   \

Useless field, you can always perform this check in the code Since you
have int_bit field defined. Filling it with kinda garbage is not an
excuse, you can just define the INVALID_IRQ like many drivers do that
want to use unsigned types.

#define OMNIA_GPIO_INVALID_INT_BIT  0xff

Possibly to have
static inline is_int_bit_valid(struct omnia_gpio *gpio)
{
  return gpio->int_bit !=3D OMNIA_GPIO_INVALID_INT_BIT;
}

...

> +       /*
> +        * If firmware does support the new interrupt API, we may have ca=
ched
> +        * the value of a GPIO in the interrupt service routine. If not, =
read
> +        * the relevant bit now.
> +        */

> +       if (gpio->has_int && test_bit(gpio->int_bit, &mcu->is_cached))

See above.

> +               return test_bit(gpio->int_bit, &mcu->cached);
> +
> +       return omnia_cmd_read_bit(mcu->client, gpio->cmd, BIT(gpio->bit))=
;
> +}


> +       /* assign relevant bits in result */
> +       for_each_set_bit(i, mask, ARRAY_SIZE(omnia_gpios)) {
> +               field =3D _relevant_field_for_sts_cmd(omnia_gpios[i].cmd,
> +                                                   &sts, &ext_sts, &ext_=
ctl);

> +               if (field)

Perhaps

  if (!field)
    continue;

?

> +                       __assign_bit(i, bits,
> +                                    test_bit(omnia_gpios[i].bit, field))=
;

This will become one line after the above change.

> +       }
> +
> +       return 0;
> +}

...

> +       int i;

Why signed?

> +       for_each_set_bit(i, mask, ARRAY_SIZE(omnia_gpios)) {
> +               unsigned long *field, *field_mask;
> +               u8 bit =3D omnia_gpios[i].ctl_bit;
> +
> +               switch (omnia_gpios[i].ctl_cmd) {
> +               case OMNIA_CMD_GENERAL_CONTROL:
> +                       field =3D &ctl;
> +                       field_mask =3D &ctl_mask;
> +                       break;
> +               case OMNIA_CMD_EXT_CONTROL:
> +                       field =3D &ext_ctl;
> +                       field_mask =3D &ext_ctl_mask;
> +                       break;
> +               default:
> +                       field =3D field_mask =3D NULL;
> +                       break;
> +               }

> +               if (field) {

Like the above

  if (!field)
    continue;

> +                       __set_bit(bit, field_mask);
> +                       __assign_bit(bit, field, test_bit(i, bits));
> +               }
> +       }

...

> +       if (!(type & IRQ_TYPE_EDGE_BOTH)) {
> +               dev_err(dev, "irq %u: unsupported type %u\n", d->irq, typ=
e);

You have hwirq, no need to dereference again.

> +               return -EINVAL;
> +       }

...

> +/**
> + * omnia_mask_interleave - Interleaves the bytes from @rising and @falli=
ng
> + *     @dst: the destination u8 array of interleaved bytes
> + *     @rising: rising mask
> + *     @falling: falling mask

Why so many spaces before @? One is enough.

> + *
> + * Interleaves the little-endian bytes from @rising and @falling words.
> + *
> + * If @rising =3D (r0, r1, r2, r3) and @falling =3D (f0, f1, f2, f3), th=
e result is
> + * @dst =3D (r0, f0, r1, f1, r2, f2, r3, f3).
> + *
> + * The MCU receives an interrupt mask and reports a pending interrupt bi=
tmap in
> + * this interleaved format. The rationale behind this is that the low-in=
dexed
> + * bits are more important - in many cases, the user will be interested =
only in
> + * interrupts with indexes 0 to 7, and so the system can stop reading af=
ter
> + * first 2 bytes (r0, f0), to save time on the slow I2C bus.
> + *
> + * Feel free to remove this function and its inverse, omnia_mask_deinter=
leave,
> + * and use an appropriate bitmap_*() function once such a function exist=
s.
> + */
> +static void
> +omnia_mask_interleave(u8 *dst, unsigned long rising, unsigned long falli=
ng)

But rising and failing should be either u64 or unsigned long *.

> +{
> +       for (int i =3D 0; i < sizeof(u32); ++i) {

In other cases you use:
1) unsigned
2) post-increment

What makes this one special?

> +               dst[2 * i] =3D rising >> (8 * i);
> +               dst[2 * i + 1] =3D falling >> (8 * i);
> +       }
> +}

...

> +/**
> + * omnia_mask_deinterleave - Deinterleaves the bytes into @rising and @f=
alling
> + *     @src: the source u8 array containing the interleaved bytes
> + *     @rising: pointer where to store the rising mask gathered from @sr=
c
> + *     @falling: pointer where to store the falling mask gathered from @=
src
> + *
> + * This is the inverse function to omnia_mask_interleave.
> + */
> +static void omnia_mask_deinterleave(const u8 *src, unsigned long *rising=
,
> +                                   unsigned long *falling)
> +{
> +       *rising =3D *falling =3D 0;
> +
> +       for (int i =3D 0; i < sizeof(u32); ++i) {
> +               *rising |=3D src[2 * i] << (8 * i);
> +               *falling |=3D src[2 * i + 1] << (8 * i);
> +       }
> +}

Same comments as per above function.

--=20
With Best Regards,
Andy Shevchenko

