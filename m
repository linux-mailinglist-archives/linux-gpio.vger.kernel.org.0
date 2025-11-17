Return-Path: <linux-gpio+bounces-28580-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 01917C6393E
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 11:35:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 538FE347DC8
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 10:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F1A3246F4;
	Mon, 17 Nov 2025 10:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MHRxvTgm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB9831E106
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 10:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763375327; cv=none; b=STkQHS+05m9adsoJTp0v4Xa0NUReBhANzFSRNnNoh6T6Auh2riMyrT7TMvzuLJtb0HY3O1u5EdTt8JOfWT/Ibc5v1Q6J0YmwbnD5KViWCTI9GLD5tqTYL7tDUD0WUOP37/prpUAg3Gk5VdiEXYyy6DnxPnblHCN4LUy/T5IGVxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763375327; c=relaxed/simple;
	bh=s+iROLNXr0PR/ebcGstX05mh2QdPAP+zsgiqjeVNAgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WbLRHEsRGiqzIySsfopkq+w0+esAPUHI8c6SboesV7stsMFUQkf7xgWQ7U6xpnDIoQGldm06XCxWB9xbqfp4akLXx4QD4hx2wYbY8Yn/EozV4YMq/4DXVKTLIZwzWDah0+bDXVZOCqsBSQ78Z380mFl5DnF+lJd/FAvFxiLe7F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MHRxvTgm; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37a5bc6b491so32511451fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 02:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763375323; x=1763980123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkJMtTN7NxZ+mZUREGtT9UKMbYN1mlB2BuJUoJdFB9Q=;
        b=MHRxvTgm6oNnyspS9xikC5Tjgku5HViDeGOlipM9KsaYZgg8RsIPyed1rlLa6CgARm
         v8J08ga8hHv1KA4RtgdnxPigz4solKJgp4zxpsyPSGKY/VR0FV6ptmh1OgQ37vmVhc1y
         Cgc2S8NpFXEqkcNMpFs5XlhLigftagU/RMc7UzzsEiJEWhBqD8ot8TN+S9BVIN/d+coe
         KsRp0bjhtjfg0GBjlAXlu96bIh9D2vY78tSbUuB9kKtbXa4j5CWIf3uZu93me42XNdTy
         bXFVSNSNz1HZZvqN9ed3K2F44bTnZDT2Bgd4G2wCknvazxT09T2ttqanYR6iMOTBy70g
         KXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763375323; x=1763980123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qkJMtTN7NxZ+mZUREGtT9UKMbYN1mlB2BuJUoJdFB9Q=;
        b=NAgbUy7PQNIWizbquUuOtGkSjlKrMe35tnQHw8U10vdFcE/5sCY/Ezts1IkCECZGi0
         Deb4h6Bj5Z7/JkNxeqVnCscTV4vxnuN3UuPrZ3NbQZpj+FbE6mq3B83sOE8Tzdwk3Ccs
         BG75ieeLZ8TLMNF9cH9RKn3H1vnvwt2lzGrVRMSOSQxyuscLE3ha5zyC03bKvCz7OdyI
         MqxOrngo6XRAQ1lXqmxJqg5FMNafXLOzMP1kKEn53w54E0SPVqsoiXlOcAaDfiIYbag7
         jqLiecX0bodnQRMwZaiMu2fe59UgfL6ON2XUDR268VtVuwv2iz3rzZfg100QkuE4Fgvl
         Xrlw==
X-Forwarded-Encrypted: i=1; AJvYcCXLnDv3aP9FsOllANBeTEOljD0+J3I8mlKdabcFl5mjjKWpnQmNhHFwWyF9VESF9nJEhns6x2vV7XNf@vger.kernel.org
X-Gm-Message-State: AOJu0YwES/WrBYhxJ3TbHxY1Z5EO4GsvZMaYdSgo7iZHKXDXwEk/V2bu
	u5v95Y/X2oDBCpSrtwCYnd/8TCORPXdo1E8VByBZwqWPCfV9Zo+YqDPpfFta4KL/Gm6JFPGXMHv
	5UB9ubpFjL8U5cySd94fou+wNhPpjlM1g/ZjZ1AHT2g==
X-Gm-Gg: ASbGncsP4AV1ws1Nd09Cfh6Zg7bJE1bkEEKWIc3fLPSR713hhddu1PfiIDuhit3ZsHT
	oak6pn8mlt8alYPExH1GoSwlTjq0AgMqaaBtD5nATb5quttqkUL3x5LQf/3DR61PgFmvZJ33YHf
	bGHEUw+crBIJcInVziAi8ttipDWyf8aZEeiCDT0pxKBeC4Znl+XqESfapTLaDTzwGxudzLS7cA+
	0CJYleF45E3AuJT1I2PotuIR7+fSQJEXsxOY30gME1ne71zCe3Rq+ZNyJQoG9VQfl4udBO3vyBR
	qSN0kR3P/fn3x+LF/FwWKaORSEo=
X-Google-Smtp-Source: AGHT+IENV8CzaL1K6Mya3S06DEhM6EMRTPuSzPHFw2nXA/z7e0mvMy8eMA+dW5u5JNz+Rug2kI4wZiVyhTp0m7NKaNs=
X-Received: by 2002:a05:6512:108e:b0:595:831d:22ff with SMTP id
 2adb3069b0e04-595841b4e6emr3599560e87.21.1763375323425; Mon, 17 Nov 2025
 02:28:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_1B2BC712D34FBE7DEB01320E665BEB2D8908@qq.com>
