Return-Path: <linux-gpio+bounces-30150-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAF6CF465C
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 16:29:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40DD031C5B9F
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 15:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE6B3064A9;
	Mon,  5 Jan 2026 14:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkaRQ07f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CD33016EB;
	Mon,  5 Jan 2026 14:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767624994; cv=none; b=Z0RXWuZ7aOLPA2qdYDa46P0lZE7O6H9pvbfs+zB3zV4/mOWRVoBBajKpYfH5MjiuQVxGyHLOYudjaRXBCMeNJ0nTIIS5PE9saU5hEVs0sjF9aKd5Uy1NlCOmeUS7mC9OqG2bcJU1eiZAX1E1DWqX+rRlTJvmGXPYzqVA19sp2Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767624994; c=relaxed/simple;
	bh=2BfDcpqJ/H9SOI7FW+MjuhvvMHwLETfCqFX68OCsWV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qROr1o+p62URmzCf8MLSz5ZE9B+3IE+hp1hMC09FoiBlBc7zYThoj+jih3xV6Zx0RQEwFrZzHAtAry3nPEXuZ5XiUcGwf5OssiTea95IHcx3OU1aFFHPZu0QpoIwKsrI28qCr9pawXlk6+Rq4KTv3UyxYZnpOcI/cximJ4r/IOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UkaRQ07f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C7FC116D0;
	Mon,  5 Jan 2026 14:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767624993;
	bh=2BfDcpqJ/H9SOI7FW+MjuhvvMHwLETfCqFX68OCsWV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UkaRQ07fU9QAhiN83QY0Ls8YP62EPS3/IQ0f/dZEtDAF9eCxskeevrTRA0ClYmrcP
	 70LpLJ1AvypfS3+ruIHeEFXdUzW3wcqBmzd5/0u7OW0Szn3AYovNQmdM1eNTP5CDTy
	 NLo4rxyvo9UXUo+OjExRc8MT1bOQhF5dxyGXQgwcMU24NWAHwvipJN2GtXoip22ZbS
	 Gy83R7FHRfunbsfZJj8/9jx923YvDgCxAQyDtEH5r2/RIsW8vUF4HveneRcfprn62l
	 cfopLqF5SDtSr+a1yfGkPdbyFV8BiPCmxsclfD2SRFol/cMyTGoQkGAUmRVFEh8Ph7
	 E1IwM0w6Tw/lg==
Date: Mon, 5 Jan 2026 08:56:30 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: glymur: Add Mahua TLMM support
Message-ID: <m2jqzihinv6j3gfjfgapfgppj3bdzclpqfpahfwprs5dcbnhwm@vfprlhe4uvhb>
References: <20260105-pinctrl-qcom-mahua-tlmm-v2-0-7ac036f700de@oss.qualcomm.com>
 <20260105-pinctrl-qcom-mahua-tlmm-v2-2-7ac036f700de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-pinctrl-qcom-mahua-tlmm-v2-2-7ac036f700de@oss.qualcomm.com>

On Mon, Jan 05, 2026 at 05:21:11AM -0800, Gopikrishna Garmidi wrote:
> Add Mahua-specific compatible and wakeirq map
> Add mahua tlmm soc data

I'm sorry, but saying "Add Mahua" three times doesn't tell me why this
patch exists.

Looking at the patch I'm guessing that the PDC map is different and we
therefor need this patch, but the reader of the git log shouldn't have
to guess.

Please fix it with something like:

"""
Mahua TLMM block is identical to Glymur, but the PDC map differs in X,
Y, Z.

Add the Mahua-specific PDC map to the Glymur TLMM driver.
"""

> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-glymur.c | 43 ++++++++++++++++++++++++++++++++---
>  1 file changed, 40 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
> index 335005084b6b..0f47e75db7b4 100644
> --- a/drivers/pinctrl/qcom/pinctrl-glymur.c
> +++ b/drivers/pinctrl/qcom/pinctrl-glymur.c
> @@ -1729,6 +1729,25 @@ static const struct msm_gpio_wakeirq_map glymur_pdc_map[] = {
>  	{ 232, 206 }, { 234, 172 }, { 235, 173 }, { 242, 158 }, { 244, 156 },
>  };
>  
> +static const struct msm_gpio_wakeirq_map mahua_pdc_map[] = {
> +	{ 0, 116 },   { 2, 114 },   { 3, 115 },	  { 4, 175 },	{ 5, 176 },
> +	{ 7, 111 },   { 11, 129 },  { 13, 130 },  { 15, 112 },	{ 19, 113 },
> +	{ 23, 187 },  { 27, 188 },  { 28, 121 },  { 29, 122 },	{ 30, 136 },
> +	{ 31, 203 },  { 32, 189 },  { 34, 174 },  { 35, 190 },	{ 36, 191 },
> +	{ 39, 124 },  { 43, 192 },  { 47, 193 },  { 51, 123 },	{ 53, 133 },
> +	{ 55, 125 },  { 59, 131 },  { 64, 134 },  { 65, 150 },	{ 66, 186 },
> +	{ 67, 132 },  { 68, 195 },  { 71, 135 },  { 75, 196 },	{ 79, 197 },
> +	{ 83, 198 },  { 84, 181 },  { 85, 199 },  { 87, 200 },	{ 91, 201 },
> +	{ 92, 182 },  { 93, 183 },  { 94, 184 },  { 95, 185 },	{ 98, 202 },
> +	{ 105, 157 }, { 113, 128 }, { 121, 117 }, { 123, 118 }, { 125, 119 },
> +	{ 129, 120 }, { 131, 126 }, { 132, 160 }, { 133, 194 }, { 134, 127 },
> +	{ 141, 137 }, { 144, 138 }, { 145, 139 }, { 147, 140 }, { 148, 141 },
> +	{ 150, 146 }, { 151, 147 }, { 153, 148 }, { 154, 144 }, { 156, 149 },
> +	{ 157, 151 }, { 163, 142 }, { 172, 143 }, { 181, 145 }, { 193, 161 },
> +	{ 196, 152 }, { 203, 177 }, { 208, 178 }, { 215, 162 }, { 217, 153 },
> +	{ 220, 154 }, { 221, 155 }, { 228, 179 }, { 230, 180 }, { 232, 206 },
> +	{ 234, 172 }, { 235, 173 }, { 242, 158 }, { 244, 156 },
> +};

Do you see how there's a single newline between glymur_pdc_map[] and
glymur_tlmm today? Please follow that style.

>  static const struct msm_pinctrl_soc_data glymur_tlmm = {
>  	.pins = glymur_pins,
>  	.npins = ARRAY_SIZE(glymur_pins),
> @@ -1742,14 +1761,32 @@ static const struct msm_pinctrl_soc_data glymur_tlmm = {
>  	.egpio_func = 11,
>  };
>  
> +static const struct msm_pinctrl_soc_data mahua_tlmm = {
> +	.pins = glymur_pins,
> +	.npins = ARRAY_SIZE(glymur_pins),
> +	.functions = glymur_functions,
> +	.nfunctions = ARRAY_SIZE(glymur_functions),
> +	.groups = glymur_groups,
> +	.ngroups = ARRAY_SIZE(glymur_groups),
> +	.ngpios = 251,
> +	.wakeirq_map = mahua_pdc_map,
> +	.nwakeirq_map = ARRAY_SIZE(mahua_pdc_map),
> +	.egpio_func = 11,
> +};

Here as well.

Regards,
Bjorn

>  static const struct of_device_id glymur_tlmm_of_match[] = {
> -	{ .compatible = "qcom,glymur-tlmm", },
> -	{ }
> +	{ .compatible = "qcom,glymur-tlmm", .data = &glymur_tlmm },
> +	{ .compatible = "qcom,mahua-tlmm", .data = &mahua_tlmm },
> +	{ },
>  };
>  
>  static int glymur_tlmm_probe(struct platform_device *pdev)
>  {
> -	return msm_pinctrl_probe(pdev, &glymur_tlmm);
> +	const struct msm_pinctrl_soc_data *data;
> +
> +	data = of_device_get_match_data(&pdev->dev);
> +	if (!data)
> +		return -ENODEV;
> +	return msm_pinctrl_probe(pdev, data);
>  }
>  
>  static struct platform_driver glymur_tlmm_driver = {
> 
> -- 
> 2.34.1
> 

