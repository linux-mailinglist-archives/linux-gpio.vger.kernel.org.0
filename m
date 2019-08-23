Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9FDD9A7E2
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 08:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404280AbfHWG4W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 02:56:22 -0400
Received: from mx.0dd.nl ([5.2.79.48]:60210 "EHLO mx.0dd.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404303AbfHWG4T (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Aug 2019 02:56:19 -0400
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd01::250])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.0dd.nl (Postfix) with ESMTPS id 09BD25FA7D;
        Fri, 23 Aug 2019 08:56:17 +0200 (CEST)
Authentication-Results: mx.0dd.nl;
        dkim=pass (2048-bit key; secure) header.d=vdorst.com header.i=@vdorst.com header.b="sxuCZ7G5";
        dkim-atps=neutral
Received: from www (www.vdorst.com [192.168.2.222])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.vdorst.com (Postfix) with ESMTPSA id C203C1D87AB0;
        Fri, 23 Aug 2019 08:56:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com C203C1D87AB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
        s=default; t=1566543376;
        bh=i4izGsTFHI2qX0ITiH13V1P8hsBkqEM6ULePLcob3HU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=sxuCZ7G5Z00EIVrnXzMNlY0x97YL+coDxnx7g6Tht0ff+Zxud2A+4EuLndnoVMVO/
         5kKeoHXLhS4r2Csy31p4igrqPEzm/KH0OcMMS2Wo09TLhI9Ru6d1DZHMdTaKPxyc8j
         EkBvqEE/bbu8YxqBVeVvDEvBZIhN05B430gOAGyYiCIKXY2OTIHyUDrC/O7qqr32UX
         BaaUu6+bzC1rTC6axKFsSiiWDFttCrQpEI166Wr9ZdT8LYJyQAFZXgt+BeZ0mxd6Tn
         Q2GpwXdw6Eme3L3IEbLjMZ6RRindiznJBFECUxp/S0FAyP4GkaR3TBcZvejU9lJLAb
         cuRbz9FRxJfIg==
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1]) by
 www.vdorst.com (Horde Framework) with HTTPS; Fri, 23 Aug 2019 06:56:16 +0000
Date:   Fri, 23 Aug 2019 06:56:16 +0000
Message-ID: <20190823065616.Horde.zxW8UlkPwcaP5PP9T86uVGn@www.vdorst.com>
From:   =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Ungerer <gerg@kernel.org>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH] gpio: mt7621: Pass irqchip when adding gpiochip
In-Reply-To: <20190809141116.16403-1-linus.walleij@linaro.org>
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Sorry for the late reply.

Quoting Linus Walleij <linus.walleij@linaro.org>:

> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
>
> For chained irqchips this is a pretty straight-forward
> conversion.
>
> This driver requests the IRQ directly in the driver so it
> differs a bit from the others.
>
> Cc: René van Dorst <opensource@vdorst.com>
> Cc: Greg Ungerer <gerg@kernel.org>
> Cc: Nicholas Mc Guire <hofrat@osadl.org>
> Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-mt7621.c | 33 +++++++++++++++++----------------
>  1 file changed, 17 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
> index 79654fb2e50f..d1d785f983a7 100644
> --- a/drivers/gpio/gpio-mt7621.c
> +++ b/drivers/gpio/gpio-mt7621.c
> @@ -241,13 +241,6 @@ mediatek_gpio_bank_probe(struct device *dev,
>  	if (!rg->chip.label)
>  		return -ENOMEM;
>
> -	ret = devm_gpiochip_add_data(dev, &rg->chip, mtk);
> -	if (ret < 0) {
> -		dev_err(dev, "Could not register gpio %d, ret=%d\n",
> -			rg->chip.ngpio, ret);
> -		return ret;
> -	}
> -
>  	rg->irq_chip.name = dev_name(dev);
>  	rg->irq_chip.parent_device = dev;
>  	rg->irq_chip.irq_unmask = mediatek_gpio_irq_unmask;
> @@ -256,8 +249,10 @@ mediatek_gpio_bank_probe(struct device *dev,
>  	rg->irq_chip.irq_set_type = mediatek_gpio_irq_type;
>
>  	if (mtk->gpio_irq) {
> +		struct gpio_irq_chip *girq;
> +
>  		/*
> -		 * Manually request the irq here instead of passing
> +		 * Directly request the irq here instead of passing
>  		 * a flow-handler to gpiochip_set_chained_irqchip,
>  		 * because the irq is shared.
>  		 */
> @@ -271,15 +266,21 @@ mediatek_gpio_bank_probe(struct device *dev,
>  			return ret;
>  		}
>
> -		ret = gpiochip_irqchip_add(&rg->chip, &rg->irq_chip,
> -					   0, handle_simple_irq, IRQ_TYPE_NONE);
> -		if (ret) {
> -			dev_err(dev, "failed to add gpiochip_irqchip\n");
> -			return ret;
> -		}
> +		girq = &rg->chip.irq;
> +		girq->chip = &rg->irq_chip;
> +		/* This will let us handle the parent IRQ in the driver */
> +		girq->parent_handler = NULL;
> +		girq->num_parents = 0;
> +		girq->parents = NULL;
> +		girq->default_type = IRQ_TYPE_NONE;
> +		girq->handler = handle_simple_irq;
> +	}
>
> -		gpiochip_set_chained_irqchip(&rg->chip, &rg->irq_chip,
> -					     mtk->gpio_irq, NULL);
> +	ret = devm_gpiochip_add_data(dev, &rg->chip, mtk);
> +	if (ret < 0) {
> +		dev_err(dev, "Could not register gpio %d, ret=%d\n",
> +			rg->chip.ngpio, ret);
> +		return ret;
>  	}
>
>  	/* set polarity to low for all gpios */
> --
> 2.21.0

I have this patch applied for a while.
I didn't encounter an issues.

Tested-by: René van Dorst <opensource@vdorst.com>

Greats,

René






