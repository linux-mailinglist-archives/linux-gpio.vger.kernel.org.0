Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 603EC427384
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Oct 2021 00:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243565AbhJHWSF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 18:18:05 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:41722 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231830AbhJHWSD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Oct 2021 18:18:03 -0400
Received: by mail-ot1-f47.google.com with SMTP id v2-20020a05683018c200b0054e3acddd91so8839244ote.8;
        Fri, 08 Oct 2021 15:16:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g33B09Xm8uJRWGzSRw0MEMlYpfqM7GZ2k5+fymu898Y=;
        b=FQxOd1QM7t4I/iQSazs2BDoPE+nS2KCB7iEfhh4ClsPCVGcSfXur0um8yJaT+9BFK8
         QZRPS0o7RP6kNUCndxQl6YbatUOyFsbCb7dhuGw8oQ3dnHRdcTnf9I5rUpj2olatk2R7
         nOyk80N+OJd8imMUzB3OBtcfoHnQbEcTxDDRoMjHpDd+0J/YFIxnKyqrRicRw/iEWgFm
         X1quyLh86r5AuTH7lo++g4a4L1Ee2K8yMt2YFAz/pv8/RkWGMJGRRGByddVO9qoERav5
         UCZL2rWLqbzqONPJ5cd9bgWj5VOGi5AjHF1cn59cXbnC1TtKAG8JRPFWSUW25dZ2M6GS
         pIDA==
X-Gm-Message-State: AOAM533bZPfbpTqYfjLDKvVkX7lA6hqcmpzzqk5dmVe1KGLA2zI2g4Y6
        eV/af+gRF+jX0W00Jdf4tQ==
X-Google-Smtp-Source: ABdhPJwS8hN9ifJqRWhByXbd20/OtS1gwxVjti0wkeliNZQqJ1NFxHfpoXPp5+zeymsbCqoEDGWZ+Q==
X-Received: by 2002:a05:6830:2806:: with SMTP id w6mr10687153otu.238.1633731367517;
        Fri, 08 Oct 2021 15:16:07 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bd24sm185470oib.52.2021.10.08.15.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 15:16:06 -0700 (PDT)
Received: (nullmailer pid 3413981 invoked by uid 1000);
        Fri, 08 Oct 2021 22:16:05 -0000
Date:   Fri, 8 Oct 2021 17:16:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, warthog618@gmail.com,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RFC v2 07/11] gpio: tegra186: Add HTE in gpio-tegra186 driver
Message-ID: <YWDDJbnbTea397I8@robh.at.kernel.org>
References: <20210930232617.6396-1-dipenp@nvidia.com>
 <20210930232617.6396-8-dipenp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930232617.6396-8-dipenp@nvidia.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 30, 2021 at 04:26:13PM -0700, Dipen Patel wrote:
> Tegra194 AON GPIO controller with the use of its internal hardware
> timestamping engine (HTE) also known as GTE can timestamp GPIO
> lines through system counter. This patch implements two callbacks
> which are essential for the gpio consumers that want such HTE
> functionality. The callbacks details can be found at
> include/gpio/driver.h.
> 
> Since AON GPIO controller depends on HTE engine, it creates hardware
> dependency between controller and AON HTE provider. To express that,
> the optional devicetree property is introduced for AON GPIO controller.
> 
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> ---
>  .../bindings/gpio/nvidia,tegra186-gpio.txt    |  7 ++

Bindings should be a separate patch. Consider converting this to schema 
first too.

>  drivers/gpio/gpio-tegra186.c                  | 89 +++++++++++++++++++
>  2 files changed, 96 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
> index adff16c71d21..00a3e47ab560 100644
> --- a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
> @@ -127,6 +127,12 @@ Required properties:
>              - 8: Active low level-sensitive.
>              Valid combinations are 1, 2, 3, 4, 8.
>  
> +Optional properties:
> +- timestamp-engine

Should be in the common binding.

But then when do you use hardware-timestamps? This property seems to 
assume GPIO hand the timestamp engine have the same numbering of 
signals. I think you need to be able to map GPIOx to timestamp y. If you 
want a short cut for a 1-1 case, then that's another discussion.

