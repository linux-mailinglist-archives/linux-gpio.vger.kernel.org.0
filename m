Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4AE18CDAD
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 10:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbfHNIJd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 04:09:33 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39363 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725265AbfHNIJd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Aug 2019 04:09:33 -0400
Received: by mail-lf1-f66.google.com with SMTP id x3so24918396lfn.6
        for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2019 01:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a3pu4WqgZpVtxAPpr6WRRG6CgvXxsRt/IJW7QWZZBkQ=;
        b=B5hCQPPM/FOpJJlOBHnIL4YX7ZnsrCAX7eRZbnz2PJMhtcI0fVe6V4tL+rTL5JoHgZ
         CHqDhH41nc5wKh+bC3n8fdrhtv10H700YfIlpEyJHujfqhUrKrq1Do8k8+av41R3vJeL
         qs0QfYp8SOYllcOBS3PKhtLI4alQkT7Kt94EHplLYwzMh9sG1DGikunIPOdaoMVMjVwP
         rN4aKmc05L+cbA9//qjMoTgsIYtOUYVIVrpo/q+SMLJzJZahwtGzHuBN85pWOa2Qdbu4
         T8V7sVe3UoVNzPP82tcfVm/NqmzSFZEFfwoH/i5jHXfTKL1QicnXiUITV3szo9S/2uof
         WWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a3pu4WqgZpVtxAPpr6WRRG6CgvXxsRt/IJW7QWZZBkQ=;
        b=og7B6bn0+h6sXoqHVSASwxPEU6SFAZcZCE+D34qmaiLSUw6vaVcBA9a3N8LPunHWmu
         MUyB97jyln2g1/i/QqvzD5RY/AT9exzvp2NX7ceV4H37SaAIem0ltmDPpae/phREJSl/
         fsDKPLxYFgUkn1vCN9Yk+dRnYMm+1QLgEdFWvSNuaQzKCkND0XF2tO96zCrui1u7oF41
         8/cOS12GTE7oplTylI/GLqdQM3UZR0m0G6kBCcyTtou/8HqrSPMI8lvX8kuMCoKQtgED
         +aoIUyTUr6WdlWTtWLuvDTQPWvu/AfUVW+9NrVJVnpMGce2OTgXduZlf+qmn+WlbUX/m
         SCtA==
X-Gm-Message-State: APjAAAUXFl5KJXR6+lFntweP2Sk1zunSfPjOZafLNX5tMOMHhfDxmKxq
        ek/RdhyVOzgKgKANNxX1C1y+b+PxDiFmoM9UHUhXVA==
X-Google-Smtp-Source: APXvYqxBCrpxYicv9hI8gzWTP6SjkdBV0kiAs9w9dXlSllL/56vgciBYrqOy9aeSFx8Aqqn7+5gXG80m6la1l53JTPU=
X-Received: by 2002:a19:e006:: with SMTP id x6mr24363756lfg.165.1565770171843;
 Wed, 14 Aug 2019 01:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <1564603297-1391-1-git-send-email-hongweiz@ami.com> <1564603297-1391-3-git-send-email-hongweiz@ami.com>
In-Reply-To: <1564603297-1391-3-git-send-email-hongweiz@ami.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Aug 2019 10:09:20 +0200
Message-ID: <CACRpkdaojLe3UTc0=66b5J2yrSOo7t8o5bAY=WRscL+met3iWQ@mail.gmail.com>
Subject: Re: [v7 2/2] gpio: aspeed: Add SGPIO driver
To:     Hongwei Zhang <hongweiz@ami.com>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Hongwei,

thanks for your patch!

I have now merged the bindings so you only need to respin
this patch.

On Wed, Jul 31, 2019 at 10:02 PM Hongwei Zhang <hongweiz@ami.com> wrote:

> Add SGPIO driver support for Aspeed AST2500 SoC.
>
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> Reviewed-by:   Andrew Jeffery <andrew@aj.id.au>

I guess I need to go with this, there are some minor things
I still want to be fixed:

> +static void __aspeed_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)

I don't like __underscore_functions because their semantic
is ambiguous.

Rename this something like aspeed_sgpio_commit() or
whatever best fits the actual use.

> +static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
> +                                  struct platform_device *pdev)
> +{
(...)
> +       rc = gpiochip_irqchip_add(&gpio->chip, &aspeed_sgpio_irqchip,
> +                                 0, handle_bad_irq, IRQ_TYPE_NONE);
(...)
> +       gpiochip_set_chained_irqchip(&gpio->chip, &aspeed_sgpio_irqchip,
> +                                    gpio->irq, aspeed_sgpio_irq_handler);

We do not set up chained irqchips like this anymore, sorry.

I am currently rewriting all existing chained drivers to pass
an initialized irqchip when registering the whole gpio chip.
See drivers/gpio/TODO.

Here are examples:
https://lore.kernel.org/linux-gpio/20190811080539.15647-1-linus.walleij@linaro.org/
https://lore.kernel.org/linux-gpio/20190812132554.18313-1-linus.walleij@linaro.org/

> +       /* set all SGPIO pins as input (1). */
> +       memset(gpio->dir_in, 0xff, sizeof(gpio->dir_in));

Do the irqchip set-up here, before adding the gpio_chip.

> +       rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
> +       if (rc < 0)
> +               return rc;
> +
> +       return aspeed_sgpio_setup_irqs(gpio, pdev);

Yours,
Linus Walleij
