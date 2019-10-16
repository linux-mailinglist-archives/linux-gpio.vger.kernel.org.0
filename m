Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A673AD9130
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2019 14:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391323AbfJPMlp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Oct 2019 08:41:45 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:39675 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726859AbfJPMlo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2019 08:41:44 -0400
Received: by mail-qk1-f195.google.com with SMTP id 4so22552057qki.6
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2019 05:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qm75DokwzXjTKEsie0o+9Iq4HWwxwsH9v5bQoEbr1/o=;
        b=GCbDGIfZj92w5Qr0xsU4UFCGnAPsKp2B0SiNcm4fP+CM+kqIY+pbss57O7snZ/Jb7u
         p2qiS7Jr7qstgGUIAFsOvcZM3Rf6mEogb9Po9PUh3Dvni6D8KifmK5EFUraMLpG7XOpd
         LbLUl93c+tyAA4l00tH09WvmkUDo6Wa+qLUXglL+/RbwD5H7DE/BrHT/qvB1FGuV/Suw
         Ze2a8Aph6z4KM+O3/6CPiHRwfmWjJ8qS8SvURsTHjnO3O6Q33w21FEa6oE6QvnAO+RJl
         Fp1bm83FJt4fMoxFEkftNFuuNpN7fPAjE+j3TRVHaP+sAkRtfw4Tbs4NgiQlgSYhsahl
         XwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qm75DokwzXjTKEsie0o+9Iq4HWwxwsH9v5bQoEbr1/o=;
        b=puLqBrhsxrivbxmRWgHY8aSp11Po/iewmbva0dgOPNAriuDZ6N/RPMzDDcQIr+w5tP
         6Y/1U8WUwd39BPrtXEriK0UyjIZRKUWUuI1epxeg0/doYeXtbgJfm9g1G4GZtCaniVcp
         8P0kLE1iSDipP+j1oiuC8aCqsbk0zWXKjvkb2VUwRuHiEssiVZDM3ftUJijRU+xqp4gD
         X482aIytzpbKdJ7Ipp9y33CDqIewVgmaY1XTcpNpSbu/ZelpVdPMMKKUNxRk634RONFP
         Dod7T1t7xlSgZOXAJjkJlY7HNlUzS4Fksrl2rTTRIEvKkpcxh+Jr2C71wUDCcGFFCoZV
         lQTQ==
X-Gm-Message-State: APjAAAXroGAaF0br/rhA9jQhe3dLksNWZ8JtwiRXY1J/1VhYiMvmDYIy
        5Sgo/03YkCC3Ycx1Cu+Y+mnscbjP4hWfAfocJMUK1w==
X-Google-Smtp-Source: APXvYqxJshG3708iZ8DdRzTqOCKqoWAZClhQq8BFfkn1xeAaY0P671YgWTPOt5msWwuM1JD2JtXAOJkXdiETud2QSVI=
X-Received: by 2002:a05:620a:751:: with SMTP id i17mr39873356qki.340.1571229703313;
 Wed, 16 Oct 2019 05:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191015173026.9962-1-manivannan.sadhasivam@linaro.org> <20191015173026.9962-4-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20191015173026.9962-4-manivannan.sadhasivam@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Oct 2019 14:41:32 +0200
Message-ID: <CACRpkdZRY138RAf8N2xGam89r66ik2vW44OZx0bDcCt4P2GBLA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] gpio: Add RDA Micro GPIO controller support
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-unisoc@lists.infradead.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Manivannan!

Thanks for your patch!

On Tue, Oct 15, 2019 at 7:30 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> Add support for GPIO controller from RDA Micro.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Please use a little bit more verbose commit message, who
made this hardware and what is it for. If you know!

> +config GPIO_RDA
> +       bool "RDA Micro GPIO controller support"
> +       depends on ARCH_RDA || COMPILE_TEST
> +       depends on OF_GPIO
> +       select GPIOLIB_IRQCHIP

select GPIO_GENERIC

> +#include <linux/bitops.h>

Do you need this or just <linux/bits.h>?

> +#define RDA_GPIO_OEN_VAL               0x00
> +#define RDA_GPIO_OEN_SET_OUT           0x04
> +#define RDA_GPIO_OEN_SET_IN            0x08
> +#define RDA_GPIO_VAL                   0x0c
> +#define RDA_GPIO_SET                   0x10
> +#define RDA_GPIO_CLR                   0x14
> +#define RDA_GPIO_INT_CTRL_SET          0x18
> +#define RDA_GPIO_INT_CTRL_CLR          0x1c
> +#define RDA_GPIO_INT_CLR               0x20
> +#define RDA_GPIO_INT_STATUS            0x24

