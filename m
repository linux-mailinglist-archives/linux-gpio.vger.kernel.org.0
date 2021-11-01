Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ABD144157A
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Nov 2021 09:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbhKAInC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Nov 2021 04:43:02 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:55562 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbhKAInC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Nov 2021 04:43:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1635756029; x=1667292029;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yjGMneWMb2f2E3T9+bukDdyt/pi9YaqXYViNWsE36vI=;
  b=BjTqiqN38B5srZxqi28UUQBoq96ouLougP6yQXJJlGaUMddopy+DHZQu
   qYbWaGwkTQlhMiOkNKnm0APTnlLhAstB3M2kSULhtKOA2eSJulrjhhoGF
   /iIY5U9By2kECfVL/YqHpyqBhBi0SJRoJHawGt7rhnS4T3F+S+pc9JB5U
   IZ99pvYMG7nLvSLDdpKeuKV1frsUeqcS3U9vt2SCHew7Yq9Y91F/Rxvao
   JAzXK/gSH03Oez2T9CLFiX+GKeridVEv+RgLMCgzxO5s1kz8/vgZcWEhh
   Zwv5i4WdnksW8faauJU/zglIoCL9z0iBVNBer5vJxiloEBubY3zqyb63b
   Q==;
IronPort-SDR: G/GDa1JeVnm17n+ACytQIPfYq2hWkm97J8AfrfxdGLpErMIzMSdTBrUhb1faDIbjLFs40g0DPD
 tX+WYCzHKtDzEc5FJD+EXaaVaelR1qQVQI3gSY17UwLxFTKKiGgupp1sigyW2acDjGOV07eJK1
 oaSuFfezvnw3/MzE2W8OSA7XG18JQH36IKbD0/8xBtcF3qZyJGvZ9nJUwsSplTts5Y6lJ0SMvK
 /jaAf3K20D8EkyVLIVILF9yzkdCIQfUn/cm77zafI4OauA9XuXUUjD6f0Jla9NCVATAMphkT1S
 +wsoRgtisTbDT3hGfaSsgxve
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; 
   d="scan'208";a="137563529"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Nov 2021 01:40:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 1 Nov 2021 01:40:28 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 1 Nov 2021 01:40:28 -0700
Date:   Mon, 1 Nov 2021 09:42:13 +0100
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
CC:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <UNGLinuxDriver@microchip.com>
Subject: Re: [PATCH v2 2/2] pinctrl: ocelot: Extend support for lan966x
Message-ID: <20211101084213.r5fgmkscyemjfdcj@soft-dev3-1.localhost>
References: <20211101064630.32243-1-kavyasree.kotagiri@microchip.com>
 <20211101064630.32243-3-kavyasree.kotagiri@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20211101064630.32243-3-kavyasree.kotagiri@microchip.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Kavya,

The 11/01/2021 12:16, Kavyasree Kotagiri wrote:
> This patch extends pinctrl-ocelot driver to support also the
> lan966x. Register layout is same as ocelot. It has 78 GPIOs.
> Requires 3 registers ALT0, ALT1, ALT2 to configure ALT mode.
> 
> Signed-off-by: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
> ---
>  drivers/pinctrl/pinctrl-ocelot.c | 416 +++++++++++++++++++++++++++++++
>  1 file changed, 416 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
> index 0a36ec8775a3..751eb38f93da 100644
> --- a/drivers/pinctrl/pinctrl-ocelot.c
> +++ b/drivers/pinctrl/pinctrl-ocelot.c
> @@ -57,16 +57,71 @@ enum {
>  #define OCELOT_FUNC_PER_PIN	4
>  
> +	LAN966X_PIN(68),
> +	LAN966X_PIN(69),
> +	LAN966X_PIN(70),
> +	LAN966X_PIN(71),
> +	LAN966X_PIN(72),
> +	LAN966X_PIN(73),
> +	LAN966X_PIN(74),
> +	LAN966X_PIN(75),
> +	LAN966X_PIN(76),
> +	LAN966X_PIN(77),
> +};
> +
> +

Here is an extra new line.

>  static int ocelot_get_functions_count(struct pinctrl_dev *pctldev)
>  {
>  	return ARRAY_SIZE(ocelot_function_names);
> @@ -709,6 +1056,9 @@ static int ocelot_pin_function_idx(struct ocelot_pinctrl *info,
>  	for (i = 0; i < OCELOT_FUNC_PER_PIN; i++) {
>  		if (function == p->functions[i])
>  			return i;
> +
> +		if (function == p->a_functions[i])
> +			return i + OCELOT_FUNC_PER_PIN;
>  	}
>  
>  	return -1;
> @@ -744,6 +1094,36 @@ static int ocelot_pinmux_set_mux(struct pinctrl_dev *pctldev,
>  	return 0;
>  }
>  

> +
>  static int ocelot_pctl_get_groups_count(struct pinctrl_dev *pctldev)
>  {
>  	struct ocelot_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
> @@ -1074,6 +1480,14 @@ static struct pinctrl_desc sparx5_desc = {
>  	.npins = ARRAY_SIZE(sparx5_pins),
>  	.pctlops = &ocelot_pctl_ops,
>  	.pmxops = &ocelot_pmx_ops,
> +};
> +
> +static struct pinctrl_desc lan966x_desc = {
> +	.name = "lan966x-pinctrl",
> +	.pins = lan966x_pins,
> +	.npins = ARRAY_SIZE(lan966x_pins),
> +	.pctlops = &ocelot_pctl_ops,
> +	.pmxops = &lan966x_pmx_ops,

This change removes .confops and .owner from sparx5 which is a mistake.

>  	.confops = &ocelot_confops,
>  	.owner = THIS_MODULE,
>  };
> @@ -1114,6 +1528,7 @@ static int ocelot_create_group_func_map(struct device *dev,
>  	return 0;
>  }
>  
> +

Here is an extra new line.

>  static int ocelot_pinctrl_register(struct platform_device *pdev,
>  				   struct ocelot_pinctrl *info)
>  {
> @@ -1337,6 +1752,7 @@ static const struct of_device_id ocelot_pinctrl_of_match[] = {
>  	{ .compatible = "mscc,ocelot-pinctrl", .data = &ocelot_desc },
>  	{ .compatible = "mscc,jaguar2-pinctrl", .data = &jaguar2_desc },
>  	{ .compatible = "microchip,sparx5-pinctrl", .data = &sparx5_desc },
> +	{ .compatible = "microchip,lan966x-pinctrl", .data = &lan966x_desc },
>  	{},
>  };
>  
> -- 
> 2.17.1
> 

-- 
/Horatiu
