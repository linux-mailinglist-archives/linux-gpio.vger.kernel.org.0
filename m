Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 704CA42A5E8
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 15:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236686AbhJLNmv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 12 Oct 2021 09:42:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236394AbhJLNmv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 09:42:51 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4565C061570
        for <linux-gpio@vger.kernel.org>; Tue, 12 Oct 2021 06:40:49 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1maI1L-0002rR-92; Tue, 12 Oct 2021 15:40:43 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1maI1K-0001pd-Qa; Tue, 12 Oct 2021 15:40:42 +0200
Message-ID: <ea3b5be735f51dd7c9ac7e77a19596b0e4ced740.camel@pengutronix.de>
Subject: Re: [PATCH] pinctrl: microchip sgpio: use reset driver
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Horatiu Vultur <horatiu.vultur@microchip.com>,
        lars.povlsen@microchip.com, Steen.Hegelund@microchip.com,
        UNGLinuxDriver@microchip.com, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Tue, 12 Oct 2021 15:40:42 +0200
In-Reply-To: <20211012122435.2081930-1-horatiu.vultur@microchip.com>
References: <20211012122435.2081930-1-horatiu.vultur@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 2021-10-12 at 14:24 +0200, Horatiu Vultur wrote:
> On lan966x platform when the switch gets reseted then also the sgpio
> gets reseted. The fix for this is to extend also the sgpio driver to
> call the reset driver which will be reseted only once by the first
> driver that is probed.
> 
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> ---
>  drivers/pinctrl/pinctrl-microchip-sgpio.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
> index 072bccdea2a5..e8a91d0824cb 100644
> --- a/drivers/pinctrl/pinctrl-microchip-sgpio.c
> +++ b/drivers/pinctrl/pinctrl-microchip-sgpio.c
> @@ -17,6 +17,7 @@
>  #include <linux/pinctrl/pinmux.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
> +#include <linux/reset.h>
>  
>  #include "core.h"
>  #include "pinconf.h"
> @@ -803,6 +804,7 @@ static int microchip_sgpio_probe(struct platform_device *pdev)
>  	int div_clock = 0, ret, port, i, nbanks;
>  	struct device *dev = &pdev->dev;
>  	struct fwnode_handle *fwnode;
> +	struct reset_control *reset;
>  	struct sgpio_priv *priv;
>  	struct clk *clk;
>  	u32 val;
> @@ -813,6 +815,10 @@ static int microchip_sgpio_probe(struct platform_device *pdev)
>  
>  	priv->dev = dev;
>  
> +	reset = devm_reset_control_get_shared(&pdev->dev, "switch");

This seems to be missing an update to the devicetree binding.

Just to make sure we aren't introducing a circular dependency here, are
the PHY reset GPIOs that are toggled by the "switch" reset controller in
[1] provided by one of the sgpio controllers?

[1] https://lore.kernel.org/all/20211012114238.2060101-3-horatiu.vultur@microchip.com/

regards
Philipp
