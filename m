Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE0145A9F72
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 20:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231455AbiIAS4T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 14:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233450AbiIAS4O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 14:56:14 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 629E36A4A3
        for <linux-gpio@vger.kernel.org>; Thu,  1 Sep 2022 11:56:00 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id f14so92048qkm.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Sep 2022 11:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=1VvKQrI+SSW3GbbR3EcVWpVRmYCp6SaG8dIjhzsYhOM=;
        b=Bh36Zm/09czxvJIp6FKPj/gpDE2cQv5AUbtCEww7iLv77eW+xe70dYVjKj8o0DKgkp
         wX5sNd2NIxQZZHMIouEgDUx2HVgoi+JhXP16roRVEPLgjneAOLJo0badD8V14/T6aAIc
         BYEWg1IuGeQi5Dh4nHFvq2eFQpOaYBufXZ7qCy88SMhJevvMR1CEENesqlyR3exklmHx
         hOcHxLhJtfupJ3PgfRe/mvZmU1k+2jQ9Oi1NfHRNNF8pBFKczaONc6hb7Pa3yQHtU9LJ
         MYgFIKZHOfhRt5NWgRpuHQvaKcK5oJCDjKoeY0Ad4kfCRracjbRMMCSPKXRqlBYXywSW
         cEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=1VvKQrI+SSW3GbbR3EcVWpVRmYCp6SaG8dIjhzsYhOM=;
        b=J5bIGwfzxplleEeegAR0ZPo5yhG3ZyOM2iLw8CM9miBOZg1Zc0ltW3McS616vl05A4
         X30sv8tLiuTdoF+PlkL4LTUZDqfEi54MsGtZpNujpXJ0we3khCWwmWsKuyou3gix/RJ3
         p92IXHgiywY0wriwYoodGd8UzTs7lpjwHig+8OCtpzSYilM33vQ+feJ9fs3YoedQenDt
         lIAVjPu0VJ0lTXnaK+gO8wgdDLuxoNeiAXkPci2O88+QVeAEo+VJt/IbEuHp4YEcr1jo
         DmDpw/XmwO27z3oU7pRXoowUW/kUPWXY1d0xQxNg5hv+PvPOUoah67iFgPSV5DoyK8Vx
         0cbw==
X-Gm-Message-State: ACgBeo32ZyJPjj+jgwGFx6VMPqadKvp/sSmUH66K8b0AEi+fTRDe6kdu
        9CUp0GxNo5SPFb55tvw7KrPWDfbJHzUOcfk9mFg=
X-Google-Smtp-Source: AA6agR6yVph8B9MEmz/Yn3Kga+Chvz+h6RQ4roBohfY8Ki1bWSSoJdC3BLtoybu3oxfMWiUVAIYlbYqnS2VKv/VV7oI=
X-Received: by 2002:a05:620a:254d:b0:6ab:84b8:25eb with SMTP id
 s13-20020a05620a254d00b006ab84b825ebmr20567527qko.383.1662058559429; Thu, 01
 Sep 2022 11:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 1 Sep 2022 21:55:23 +0300
Message-ID: <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 1, 2022 at 5:17 PM Russell King <rmk+kernel@armlinux.org.uk> wrote:
>
> From: Hector Martin <marcan@marcan.st>
>
> This driver implements the GPIO service on top of the SMC framework
> on Apple Mac machines. In particular, these are the GPIOs present in the
> PMU IC which are used to control power to certain on-board devices.
>
> Although the underlying hardware supports various pin config settings
> (input/output, open drain, etc.), this driver does not implement that
> functionality and leaves it up to the firmware to configure things
> properly. We also don't yet support interrupts/events. This is
> sufficient for device power control, which is the only thing we need to
> support at this point. More features will be implemented when needed.
>
> To our knowledge, only Apple Silicon Macs implement this SMC feature.

...

> +/*
> + * Commands 0-6 are, presumably, the intended API.

> + * Command 0xff lets you get/set the pin configuration in detail directly,
> + * but the bit meanings seem not to be stable between devices/PMU hardware
> + * versions.

Probably for debugging purposes...

> + *
> + * We're going to try to make do with the low commands for now.
> + * We don't implement pin mode changes at this time.
> + */

...