> +    AON GPIO controller has timestamp engine which can hardware timestamp
> +    GPIO configured as input and IRQ. This property specifies hardware
> +    timestamp engine (HTE) device-tree node.
> +
>  Example:
>  
>  #include <dt-bindings/interrupt-controller/irq.h>
> @@ -162,4 +168,5 @@ gpio@c2f0000 {
>  	#gpio-cells = <2>;
>  	interrupt-controller;
>  	#interrupt-cells = <2>;
> +	timestamp-engine = <&tegra_hte_aon>;
>  };
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index c026e7141e4e..6d1f15167529 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -11,6 +11,7 @@
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> +#include <linux/hte.h>
>  
>  #include <dt-bindings/gpio/tegra186-gpio.h>
>  #include <dt-bindings/gpio/tegra194-gpio.h>
> @@ -34,6 +35,7 @@
>  #define  TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_LEVEL BIT(4)
>  #define  TEGRA186_GPIO_ENABLE_CONFIG_DEBOUNCE BIT(5)
>  #define  TEGRA186_GPIO_ENABLE_CONFIG_INTERRUPT BIT(6)
> +#define  TEGRA186_GPIO_ENABLE_CONFIG_TIMESTAMP_FUNC BIT(7)
>  
>  #define TEGRA186_GPIO_DEBOUNCE_CONTROL 0x04
>  #define  TEGRA186_GPIO_DEBOUNCE_CONTROL_THRESHOLD(x) ((x) & 0xff)
> @@ -81,6 +83,7 @@ struct tegra_gpio {
>  	struct irq_chip intc;
>  	unsigned int num_irq;
>  	unsigned int *irq;
> +	struct device *dev;
>  
>  	const struct tegra_gpio_soc *soc;
>  	unsigned int num_irqs_per_bank;
> @@ -192,6 +195,86 @@ static int tegra186_gpio_direction_output(struct gpio_chip *chip,
>  	return 0;
>  }
>  
> +static int tegra186_gpio_req_hw_ts(struct gpio_chip *chip, unsigned int offset,
> +				   hte_ts_cb_t cb, hte_ts_threaded_cb_t tcb,
> +				   struct hte_ts_desc *hdesc, void *data)
> +{
> +	struct tegra_gpio *gpio;
> +	void __iomem *base;
> +	int value, ret;
> +
> +	if (!chip || !hdesc)
> +		return -EINVAL;
> +
> +	gpio = gpiochip_get_data(chip);
> +	if (!gpio)
> +		return -ENODEV;
> +
> +	base = tegra186_gpio_get_base(gpio, offset);
> +	if (WARN_ON(base == NULL))
> +		return -EINVAL;
> +
> +	/*
> +	 * HTE provider of this gpio controller does not support below gpio
> +	 * configs:
> +	 * 1. gpio as output
> +	 * 2. gpio as input
> +	 *
> +	 * HTE provider supports below gpio config:
> +	 * a. gpio as input with irq enabled
> +	 */
> +
> +	if (tegra186_gpio_get_direction(chip, offset) ==
> +	    GPIO_LINE_DIRECTION_OUT)
> +		return -ENOTSUPP;
> +
> +	if (!gpiochip_line_is_irq(chip, offset))
> +		return -ENOTSUPP;
> +
> +	hdesc->con_id = offset;
> +
> +	ret = hte_req_ts_by_hte_name(gpio->dev, "timestamp-engine", hdesc, cb,
> +				     tcb, data);
> +	if (ret)
> +		return ret;
> +
> +	value = readl(base + TEGRA186_GPIO_ENABLE_CONFIG);
> +	value |= TEGRA186_GPIO_ENABLE_CONFIG_TIMESTAMP_FUNC;
> +	writel(value, base + TEGRA186_GPIO_ENABLE_CONFIG);
> +
> +	return 0;
> +}
> +
> +static int tegra186_gpio_rel_hw_ts(struct gpio_chip *chip,
> +				   unsigned int offset,
> +				   struct hte_ts_desc *hdesc)
> +{
> +	struct tegra_gpio *gpio;
> +	void __iomem *base;
> +	int value, ret;
> +
> +	if (!hdesc || !chip)
> +		return -EINVAL;
> +
> +	gpio = gpiochip_get_data(chip);
> +	if (!gpio)
> +		return -ENODEV;
> +
> +	base = tegra186_gpio_get_base(gpio, offset);
> +	if (WARN_ON(base == NULL))
> +		return -EINVAL;
> +
> +	ret = hte_release_ts(hdesc);
> +	if (ret)
> +		return ret;
> +
> +	value = readl(base + TEGRA186_GPIO_ENABLE_CONFIG);
> +	value &= ~TEGRA186_GPIO_ENABLE_CONFIG_TIMESTAMP_FUNC;
> +	writel(value, base + TEGRA186_GPIO_ENABLE_CONFIG);
> +
> +	return 0;
> +}
> +
>  static int tegra186_gpio_get(struct gpio_chip *chip, unsigned int offset)
>  {
>  	struct tegra_gpio *gpio = gpiochip_get_data(chip);
> @@ -821,6 +904,12 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>  		offset += port->pins;
>  	}
>  
> +	gpio->dev = &pdev->dev;
> +	if (device_property_present(gpio->dev, "timestamp-engine")) {
> +		gpio->gpio.req_hw_timestamp = tegra186_gpio_req_hw_ts;
> +		gpio->gpio.rel_hw_timestamp = tegra186_gpio_rel_hw_ts;
> +	}
> +
>  	return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio, gpio);
>  }
>  
> -- 
> 2.17.1
> 
> 
