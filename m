Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E308C215738
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2020 14:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729046AbgGFM2A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jul 2020 08:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729015AbgGFM2A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jul 2020 08:28:00 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F05DFC061794;
        Mon,  6 Jul 2020 05:27:59 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id b92so16960076pjc.4;
        Mon, 06 Jul 2020 05:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uGcN/dQUvfFHJxD7/3RQyI8ooNZFu20+CAJIaRPmdZ0=;
        b=VatyV3O7C+Ui7z6K5O70hpojcHAAyPU4Co4495eo6U8tcd6W2pvYu2tqDT10sHSq4t
         jd8ULr4xAUbXCgw3VwNwNRmxQ+BwjfOE3pudDOeHvLDrENsjWdGv2jsVdbyzAmmG2STD
         C8pkMyD7CFMl0LNP/TMbe1xg30oxROSxWUlgqux3K1VcZHSZSrC9niKfr+7hhKZwSh0e
         ILtsIvJvTRwFyM25RK4ju2iyu+Ym0t9DzY5q+e4TQgilIpnJrYX2CuIQmrnE8UPumO5W
         JxCTqPORWo5Wq0kxrKipYVUl6c19JjzuKKBA8SsCpZ4VEmv313X9/C3PsR4wq94RTBlN
         iH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uGcN/dQUvfFHJxD7/3RQyI8ooNZFu20+CAJIaRPmdZ0=;
        b=ugWHQjJzJDEtocI35S75PJKQUsSCtNVNQJi5kq4KWh2MxuEyqhSvbJDbXHDyjckD/J
         D33QwTEtq7V0wyUW6J9a34PkX2kSR7v7KHUAP4tDr44guMYosZq5himYqPd2Xpi2FRB8
         ZjnEwU/usY6vWcN7919AM0+HJdQ2UPccKX2fI8avcHOjyDySgbEuRoZLqoS8uiZOAsKm
         cF+1esWzQlA5e0KWK3F845n1bPf/f7HjwqJuV0KfHOeMCVkLcFm8akGddSPYE83jpRfd
         XShZuI/emDMjHyNBhpQ1kKeaA5+JhibQxEug0tClEY574WhqtYPHJEzn8ap+1iV47r5r
         zt/Q==
X-Gm-Message-State: AOAM531JcMYHDDhilqQ8PntziErchHR0zkw5VL09MSjQAYiXpLF0bvBK
        ytTYRmEzOh8Z/lu5jGO047Jk8xqIzftwNQ3mzLc=
X-Google-Smtp-Source: ABdhPJxxwlXggdrm4VJkoXTr5IdbXdYn4AroBkGeJR82Z/mrkOfNtZ5dmAeXfN2gW7lUT6+1freCth262v4Tzf8FiZU=
X-Received: by 2002:a17:90b:3547:: with SMTP id lt7mr25700821pjb.181.1594038479529;
 Mon, 06 Jul 2020 05:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200705133038.161547-1-mans0n@gorani.run>
In-Reply-To: <20200705133038.161547-1-mans0n@gorani.run>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 6 Jul 2020 15:27:43 +0300
Message-ID: <CAHp75VcsVWBJ6Lu+QsZmabHcCN6B0s884FGf0d3Ld_UsgChTLw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] gpio: add GPO driver for PCA9570
To:     Sungbo Eo <mans0n@gorani.run>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Walle <michael@walle.cc>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jul 5, 2020 at 4:31 PM Sungbo Eo <mans0n@gorani.run> wrote:
>
> NXP PCA9570 is a 4-bit I2C GPO expander without interrupt functionality.
> Its ports are controlled only by a data byte without register address.

Thank you for an update, my comments (besides what Bart has) below.

> Datasheet: https://www.nxp.com/docs/en/data-sheet/PCA9570.pdf
>
> Signed-off-by: Sungbo Eo <mans0n@gorani.run>

No blank line in between.

...

> +#include <linux/gpio/driver.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>

It also needs property.h.

...

> +struct pca9570 {
> +       struct gpio_chip chip;

> +       struct i2c_client *client;

This basically a duplication of reference to a parent device of GPIO chip.
See below.

> +       u8 out;
> +};
> +
> +static int pca9570_read(struct pca9570 *gpio, u8 *value)
> +{

struct i2c_client *client = to_i2c_client(gpio->chip.parent);

> +       int ret;
> +
> +       ret = i2c_smbus_read_byte(gpio->client);
> +       if (ret < 0)
> +               return ret;
> +
> +       *value = ret;
> +       return 0;
> +}

...

> +static const struct i2c_device_id pca9570_id_table[] = {
> +       { "pca9570", 4 },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(i2c, pca9570_id_table);
> +
> +static const struct of_device_id pca9570_of_match_table[] = {
> +       { .compatible = "nxp,pca9570", .data = (void *)4 },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, pca9570_of_match_table);

These structures now can be located closer to the end of the driver
(exactly before first use).

...

> +       gpio->chip = template_chip;

I'm not sure why we need an additional structure to just memcpy() to the chip.
But here I have no strong opinion (perhaps the compiler even optimizes this).

-- 
With Best Regards,
Andy Shevchenko
