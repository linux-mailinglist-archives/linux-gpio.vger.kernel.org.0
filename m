Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E44B4B0BF3
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Feb 2022 12:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240507AbiBJLKb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 10 Feb 2022 06:10:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235688AbiBJLKa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Feb 2022 06:10:30 -0500
X-Greylist: delayed 429 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 10 Feb 2022 03:10:32 PST
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17842B71
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 03:10:32 -0800 (PST)
Date:   Thu, 10 Feb 2022 11:03:13 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] pinctrl: ingenic: Fix regmap on X series SoCs
To:     Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Cc:     linus.walleij@linaro.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <DD537R.K2D13DXGNPGH@crapouillou.net>
In-Reply-To: <20220209230452.19535-1-aidanmacdonald.0x0@gmail.com>
References: <20220209230452.19535-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Aidan,

Le mer., févr. 9 2022 at 23:04:54 +0000, Aidan MacDonald 
<aidanmacdonald.0x0@gmail.com> a écrit :
> The X series Ingenic SoCs have a shadow GPIO group which
> is at a higher offset than the other groups, and is used
> for all GPIO configuration. The regmap did not take this
> offset into account and set max_register too low. Writes
> to the shadow group registers were blocked, which made it
> impossible to change any pin configuration.
> 
> Fix this by pretending there are at least 8 chips on any
> 'X' SoC for the purposes of calculating max_register. This
> ensures the shadow group is accessible.

I don't like your solution, it sounds very hacky. I think it would make 
more sense to use a dedicated x1000_pinctrl_regmap_config that would be 
used for the X1000 SoC. That would also allow you to express that there 
are no registers in the 0x400-0x700 range (through 
regmap_config.wr_table / .rd_table).

Cheers,
-Paul

> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  drivers/pinctrl/pinctrl-ingenic.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c 
> b/drivers/pinctrl/pinctrl-ingenic.c
> index 2712f51eb238..9d2bccda50f1 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -4168,7 +4168,10 @@ static int __init ingenic_pinctrl_probe(struct 
> platform_device *pdev)
>  		return PTR_ERR(base);
> 
>  	regmap_config = ingenic_pinctrl_regmap_config;
> -	regmap_config.max_register = chip_info->num_chips * 
> chip_info->reg_offset;
> +	if (chip_info->version >= ID_X1000)
> +		regmap_config.max_register = MIN(8, chip_info->num_chips) * 
> chip_info->reg_offset;
> +	else
> +		regmap_config.max_register = chip_info->num_chips * 
> chip_info->reg_offset;
> 
>  	jzpc->map = devm_regmap_init_mmio(dev, base, &regmap_config);
>  	if (IS_ERR(jzpc->map)) {
> --
> 2.34.1
> 


