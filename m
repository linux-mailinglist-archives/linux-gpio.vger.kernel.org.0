Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77A7A8A2C9
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 18:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfHLQAk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 12:00:40 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37728 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725648AbfHLQAk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Aug 2019 12:00:40 -0400
Received: by mail-pl1-f193.google.com with SMTP id bj8so1020868plb.4
        for <linux-gpio@vger.kernel.org>; Mon, 12 Aug 2019 09:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=eu4hl5qNaMJhHhWuL7T0rF5vow3jYh9xaCT/k0XYegc=;
        b=fYGgtyFXvcj2HnwlHoYT6g9KhiCyUBLNG62n3HsLA934ERKhjuhYqXTY11f9yY6qGW
         Ri9OSvrv1P5bg2kET95NS8shMfc2ZwBGOPNGDf81JO3GCrJhKzrohIwwAYe2YHXd93tY
         CNkMMRoBmf4uyMvTfvK+8TGl7uZnzbvN1o7Tc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=eu4hl5qNaMJhHhWuL7T0rF5vow3jYh9xaCT/k0XYegc=;
        b=WZgD3FE9Ze0bqjn74gV8aU6e0q9XCu+w9dMJ/aEqUCuEVoLqM0u4zdBrAAEA5QJi1T
         mH3ntZt03XOE+/hkQwACO/R+B+Uuj7j18pE1F7iEkbo+RmJouwkt8UFGUuJ4/WsO770r
         lDCUkN+xIfdVIX1neR8S21fnhqyfaSX6bHuZfTyAyyESrNTmxAU0OEerlSDwBEjJtc+4
         Yuss8IaaoaT9B0EBpkIvgq/qN34J3dio6wHqPgs5B8+fIfx8DxubRBx32pMhGBkpRueb
         a5OdeZjzghYtasVF/m5WFPvy6YcWLFxMDS6Y0HpbZG99YmJIssAlqqqnTtgf9qbB/Vmu
         VqcA==
X-Gm-Message-State: APjAAAVGqyT4CEk2c7yeD1dQU30AzM++Wp+1bkyJysEc7jUEk7QLSrFj
        oebv5G4sdLTV+fQ8s9gFvnV80w==
X-Google-Smtp-Source: APXvYqyU3EltDuiGW5guVXDVBQ+lUYTTY/F8ooszBunHleKhnCrCI6OV79LHfPrQ0DhHD9nj2iePSA==
X-Received: by 2002:a17:902:381:: with SMTP id d1mr32851258pld.331.1565625639711;
        Mon, 12 Aug 2019 09:00:39 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id l1sm152074747pfl.9.2019.08.12.09.00.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 09:00:38 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: bcm-iproc: Pass irqchip when adding gpiochip
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pramod Kumar <pramodku@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Thierry Reding <treding@nvidia.com>
References: <20190812132554.18313-1-linus.walleij@linaro.org>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <24d28eed-c2ab-5850-50b2-db63740b71dd@broadcom.com>
Date:   Mon, 12 Aug 2019 09:00:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812132554.18313-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 2019-08-12 6:25 a.m., Linus Walleij wrote:
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
>
> For chained irqchips this is a pretty straight-forward
> conversion.
>
> Cc: Pramod Kumar <pramodku@broadcom.com>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Scott Branden <scott.branden@broadcom.com>
> ---
>   drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 33 ++++++++++++++----------
>   1 file changed, 19 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> index 18ff01727e0e..ee01306c62fa 100644
> --- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> +++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> @@ -780,6 +780,25 @@ static int iproc_gpio_probe(struct platform_device *pdev)
>   	chip->pinmux_is_supported = of_property_read_bool(dev->of_node,
>   							"gpio-ranges");
>   
> +	/* optional GPIO interrupt support */
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq) {
> +		struct gpio_irq_chip *girq;
> +
> +		girq = &gc->irq;
> +		girq->chip = &iproc_gpio_irq_chip;
> +		girq->parent_handler = iproc_gpio_irq_handler;
> +		girq->num_parents = 1;
> +		girq->parents = devm_kcalloc(dev, 1,
> +					     sizeof(*girq->parents),
> +					     GFP_KERNEL);
> +		if (!girq->parents)
> +			return -ENOMEM;
> +		girq->parents[0] = irq;
> +		girq->default_type = IRQ_TYPE_NONE;
> +		girq->handler = handle_simple_irq;
> +	}
> +
>   	ret = gpiochip_add_data(gc, chip);
>   	if (ret < 0) {
>   		dev_err(dev, "unable to add GPIO chip\n");
> @@ -804,20 +823,6 @@ static int iproc_gpio_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> -	/* optional GPIO interrupt support */
> -	irq = platform_get_irq(pdev, 0);
> -	if (irq) {
> -		ret = gpiochip_irqchip_add(gc, &iproc_gpio_irq_chip, 0,
> -					   handle_simple_irq, IRQ_TYPE_NONE);
> -		if (ret) {
> -			dev_err(dev, "no GPIO irqchip\n");
> -			goto err_rm_gpiochip;
> -		}
> -
> -		gpiochip_set_chained_irqchip(gc, &iproc_gpio_irq_chip, irq,
> -					     iproc_gpio_irq_handler);
> -	}
> -
>   	return 0;
>   
>   err_rm_gpiochip:
