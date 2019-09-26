Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E1D4BF5FE
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2019 17:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727305AbfIZPgF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Sep 2019 11:36:05 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:46504 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727238AbfIZPgF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Sep 2019 11:36:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=uAwy68EBZ+WrFk18SUph66dAQKMcbtYPjR8HT7qhx0U=; b=v5EjcodX+DDYtZVC73ZrRDKTv
        Law3lHGDqKvv/DuA/ybW7hpqoyRp8b67l6kGkzqF5w3Cpl6OhMcwQ/d7PNXXOy4QdP19lD1Z/FAHY
        7k04JuKGO9slt2XSKqRXjO4U2vSVUX5g4Jieq5ALG4E0frC/HksY3OlnURO2rzcmSqc7CJw8bInxf
        t8qt/zPzhj2O6TOUHp0xEnZCSmVUc1kS9HfT8BOYcEYddyZUsPUw/vpO60OM3jFlAM0zU3ZTNebeS
        2IJTX0Bmi+ZpgOk6/MDTXSGIr5z5k4L2mNfZcgvEbtXleqF5l7BxqwjnXjmfMxZp9cHtwJjFOzfvn
        BP7LnGAqg==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:36844)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1iDVo2-00072Q-Mf; Thu, 26 Sep 2019 16:35:46 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1iDVny-0003K7-Va; Thu, 26 Sep 2019 16:35:42 +0100
Date:   Thu, 26 Sep 2019 16:35:42 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Hui Song <hui.song_1@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5] gpio/mpc8xxx: change irq handler from chained to
 normal
Message-ID: <20190926153542.GE25745@shell.armlinux.org.uk>
References: <20190916055817.43425-1-hui.song_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190916055817.43425-1-hui.song_1@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 16, 2019 at 01:58:17PM +0800, Hui Song wrote:
> From: Song Hui <hui.song_1@nxp.com>
> 
> More than one gpio controllers can share one interrupt, change the
> driver to request shared irq.
> 
> Signed-off-by: Laurentiu Tudor <Laurentiu.Tudor@nxp.com>
> Signed-off-by: Alex Marginean <alexandru.marginean@nxp.com>
> Signed-off-by: Song Hui <hui.song_1@nxp.com>

While this will work, it will mess up userspace accounting of the
number of interrupts per second in tools such as vmstat.  The reason
is that for every GPIO interrupt, /proc/interrupts records the count
against GIC interrupt 68 or 69, as well as the GPIO itself.  So, for
every GPIO interrupt, the total number of interrupts that the system
has seen increments by two.

If we don't care about accurate interrupt statistics, then this is
fine, but I think it should be mentioned in the commit message.

> ---
> Changes in v5:
> 	- add traverse every bit function.
> Changes in v4:
> 	- convert 'pr_err' to 'dev_err'.
> Changes in v3:
> 	- update the patch description.
> Changes in v2:
> 	- delete the compatible of ls1088a.
>  drivers/gpio/gpio-mpc8xxx.c | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index 16a47de..3a06ca9 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -22,6 +22,7 @@
>  #include <linux/irq.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/bitops.h>
> +#include <linux/interrupt.h>
>  
>  #define MPC8XXX_GPIO_PINS	32
>  
> @@ -127,20 +128,20 @@ static int mpc8xxx_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
>  		return -ENXIO;
>  }
>  
> -static void mpc8xxx_gpio_irq_cascade(struct irq_desc *desc)
> +static irqreturn_t mpc8xxx_gpio_irq_cascade(int irq, void *data)
>  {
> -	struct mpc8xxx_gpio_chip *mpc8xxx_gc = irq_desc_get_handler_data(desc);
> -	struct irq_chip *chip = irq_desc_get_chip(desc);
> +	struct mpc8xxx_gpio_chip *mpc8xxx_gc = (struct mpc8xxx_gpio_chip *)data;
>  	struct gpio_chip *gc = &mpc8xxx_gc->gc;
>  	unsigned int mask;
> +	int i;
>  
>  	mask = gc->read_reg(mpc8xxx_gc->regs + GPIO_IER)
>  		& gc->read_reg(mpc8xxx_gc->regs + GPIO_IMR);
> -	if (mask)
> +	for_each_set_bit(i, &mask, 32)
>  		generic_handle_irq(irq_linear_revmap(mpc8xxx_gc->irq,
> -						     32 - ffs(mask)));
> -	if (chip->irq_eoi)
> -		chip->irq_eoi(&desc->irq_data);
> +						     31 - i));
> +
> +	return IRQ_HANDLED;
>  }
>  
>  static void mpc8xxx_irq_unmask(struct irq_data *d)
> @@ -388,8 +389,8 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>  
>  	ret = gpiochip_add_data(gc, mpc8xxx_gc);
>  	if (ret) {
> -		pr_err("%pOF: GPIO chip registration failed with status %d\n",
> -		       np, ret);
> +		dev_err(&pdev->dev, "%pOF: GPIO chip registration failed with status %d\n",
> +			np, ret);
>  		goto err;
>  	}
>  
> @@ -409,8 +410,15 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>  	if (devtype->gpio_dir_in_init)
>  		devtype->gpio_dir_in_init(gc);
>  
> -	irq_set_chained_handler_and_data(mpc8xxx_gc->irqn,
> -					 mpc8xxx_gpio_irq_cascade, mpc8xxx_gc);
> +	ret = request_irq(mpc8xxx_gc->irqn, mpc8xxx_gpio_irq_cascade,
> +			  IRQF_NO_THREAD | IRQF_SHARED, "gpio-cascade",
> +			  mpc8xxx_gc);
> +	if (ret) {
> +		dev_err(&pdev->dev, "%s: failed to request_irq(%d), ret = %d\n",
> +			np->full_name, mpc8xxx_gc->irqn, ret);
> +		goto err;
> +	}
> +
>  	return 0;
>  err:
>  	iounmap(mpc8xxx_gc->regs);
> -- 
> 2.9.5
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
