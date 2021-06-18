Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9AF3AC7E3
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jun 2021 11:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231565AbhFRJqT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Jun 2021 05:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbhFRJqS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Jun 2021 05:46:18 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0969AC061574
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jun 2021 02:44:08 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id q20so15667819lfo.2
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jun 2021 02:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8MpyH2W/Qi16vZF1RutDfX/LXWayA+uMuphu1a4gDY8=;
        b=WS97S26sHLsjWjnE4s2jX0/ynLhPoe0+VUb0hrL9k3lZ0LxP5jHd7PkAhea6aF429B
         Y+qwux8Btsy6lCFc/+i0aB6x+MGHD46ahPFfVf9Kn937OEb7QczXPOCIZ5HHNUyUf3It
         eRH8Rij5W3fCdq0jCzeEpTpd+D1wycYbbYve+Z6hubf30WMg4FgSff9vD2mA7cJkyhFf
         5lWW9sZtAOSfGYqO0hAZaCntF5/qPm97kpkeIYlGl3o7puopBYT1CW/z6FTdet91yO38
         sBphYsO/Ty7OXJY8TkssfooKxvef+GmimD8/2MjK1tXm5GRKIrMxXyV0BQP8arKq2Pft
         ZlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8MpyH2W/Qi16vZF1RutDfX/LXWayA+uMuphu1a4gDY8=;
        b=AbZdKpPg6vgoDrnri560mKeJ7f17O/PFVgmwH/AsOiVVeC0VVtjMjA2xxS8iofDXd9
         4bCobbIjcH5O6a0mXSNgZUugkP54oCTor6tcjQFo1F2ErHc/PHHfrEVEzAZcWTelpWD6
         YvIrm2ksji7/+85CPQjeYmS8IDQ3CkwUR4hSFLc2Jlw3b4dneXce8BdNbSMm+FVsv5ty
         FtFpIYVQ4o2JHYPophjudVHpS0Vpv9iOnmyEjC5Pypbi4Y7okoKXpWGwiPtOe/v7nDAr
         vrnjlbR+MSL8CcB6JNlqT7y1hct07OR8icjeRlM3uvcIMJ0FMGYPxc+t9O7HSdW71uAK
         LS4A==
X-Gm-Message-State: AOAM530tZmU7JUqixrXdU+aHOUAd3mZmB54sDsX0i7jw0xO0ASGsuI5V
        jrjnjUGLj2CBuSq5IPzTZEMMvyEL1r2TL1Dc7r1g/Q==
X-Google-Smtp-Source: ABdhPJzo4qbbSF3xLRiPOBtDaxlez1Z9u7fCpK1MwfRoaiuf8Qyc5m63k0jWd26FO6A0lO02OSeSEHK0P3YE5fo4/UQ=
X-Received: by 2002:a05:6512:3241:: with SMTP id c1mr2595058lfr.29.1624009446392;
 Fri, 18 Jun 2021 02:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210615080553.2021061-1-piyush.mehta@xilinx.com> <20210615080553.2021061-3-piyush.mehta@xilinx.com>
In-Reply-To: <20210615080553.2021061-3-piyush.mehta@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 18 Jun 2021 11:43:55 +0200
Message-ID: <CACRpkdYv6yosZ1KJazrMzaizpYz-cv-y4LcCqHm+Q94jva8sAA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: modepin: Add driver support for modepin GPIO controller
To:     Piyush Mehta <piyush.mehta@xilinx.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        git <git@xilinx.com>, Srinivas Goud <sgoud@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Piyush!

thanks for your patch!

On Tue, Jun 15, 2021 at 10:06 AM Piyush Mehta <piyush.mehta@xilinx.com> wrote:

> This patch adds support for the mode pin GPIO controller. GPIO Modepin
> driver set and get the value and status of the PS_MODE pin, based on
> device-tree pin configuration. These 4-bits boot-mode pins are dedicated
> configurable as input/output. After the stabilization of the system,
> these mode pins are sampled.
>
> Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>

OK, sounds interesting!

> +#include <linux/slab.h>

I think I saw somewhere that this is not needed anymore, check if you need it.

> +#define GET_OUTEN_PIN(pin)             (1U << (pin))

Delete this macro and just use BIT(pin) inline.
#include <linux/bits.h>

> +static int modepin_gpio_get_value(struct gpio_chip *chip, unsigned int pin)
> +{
> +       u32 out_en;
> +       u32 regval = 0;
> +       int ret;
> +
> +       out_en = GET_OUTEN_PIN(pin);

Drop this and out_en

> +       ret = zynqmp_pm_bootmode_read(&regval);
> +       if (ret) {
> +               pr_err("modepin: get value err %d\n", ret);
> +               return ret;
> +       }
> +
> +       return (out_en & (regval >> 8U)) ? 1 : 0;

return !!(regval & BIT(pin + 8));

should work and is easier to read IMO. We just check the right
bit immediately.

> +static void modepin_gpio_set_value(struct gpio_chip *chip, unsigned int pin,
> +                                  int state)
> +{
> +       u32 out_en;
> +       u32 bootpin_val = 0;
> +       int ret;
> +
> +       out_en = GET_OUTEN_PIN(pin);

Skip this helper variable.

> +       state = state != 0 ? out_en : 0;

Uh that is really hard to read and modified a parameter. Skip that too.

> +       bootpin_val = (state << (8U)) | out_en;

What you want is mask and set.

bootpin_val = BIT(pin + 8);

> +       /* Configure bootpin value */
> +       ret = zynqmp_pm_bootmode_write(bootpin_val);

This just looks weird.

Why are you not reading the value first since you are using
read/modify/write?

I *think* you want to do this:

ret = zynqmp_pm_bootmode_read(&val);
if (ret)
   /* error handling */
if (state)
    val |= BIT(pin + 8);
else
    val &= ~BIT(pin + 8);
ret = zynqmp_pm_bootmode_write(val);
if (ret)
   /* error handling */

> +/*
> + * modepin_gpio_dir_in - Set the direction of the specified GPIO pin as input
> + * @chip:      gpio_chip instance to be worked on
> + * @pin:       gpio pin number within the device
> + *
> + * Return: 0 always
> + */
> +static int modepin_gpio_dir_in(struct gpio_chip *chip, unsigned int pin)
> +{
> +       return 0;
> +}

I think you said this was configurable in the commit message.

Use the define GPIO_LINE_DIRECTION_OUT rather than 0.

> +static int modepin_gpio_dir_out(struct gpio_chip *chip, unsigned int pin,
> +                               int state)
> +{
> +       return 0;
> +}

Configurable?

> +       status = devm_gpiochip_add_data(&pdev->dev, chip, chip);
> +       if (status)
> +               dev_err_probe(&pdev->dev, status,
> +                             "Failed to add GPIO chip\n");

just return dev_err_probe(...)

Yours,
Linus Walleij
