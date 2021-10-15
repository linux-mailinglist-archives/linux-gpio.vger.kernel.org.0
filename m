Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55C8342F3D9
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Oct 2021 15:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239607AbhJONlT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Fri, 15 Oct 2021 09:41:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236154AbhJONlS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Oct 2021 09:41:18 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCBA1C061762
        for <linux-gpio@vger.kernel.org>; Fri, 15 Oct 2021 06:39:11 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mbNQK-0000Rn-58; Fri, 15 Oct 2021 15:39:00 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mbNQJ-00030v-CS; Fri, 15 Oct 2021 15:38:59 +0200
Message-ID: <a73a43a71adedcdc34d060bcff10fc13ca1d6d16.camel@pengutronix.de>
Subject: Re: [PATCH v4 2/2] pinctrl: microchip sgpio: use reset driver
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Horatiu Vultur <horatiu.vultur@microchip.com>,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        lars.povlsen@microchip.com, Steen.Hegelund@microchip.com,
        UNGLinuxDriver@microchip.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Date:   Fri, 15 Oct 2021 15:38:59 +0200
In-Reply-To: <20211015132526.200816-3-horatiu.vultur@microchip.com>
References: <20211015132526.200816-1-horatiu.vultur@microchip.com>
         <20211015132526.200816-3-horatiu.vultur@microchip.com>
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

On Fri, 2021-10-15 at 15:25 +0200, Horatiu Vultur wrote:
> On lan966x platform when the switch gets reseted then also the sgpio
> gets reseted. The fix for this is to extend also the sgpio driver to
> call the reset driver which will be reseted only once by the first
> driver that is probed.
> 
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> ---
>  drivers/pinctrl/pinctrl-microchip-sgpio.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
> index 072bccdea2a5..23f5a744edc4 100644
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
> @@ -813,6 +815,9 @@ static int microchip_sgpio_probe(struct platform_device *pdev)
>  
>  	priv->dev = dev;
>  
> +	reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);

	if (IS_ERR(reset))
		return dev_err_probe(dev, PTR_ERR(reset), "Failed to get reset\n");

This could still happen if the device tree is broken or on
-EPROBE_DEFER.

> +	reset_control_reset(reset);
> +
>  	clk = devm_clk_get(dev, NULL);
>  	if (IS_ERR(clk))
>  		return dev_err_probe(dev, PTR_ERR(clk), "Failed to get clock\n");

regards
Philipp
