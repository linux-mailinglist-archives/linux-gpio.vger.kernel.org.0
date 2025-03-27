Return-Path: <linux-gpio+bounces-18033-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6869A7290D
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 04:23:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55F191782B8
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 03:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D9824B28;
	Thu, 27 Mar 2025 03:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="DuFvsMdR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B8A749C;
	Thu, 27 Mar 2025 03:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045797; cv=none; b=sJRmZsbdKvJ3rK1ZZfaSxbTj2SoBB8qDa/8qWIdWDZ5Zhai7h827Eke5iIfkRkZ2zlRRrtXl5L5Y1o0XCyFrWBtk6gtl8ONN3CL3VymrJmKUVSNdkslhz5SDBqDGp2wOTL/Zzz2lKCPlCVyXY/0IOzMqlfVa58zhXO/PsYau4jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045797; c=relaxed/simple;
	bh=9k6sdiZnq/+Nh2Gz/xA+iWSDA9kiQOLH2z8Rye2NVas=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=pSjfo4VJyDxnm4fpGBseu9aLq9vy8PSk8W87V5Zf2tPYLKZCGFiuyBxKNRLWAlEXAvUPCbZ5llx5cfZ8ZndM+GV117NKEFiV2QqPPLKKjohk94RPqotb7wHZcEp38VotrIRjWUUz2dwYLLj/WiC7jusPnOjRrrN97m7jkgnByhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=DuFvsMdR; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1743045789; h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type;
	bh=9l4aFOxumh1cNwMtHi5adLg5HgiobmrxLoMgmroxvWA=;
	b=DuFvsMdRqWlCHf5v4k2IBza9fx+ZAoU2WuTeDwOBmwry+gr4PKZZ95KY9NHoe/wXjNcvvN6VmZySiGGl742TWpX0L2l/AX96ge0G+yqaZdMN4LoeJTSW7xq+DymRwlH7RUPsXdt7NHh/WbP9ivZ+stHPew0Z+m203ulDyaNf/po=
Received: from 30.178.82.140(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0WT7GFas_1743045788 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 27 Mar 2025 11:23:09 +0800
Message-ID: <fd3e8393-90a2-40e9-b024-f0e976f0eaaf@linux.alibaba.com>
Date: Thu, 27 Mar 2025 11:23:07 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: =?UTF-8?B?TW96aWxsYSBUaHVuZGVyYmlyZCDmtYvor5XniYg=?=
Subject: Re: [PATCH v2] gpio: tegra186: fix resource handling in ACPI probe
 path
From: Guixin Liu <kanie@linux.alibaba.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
 stable@vger.kernel.org
References: <20250327032006.73798-1-kanie@linux.alibaba.com>
In-Reply-To: <20250327032006.73798-1-kanie@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Please igore this one, sorry for the troble.

Best Regards,

Guixin Liu

在 2025/3/27 11:20, Guixin Liu 写道:
> When the Tegra186 GPIO controller is probed through ACPI matching,
> the driver emits two error messages during probing:
>    "tegra186-gpio NVDA0508:00: invalid resource (null)"
>    "tegra186-gpio NVDA0508:00: invalid resource (null)"
>
> Fix this by getting resource first and then do the ioremap.
>
> Fixes: 2606e7c9f5fc ("gpio: tegra186: Add ACPI support")
> Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>
> ---
> Changes from v1 to v2:
> - Add "Fixes" to commit body.
>
>   drivers/gpio/gpio-tegra186.c | 27 ++++++++++++++-------------
>   1 file changed, 14 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index 6895b65c86af..d27bfac6c9f5 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -823,6 +823,7 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>   	struct gpio_irq_chip *irq;
>   	struct tegra_gpio *gpio;
>   	struct device_node *np;
> +	struct resource *res;
>   	char **names;
>   	int err;
>   
> @@ -842,19 +843,19 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>   	gpio->num_banks++;
>   
>   	/* get register apertures */
> -	gpio->secure = devm_platform_ioremap_resource_byname(pdev, "security");
> -	if (IS_ERR(gpio->secure)) {
> -		gpio->secure = devm_platform_ioremap_resource(pdev, 0);
> -		if (IS_ERR(gpio->secure))
> -			return PTR_ERR(gpio->secure);
> -	}
> -
> -	gpio->base = devm_platform_ioremap_resource_byname(pdev, "gpio");
> -	if (IS_ERR(gpio->base)) {
> -		gpio->base = devm_platform_ioremap_resource(pdev, 1);
> -		if (IS_ERR(gpio->base))
> -			return PTR_ERR(gpio->base);
> -	}
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "security");
> +	if (!res)
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	gpio->secure = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(gpio->secure))
> +		return PTR_ERR(gpio->secure);
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "gpio");
> +	if (!res)
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	gpio->base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(gpio->base))
> +		return PTR_ERR(gpio->base);
>   
>   	err = platform_irq_count(pdev);
>   	if (err < 0)