This is a very clear cut MMIO GPIO so use GPIO_GENERIC with this
hardware.

> +static void rda_gpio_update(struct gpio_chip *chip, unsigned int offset,
> +                           u16 reg, int val)

Maybe keep this if it saves code from the IRQ callbacks,
inline it to register writes if it doesn't get called much.

> +static int rda_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
> +static int rda_gpio_direction_output(struct gpio_chip *chip,
> +                                    unsigned int offset, int value)
> +static int rda_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +static void rda_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)

This can all be replaces by select GPIO_GENERIC and passing
the right offsets into bgpio_init(). Look at for example
gpio-ftgpio010.c and the documentation for bgpio_init()
in gpio-mmio.c for help.

This will also implement get/set_multiple for you for
free!

> +static void rda_gpio_irq_mask(struct irq_data *data)
> +static void rda_gpio_irq_ack(struct irq_data *data)

Looks good

> +static int rda_gpio_set_irq(struct gpio_chip *chip, u32 offset,
> +                           unsigned int flow_type)

Maybe _setup_irq()? Not sure, just that the name doesn't
obviously imply how it is used as it is called from two
places.

The rest of the IRQ code looks good!

> +static int rda_gpio_probe(struct platform_device *pdev)
> +{
> +       struct device_node *np = pdev->dev.of_node;
> +       struct gpio_irq_chip *irq_chip;

Since irq_chip is the name of a struct in the kernel I usually
just call this "girq" as in "GPIO irq chip".

> +       struct rda_gpio *rda_gpio;
> +       u32 ngpios;
> +       int ret;

Create a struct device *dev = &pdev->dev; helper variable
to make the following code easier to read. (The pointer
&pdev->dev is used in many places...)

> +       /*
> +        * Not all ports have interrupt capability. For instance, on
> +        * RDA8810PL, GPIOC doesn't support interrupt. So we must handle
> +        * those also.
> +        */
> +       rda_gpio->irq = platform_get_irq(pdev, 0);
> +
> +       rda_gpio->base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(rda_gpio->base))
> +               return PTR_ERR(rda_gpio->base);
> +
> +       spin_lock_init(&rda_gpio->lock);
> +
> +       rda_gpio->chip.label = dev_name(&pdev->dev);
> +       rda_gpio->chip.ngpio = ngpios;
> +       rda_gpio->chip.base = -1;
> +       rda_gpio->chip.parent = &pdev->dev;
> +       rda_gpio->chip.of_node = np;
> +       rda_gpio->chip.get = rda_gpio_get;
> +       rda_gpio->chip.set = rda_gpio_set;
> +       rda_gpio->chip.direction_input = rda_gpio_direction_input;
> +       rda_gpio->chip.direction_output = rda_gpio_direction_output;
> +
> +       if (rda_gpio->irq >= 0) {
> +               rda_gpio->irq_chip.name = "rda-gpio",
> +               rda_gpio->irq_chip.irq_ack = rda_gpio_irq_ack,
> +               rda_gpio->irq_chip.irq_mask = rda_gpio_irq_mask,
> +               rda_gpio->irq_chip.irq_unmask = rda_gpio_irq_unmask,
> +               rda_gpio->irq_chip.irq_set_type = rda_gpio_irq_set_type,
> +               rda_gpio->irq_chip.flags = IRQCHIP_SKIP_SET_WAKE,
> +
> +               irq_chip = &rda_gpio->chip.irq;
> +               irq_chip->chip = &rda_gpio->irq_chip;
> +               irq_chip->handler = handle_bad_irq;
> +               irq_chip->default_type = IRQ_TYPE_NONE;
> +               irq_chip->parent_handler = rda_gpio_irq_handler;
> +               irq_chip->parent_handler_data = rda_gpio;
> +               irq_chip->num_parents = 1;
> +               irq_chip->parents = &rda_gpio->irq;

That works but ... please devm_kzalloc() like the other drivers
do:

girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
                                     GFP_KERNEL);
        if (!girq->parents) {
                ret = -ENOMEM;
(...)

Unless you have a real good reason to optimize it. I just
want it to follow the pattern since I want to minimize
cognitive stress for the maintainers. (Me.)

Yours,
Linus Walleij
