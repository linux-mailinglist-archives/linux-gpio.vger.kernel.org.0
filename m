Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52FC9864DC
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2019 16:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730170AbfHHO4e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Aug 2019 10:56:34 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:39281 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728289AbfHHO4e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Aug 2019 10:56:34 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hvjq9-0005mr-PZ; Thu, 08 Aug 2019 16:56:29 +0200
Message-ID: <1565276188.3656.24.camel@pengutronix.de>
Subject: Re: [PATCH] pinctrl: freescale: imx: Add of_node_put() before return
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>, aisheng.dong@nxp.com,
        festevam@gmail.com, shawnguo@kernel.org, stefan@agner.ch,
        kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-imx@nxp.com,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date:   Thu, 08 Aug 2019 16:56:28 +0200
In-Reply-To: <20190808074720.15754-1-nishkadg.linux@gmail.com>
References: <20190808074720.15754-1-nishkadg.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 2019-08-08 at 13:17 +0530, Nishka Dasgupta wrote:
> Each iteration of for_each_child_of_node() puts the previous node;
> however, in the case of a return from the middle of the loop, there is no
> put, thus causing a memory leak. Hence put of_node_put() statements as
> required before two mid-loop return statements.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/pinctrl/freescale/pinctrl-imx.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
> index 83ff9532bae6..9f42036c5fbb 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> @@ -672,8 +672,10 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
>  
>  		grp = devm_kzalloc(ipctl->dev, sizeof(struct group_desc),
>  				   GFP_KERNEL);

This looks to me like it could just allocate an array of struct
group_desc upfront, just like the group_names array. Same for the
functions in imx_pinctrl_probe_dt(). Not an issue with this patch
though.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

> -		if (!grp)
> +		if (!grp) {
> +			of_node_put(child);
>  			return -ENOMEM;
> +		}
>  
>  		mutex_lock(&ipctl->mutex);
>  		radix_tree_insert(&pctl->pin_group_tree,
> @@ -697,12 +699,17 @@ static bool imx_pinctrl_dt_is_flat_functions(struct device_node *np)
>  	struct device_node *pinctrl_np;
>  
>  	for_each_child_of_node(np, function_np) {
> -		if (of_property_read_bool(function_np, "fsl,pins"))
> +		if (of_property_read_bool(function_np, "fsl,pins")) {
> +			of_node_put(function_np);
>  			return true;
> +		}
>  
>  		for_each_child_of_node(function_np, pinctrl_np) {
> -			if (of_property_read_bool(pinctrl_np, "fsl,pins"))
> +			if (of_property_read_bool(pinctrl_np, "fsl,pins")) {
> +				of_node_put(pinctrl_np);
> +				of_node_put(function_np);
>  				return false;
> +			}
>  		}
>  	}
>  
