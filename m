Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70D8FD0FA0
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 15:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731005AbfJINHr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 09:07:47 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:64754 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730858AbfJINHr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 09:07:47 -0400
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
  Ludovic.Desroches@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="Ludovic.Desroches@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Ludovic.Desroches@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: M8Q5Fo46EoMAbsYto3jBLDpfJPLyo8ifAQOzavgD9PehgmpKz0cCFCKNiBdWD/S+0pz2PeZcCm
 RSHMhITZ0gSPKzZAklVAVDx3NihwbrwBqhxtyJTfhxgvNMDktmf07VXBbrbP6qDIartnoc8cZ1
 /uZpTiV/DhFhQw+J/f54YBXh2qWjxfiiVDZgr/H9QIZauThRzXEjrJeZwJPBlRLcMgdDhfxGSj
 +YXO280Gw4lbS6Z1IYlT2Bl/ncWVJ074pygk2jYVdCuX4wGhmPsWHnxc9vqzSqyOah/8uGermf
 ILM=
X-IronPort-AV: E=Sophos;i="5.67,276,1566889200"; 
   d="scan'208";a="50800272"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Oct 2019 06:07:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 9 Oct 2019 06:07:45 -0700
Received: from localhost (10.10.85.251) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 9 Oct 2019 06:07:45 -0700
Date:   Wed, 9 Oct 2019 15:07:53 +0200
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] pinctrl: at91: Pass irqchip when adding gpiochip
Message-ID: <20191009130752.mt24stq6ok2wzmgc@M43218.corp.atmel.com>
Mail-Followup-To: Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>
References: <20191001130645.8350-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191001130645.8350-1-linus.walleij@linaro.org>
User-Agent: NeoMutt/20180716
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 01, 2019 at 03:06:45PM +0200, Linus Walleij wrote:
> 
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
> 
> For chained irqchips this is a pretty straight-forward
> conversion: at91 is a little bit special since it registers
> up to 3 gpio_chips with the same parent handler, but just
> passing girq->parent_handler and the parent on the first
> of them should cut it.
> 
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com> 

By the way, tested with a sama5d3_xplained board.

Thanks

Ludovic

> ---
>  drivers/pinctrl/pinctrl-at91.c | 47 ++++++++++++++++------------------
>  1 file changed, 22 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
> index d6e7e9f0ddec..117075b5798f 100644
> --- a/drivers/pinctrl/pinctrl-at91.c
> +++ b/drivers/pinctrl/pinctrl-at91.c
> @@ -1723,9 +1723,11 @@ static int at91_gpio_of_irq_setup(struct platform_device *pdev,
>  	struct at91_gpio_chip   *prev = NULL;
>  	struct irq_data		*d = irq_get_irq_data(at91_gpio->pioc_virq);
>  	struct irq_chip		*gpio_irqchip;
> -	int ret, i;
> +	struct gpio_irq_chip	*girq;
> +	int i;
>  
> -	gpio_irqchip = devm_kzalloc(&pdev->dev, sizeof(*gpio_irqchip), GFP_KERNEL);
> +	gpio_irqchip = devm_kzalloc(&pdev->dev, sizeof(*gpio_irqchip),
> +				    GFP_KERNEL);
>  	if (!gpio_irqchip)
>  		return -ENOMEM;
>  
> @@ -1747,33 +1749,30 @@ static int at91_gpio_of_irq_setup(struct platform_device *pdev,
>  	 * handler will perform the actual work of handling the parent
>  	 * interrupt.
>  	 */
> -	ret = gpiochip_irqchip_add(&at91_gpio->chip,
> -				   gpio_irqchip,
> -				   0,
> -				   handle_edge_irq,
> -				   IRQ_TYPE_NONE);
> -	if (ret) {
> -		dev_err(&pdev->dev, "at91_gpio.%d: Couldn't add irqchip to gpiochip.\n",
> -			at91_gpio->pioc_idx);
> -		return ret;
> -	}
> +	girq = &at91_gpio->chip.irq;
> +	girq->chip = gpio_irqchip;
> +	girq->default_type = IRQ_TYPE_NONE;
> +	girq->handler = handle_edge_irq;
>  
> -	/* The top level handler handles one bank of GPIOs, except
> +	/*
> +	 * The top level handler handles one bank of GPIOs, except
>  	 * on some SoC it can handle up to three...
>  	 * We only set up the handler for the first of the list.
>  	 */
>  	gpiochip_prev = irq_get_handler_data(at91_gpio->pioc_virq);
>  	if (!gpiochip_prev) {
> -		/* Then register the chain on the parent IRQ */
> -		gpiochip_set_chained_irqchip(&at91_gpio->chip,
> -					     gpio_irqchip,
> -					     at91_gpio->pioc_virq,
> -					     gpio_irq_handler);
> +		girq->parent_handler = gpio_irq_handler;
> +		girq->num_parents = 1;
> +		girq->parents = devm_kcalloc(&pdev->dev, 1,
> +					     sizeof(*girq->parents),
> +					     GFP_KERNEL);
> +		if (!girq->parents)
> +			return -ENOMEM;
> +		girq->parents[0] = at91_gpio->pioc_virq;
>  		return 0;
>  	}
>  
>  	prev = gpiochip_get_data(gpiochip_prev);
> -
>  	/* we can only have 2 banks before */
>  	for (i = 0; i < 2; i++) {
>  		if (prev->next) {
> @@ -1903,6 +1902,10 @@ static int at91_gpio_probe(struct platform_device *pdev)
>  	range->npins = chip->ngpio;
>  	range->gc = chip;
>  
> +	ret = at91_gpio_of_irq_setup(pdev, at91_chip);
> +	if (ret)
> +		goto gpiochip_add_err;
> +
>  	ret = gpiochip_add_data(chip, at91_chip);
>  	if (ret)
>  		goto gpiochip_add_err;
> @@ -1910,16 +1913,10 @@ static int at91_gpio_probe(struct platform_device *pdev)
>  	gpio_chips[alias_idx] = at91_chip;
>  	gpio_banks = max(gpio_banks, alias_idx + 1);
>  
> -	ret = at91_gpio_of_irq_setup(pdev, at91_chip);
> -	if (ret)
> -		goto irq_setup_err;
> -
>  	dev_info(&pdev->dev, "at address %p\n", at91_chip->regbase);
>  
>  	return 0;
>  
> -irq_setup_err:
> -	gpiochip_remove(chip);
>  gpiochip_add_err:
>  clk_enable_err:
>  	clk_disable_unprepare(at91_chip->clock);
> -- 
> 2.21.0
> 
> 
