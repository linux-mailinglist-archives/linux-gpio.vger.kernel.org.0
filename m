Return-Path: <linux-gpio+bounces-26421-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E82F7B8D39F
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Sep 2025 04:39:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A91C1484C64
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Sep 2025 02:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB081F8BD6;
	Sun, 21 Sep 2025 02:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AH7mqy+H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F4D1F3BBB;
	Sun, 21 Sep 2025 02:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758422392; cv=none; b=aQTQ6tqcO86hcnClHxCtEqfDsrPDGpgOGQ7fitMyDJZMu1Gl6qlrsrQDbq8XYfP5XH6RMbvjSIuwL8ePsiGm+eV7zHIvASUJ6bPvtmZ7dZMInBZ78NX/Z77Rwrl7QJwl4k0JaxLnp5FyqWlFXoY93yBVpqgNM9fZjbw9tv60NOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758422392; c=relaxed/simple;
	bh=uc1KX+cVmv+/7e4DU2Xpwh2GQ8SrMs+GVn0BJDIqaSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzR98TnswQNTDfXZk1WxJNTMyYF7zK3z6hpli+3/rgWMCGqY1pDnVzdRCmWdy/0fGc1wJMtzRQBf0wMls+GTp+jIOpU1BW40lBlmuCmglWUui2rTqkd65DWxbzztD/4fo5Ew7kkPyTPuzhyIc1rPun/aJpyXVVeRDJiqU5KR1UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AH7mqy+H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E56DC4CEEB;
	Sun, 21 Sep 2025 02:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758422392;
	bh=uc1KX+cVmv+/7e4DU2Xpwh2GQ8SrMs+GVn0BJDIqaSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AH7mqy+Hitk41NDuErDTuoS+RamEUpOAavap8DHjj5OrxYM7rRJjCING4NKw9/eVR
	 cyPilEshP+YgwX2wFqkFStj053NMxIPjGPcqzc5in/NSBTslMr6SHNRmvnuLQGjvOl
	 8/sbkXtGMWNesE9il/zh3owaUEQxKVLkuX2bFMDUUXtQtDefAl0XuLx9wTfF0NwuWQ
	 WngGdYQHHNi90pN3x7jR62PuKQtqG5oftlMk/IW6wheFjxUoEf8LieVjIdRS7a0Ls+
	 oJeK+cP+AfJsSlONdl/VFxZVmzoOkoHS3YqD0DaKjDuksYzZJ+pvAJZQZwxGEBudWS
	 mmQIfY96oAO2Q==
Date: Sat, 20 Sep 2025 21:39:49 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, 
	Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] pinctrl: qcom: spmi-gpio: Add PMCX0102, PMK8850 &
 PMH01XX PMICs support
Message-ID: <7sso6x5tkrnpihczkfxush2jax3hq5q456ftidzbumlbrwzgph@dws6xkfsbwcr>
References: <20250920-glymur-spmi-v8-gpio-driver-v1-0-23df93b7818a@oss.qualcomm.com>
 <20250920-glymur-spmi-v8-gpio-driver-v1-2-23df93b7818a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920-glymur-spmi-v8-gpio-driver-v1-2-23df93b7818a@oss.qualcomm.com>

On Sat, Sep 20, 2025 at 01:30:10AM +0530, Kamal Wadhwa wrote:
> From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> 
> Add support for PMCX0102, PMH0101, PMH0104, PMH0110 and PMK8850 PMIC
> GPIOs with adding appropriate compatible strings.
> 

This patch (and patch 3) doesn't seem to actually have a dependency on
patch 1 in this series, so it would have been better to be send in a
separate series.

I do however believe this patch should have been sent together with
https://lore.kernel.org/all/20250919141440.1068770-1-pankaj.patil@oss.qualcomm.com/ 

Regards,
Bjorn

> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index 485b68cc93f8edac07c15aad50ff5c9c7894d8bc..c4f7d2d7a017684cd9c0d0850cb8d998668b543e 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -1239,7 +1239,11 @@ static const struct of_device_id pmic_gpio_of_match[] = {
>  	{ .compatible = "qcom,pm8998-gpio", .data = (void *) 26 },
>  	{ .compatible = "qcom,pma8084-gpio", .data = (void *) 22 },
>  	{ .compatible = "qcom,pmc8380-gpio", .data = (void *) 10 },
> +	{ .compatible = "qcom,pmcx0102-gpio", .data = (void *)14 },
>  	{ .compatible = "qcom,pmd8028-gpio", .data = (void *) 4 },
> +	{ .compatible = "qcom,pmh0101-gpio", .data = (void *)18 },
> +	{ .compatible = "qcom,pmh0104-gpio", .data = (void *)8 },
> +	{ .compatible = "qcom,pmh0110-gpio", .data = (void *)14 },
>  	{ .compatible = "qcom,pmi632-gpio", .data = (void *) 8 },
>  	{ .compatible = "qcom,pmi8950-gpio", .data = (void *) 2 },
>  	{ .compatible = "qcom,pmi8994-gpio", .data = (void *) 10 },
> @@ -1248,6 +1252,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
>  	{ .compatible = "qcom,pmiv0104-gpio", .data = (void *) 10 },
>  	{ .compatible = "qcom,pmk8350-gpio", .data = (void *) 4 },
>  	{ .compatible = "qcom,pmk8550-gpio", .data = (void *) 6 },
> +	{ .compatible = "qcom,pmk8850-gpio", .data = (void *)8 },
>  	{ .compatible = "qcom,pmm8155au-gpio", .data = (void *) 10 },
>  	{ .compatible = "qcom,pmm8654au-gpio", .data = (void *) 12 },
>  	/* pmp8074 has 12 GPIOs with holes on 1 and 12 */
> 
> -- 
> 2.25.1
> 

