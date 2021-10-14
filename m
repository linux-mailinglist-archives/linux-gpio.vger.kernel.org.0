Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6940842D880
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Oct 2021 13:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231195AbhJNLuF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 14 Oct 2021 07:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231177AbhJNLuE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Oct 2021 07:50:04 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDDF1C061570
        for <linux-gpio@vger.kernel.org>; Thu, 14 Oct 2021 04:47:59 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mazDC-00079e-2V; Thu, 14 Oct 2021 13:47:50 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mazDA-0004UO-F8; Thu, 14 Oct 2021 13:47:48 +0200
Message-ID: <2874212d2f9462880d1b0aae35296162e1277e62.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/2] pinctrl: microchip sgpio: use reset driver
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Horatiu Vultur <horatiu.vultur@microchip.com>,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        lars.povlsen@microchip.com, Steen.Hegelund@microchip.com,
        UNGLinuxDriver@microchip.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Date:   Thu, 14 Oct 2021 13:47:48 +0200
In-Reply-To: <20211014085929.2579695-3-horatiu.vultur@microchip.com>
References: <20211014085929.2579695-1-horatiu.vultur@microchip.com>
         <20211014085929.2579695-3-horatiu.vultur@microchip.com>
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

Hi Horatiu,

On Thu, 2021-10-14 at 10:59 +0200, Horatiu Vultur wrote:
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

Please use devm_reset_control_get_optional_shared() for optional resets
and handle errors. That will return NULL in case the optional reset is
not specified in the device tree.

It seems weird to me that the reset input to the GPIO controller is
called "switch" reset. You can request a single unnamed reset with

	reset = devm_reset_control_get_shared(&pdev->dev, NULL);

although that would limit future extendability in case this driver will
ever require to handle multiple separate resets. If you decide to
request the reset control by name, the yaml binding should specify the
same name.

> +	if (!IS_ERR(reset))
> +		reset_control_reset(reset);

With optional resets, this can be just:

	reset_control_reset(reset);

regards
Philipp
