Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E97DB1DF673
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2020 11:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387695AbgEWJnB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 May 2020 05:43:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:46598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725268AbgEWJnA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 23 May 2020 05:43:00 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DBC35206DD;
        Sat, 23 May 2020 09:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590226980;
        bh=hj2/MZNt9a5rifdy8Xt84AYjhMeZP/OYOP04fmwQbhg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ARG81cTbzmoJuaL93XUXGM6BmTzp9SKNDIDONRvPP+bcfpwZE3IwH9YwFQN7JVUXE
         cGS7MoKD2fLp5M/WZPz2mHh2JxvFEzqpAXfhUdws/vFEzbGa4WSFYCCm4XqU60wir5
         b7ZQlQUbsc3O9F1R8weu+eVZ7D90i0nsT8BcEsWY=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jcQgE-00EiXE-9o; Sat, 23 May 2020 10:42:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 23 May 2020 10:42:58 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        swboyd@chromium.org, evgreen@chromium.org, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
Subject: Re: [PATCH 1/4] gpio: gpiolib: Allow GPIO IRQs to lazy disable
In-Reply-To: <1590153569-21706-2-git-send-email-mkshah@codeaurora.org>
References: <1590153569-21706-1-git-send-email-mkshah@codeaurora.org>
 <1590153569-21706-2-git-send-email-mkshah@codeaurora.org>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <5888fc645d26b4780e9d9c6fd582374f@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: mkshah@codeaurora.org, bjorn.andersson@linaro.org, linus.walleij@linaro.org, swboyd@chromium.org, evgreen@chromium.org, mka@chromium.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de, jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-05-22 14:19, Maulik Shah wrote:
> With 'commit 461c1a7d4733 ("gpiolib: override irq_enable/disable")' 
> gpiolib
> overrides irqchip's irq_enable and irq_disable callbacks. If 
> irq_disable
> callback is implemented then genirq takes unlazy path to disable irq.
> 
> Underlying irqchip may not want to implement irq_disable callback to 
> lazy
> disable irq when client drivers invokes disable_irq(). By overriding
> irq_disable callback, gpiolib ends up always unlazy disabling IRQ.
> 
> Allow gpiolib to lazy disable IRQs by overriding irq_disable callback 
> only
> if irqchip implemented irq_disable. In cases where irq_disable is not
> implemented irq_mask is overridden. Similarly override irq_enable 
> callback
> only if irqchip implemented irq_enable otherwise irq_unmask is 
> overridden.
> 
> Fixes: 461c1a7d47 (gpiolib: override irq_enable/disable)
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/gpio/gpiolib.c      | 59 
> +++++++++++++++++++++++++++++----------------
>  include/linux/gpio/driver.h | 13 ++++++++++
>  2 files changed, 51 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index eaa0e20..a8fdc74 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2465,33 +2465,38 @@ static void gpiochip_irq_relres(struct irq_data 
> *d)
>  	gpiochip_relres_irq(gc, d->hwirq);
>  }
> 
> +static void gpiochip_irq_mask(struct irq_data *d)
> +{
> +	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
> +
> +	if (chip->irq.irq_mask)
> +		chip->irq.irq_mask(d);
> +	gpiochip_disable_irq(chip, d->hwirq);
> +}
> +
> +static void gpiochip_irq_unmask(struct irq_data *d)
> +{
> +	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
> +
> +	gpiochip_enable_irq(chip, d->hwirq);
> +	if (chip->irq.irq_unmask)
> +		chip->irq.irq_unmask(d);
> +}
> +
>  static void gpiochip_irq_enable(struct irq_data *d)
>  {
>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> 
> -	gpiochip_enable_irq(gc, d->hwirq);
> -	if (gc->irq.irq_enable)
> -		gc->irq.irq_enable(d);
> -	else
> -		gc->irq.chip->irq_unmask(d);
> +	gpiochip_enable_irq(chip, d->hwirq);

You really never compiled this, did you?

I've stopped looking at this. Please send something that you will have 
actually tested.

         M.
-- 
Jazz is not dead. It just smells funny...
