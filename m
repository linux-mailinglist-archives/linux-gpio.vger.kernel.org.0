Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23FC04CBCE8
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Mar 2022 12:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbiCCLlU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 3 Mar 2022 06:41:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232404AbiCCLlU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Mar 2022 06:41:20 -0500
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83DA2DD97E
        for <linux-gpio@vger.kernel.org>; Thu,  3 Mar 2022 03:40:33 -0800 (PST)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1nPjos-0007nY-N4; Thu, 03 Mar 2022 12:40:30 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     linus.walleij@linaro.org, linux-rockchip@lists.infradead.org,
        linux-gpio@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>
Subject: Re: [PATCH 2/2] gpio: rockchip: get pinctrl node from 'gpio-ranges' property
Date:   Thu, 03 Mar 2022 12:40:30 +0100
Message-ID: <2004737.KQk8vJUODO@diego>
In-Reply-To: <20220303062211.1378883-3-jay.xu@rock-chips.com>
References: <20220303062211.1378883-1-jay.xu@rock-chips.com> <20220303062211.1378883-3-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jianqun,

Am Donnerstag, 3. März 2022, 07:22:11 CET schrieb Jianqun Xu:
> The dt nodes for rockchip soc designes as
> 
> 	pinctrl: pinctrl {
> 		gpio {
> 			gpio-ranges = <&pinctrl xxx>;
> 		};
> 	};
> 
> Currently, we get the pinctrl dt node from parent of gpio, this patch
> try to get pinctrl dt node from 'gpio-ranges' property.
> 
> After this patch, the dt nodes possible to be
> 
> 	gpio {
> 		gpio-ranges = <&pinctrl xxx>;
> 	};
> 
> 	pinctrl: pinctrl {
> 
> 	};
> 
> then the gpio driver could register as platform device itself, but not
> populate from pinctrl driver.

The change looks interesting, as it would solve that long-standing
design-issue I "created" back in 2013 ;-) .

Though you need to keep some things in mind:

(1) Such a change should be reflected in the devicetree binding
    as it involves a different form of nodes and introduces.

    Looking at the binding description, using gpio-ranges to map
    to specific pinctrl pins really seems to be a valid use for this.


(2) Keep things backwards compatible.
    Old devicetrees should stay working with new kernel versions

    A common pattern is to try the new approach and if that fails
    try the "deprecated" method, which should be nicely doable
    when looking at the code change below.


Heiko

> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---
>  drivers/gpio/gpio-rockchip.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 1da0324445cc..46c54dff92db 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -690,6 +690,9 @@ rockchip_gpio_find_bank(struct pinctrl_dev *pctldev, int id)
>  	int i, found = 0;
>  
>  	info = pinctrl_dev_get_drvdata(pctldev);
> +	if (!info)
> +		return NULL;
> +
>  	bank = info->ctrl->pin_banks;
>  	for (i = 0; i < info->ctrl->nr_banks; i++, bank++) {
>  		if (bank->bank_num == id) {
> @@ -705,15 +708,16 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
> -	struct device_node *pctlnp = of_get_parent(np);
> +	struct device_node *pctlnp = NULL;
>  	struct pinctrl_dev *pctldev = NULL;
>  	struct rockchip_pin_bank *bank = NULL;
>  	struct rockchip_pin_output_deferred *cfg;
>  	static int gpio;
>  	int id, ret;
>  
> -	if (!np || !pctlnp)
> -		return -ENODEV;
> +	pctlnp = of_parse_phandle(np, "gpio-ranges", 0);
> +	if (!pctlnp)
> +		pctlnp = of_get_parent(np);
>  
>  	pctldev = of_pinctrl_get(pctlnp);
>  	if (!pctldev)
> 




