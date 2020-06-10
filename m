Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 333D21F4E6B
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 08:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726153AbgFJGtj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 02:49:39 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35904 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbgFJGtj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2020 02:49:39 -0400
Received: by mail-wr1-f66.google.com with SMTP id q11so921223wrp.3;
        Tue, 09 Jun 2020 23:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+2RflAbiZFNXscYVcTRcL3mwiWsg2XTLWoR4ERYm7ms=;
        b=IyGuuFvahSsr9+mYglsAHESTS6ZzGHxYnoBomn7770HJ3zwytoFTjnrEtJoXFTAsQi
         xc/scuXPUPhSHljSiZkgoW+/64K06rF/Ua79Zhja+mG4p+kQTwyFkx2cdmtWzWN6jBCp
         o58fLKzEGD3sfNB786znZKMHPytwnI+XiKO0sX08oY+WzekwcK7xexBqIS5gbtGP1jWX
         p3fX2UAJg4QtJGHE3/xOhK3Oi6r6+VAWRRbVzXzlcsvEf9s6mXVYKjl1XJTAYsSVwwd7
         6xHjWvMbap0nCbIjAHW2a+A8azf5+qTs7bJyJMTYGKtNCghHwyTD+YHYJ7nOy0l3rUXm
         3yLQ==
X-Gm-Message-State: AOAM532EcKiJpF6sewX5dV/PCSKMITOJ7WJPEAmwoGbjNlpZ6fgZMPVx
        +OXbuWMpHDBbQZnabBp/WkI=
X-Google-Smtp-Source: ABdhPJwX/wNCPF2VRVwD59vAKR/9jZo0RtMMrv0N+L3RYQCSPc3Nyzmetn/pXQ5whdFbu/vILOolMQ==
X-Received: by 2002:adf:a491:: with SMTP id g17mr1999512wrb.132.1591771776849;
        Tue, 09 Jun 2020 23:49:36 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id u74sm5785556wmu.31.2020.06.09.23.49.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 23:49:36 -0700 (PDT)
Date:   Wed, 10 Jun 2020 08:49:33 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] pinctrl: samsung: Use bank name as irqchip name
Message-ID: <20200610064933.GA3716@kozik-lap>
References: <CGME20200609082341eucas1p2e24e71598af14d994520b79494e96b15@eucas1p2.samsung.com>
 <20200609082329.10184-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200609082329.10184-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 09, 2020 at 10:23:29AM +0200, Marek Szyprowski wrote:
> Use the bank name as the irqchip name. This name is later visible in
> /proc/interrupts, what makes it possible to easily identify each
> GPIO interrupt.
> 
> /proc/interrupts before this patch:
> 143:    0     exynos4210_wkup_irq_chip   7 Edge      hdmi
> 144:    0     exynos4210_wkup_irq_chip   6 Level     wm8994
> 145:    1     exynos4210_wkup_irq_chip   7 Edge      max77686-pmic, max77686-rtc
> 146:    1     exynos_gpio_irq_chip   3 Edge      3-0048
> 
> /proc/interrupts after this patch:
> 143:    0     gpx3   7 Edge      hdmi
> 144:    0     gpx3   6 Level     wm8994
> 145:    1     gpx0   7 Edge      max77686-pmic, max77686-rtc
> 146:    1     gpm2   3 Edge      3-0048
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>


Hi Marek,

Nice idea!

> ---
>  drivers/pinctrl/samsung/pinctrl-exynos.c | 27 +++++++++++++++---------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
> index 84501c785473..1c87cf41602a 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> @@ -207,7 +207,7 @@ static void exynos_irq_release_resources(struct irq_data *irqd)
>  /*
>   * irq_chip for gpio interrupts.
>   */
> -static struct exynos_irq_chip exynos_gpio_irq_chip = {
> +static const struct exynos_irq_chip exynos_gpio_irq_chip __initconst = {
>  	.chip = {
>  		.name = "exynos_gpio_irq_chip",
>  		.irq_unmask = exynos_irq_unmask,
> @@ -313,7 +313,13 @@ int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
>  			goto err_domains;
>  		}
>  
> -		bank->irq_chip = &exynos_gpio_irq_chip;
> +		bank->irq_chip = kmemdup(&exynos_gpio_irq_chip,
> +					 sizeof(*bank->irq_chip), GFP_KERNEL);

You cannot reference initconst memory from non-init function. Build with
SECTION_MISMATCH to see the warnings.

> +		if (!bank->irq_chip) {

irq_domain_remove()

> +			ret = -ENOMEM;
> +			goto err_domains;
> +		}
> +		bank->irq_chip->chip.name = bank->name;
>  	}
>  
>  	return 0;
> @@ -521,7 +527,7 @@ int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
>  	struct samsung_pin_bank *bank;
>  	struct exynos_weint_data *weint_data;
>  	struct exynos_muxed_weint_data *muxed_data;
> -	struct exynos_irq_chip *irq_chip;
> +	const struct exynos_irq_chip *irq_chip;
>  	unsigned int muxed_banks = 0;
>  	unsigned int i;
>  	int idx, irq;
> @@ -531,12 +537,7 @@ int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
>  
>  		match = of_match_node(exynos_wkup_irq_ids, np);
>  		if (match) {
> -			irq_chip = kmemdup(match->data,
> -				sizeof(*irq_chip), GFP_KERNEL);
> -			if (!irq_chip) {
> -				of_node_put(np);
> -				return -ENOMEM;
> -			}
> +			irq_chip = match->data;
>  			wkup_np = np;
>  			break;
>  		}
> @@ -557,7 +558,13 @@ int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
>  			return -ENXIO;
>  		}
>  
> -		bank->irq_chip = irq_chip;
> +		bank->irq_chip = kmemdup(irq_chip, sizeof(*irq_chip),
> +					 GFP_KERNEL);
> +		if (!bank->irq_chip) {
> +			of_node_put(wkup_np);

irq_domain_remove()

Best regards,
Krzysztof


> +			return -ENOMEM;
> +		}
> +		bank->irq_chip->chip.name = bank->name;
>  
>  		if (!of_find_property(bank->of_node, "interrupts", NULL)) {
>  			bank->eint_type = EINT_TYPE_WKUP_MUX;
> -- 
> 2.17.1
> 
