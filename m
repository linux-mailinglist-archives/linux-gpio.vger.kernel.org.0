Return-Path: <linux-gpio+bounces-6418-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2048C8105
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 08:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FC66280A08
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 06:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5187714A8D;
	Fri, 17 May 2024 06:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="tMmyJ/dM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D86134A6;
	Fri, 17 May 2024 06:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715928313; cv=none; b=QxeDOVLQUvmebinNSVCBDr4L7vYNjG2WseJRCPo9d2FDHgk9fsceqn4w+A19oGPzq5GeMxbBUCA3WRw0TXkC5YHoxoUwJpdxOh55h1Nn+e+2KxvMAB1b5kcfK3Q4zY/QIBoOFbLkuyvkZf9GhCdfh472J1Ly2NSzt7qrgKPbT0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715928313; c=relaxed/simple;
	bh=2d8ySRlSXwbmMwAUg60FXtHZ9wSpOywMHJPzjAcqCyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qwfcRLoQHYOUXCm14h/Snun7+MoY2JYDbzxmeU86B//PjV0tNYa0LNdV9Y546rpObpLl8Rw/PEQ3sCCR39QvODscVt7d3qXP+0hK5GZTdk3L1hDJrpPWPqnJ3COBRcHmQoMB1fgT1eBXxQheMGKxTgHYylxebxjHko23GmI9y0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=tMmyJ/dM; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44H0KKJs005405;
	Fri, 17 May 2024 08:45:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=z/uK7yf6eIe+jSuaXNY0ImTzPYAvaGtkUIkCxsmH9qM=; b=tM
	myJ/dMGKQ2x/4Ia33JfzZHcbgnx7LWrzROgMgfHhzPWq0PRz9OjTTociU4rQ6I5R
	IYFzIFLY0ReOsUeTwx91iz945oEF7HmCnXypJxQbRi3+yIQ+10AwkrblW/lieGiG
	65WmOoAnpKxBY/y2iy7RqLElDrZOTGjUwgSsM2gVxnZyEqUNzyno7y/GRQZZjFEV
	OSxYVDjB6Y2pyBD6b+pV2aLeUDSz9GEULXeSjZOMbAB/C/K1yx0SCrI3zfofnHJ6
	AZOrbjQ26YwAEE/E5uByqagJzdtxukCnzwMGt6xODMYg2i6T+bOOvR/RP2gycvfH
	b3ijlVxPrqbcbkxrKm6w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y4symgb72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 08:45:06 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B49C64002D;
	Fri, 17 May 2024 08:44:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 871E621058D;
	Fri, 17 May 2024 08:44:26 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 17 May
 2024 08:44:23 +0200
Message-ID: <e2b89d34-0222-42a1-98ae-c417220f9b39@foss.st.com>
Date: Fri, 17 May 2024 08:44:23 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/20] pinctrl: st: Use scope based of_node_put()
 cleanups
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Emil Renner Berthing
	<kernel@esmil.dk>,
        Jianlong Huang <jianlong.huang@starfivetech.com>,
        Hal Feng
	<hal.feng@starfivetech.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
	<baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Viresh
 Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>, <soc@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki
	<s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Geert
 Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>, Damien Le Moal <dlemoal@kernel.org>,
        Ludovic Desroches
	<ludovic.desroches@microchip.com>,
        Nicolas Ferre
	<nicolas.ferre@microchip.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
        Jacky Bai <ping.bai@nxp.com>,
        Pengutronix
 Kernel Team <kernel@pengutronix.de>,
        Chester Lin <chester62515@gmail.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Ghennadi Procopciuc
	<ghennadi.procopciuc@oss.nxp.com>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias
 Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Sascha Hauer
	<s.hauer@pengutronix.de>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Joel
 Stanley <joel@jms.id.au>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Tony
 Lindgren <tony@atomide.com>,
        Stephen Warren <swarren@wwwdotorg.org>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <imx@lists.linux.dev>,
        <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
        Peng Fan
	<peng.fan@nxp.com>
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-8-26c5f2dc1181@nxp.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-8-26c5f2dc1181@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02



