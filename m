Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93DB61BBDC9
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 14:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgD1MoW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 08:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726544AbgD1MoW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 08:44:22 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1479DC03C1AC
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 05:44:22 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id f18so21298250lja.13
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 05:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YYJpKvgRNwf06GUmtJtBJkQp9t7R4gewPU7zZ78LA+s=;
        b=mk2RHuyP1dBXuBJrfAOgE4aTk4QCMyQynOZyfN/yKbZbhy4BXeuLtNyFWDHODwzeiC
         cZKJ0bVU4Ila7ewhdJekO1M+Wqxfp716yNDK2+Og+KI5m2rbWx57Aj0V6nqGLaBXph2W
         OOWSF68o4YAQpct91VaidNWsvZj83lArAOLnjGwMYsGxnFxHmNa1YdAlCpfR0tj5XxK+
         8MKWraI/EYHPVVtw/vaaxx5bFK2CH81c2JV2yoSEurhiT6jz1zgMS6zL/d5sszc6eENO
         TiWgE8A9eEXIojHW3wV6d8AZ7FuUF2mtZstIdmwW+DMcv/BWbMcxHYBhFddLM/NuQGIy
         vd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YYJpKvgRNwf06GUmtJtBJkQp9t7R4gewPU7zZ78LA+s=;
        b=R4KwTXFlLJz07v8FlqJJCR60MmskymCBuGw6tTYFv7EfsdTuZC2tRLyx4rrRcFbq5E
         MccAzhwFZFx0qVHE4p4PXhggQTu6OzMxrMjiZX9Ftd3KfdDFtHxo/2efPz6GxMlnxpnD
         cwI25T2MPb/7WmjoWMchr0rjdIua9M0ZST3qj3exVeobFXdpNv4llOaU13K0jcGVF+u0
         VQWa1jHO6KQ6FYCYWcDIh/AzmGk+0EtYSvZGVX1MCsfuXN7ed3yjka+YMTPr/dg02TsT
         knRR1eW4pygM3f2HRL3X3dpjgK6zjU5ACsBEHmFCi6fakbf5QeF7D54hvw2aWMqfSe6j
         1jWQ==
X-Gm-Message-State: AGi0PuZmqUgqgQz3HzcrluyK2G5tioyRRVLK6lfQxcSqvfue6sQQaYaM
        /FIgtBk+CSJS6enisOnLOcluEXLbtRJroAyjHIVgFg==
X-Google-Smtp-Source: APiQypLwu6uj/vOvGPr2x0PmORxYHaK42JWpzfvhR7IaWOGGQ5sMKsweb+hLcKNmLiQz6ikMd8hEcH9LBAJglrU6wZE=
X-Received: by 2002:a05:651c:32e:: with SMTP id b14mr17623187ljp.277.1588077860337;
 Tue, 28 Apr 2020 05:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200423162548.129661-1-dianders@chromium.org> <20200423092431.v3.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
In-Reply-To: <20200423092431.v3.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 14:44:09 +0200
Message-ID: <CACRpkdYsw1uFf_PVkRwibXUtQOwvWa7jqiw6aT9AdmkLLyqisQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] drm/bridge: ti-sn65dsi86: Export bridge GPIOs to Linux
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Sandeep Panda <spanda@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 23, 2020 at 6:26 PM Douglas Anderson <dianders@chromium.org> wrote:

> The ti-sn65dsi86 MIPI DSI to eDP bridge chip has 4 pins on it that can
> be used as GPIOs in a system.  Each pin can be configured as input,
> output, or a special function for the bridge chip.  These are:
> - GPIO1: SUSPEND Input
> - GPIO2: DSIA VSYNC
> - GPIO3: DSIA HSYNC or VSYNC
> - GPIO4: PWM
>
> Let's expose these pins as GPIOs.  A few notes:
> - Access to ti-sn65dsi86 is via i2c so we set "can_sleep".
> - These pins can't be configured for IRQ.
> - There are no programmable pulls or other fancy features.
> - Keeping the bridge chip powered might be expensive.  The driver is
>   setup such that if all used GPIOs are only inputs we'll power the
>   bridge chip on just long enough to read the GPIO and then power it
>   off again.  Setting a GPIO as output will keep the bridge powered.
> - If someone releases a GPIO we'll implicitly switch it to an input so
>   we no longer need to keep the bridge powered for it.
>
> Because of all of the above limitations we just need to implement a
> bare-bones GPIO driver.  The device tree bindings already account for
> this device being a GPIO controller so we only need the driver changes
> for it.
>
> NOTE: Despite the fact that these pins are nominally muxable I don't
> believe it makes sense to expose them through the pinctrl interface as
> well as the GPIO interface.  The special functions are things that the
> bridge chip driver itself would care about and it can just configure
> the pins as needed.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Pretty cool.

