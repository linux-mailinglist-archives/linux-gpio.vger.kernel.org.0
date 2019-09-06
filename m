Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5173FAC0D3
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 21:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393422AbfIFTrH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Sep 2019 15:47:07 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:34550 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393209AbfIFTrH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Sep 2019 15:47:07 -0400
Received: by mail-qk1-f196.google.com with SMTP id q203so6865896qke.1;
        Fri, 06 Sep 2019 12:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GlriHQcPoNAAyA0m3FTNkIoAvIrt6CyS5DffxYEz37k=;
        b=JV3Gxop+nVe6QmZ91Cy718WYBKBAy8NjiGK4vtv+HjEfMdhIIBjEhWnBJdsRgYlyWr
         6Q0JSuJelzRFEQ/cvRNurMHnh4RnezG6ayGXFbCJDsZWwhDYiN8Rj8VgPLvDUmKAjXst
         DOD3sL8OIY+m5zWDXSDXsKLu+c86L3M9Esd0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GlriHQcPoNAAyA0m3FTNkIoAvIrt6CyS5DffxYEz37k=;
        b=dUIApfnisSnuFWBF2+J5yVWA9BfH3ahumqfkCGfw3z5rDb7QYKR6EUoWI0TTpBc7bN
         3I2lIEziv8gVVIkWtTKj58dGPDolrSuRyKm7o8B3gH9pZ/eiNp6qYFryzs/yOZH4MF/n
         5kzL4741fanTaxAuV2UPSdwpJJqDR4/gXRNDJWJB52gQgUu1Gih8RJeJdK6lLX5YGQfq
         XxPIb4XHqnRrmUrECF0/HjDib7YQDWlSBq+vC2So4fVcumchSi7UHXzNwysquSEzLEde
         a4+VC07zKu9wsRDxSstBjcqrfLETnOhbvGIu2KVqzkn94FC7Ma6ZJn9pMbX3RcA/y1nW
         g2Tw==
X-Gm-Message-State: APjAAAV3iARzK0xjbdKNePJLqIEhlqY8gFg4vkqgtzUFcukPilKiz/Qk
        NQeDzEuSfj5Qj7vgbUGvrCRSoeSr7gZEpkyVVgM=
X-Google-Smtp-Source: APXvYqzPbIKN8fLMP3JKF0jTbxrj163kAl2OUg9AwS3DSyA2kYmIJr9dAtyu/yz9wztF6mdPxhcTuHhbFMrrusGOrNI=
X-Received: by 2002:a37:bd5:: with SMTP id 204mr10857479qkl.330.1567799226454;
 Fri, 06 Sep 2019 12:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190906062644.13445-1-rashmica.g@gmail.com>
In-Reply-To: <20190906062644.13445-1-rashmica.g@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Fri, 6 Sep 2019 19:46:55 +0000
Message-ID: <CACPK8XdWtg73-ZewJ7jThs0G-j5a3PL3Y9HLcMiEjU+8W_-_Uw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] gpio/aspeed: Setup irqchip dynamically
To:     Rashmica Gupta <rashmica.g@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 6 Sep 2019 at 06:26, Rashmica Gupta <rashmica.g@gmail.com> wrote:
>
> This is in preparation for adding ast2600 support. The ast2600 SoC
> requires two instances of the GPIO driver as it has two GPIO
> controllers. Each instance needs it's own irqchip.
>
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/gpio/gpio-aspeed.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index b83e23aecd18..16c6eaf70857 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -52,6 +52,7 @@ struct aspeed_gpio_config {
>   */
>  struct aspeed_gpio {
>         struct gpio_chip chip;
> +       struct irq_chip irqc;
>         spinlock_t lock;
>         void __iomem *base;
>         int irq;
> @@ -681,14 +682,6 @@ static void aspeed_gpio_irq_handler(struct irq_desc *desc)
>         chained_irq_exit(ic, desc);
>  }
>
> -static struct irq_chip aspeed_gpio_irqchip = {
> -       .name           = "aspeed-gpio",
> -       .irq_ack        = aspeed_gpio_irq_ack,
> -       .irq_mask       = aspeed_gpio_irq_mask,
> -       .irq_unmask     = aspeed_gpio_irq_unmask,
> -       .irq_set_type   = aspeed_gpio_set_type,
> -};
> -
>  static void set_irq_valid_mask(struct aspeed_gpio *gpio)
>  {
>         const struct aspeed_bank_props *props = gpio->config->props;
> @@ -1192,7 +1185,12 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
>
>                 gpio->irq = rc;
>                 girq = &gpio->chip.irq;
> -               girq->chip = &aspeed_gpio_irqchip;
> +               girq->chip = &gpio->irqc;
> +               girq->chip->name = dev_name(&pdev->dev);
> +               girq->chip->irq_ack = aspeed_gpio_irq_ack;
> +               girq->chip->irq_mask = aspeed_gpio_irq_mask;
> +               girq->chip->irq_unmask = aspeed_gpio_irq_unmask;
> +               girq->chip->irq_set_type = aspeed_gpio_set_type;
>                 girq->parent_handler = aspeed_gpio_irq_handler;
>                 girq->num_parents = 1;
>                 girq->parents = devm_kcalloc(&pdev->dev, 1,
> --
> 2.20.1
>
