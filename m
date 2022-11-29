Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7DC63C533
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 17:31:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235972AbiK2QbI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 11:31:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233767AbiK2QbH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 11:31:07 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77ED56931E
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 08:31:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 15226617B6
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 16:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B494CC433D7;
        Tue, 29 Nov 2022 16:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669739463;
        bh=4PyMQ5JlxAjpq7Km/9Uz5WOUe5WAq/COu0sUXNNBUDw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Gjit77NkwrwsiTYvSYSel27B2Z36ZY0hlwpWDSdzH0aDBrOr5AZyswD/eLYuu3Y6Z
         QgyGrMGR/tT8/41pDfZ3NR639KMEthVg+dy9BNtOsAqcDF9bhYFAldq6DI4fX2VrvF
         hGPWlmTz1LedI3bcBFV3D35eJytp2Z3bsx6wiyfrx+vI4ZOxO/NamVuc23JFkJaBSr
         zJ4TRn8+yCk44kp/a8mxuPZ07DfIKc5Ap7CFms4X8SfUSOdiRLkkb3TTvS5LQxTFGk
         qQvFSPNvE8ZAbanUCbadFMphLnFOnsnYj90JqeICDX9+KpI/bhWpK6z1OPo4PEoopQ
         KQ/aXoeCIzN8Q==
Date:   Tue, 29 Nov 2022 16:30:59 +0000
From:   Conor Dooley <conor@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH] gpio: mpfs: Make the irqchip immutable
Message-ID: <Y4Yzw4Oq8lUEHdcC@spud>
References: <4ee1a396acc34871dbae73a5b032915f745795ec.1669738949.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ee1a396acc34871dbae73a5b032915f745795ec.1669738949.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hey Geert,

On Tue, Nov 29, 2022 at 05:23:22PM +0100, Geert Uytterhoeven wrote:
> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips.  Following this change the following warning is
> now observed for the gpio-mpfs driver:
> 
>     gpio gpiochip0: (20122000.gpio): not an immutable chip, please consider fixing it!
> 
> Fix this by making the irqchip in the gpio-mpfs driver immutable.
> 
> While at it, drop of the unneeded masking of the hwirq number, as it is
> always smaller than the number of GPIOs/interrupts handled by the
> controller.

Huh, I didn't think this was upstream yet?
Lewis should be working on an updated version of it at the moment, last
I heard he was looking into using regmap stuff as pointed out in a
review.

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Not tested with interrupts, as there are no inputs described in the
> Icicle DTS yet.
> ---
>  drivers/gpio/gpio-mpfs.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
> index 168be0b90cf8c656..fd294b581ae77369 100644
> --- a/drivers/gpio/gpio-mpfs.c
> +++ b/drivers/gpio/gpio-mpfs.c
> @@ -168,8 +168,9 @@ static void mpfs_gpio_irq_unmask(struct irq_data *data)
>  {
>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
>  	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> -	int gpio_index = irqd_to_hwirq(data) % MAX_NUM_GPIO;
> +	int gpio_index = irqd_to_hwirq(data);
>  
> +	gpiochip_enable_irq(gc, gpio_index);
>  	mpfs_gpio_direction_input(gc, gpio_index);
>  	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
>  	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index),
> @@ -180,11 +181,12 @@ static void mpfs_gpio_irq_mask(struct irq_data *data)
>  {
>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
>  	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
> -	int gpio_index = irqd_to_hwirq(data) % MAX_NUM_GPIO;
> +	int gpio_index = irqd_to_hwirq(data);
>  
>  	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
>  	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index),
>  			     MPFS_GPIO_EN_INT, 0);
> +	gpiochip_disable_irq(gc, gpio_index);
>  }
>  
>  static const struct irq_chip mpfs_gpio_irqchip = {
> @@ -192,7 +194,8 @@ static const struct irq_chip mpfs_gpio_irqchip = {
>  	.irq_set_type = mpfs_gpio_irq_set_type,
>  	.irq_mask	= mpfs_gpio_irq_mask,
>  	.irq_unmask	= mpfs_gpio_irq_unmask,
> -	.flags = IRQCHIP_MASK_ON_SUSPEND,
> +	.flags = IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND,
> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };
>  
>  static void mpfs_gpio_irq_handler(struct irq_desc *desc)
> -- 
> 2.25.1
> 
