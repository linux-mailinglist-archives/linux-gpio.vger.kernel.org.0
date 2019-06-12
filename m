Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4E2041F24
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 10:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437196AbfFLIcl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 04:32:41 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:54095 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437195AbfFLIck (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 04:32:40 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1haygN-0005Ql-0z; Wed, 12 Jun 2019 10:32:35 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1haygG-0006HR-L5; Wed, 12 Jun 2019 10:32:28 +0200
Date:   Wed, 12 Jun 2019 10:32:28 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Phil Reid <preid@electromag.com.au>
Cc:     linus.walleij@linaro.org, jkridner@gmail.com, poeschel@lemonage.de,
        gustavo@embeddedor.com, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/1] pinctlr: mcp23s08: Fix add_data and
 irqchip_add_nested call order
Message-ID: <20190612083228.jbs7ygn62q6twedp@pengutronix.de>
References: <1560306258-54654-1-git-send-email-preid@electromag.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560306258-54654-1-git-send-email-preid@electromag.com.au>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:29:34 up 25 days, 14:47, 47 users,  load average: 0.02, 0.03,
 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Phil,

thanks for the patch. Can you check that the error which should be fixed
by commit 02e389e6 ("pinctrl: mcp23s08: fix irq setup order") do not
appear. If so we should also add a Fixes line.

Regards,
  Marco

On 19-06-12 10:24, Phil Reid wrote:
> Currently probing of the mcp23s08 results in an error message
> "detected irqchip that is shared with multiple gpiochips:
> please fix the driver"
> 
> This is due to the following:
> 
> Call to mcp23s08_irqchip_setup() with call hierarchy:
> mcp23s08_irqchip_setup()
>   gpiochip_irqchip_add_nested()
>     gpiochip_irqchip_add_key()
>       gpiochip_set_irq_hooks()
> 
> Call to devm_gpiochip_add_data() with call hierarchy:
> devm_gpiochip_add_data()
>   gpiochip_add_data_with_key()
>     gpiochip_add_irqchip()
>       gpiochip_set_irq_hooks()
> 
> The gpiochip_add_irqchip() returns immediately if there isn't a irqchip
> but we added a irqchip due to the previous mcp23s08_irqchip_setup()
> call. So it calls gpiochip_set_irq_hooks() a second time.
> 
> Fix this by moving the call to devm_gpiochip_add_data before
> the call to mcp23s08_irqchip_setup
> 
> Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Phil Reid <preid@electromag.com.au>
> ---
> 
> Notes:
>     v2:
>     - remove unrelated whitespace changes
> 
>  drivers/pinctrl/pinctrl-mcp23s08.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
> index 5d7a851..b727de56 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> @@ -881,6 +881,10 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
>  	if (ret < 0)
>  		goto fail;
>  
> +	ret = devm_gpiochip_add_data(dev, &mcp->chip, mcp);
> +	if (ret < 0)
> +		goto fail;
> +
>  	mcp->irq_controller =
>  		device_property_read_bool(dev, "interrupt-controller");
>  	if (mcp->irq && mcp->irq_controller) {
> @@ -922,10 +926,6 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
>  			goto fail;
>  	}
>  
> -	ret = devm_gpiochip_add_data(dev, &mcp->chip, mcp);
> -	if (ret < 0)
> -		goto fail;
> -
>  	if (one_regmap_config) {
>  		mcp->pinctrl_desc.name = devm_kasprintf(dev, GFP_KERNEL,
>  				"mcp23xxx-pinctrl.%d", raw_chip_address);
> -- 
> 1.8.3.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
