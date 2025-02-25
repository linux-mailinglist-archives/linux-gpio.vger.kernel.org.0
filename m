Return-Path: <linux-gpio+bounces-16578-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF4FA44830
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 18:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23B751895F54
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 17:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AAFB1A38F9;
	Tue, 25 Feb 2025 17:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="2oSi2Goj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44B01A2C04;
	Tue, 25 Feb 2025 17:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740504388; cv=none; b=lygbm/Ygj31DobCy3kBwAGpj6t7zL/sotlLRnm/B98Y52ZrReM+42ZjCcItYAhDFvAHjid1UV7hntc8mLpSQ/4UWQDeMphXRd2EyIIUCUz7UL/x2dW/WAPRK3kDp6Y77blzR9inJFjp16sGchjVXMu0lH555t8EHa4Bt/+S/dX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740504388; c=relaxed/simple;
	bh=tAzfBIJDWESxVA6YC88XkcICm6cpNiExrf/JuUHyhbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KRtdcr73jUUSowAltINg2eNC1TIPx9HhcQ/xfJp57sO5Fjj2NiofO7/a2XXYnrBGi1CVMcpjXLs+GE80Z6BsmG2ooTazSplMOLBI3kA5OENBzXzK/ufhGP54IVB/GsOxTfY0IZzrZDYhbfPd4C3GuJnAKiCMMZGeVzKD7Pr1qI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=2oSi2Goj; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PFPIL9001949;
	Tue, 25 Feb 2025 18:26:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Q8I40M+53DR3Tk1rSGwdSEzVyqyWVWvkoMDFoF2R850=; b=2oSi2GojCU5+RwGJ
	Q+uzD70ryBhw0LlAMBITvSRLhKvcumfFP4tndQxCZmvAemA//R1WNnm/f8c6UZvJ
	kkCSGBwdrQ8ymB4zUaNgSyyAjgJquoFfAqP2iCt0Dxf48sPWusZs41rAx/xITrNT
	X89UACnAxkuDiSHLfvQ7gctCcRiAb8YM+kVOVJiW5jodhLXRcjxbWmGKEFoYhPso
	DwbU7TC+dOmE2DiPcvi+KSV8cUR8X9BcZezuwT0ei4A4xUhxglJb2eyMm5/1SC/x
	oG9KAp58UvLQsJ40sfc3/h1X8b2zMKHuL2Ri6pMZseR/X5pE7Nj5pWFGUOTjYh/y
	D3cqsg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512spctmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 18:26:12 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7277740044;
	Tue, 25 Feb 2025 18:25:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F0ED047B9CA;
	Tue, 25 Feb 2025 17:05:15 +0100 (CET)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 17:05:15 +0100
Message-ID: <b074941f-3c6a-4b98-a00e-d22d18280ef5@foss.st.com>
Date: Tue, 25 Feb 2025 17:05:14 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] pinctrl: stm32: Introduce HDP driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
 <20250225-hdp-upstream-v1-3-9d049c65330a@foss.st.com>
 <1990c649-668e-4ae9-82b5-ed9931f41ec4@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <1990c649-668e-4ae9-82b5-ed9931f41ec4@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_05,2025-02-25_03,2024-11-22_01

On 2/25/25 13:59, Krzysztof Kozlowski wrote:
> On 25/02/2025 09:48, Clément Le Goffic wrote:
>> This patch introduce the driver for the Hardware Debug Port available on
> 
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

Ok

> 
>> STM32MP platforms. The HDP allows the observation of internal SoC
>> signals by using multiplexers. Each HDP port can provide up to 16
>> internal signals (one of them can be software controlled as a GPO)
> 
> 
> 
> ....
> 
>> +
>> +static int stm32_hdp_suspend(struct device *dev)
>> +{
>> +	struct stm32_hdp *hdp = dev_get_drvdata(dev);
>> +
>> +	hdp->gposet_conf = readl_relaxed(hdp->base + HDP_GPOSET);
>> +
>> +	pinctrl_pm_select_sleep_state(dev);
>> +
>> +	clk_disable_unprepare(hdp->clk);
>> +
>> +	return 0;
>> +}
>> +
>> +static int stm32_hdp_resume(struct device *dev)
>> +{
>> +	struct stm32_hdp *hdp = dev_get_drvdata(dev);
>> +	int err;
>> +
>> +	err = clk_prepare_enable(hdp->clk);
>> +	if (err)
>> +		return dev_err_probe(hdp->dev, err, "Failed to prepare_enable clk");
> 
> 
> That's wrong, it is not a probe path.

Indeed

> 
>> +
>> +	writel_relaxed(HDP_CTRL_ENABLE, hdp->base + HDP_CTRL);
>> +	writel_relaxed(hdp->gposet_conf, hdp->base + HDP_GPOSET);
>> +	writel_relaxed(hdp->mux_conf, hdp->base + HDP_MUX);
>> +
>> +	pinctrl_pm_select_default_state(dev);
>> +
>> +	return 0;
>> +}
>> +
>> +DEFINE_SIMPLE_DEV_PM_OPS(stm32_hdp_pm_ops, stm32_hdp_suspend, stm32_hdp_resume);
>> +
>> +static struct platform_driver stm32_hdp_driver = {
>> +	.probe = stm32_hdp_probe,
>> +	.remove = stm32_hdp_remove,
>> +	.driver = {
>> +		.name = DRIVER_NAME,
>> +		.pm = pm_sleep_ptr(&stm32_hdp_pm_ops),
>> +		.of_match_table = stm32_hdp_of_match,
>> +	}
>> +};
>> +
>> +module_platform_driver(stm32_hdp_driver);
>> +
>> +MODULE_ALIAS("platform:" DRIVER_NAME);
> 
> 
> You should not need MODULE_ALIAS() in normal cases. If you need it,
> usually it means your device ID table is wrong (e.g. misses either
> entries or MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute
> for incomplete ID table.
> 

Ok

> 
> 
> Best regards,
> Krzysztof

Best regards,

Clément