I wonder if this chip could use the generic regmap GPIO helpers
that we are working on when they come around?
https://lore.kernel.org/linux-gpio/20200423174543.17161-11-michael@walle.cc/

> +#include <linux/gpio/driver.h>
> +#include <linux/gpio.h>

Only <linux/gpio/driver.h> should be needed else you are doing
something wrong.

> + * @gchip:        If we expose our GPIOs, this is used.
> + * @gchip_output: A cache of whether we've set GPIOs to output.  This
> + *                serves double-duty of keeping track of the direction and
> + *                also keeping track of whether we've incremented the
> + *                pm_runtime reference count for this pin, which we do
> + *                whenever a pin is configured as an output.

That sounds a bit hairy but I guess it's fine.

> + */
>  struct ti_sn_bridge {
>         struct device                   *dev;
>         struct regmap                   *regmap;
> @@ -102,6 +136,9 @@ struct ti_sn_bridge {
>         struct gpio_desc                *enable_gpio;
>         struct regulator_bulk_data      supplies[SN_REGULATOR_SUPPLY_NUM];
>         int                             dp_lanes;
> +
> +       struct gpio_chip                gchip;
> +       DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);

Do you really need a bitmap for 4 bits? Can't you just have something
like an u8 and check bit 0,1,2,3 ... well I suppose it has some elegance to
it as well but... hm.

> +static struct ti_sn_bridge *gchip_to_pdata(struct gpio_chip *chip)
> +{
> +       return container_of(chip, struct ti_sn_bridge, gchip);
> +}
> +
> +static int ti_sn_bridge_gpio_get_direction(struct gpio_chip *chip,
> +                                          unsigned int offset)
> +{
> +       struct ti_sn_bridge *pdata = gchip_to_pdata(chip);

Is there some specific reason why you don't just use
gpiochip_get_data()?

> +       /*
> +        * We already have to keep track of the direction because we use
> +        * that to figure out whether we've powered the device.  We can
> +        * just return that rather than (maybe) powering up the device
> +        * to ask its direction.
> +        */
> +       return test_bit(offset, pdata->gchip_output) ?
> +               GPIOF_DIR_OUT : GPIOF_DIR_IN;
> +}

Don't use these legacy defines, they are for consumers.
Use GPIO_LINE_DIRECTION_IN  and GPIO_LINE_DIRECTION_OUT.
from <linux/gpio/driver.h>

> +       ret = regmap_read(pdata->regmap, SN_GPIO_IO_REG, &val);
> +       pm_runtime_put(pdata->dev);
> +
> +       if (ret)
> +               return ret;
> +
> +       return (val >> (SN_GPIO_INPUT_SHIFT + offset)) & 1;

My preferred way to do this is:

#include <linux/bits.h>

return !!(val & BIT(SN_GPIO_INPUT_SHIFT + offset));

> +static void ti_sn_bridge_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +                                 int val)
> +{
> +       struct ti_sn_bridge *pdata = gchip_to_pdata(chip);
> +       int ret;
> +
> +       if (!test_bit(offset, pdata->gchip_output)) {
> +               dev_err(pdata->dev, "Ignoring GPIO set while input\n");
> +               return;
> +       }
> +
> +       val &= 1;
> +       ret = regmap_update_bits(pdata->regmap, SN_GPIO_IO_REG,
> +                                BIT(SN_GPIO_OUTPUT_SHIFT + offset),
> +                                val << (SN_GPIO_OUTPUT_SHIFT + offset));

Looks like a job for the generic helper library.

> +static int ti_sn_bridge_gpio_direction_input(struct gpio_chip *chip,
> +                                            unsigned int offset)
> +{
> +       struct ti_sn_bridge *pdata = gchip_to_pdata(chip);
> +       int shift = offset * 2;
> +       int ret;
> +
> +       if (!test_and_clear_bit(offset, pdata->gchip_output))
> +               return 0;
> +
> +       ret = regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
> +                                0x3 << shift, SN_GPIO_MUX_INPUT << shift);

But this 0x03 does not look very generic, it's not just 1 bit but 2.

Overall it looks good, just the minor things above need fixing or
looking into.

Yours,
Linus Walleij
