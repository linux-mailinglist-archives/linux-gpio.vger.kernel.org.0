Return-Path: <linux-gpio+bounces-10629-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A134098BD37
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 15:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FD08B23C1B
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 13:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2025D1C4622;
	Tue,  1 Oct 2024 13:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PqSci2JL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A891C3F03
	for <linux-gpio@vger.kernel.org>; Tue,  1 Oct 2024 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727788560; cv=none; b=ronovbJ0n2Xo6Ibe1cNp/A/N6XtMJcKu6VPzR0z1kEtnoHSxmd+PL8zjSemkP8gpGH1wcBYLbbhyzkLcN1Po8Hg8ThK34ycQra9EnVUj3jFMuqTmUy9WW2uzxcZXR+h9JHys/wE7BXEgCwWLIVFzy28x9BdPYtwLmxXLOJFQvdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727788560; c=relaxed/simple;
	bh=FVAk+BLOdIqzb/efcHFww/qH9ibBCHrZeGC+jervWLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TzVs/GhDEtoMQ9Lqnt2ESYa1qJunJKH8vs2bl4PZ41sGzq8zRaveotGN6loLbgkVRnx2Oh75b5dRKKkdDeB8W7PiPBh1RklOX8MNji0np3F6HGpYTlUFMFbTazxJuQMsVgttSlF4cSndwOBEuuObsdupwjvFYrf1EoSrnek06Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PqSci2JL; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5399041167cso3843148e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Oct 2024 06:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727788556; x=1728393356; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5d0oytKKUoV7wMWG1zsqDf6MGeXNHEnligQuB1wzGpo=;
        b=PqSci2JLbfqwQJm5OFcf71XqciE5/WJHPWbIwovTVnZEDzRZw0AHzTwfoQJCYw6c8C
         fyDXkw71z06C32nj8Ej8rcwUpp5BGNysTZH2AuolhYWr14J2gKtj4LGAPpeCwu/4ItVg
         AFJ7WgMiTPFEQZQBciy3kJI0ow+xqhmD6Y4RZmDDQMcWm/CvnjmglrIy423XHWe5arqF
         IDWJDUqRq8lseiFi45iPzWtc5uYHuwY1QSeYk+ai7KEaL5tXPwqQGrDFp/WQ79FLIyLj
         QAupn/Qf35GZ9cI33GA4oXPHuHvLVmbwkknvfmpRIL2ym405qOSB71U9cVzyestsIiNH
         Sg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727788556; x=1728393356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5d0oytKKUoV7wMWG1zsqDf6MGeXNHEnligQuB1wzGpo=;
        b=Ue7gFKDKw2vtHBPZKVmiAZwk7UWI3wqajUfjBngEzL8U/HQQ5uT9GpLRqswOtKI/MU
         UCR+f4LU4GPEqss+LcbQX0QxziRhHcuBWqJx19QPxMDfWjo65AVMz7uj6ldtIVpUN+/v
         M2g+I6kNmR0kdBHISVGJQc6p86i7t6+aYn2EblYKDxcIR5hTV9XO1gAQwRaOsyw8ruqT
         g9W6DXW/qmUHWqQQbTRQEOydXKSijWAgib8awKb/qP2wK/xxbjpL9N9zqinA3qkj4tcS
         uRKhinG9ktuJZJt9+73MeU7bJfGE/9x8xtCRSx5Xbs1Bj3cr8cc5lmE0olLSWTY8k+Wx
         dGSA==
X-Forwarded-Encrypted: i=1; AJvYcCUhAGkH1Kbo4B2bMUCiBTQygpIEOqqXXZsGzGbIUrj5ChlTvF4au4M2JdEriwHZnS9HXm089N8JdQtQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwwTaMd8Xv6jc1f0WL8zQaiHvn5/IZFxFaM9a6Fs1AYZQTGRBwQ
	SpvZqWWx85pNuGuYMv3AiEGplGlIhu+ztH8r+fipTnZGT+K4Ph5Ec+kpAJe0MkcDfNVT1lve3in
	vJgndj5HMXLTlAERrPBNiLWNXWyR9bXe25p8JFA==
X-Google-Smtp-Source: AGHT+IFSCJODkQZaEKKvFqJ003dLieDQX4xED+qGDI+GkjgnscjHC7N9CLzuAMkbp4HaVOfhZAiiAgojIxmNepS1Y24=
X-Received: by 2002:a05:6512:3343:b0:531:8f2f:8ae7 with SMTP id
 2adb3069b0e04-5389fc46b2dmr10930455e87.25.1727788555727; Tue, 01 Oct 2024
 06:15:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926143122.1385658-1-andrei.stefanescu@oss.nxp.com> <20240926143122.1385658-4-andrei.stefanescu@oss.nxp.com>
