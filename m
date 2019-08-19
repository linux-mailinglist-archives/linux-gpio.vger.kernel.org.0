Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDE9891F97
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2019 11:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725536AbfHSJCd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Aug 2019 05:02:33 -0400
Received: from anchovy2.45ru.net.au ([203.30.46.146]:33476 "EHLO
        anchovy2.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbfHSJCd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Aug 2019 05:02:33 -0400
Received: (qmail 11558 invoked by uid 5089); 19 Aug 2019 09:02:31 -0000
Received: by simscan 1.2.0 ppid: 11508, pid: 11510, t: 0.0562s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.128?) (preid@electromag.com.au@203.59.235.95)
  by anchovy3.45ru.net.au with ESMTPA; 19 Aug 2019 09:02:31 -0000
Subject: Re: [PATCH] gpio: ftgpio: Move hardware initialization
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20190819082704.14237-1-linus.walleij@linaro.org>
From:   Phil Reid <preid@electromag.com.au>
Message-ID: <719afc49-9243-49eb-c0a9-18f901f140fb@electromag.com.au>
Date:   Mon, 19 Aug 2019 17:02:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819082704.14237-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 19/08/2019 16:27, Linus Walleij wrote:
> It is probably wise to initialize the hardware before registering
> the irq chip.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   drivers/gpio/gpio-ftgpio010.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
> index 250e71f3e688..3118d282514a 100644
> --- a/drivers/gpio/gpio-ftgpio010.c
> +++ b/drivers/gpio/gpio-ftgpio010.c
> @@ -296,10 +296,6 @@ static int ftgpio_gpio_probe(struct platform_device *pdev)
>   	girq->handler = handle_bad_irq;
>   	girq->parents[0] = irq;
>   
> -	ret = devm_gpiochip_add_data(dev, &g->gc, g);
> -	if (ret)
> -		goto dis_clk;
> -
>   	/* Disable, unmask and clear all interrupts */
>   	writel(0x0, g->base + GPIO_INT_EN);
>   	writel(0x0, g->base + GPIO_INT_MASK);
> @@ -308,6 +304,10 @@ static int ftgpio_gpio_probe(struct platform_device *pdev)
>   	/* Clear any use of debounce */
>   	writel(0x0, g->base + GPIO_DEBOUNCE_EN);
>   
> +	ret = devm_gpiochip_add_data(dev, &g->gc, g);
> +	if (ret)
> +		goto dis_clk;
> +
>   	platform_set_drvdata(pdev, g);

Should it also be after platform_set_drvdata?
But it doesn't look like it's used anywhere other than in _remove
so I guess it does't matter.


>   	dev_info(dev, "FTGPIO010 @%p registered\n", g->base);
>   
> 


-- 
Regards
Phil Reid