On 5/4/24 15:20, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Use scope based of_node_put() cleanup to simplify code.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/pinctrl-st.c | 37 +++++++++++--------------------------
>  1 file changed, 11 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
> index 5d9abd6547d0..fe2d52e434db 100644
> --- a/drivers/pinctrl/pinctrl-st.c
> +++ b/drivers/pinctrl/pinctrl-st.c
> @@ -1195,10 +1195,10 @@ static int st_pctl_dt_parse_groups(struct device_node *np,
>  	struct property *pp;
>  	struct device *dev = info->dev;
>  	struct st_pinconf *conf;
> -	struct device_node *pins;
> +	struct device_node *pins __free(device_node) = NULL;
>  	phandle bank;
>  	unsigned int offset;
> -	int i = 0, npins = 0, nr_props, ret = 0;
> +	int i = 0, npins = 0, nr_props;
>  
>  	pins = of_get_child_by_name(np, "st,pins");
>  	if (!pins)
> @@ -1213,8 +1213,7 @@ static int st_pctl_dt_parse_groups(struct device_node *np,
>  			npins++;
>  		} else {
>  			pr_warn("Invalid st,pins in %pOFn node\n", np);
> -			ret = -EINVAL;
> -			goto out_put_node;
> +			return -EINVAL;
>  		}
>  	}
>  
> @@ -1223,10 +1222,8 @@ static int st_pctl_dt_parse_groups(struct device_node *np,
>  	grp->pins = devm_kcalloc(dev, npins, sizeof(*grp->pins), GFP_KERNEL);
>  	grp->pin_conf = devm_kcalloc(dev, npins, sizeof(*grp->pin_conf), GFP_KERNEL);
>  
> -	if (!grp->pins || !grp->pin_conf) {
> -		ret = -ENOMEM;
> -		goto out_put_node;
> -	}
> +	if (!grp->pins || !grp->pin_conf)
> +		return -ENOMEM;
>  
>  	/* <bank offset mux direction rt_type rt_delay rt_clk> */
>  	for_each_property_of_node(pins, pp) {
> @@ -1260,17 +1257,13 @@ static int st_pctl_dt_parse_groups(struct device_node *np,
>  		i++;
>  	}
>  
> -out_put_node:
> -	of_node_put(pins);
> -
> -	return ret;
> +	return 0;
>  }
>  
>  static int st_pctl_parse_functions(struct device_node *np,
>  			struct st_pinctrl *info, u32 index, int *grp_index)
>  {
>  	struct device *dev = info->dev;
> -	struct device_node *child;
>  	struct st_pmx_func *func;
>  	struct st_pctl_group *grp;
>  	int ret, i;
> @@ -1285,15 +1278,13 @@ static int st_pctl_parse_functions(struct device_node *np,
>  		return -ENOMEM;
>  
>  	i = 0;
> -	for_each_child_of_node(np, child) {
> +	for_each_child_of_node_scoped(np, child) {
>  		func->groups[i] = child->name;
>  		grp = &info->groups[*grp_index];
>  		*grp_index += 1;
>  		ret = st_pctl_dt_parse_groups(child, grp, info, i++);
> -		if (ret) {
> -			of_node_put(child);
> +		if (ret)
>  			return ret;
> -		}
>  	}
>  	dev_info(dev, "Function[%d\t name:%s,\tgroups:%d]\n", index, func->name, func->ngroups);
>  
> @@ -1601,7 +1592,6 @@ static int st_pctl_probe_dt(struct platform_device *pdev,
>  	int i = 0, j = 0, k = 0, bank;
>  	struct pinctrl_pin_desc *pdesc;
>  	struct device_node *np = dev->of_node;
> -	struct device_node *child;
>  	int grp_index = 0;
>  	int irq = 0;
>  
> @@ -1646,25 +1636,21 @@ static int st_pctl_probe_dt(struct platform_device *pdev,
>  	pctl_desc->pins = pdesc;
>  
>  	bank = 0;
> -	for_each_child_of_node(np, child) {
> +	for_each_child_of_node_scoped(np, child) {
>  		if (of_property_read_bool(child, "gpio-controller")) {
>  			const char *bank_name = NULL;
>  			char **pin_names;
>  
>  			ret = st_gpiolib_register_bank(info, bank, child);
> -			if (ret) {
> -				of_node_put(child);
> +			if (ret)
>  				return ret;
> -			}
>  
>  			k = info->banks[bank].range.pin_base;
>  			bank_name = info->banks[bank].range.name;
>  
>  			pin_names = devm_kasprintf_strarray(dev, bank_name, ST_GPIO_PINS_PER_BANK);
> -			if (IS_ERR(pin_names)) {
> -				of_node_put(child);
> +			if (IS_ERR(pin_names))
>  				return PTR_ERR(pin_names);
> -			}
>  
>  			for (j = 0; j < ST_GPIO_PINS_PER_BANK; j++, k++) {
>  				pdesc->number = k;
> @@ -1678,7 +1664,6 @@ static int st_pctl_probe_dt(struct platform_device *pdev,
>  							i++, &grp_index);
>  			if (ret) {
>  				dev_err(dev, "No functions found.\n");
> -				of_node_put(child);
>  				return ret;
>  			}
>  		}
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