In-Reply-To: <20240926143122.1385658-4-andrei.stefanescu@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Oct 2024 15:15:43 +0200
Message-ID: <CACRpkdaYcis2r6eNDfdXV9zcXof6x_XfGHFADJ2RojxLNp7C-A@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs support
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Enric Balletbo <eballetb@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrei,

thanks for your patch!

Sorry for being so late in giving any deeper review of it.

On Thu, Sep 26, 2024 at 4:32=E2=80=AFPM Andrei Stefanescu
<andrei.stefanescu@oss.nxp.com> wrote:

> Add the GPIO driver for S32G2/S32G3 SoCs. This driver uses the SIUL2
> (System Integration Unit Lite2) hardware module. There are two
> SIUL2 hardware modules present, SIUL2_0(controlling GPIOs 0-101) and
> SIUL2_1 for the rest.
>
> The GPIOs are not fully contiguous, there are some gaps:
> - GPIO102 up to GPIO111(inclusive) are invalid
> - GPIO123 up to GPIO143(inclusive) are invalid
>
> Some GPIOs are input only(i.e. GPI182) though this restriction
> is not yet enforced in code.
>
> This patch adds basic GPIO functionality(no interrupts, no
> suspend/resume functions).
>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

(...)

> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/pinctrl/consumer.h>

Hm, are you sure you don't want one of those combined
GPIO+pinctrl drivers? Look in drivers/pinctrl for examples such
as drivers/pinctrl/pinctrl-stmfx.c

> +/* PGPDOs are 16bit registers that come in big endian
> + * order if they are grouped in pairs of two.
> + *
> + * For example, the order is PGPDO1, PGPDO0, PGPDO3, PGPDO2...
> + */
> +#define SIUL2_PGPDO(N)         (((N) ^ 1) * 2)
> +#define S32G2_SIUL2_NUM                2
> +#define S32G2_PADS_DTS_TAG_LEN 7
> +
> +#define SIUL2_GPIO_16_PAD_SIZE 16

You seem to be manipulating "pads" which is pin control territory.
That should be done in a pin control driver.

> +/**
> + * struct siul2_device_data  - platform data attached to the compatible.
> + * @pad_access: access table for I/O pads, consists of S32G2_SIUL2_NUM t=
ables.
> + * @reset_cnt: reset the pin name counter to zero when switching to SIUL=
2_1.
> + */
> +struct siul2_device_data {
> +       const struct regmap_access_table **pad_access;
> +       const bool reset_cnt;

I don't understand the reset_cnt variable at all. Explain why it exists in =
the
kerneldoc please.

> +/**
> + * struct siul2_desc - describes a SIUL2 hw module.
> + * @pad_access: array of valid I/O pads.

Now that is really pin control isn't it.

> + * @opadmap: the regmap of the Parallel GPIO Pad Data Out Register.
> + * @ipadmap: the regmap of the Parallel GPIO Pad Data In Register.
> + * @gpio_base: the first GPIO pin.
> + * @gpio_num: the number of GPIO pins.
> + */
> +struct siul2_desc {
> +       const struct regmap_access_table *pad_access;
> +       struct regmap *opadmap;
> +       struct regmap *ipadmap;
> +       u32 gpio_base;
> +       u32 gpio_num;
> +};
(...)

> +static int siul2_get_gpio_pinspec(struct platform_device *pdev,
> +                                 struct of_phandle_args *pinspec,
> +                                 unsigned int range_index)
> +{
> +       struct device_node *np =3D pdev->dev.of_node;
> +
> +       return of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
> +                                               range_index, pinspec);
> +}

I do not see why a driver would parse gpio-ranges since the gpiolib
core should normally deal with the translation between GPIO lines
and pins.

This looks hacky and probably an indication that you want to use
a combined pinctrl+gpio driver so the different parts of the driver
can access the same structures easily without hacks.

> +static void siul2_gpio_set_direction(struct siul2_gpio_dev *dev,
> +                                    unsigned int gpio, int dir)
> +{
> +       guard(raw_spinlock_irqsave)(&dev->lock);
> +
> +       if (dir =3D=3D GPIO_LINE_DIRECTION_IN)
> +               __clear_bit(gpio, dev->pin_dir_bitmap);
> +       else
> +               __set_bit(gpio, dev->pin_dir_bitmap);
> +}

This looks like a job for gpio regmap?

select GPIO_REGMAP,
look in other driver for examples of how to use it.

