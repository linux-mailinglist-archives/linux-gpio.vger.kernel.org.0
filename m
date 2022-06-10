Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D810D5461D2
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jun 2022 11:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348966AbiFJJWV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jun 2022 05:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348975AbiFJJV5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jun 2022 05:21:57 -0400
X-Greylist: delayed 1701 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 10 Jun 2022 02:19:50 PDT
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D922A175691
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jun 2022 02:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=misterjones.org; s=dkim20211231; h=Content-Transfer-Encoding:Content-Type:
        Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=tbS+0AcYDfGTlkh9RVWUDEeT2wL9d1TysW/GhoWqd4k=; b=rnTyYOHx21LZjfD03Vu5QuW6Zv
        zuRFmJscn1ILFYnYmK3KE5fLF6CK70DCVVjgD2cjoboRPZSWu9mv+pemwXBcL8LEbfjfXsAp+/rL7
        LCpLkRaaLUDLYKysXZWixzdAlOdFmuIGbGXZ/+Z/6jNG5NOT+td4yg1/sJRo75U/LOMVpUsWCRv0q
        O9UpWhrIyurss0isrQyWQ1wMvn3syNHacHQ7C1tBIbJ948x4hh3LGxRDcAzLjR+2FiBaBVi4wNM4/
        SBDu5rb6XrLcQDFvSpq/DWsU7q5ytaZ+emqRsOMDRCSo2ltY6cC7Pf9g/W+gtgzolc2gJ6Tr6VBZT
        a/LSOrbA==;
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@misterjones.org>)
        id 1nzaMV-00H5XX-32; Fri, 10 Jun 2022 09:51:23 +0100
MIME-Version: 1.0
Date:   Fri, 10 Jun 2022 09:51:22 +0100
From:   Marc Zyngier <maz@misterjones.org>
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Phil Elwell <phil@raspberrypi.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC] pinctrl: bcm2835: Make the irqchip immutable
In-Reply-To: <20220607103302.37558-1-stefan.wahren@i2se.com>
References: <20220607103302.37558-1-stefan.wahren@i2se.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <80790ad5a55e58f923de1c411e970875@misterjones.org>
X-Sender: maz@misterjones.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: stefan.wahren@i2se.com, linus.walleij@linaro.org, brgl@bgdev.pl, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, maxime@cerno.tech, phil@raspberrypi.com, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@misterjones.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2022-06-07 11:33, Stefan Wahren wrote:
> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips. The bcm2835 pinctrl is also affected by this
> warning.
> 
> Fix this by making the irqchip in the bcm2835 pinctrl driver immutable.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
> 
> Hi, not sure about this change because irq_mask/unmask also uses the
> enable/disable callbacks.

Yeah, that's totally broken.

If you have both enable and mask, they *must* be doing something
different (the names are pretty unambiguous...). If they do the
same thing, then enable/disable has to go.

> 
>  drivers/pinctrl/bcm/pinctrl-bcm2835.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> index dad453054776..f754f7ed9eb9 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> @@ -516,6 +516,8 @@ static void bcm2835_gpio_irq_enable(struct irq_data 
> *data)
>  	unsigned bank = GPIO_REG_OFFSET(gpio);
>  	unsigned long flags;
> 
> +	gpiochip_enable_irq(chip, gpio);
> +
>  	raw_spin_lock_irqsave(&pc->irq_lock[bank], flags);
>  	set_bit(offset, &pc->enabled_irq_map[bank]);
>  	bcm2835_gpio_irq_config(pc, gpio, true);
> @@ -537,6 +539,8 @@ static void bcm2835_gpio_irq_disable(struct 
> irq_data *data)
>  	bcm2835_gpio_set_bit(pc, GPEDS0, gpio);
>  	clear_bit(offset, &pc->enabled_irq_map[bank]);
>  	raw_spin_unlock_irqrestore(&pc->irq_lock[bank], flags);
> +
> +	gpiochip_disable_irq(chip, gpio);
>  }
> 
>  static int __bcm2835_gpio_irq_set_type_disabled(struct bcm2835_pinctrl 
> *pc,
> @@ -693,7 +697,7 @@ static int bcm2835_gpio_irq_set_wake(struct
> irq_data *data, unsigned int on)
>  	return ret;
>  }
> 
> -static struct irq_chip bcm2835_gpio_irq_chip = {
> +static const struct irq_chip bcm2835_gpio_irq_chip = {
>  	.name = MODULE_NAME,
>  	.irq_enable = bcm2835_gpio_irq_enable,
>  	.irq_disable = bcm2835_gpio_irq_disable,
> @@ -702,7 +706,7 @@ static struct irq_chip bcm2835_gpio_irq_chip = {
>  	.irq_mask = bcm2835_gpio_irq_disable,
>  	.irq_unmask = bcm2835_gpio_irq_enable,
>  	.irq_set_wake = bcm2835_gpio_irq_set_wake,
> -	.flags = IRQCHIP_MASK_ON_SUSPEND,
> +	.flags = (IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_IMMUTABLE),

You are missing the callbacks into the resource management
code (GPIOCHIP_IRQ_RESOURCE_HELPERS).

Thanks,

         M.
-- 
Who you jivin' with that Cosmik Debris?
