Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8B23876B8
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 12:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241679AbhERKlC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 06:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348567AbhERKk6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 May 2021 06:40:58 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF0B9C061573;
        Tue, 18 May 2021 03:39:38 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so1315386pjv.1;
        Tue, 18 May 2021 03:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=93ZCo4gwS7aFEVcH8ZnCKUdH+XCaNbCPSJVocK9d0RU=;
        b=k4Nuh+EFxvlhaQCW21jHO5N0NEDQIR0P1BplDxOrcuF7IQwhtUYhGd54/5tldabvu3
         3wIFtA8SGS2N1nbacetJ2HFgbqMBcRrER4npynFF15uBVyfw97KZ7u6oyzLznJXua9/y
         C9eI6R2PVqq/m45Pc8adMTsxcZfo/lpWHAhYzahW/bTkrhDWHQ3Vbj1oZcRy2N+jCFhw
         oKdkJM3rz3J5BAtjFtlT7cajO4ENBwPP39sXl6jgXC7ZnBU5sfHao4oC00Jk3eM7UCH+
         vDo1F5Mtz0MGKbDQndMKEFa84cRwM4Wx9cNptUqB5iI6JGYgdfmiNS68uJTgDGTjGbqw
         3YeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=93ZCo4gwS7aFEVcH8ZnCKUdH+XCaNbCPSJVocK9d0RU=;
        b=F1kwCd7pgiO4wN95nJkEXP0cxnFwx1lVKRaFQbB9J/dmrfXuSi5+XAfplPOop5yyIF
         hCXlKkLbltonmjP+yfmvALGTCSfj5xmMlfTr+H5DVrQRKO3Yq945NgiGukTsNzutwVMO
         pOeyWuT7qszZE+OrlNE9E6+cm+jDkmeqQSv907GkA6DIpNsch6rE9ZMDPvcv/af3F0Kc
         65u3H6KvO7LbHXhuk81emgecehVWs55BamAXI5fYiJMAPAT6eeZteoeFCCmV5rY4/+Om
         op/n0tPoHYFvMn0gtZ0Pp6jEwuRRgY03rWMnXrhjynEl7eCZ0KwBhQ2+ICdQvp0+exR5
         eP4g==
X-Gm-Message-State: AOAM530leG6SYra0crdSdgEasNArXjh5IFCa3jkiGyDoVU/l3waTfuzZ
        OugIhJw8gCvdwtsGGWjeTJXzttkRMdzAU+Q3MPA=
X-Google-Smtp-Source: ABdhPJxXvj6vZtvTRQW71XBT8gOzShwnMHxAZ8bDXL11j7BINt/O0dAvUBxWn2wDW/ikyh8Wa4lt256txDncrvxHIZc=
X-Received: by 2002:a17:90a:af8b:: with SMTP id w11mr740563pjq.228.1621334378382;
 Tue, 18 May 2021 03:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621279162.git.sander@svanheule.net> <d5f294489d31a80b69169f358da89bb7f70d1328.1621279162.git.sander@svanheule.net>
 <675e36df5aaa1e1be3a1a77289a0a952@walle.cc>
In-Reply-To: <675e36df5aaa1e1be3a1a77289a0a952@walle.cc>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 18 May 2021 13:39:22 +0300
Message-ID: <CAHp75VdLwSoPpmDm1j=d9kLWzzfGsHCVvMSX-9wD+sgRzHC9oA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] gpio: regmap: Add configurable dir/value order
To:     Michael Walle <michael@walle.cc>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Sander Vanheule <sander@svanheule.net>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

+Matti

On Tue, May 18, 2021 at 11:39 AM Michael Walle <michael@walle.cc> wrote:
> Am 2021-05-17 21:28, schrieb Sander Vanheule:

...

> Instead of adding a new one, we can also just check no_set_on_input
> in gpio_regmap_direction_output(), which I'd prefer.

+! here.

> static int gpio_regmap_direction_output(struct gpio_chip *chip,
>                                         unsigned int offset, int value)
> {
>         struct gpio_regmap *gpio = gpiochip_get_data(chip);
>         int ret;
>
>         if (gpio->no_set_on_input) {
>                 /* some smart comment here, also mention gliches */
>                 ret = gpio_regmap_set_direction(chip, offset, true);
>                 gpio_regmap_set(chip, offset, value);
>         } else {
>                 gpio_regmap_set(chip, offset, value);
>                 ret = gpio_regmap_set_direction(chip, offset, true);
>         }
>
>         return ret;
> }

...

> > + * @no_set_on_input: Set if output value can only be set when the
> > direction
> > + *                   is configured as output.
>
> set_direction_first ?

Perhaps we need to establish rather something like

/* Broken hardware can't set value on input pin, we have to set it to
output first */
#define GPIO_REGMAP_QUIRK_...  BIT(0)

unsigned int quirks;

?

-- 
With Best Regards,
Andy Shevchenko