> +static int siul2_get_direction(struct siul2_gpio_dev *dev,
> +                              unsigned int gpio)
> +{
> +       return test_bit(gpio, dev->pin_dir_bitmap) ? GPIO_LINE_DIRECTION_=
OUT :
> +                                                    GPIO_LINE_DIRECTION_=
IN;
> +}

Also looks like a reimplementation of GPIO_REGMAP.

> +static int siul2_gpio_dir_out(struct gpio_chip *chip, unsigned int gpio,
> +                             int val)
> +{
> +       struct siul2_gpio_dev *gpio_dev;
> +       int ret =3D 0;
> +
> +       gpio_dev =3D to_siul2_gpio_dev(chip);
> +       siul2_gpio_set_val(chip, gpio, val);
> +
> +       ret =3D pinctrl_gpio_direction_output(chip, gpio);
(...)

This is nice, pin control is properly used as the back-end.

> +static int siul2_gpio_remove_reserved_names(struct device *dev,
> +                                           struct siul2_gpio_dev *gpio_d=
ev,
> +                                           char **names)
> +{
> +       struct device_node *np =3D dev->of_node;
> +       int num_ranges, i, j, ret;
> +       u32 base_gpio, num_gpio;
> +
> +       /* Parse the gpio-reserved-ranges to know which GPIOs to exclude.=
 */
> +
> +       num_ranges =3D of_property_count_u32_elems(dev->of_node,
> +                                                "gpio-reserved-ranges");
> +
> +       /* The "gpio-reserved-ranges" is optional. */
> +       if (num_ranges < 0)
> +               return 0;
> +       num_ranges /=3D 2;
> +
> +       for (i =3D 0; i < num_ranges; i++) {
> +               ret =3D of_property_read_u32_index(np, "gpio-reserved-ran=
ges",
> +                                                i * 2, &base_gpio);
> +               if (ret) {
> +                       dev_err(dev, "Could not parse the start GPIO: %d\=
n",
> +                               ret);
> +                       return ret;
> +               }
> +
> +               ret =3D of_property_read_u32_index(np, "gpio-reserved-ran=
ges",
> +                                                i * 2 + 1, &num_gpio);
> +               if (ret) {
> +                       dev_err(dev, "Could not parse num. GPIOs: %d\n", =
ret);
> +                       return ret;
> +               }
> +
> +               if (base_gpio + num_gpio > gpio_dev->gc.ngpio) {
> +                       dev_err(dev, "Reserved GPIOs outside of GPIO rang=
e\n");
> +                       return -EINVAL;
> +               }
> +
> +               /* Remove names set for reserved GPIOs. */
> +               for (j =3D base_gpio; j < base_gpio + num_gpio; j++) {
> +                       devm_kfree(dev, names[j]);
> +                       names[j] =3D NULL;
> +               }
> +       }
> +
> +       return 0;
> +}

I don't get this. gpio-reserved-ranges is something that is parsed and
handled by gpiolib. Read the code in gpiolib.c and you'll probably
figure out how to let gpiolib take care of this for you.

> +static int siul2_gpio_populate_names(struct device *dev,
> +                                    struct siul2_gpio_dev *gpio_dev)
> +{
> +       unsigned int num_index =3D 0;
> +       char ch_index =3D 'A';
> +       char **names;
> +       int i, ret;
> +
> +       names =3D devm_kcalloc(dev, gpio_dev->gc.ngpio, sizeof(*names),
> +                            GFP_KERNEL);
> +       if (!names)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < S32G2_SIUL2_NUM; i++) {
> +               ret =3D siul2_gen_names(dev, gpio_dev->siul2[i].gpio_num,
> +                                     names + gpio_dev->siul2[i].gpio_bas=
e,
> +                                     &ch_index, &num_index);
> +               if (ret) {
> +                       dev_err(dev, "Could not set names for SIUL2_%d GP=
IOs\n",
> +                               i);
> +                       return ret;
> +               }
> +
> +               if (gpio_dev->platdata->reset_cnt)
> +                       num_index =3D 0;
> +
> +               ch_index++;
> +       }
> +
> +       ret =3D siul2_gpio_remove_reserved_names(dev, gpio_dev, names);
> +       if (ret)
> +               return ret;
> +
> +       gpio_dev->gc.names =3D (const char *const *)names;
> +
> +       return 0;
> +}

Interesting!

I'm not against, on the contrary this looks really helpful to users.

> +       gc =3D &gpio_dev->gc;

No poking around in the gpiolib internals please.

Look at what other drivers do and do like they do.

On top of these comments:
everywhere you do [raw_spin_]locks: try to use guards or
scoped guards instead. git grep guard drivers/gpio for
many examples.

Yours,
Linus Walleij