> +/*
> + * output modes seem to differ depending on the PMU in use... ?

Output

> + * j274 / M1 (Sera PMU):
> + *   0 = input
> + *   1 = output
> + *   2 = open drain
> + *   3 = disable
> + * j314 / M1Pro (Maverick PMU):
> + *   0 = input
> + *   1 = open drain
> + *   2 = output
> + *   3 = ?
> + */

...

> +struct macsmc_gpio {
> +       struct device *dev;
> +       struct apple_smc *smc;
> +       struct gpio_chip gc;

You might save some CPU cycles / code by shuffling members around.
Usually we put gpio_chip as a first one, so pointer arithmetics to get
it becomes a bit simpler, but it needs to be checked by the tool and
also paying attention to what is used in critical paths (so
performance-wise).

> +       int first_index;
> +};

...

> +static int macsmc_gpio_nr(smc_key key)
> +{
> +       int low = hex_to_bin(key & 0xff);
> +       int high = hex_to_bin((key >> 8) & 0xff);
> +
> +       if (low < 0 || high < 0)
> +               return -1;
> +
> +       return low | (high << 4);
> +}

NIH hex2bin().

> +static int macsmc_gpio_key(unsigned int offset)
> +{
> +       return _SMC_KEY("gP\0\0") | (hex_asc_hi(offset) << 8) | hex_asc_lo(offset);
> +}

NIH hex_byte_pack().

...

> +       /* First try reading the explicit pin mode register */
> +       ret = apple_smc_rw_u32(smcgp->smc, key, CMD_PINMODE, &val);
> +       if (!ret)
> +               return (val & MODE_OUTPUT) ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
> +
> +       /*
> +        * Less common IRQ configs cause CMD_PINMODE to fail, and so does open drain mode.
> +        * Fall back to reading IRQ mode, which will only succeed for inputs.
> +        */
> +       ret = apple_smc_rw_u32(smcgp->smc, key, CMD_IRQ_MODE, &val);
> +       return (!ret) ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;

What is the meaning of val in this case?

...

> +       if (ret == GPIO_LINE_DIRECTION_OUT)
> +               ret = apple_smc_rw_u32(smcgp->smc, key, CMD_OUTPUT, &val);
> +       else
> +               ret = apple_smc_rw_u32(smcgp->smc, key, CMD_INPUT, &val);

> +

Unnecessary blank line.

> +       if (ret < 0)
> +               return ret;

...

> +       ret = apple_smc_write_u32(smcgp->smc, key, CMD_OUTPUT | value);
> +       if (ret < 0)
> +               dev_err(smcgp->dev, "GPIO set failed %p4ch = 0x%x\n", &key, value);

Strange specifier... It seems like a hashed pointer with added (or
skipped? I don't remember) '4ch'. Perhaps you meant one of '%pE',
'%p4cc'?
Ditto for other cases.


...

> +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
> +       int count = apple_smc_get_key_count(smcgp->smc) - smcgp->first_index;

I would split this assignment and move it closer to the first user.

> +       int i;
> +
> +       if (count > MAX_GPIO)
> +               count = MAX_GPIO;

Hmm... When can it be the case?

> +       bitmap_zero(valid_mask, ngpios);
> +
> +       for (i = 0; i < count; i++) {
> +               smc_key key;
> +               int gpio_nr;

> +               int ret = apple_smc_get_key_by_index(smcgp->smc, smcgp->first_index + i, &key);

Ditto.

> +
> +               if (ret < 0)
> +                       return ret;
> +
> +               if (key > SMC_KEY(gPff))
> +                       break;
> +
> +               gpio_nr = macsmc_gpio_nr(key);
> +               if (gpio_nr < 0 || gpio_nr > MAX_GPIO) {
> +                       dev_err(smcgp->dev, "Bad GPIO key %p4ch\n", &key);

Yeah, according to the code it will print something you didn't want.

> +                       continue;
> +               }
> +
> +               set_bit(gpio_nr, valid_mask);
> +       }
> +
> +       return 0;
> +}

...

> +       pdev->dev.of_node = of_get_child_by_name(pdev->dev.parent->of_node, "gpio");

Can we use fwnode APIs instead?
Or do you really need this?

--
With Best Regards,
Andy Shevchenko
