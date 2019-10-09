Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFC28D142D
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 18:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731083AbfJIQgo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 12:36:44 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:58680 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731168AbfJIQgn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 12:36:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=t8pk91iuVFBfJ3Gpf//UypPqu/LoAK/DHg6zouxOibA=; b=JMBRXpTFV81Mmtkp3nQIFDAUk
        NqoiHpuFkKN5pjra+p0IK2OYNeFMYeWQXI+qN1o+8u+L/PViYCKx67+OwCR7KotV0dy96dE7km+iN
        ckJwHVkbfuQSNSzgvGlSURPq5/iBzCqlj1sJkv8UgLbKi1oDc+cZ7mhViUIK09z0Wl6GKhe6E4owu
        OqkceGQnbgpjK7aGA9itGUgmsvirMTmOkH4IN6oPIWR2fGKogkx+f6GMzg3npmo3kNt7FDgwsHWY2
        s/TgTqQ7VTVdQ0dWBZzjP7iXiWj75hfuc4NdNqS/Jk6r03ocRQp2PRKa6pTvdFQ3l1Rwj9isgZ3cN
        3TBrkLxdA==;
Received: from shell.armlinux.org.uk ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:49542)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1iIEwy-0002bz-OJ; Wed, 09 Oct 2019 17:36:32 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1iIEwv-0007qf-3J; Wed, 09 Oct 2019 17:36:29 +0100
Date:   Wed, 9 Oct 2019 17:36:29 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Hui Song <hui.song_1@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6] gpio/mpc8xxx: change irq handler from chained to
 normal
Message-ID: <20191009163628.GH25745@shell.armlinux.org.uk>
References: <20191009083021.33529-1-hui.song_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009083021.33529-1-hui.song_1@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 09, 2019 at 04:30:21PM +0800, Hui Song wrote:
> From: Song Hui <hui.song_1@nxp.com>
> 
> More than one gpio controllers can share one interrupt, change the
> driver to request shared irq.
> 
> While this will work, it will mess up userspace accounting of the number
> of interrupts per second in tools such as vmstat.  The reason is that
> for every GPIO interrupt, /proc/interrupts records the count against GIC
> interrupt 68 or 69, as well as the GPIO itself.  So, for every GPIO
> interrupt, the total number of interrupts that the system has seen
> increments by two
> 
> Signed-off-by: Laurentiu Tudor <Laurentiu.Tudor@nxp.com>
> Signed-off-by: Alex Marginean <alexandru.marginean@nxp.com>
> Signed-off-by: Song Hui <hui.song_1@nxp.com>
> ---
>  Changes in v6:
> 	- change request_irq to devm_request_irq and add commit message.
>  Changes in v5:
> 	- add traverse every bit function.
>  Changes in v4:
> 	- convert 'pr_err' to 'dev_err'.
>  Changes in v3:
> 	- update the patch description.
>  Changes in v2:
> 	- delete the compatible of ls1088a.
> 
>  drivers/gpio/gpio-mpc8xxx.c | 31 ++++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index 16a47de..f0be284 100644
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
> +	struct mpc8xxx_gpio_chip *mpc8xxx_gc = data;
>  	struct gpio_chip *gc = &mpc8xxx_gc->gc;
>  	unsigned int mask;

This needs to be "unsigned long mask;" for for_each_set_bit() not to
complain.

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
> @@ -409,8 +410,16 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>  	if (devtype->gpio_dir_in_init)
>  		devtype->gpio_dir_in_init(gc);
>  
> -	irq_set_chained_handler_and_data(mpc8xxx_gc->irqn,
> -					 mpc8xxx_gpio_irq_cascade, mpc8xxx_gc);
> +	ret = devm_request_irq(&pdev->dev, mpc8xxx_gc->irqn,
> +			       mpc8xxx_gpio_irq_cascade,
> +			       IRQF_NO_THREAD | IRQF_SHARED, "gpio-cascade",
> +			       mpc8xxx_gc);
> +	if (ret) {
> +		dev_err(&pdev->dev, "%s: failed to devm_request_irq(%d), ret = %d\n",
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
