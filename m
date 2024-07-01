Return-Path: <linux-gpio+bounces-7857-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C25DF91E003
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 14:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60BA1B210C6
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 12:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6325B15A869;
	Mon,  1 Jul 2024 12:56:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BD515A85E;
	Mon,  1 Jul 2024 12:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719838619; cv=none; b=YyVa8JLSJ7hTd29WyaLYpVY4IVklPZpXOw6nVgbJD/qggNOaH83pKIUNc+OcV4THQxC6NuD0f4e9bh1dxzhR1jrTR74J/AB47ow+WlsTJ71r8od7SGAvkpzwnqAxOdvv0NlBXPB88xfdDcqUpmRfUrFgQH6u3BQ65gtZ89C64qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719838619; c=relaxed/simple;
	bh=+MksbpmNZkTOuDD7N1ZxQe+dsTMy5M+OjKLmGmGIUsA=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ui6IU4NtV011gWA/iC1lmpCyeFFkkhIXso2COY7TsPOd66BSuTdSunrq6tF/Jq18Fd/KPoMGDz8LtuU/clzbOyZffV7wmRkbQj9EsStWJcntOQl6Q0yGlg8/+worbIp4R1BGTiDY+BtetaxGkwFhP5mXHWeT/7sfrPLdHKphIPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WCQyN1y87z6K5vp;
	Mon,  1 Jul 2024 20:55:56 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 9B624140B33;
	Mon,  1 Jul 2024 20:56:53 +0800 (CST)
Received: from localhost (10.203.174.77) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 1 Jul
 2024 13:56:53 +0100
Date: Mon, 1 Jul 2024 13:56:51 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: <linus.walleij@linaro.org>, <dan.carpenter@linaro.org>,
	<linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <aisheng.dong@nxp.com>, <festevam@gmail.com>,
	<shawnguo@kernel.org>, <kernel@pengutronix.de>,
	<u.kleine-koenig@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V3 2/3] pinctrl: equilibrium: Use scope based
 of_node_put() cleanups
Message-ID: <20240701135651.0000768a@Huawei.com>
In-Reply-To: <20240627131721.678727-3-peng.fan@oss.nxp.com>
References: <20240627131721.678727-1-peng.fan@oss.nxp.com>
	<20240627131721.678727-3-peng.fan@oss.nxp.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Thu, 27 Jun 2024 21:17:20 +0800
"Peng Fan (OSS)" <peng.fan@oss.nxp.com> wrote:

> From: Peng Fan <peng.fan@nxp.com>
> 
> Use scope based of_node_put() cleanup to simplify code.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/pinctrl-equilibrium.c | 21 +++++----------------
>  1 file changed, 5 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
> index a6d089eaaae5..3a9a0f059090 100644
> --- a/drivers/pinctrl/pinctrl-equilibrium.c
> +++ b/drivers/pinctrl/pinctrl-equilibrium.c
> @@ -588,7 +588,6 @@ static int funcs_utils(struct device *dev, struct pinfunction *funcs,
>  		       unsigned int *nr_funcs, funcs_util_ops op)
>  {
>  	struct device_node *node = dev->of_node;
> -	struct device_node *np;
>  	struct property *prop;
>  	const char *fn_name;
>  	const char **groups;
> @@ -596,7 +595,7 @@ static int funcs_utils(struct device *dev, struct pinfunction *funcs,
>  	int i, j;
>  
>  	i = 0;
> -	for_each_child_of_node(node, np) {
> +	for_each_child_of_node_scoped(node, np) {
>  		prop = of_find_property(np, "groups", NULL);
>  		if (!prop)
>  			continue;
> @@ -635,7 +634,6 @@ static int funcs_utils(struct device *dev, struct pinfunction *funcs,
>  			break;
>  
>  		default:
> -			of_node_put(np);
>  			return -EINVAL;
>  		}
>  		i++;
> @@ -708,11 +706,10 @@ static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
>  	struct device_node *node = dev->of_node;
>  	unsigned int *pins, *pinmux, pin_id, pinmux_id;
>  	struct pingroup group, *grp = &group;
> -	struct device_node *np;
>  	struct property *prop;
>  	int j, err;
>  
> -	for_each_child_of_node(node, np) {
> +	for_each_child_of_node_scoped(node, np) {
>  		prop = of_find_property(np, "groups", NULL);
>  		if (!prop)
>  			continue;
> @@ -720,42 +717,35 @@ static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
>  		err = of_property_count_u32_elems(np, "pins");
>  		if (err < 0) {
>  			dev_err(dev, "No pins in the group: %s\n", prop->name);
> -			of_node_put(np);
Given I think this is only called from probe, return dev_err_probe() works
nicely here as well.

>  			return err;
>  		}
Either way,
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