In-Reply-To: <tencent_1B2BC712D34FBE7DEB01320E665BEB2D8908@qq.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 17 Nov 2025 11:28:30 +0100
X-Gm-Features: AWmQ_blYR97KDYJ-s8zL-cfGqAncf-5UAgYD74kk8M7UvymRUP2B67vorJGJc58
Message-ID: <CAMRc=Md9-Tqejkmw0dTOj686ZZ=QABEqeKgz1xUYniJ-swnxxA@mail.gmail.com>
Subject: Re: [PATCH] leds: add aw91xxx driver
To: 429368636@qq.com
Cc: lee@kernel.org, pavel@kernel.org, linus.walleij@linaro.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-gpio@vger.kernel.org, zhangxinyu <gavin.zhang@faiot.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 10:36=E2=80=AFAM <429368636@qq.com> wrote:
>
> From: zhangxinyu <gavin.zhang@faiot.com>
>
> This commit adds support for AWINIC AW91XXX 6-channel LED driver.
> The chip supports 6 PWM channels and is controlled with I2C.
>
> Signed-off-by: zhangxinyu <429368636@qq.com>
> ---

Hi!

I have only skimmed through the code as it still requires a lot of work.

> diff --git a/drivers/leds/leds-aw91xxx.c b/drivers/leds/leds-aw91xxx.c
> new file mode 100644
> index 000000000000..8d809f3e443b
> --- /dev/null
> +++ b/drivers/leds/leds-aw91xxx.c
> @@ -0,0 +1,1865 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * leds-aw91xxx.c   aw91xxx led module
> + *
> + * Copyright (c) 2021 AWINIC Technology CO., LTD
> + *
> + * This program is free software; you can redistribute  it and/or modify=
 it
> + * under  the terms of  the GNU General  Public License as published by =
the
> + * Free Software Foundation;  either version 2 of the  License, or (at y=
our
> + * option) any later version.
> + */
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/workqueue.h>
> +#include <linux/errno.h>
> +#include <linux/pm.h>
> +#include <linux/platform_device.h>
> +#include <linux/input.h>
> +#include <linux/i2c.h>
> +#include <linux/gpio.h>

Including this legacy header makes it an immediate NAK. Please use
interfaces from linux/gpio/consumer.h.

> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/of_gpio.h>
> +#include <linux/slab.h>
> +#include <linux/wait.h>
> +#include <linux/time.h>
> +#include <linux/delay.h>
> +#include <linux/of_gpio.h>

Duplicated include. Also: you don't really need it.

> +#include <linux/miscdevice.h>
> +#include <linux/uaccess.h>
> +#include <linux/leds.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/hrtimer.h>
> +#include <linux/kernel.h>
> +#include <linux/firmware.h>
> +#include <linux/version.h>
> +#include <linux/debugfs.h>
> +#include <linux/leds.h>
> +#include <linux/fb.h>

Please order includes alphabetically, you'll avoid duplications.

> +//#include <stddef.h>

??

> +#include "leds-aw91xxx.h"

What's the reason for this header's existence? Doesn't seem like
anything here should be public?

> +
> +static DEVICE_ATTR_RW(reg);
> +static DEVICE_ATTR_RW(hwen);
> +static DEVICE_ATTR_RW(blink);
> +static DEVICE_ATTR_WO(dim);
> +static DEVICE_ATTR_WO(all_dim);
> +static DEVICE_ATTR_WO(fade_mode);
> +
> +
> +static struct attribute *aw91xxx_attributes[] =3D {
> +       &dev_attr_reg.attr,
> +       &dev_attr_hwen.attr,
> +       &dev_attr_blink.attr,
> +       &dev_attr_dim.attr,
> +       &dev_attr_all_dim.attr,
> +       &dev_attr_fade_mode.attr,
> +       NULL
> +};
> +
> +static struct attribute_group aw91xxx_attribute_group =3D {
> +       .attrs =3D aw91xxx_attributes
> +};

This whole driver looks like it belongs in driver/staging/ for now.
The LEDs subsystem provides all the relevant sysfs attributes already.
You shouldn't create your own.

> +
> +static void aw91xxx_i2c_remove(struct i2c_client *i2c)
> +{
> +       struct aw91xxx *aw91xxx =3D i2c_get_clientdata(i2c);
> +
> +       if (gpio_is_valid(aw91xxx->reset_gpio))
> +               gpio_free(aw91xxx->reset_gpio);
> +       aw91xxx_gpio_free_all_resource(aw91xxx);
> +       devm_kfree(aw91xxx->dev, aw91xxx);

The whole purpose of devres is to not have to do this.

> +
> +}
> +
> +static const struct i2c_device_id aw91xxx_i2c_id[] =3D {
> +       { AW91XXX_I2C_NAME, 0 },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(i2c, aw91xxx_i2c_id);
> +
> +static const struct of_device_id aw91xxx_dt_match[] =3D {
> +       { .compatible =3D "awinic,aw91xxx_led" },
> +       { },
> +};

You need DT bindings for this too.

Bart

