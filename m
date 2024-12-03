Return-Path: <linux-gpio+bounces-13465-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB59B9E2B22
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 19:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1E451681D4
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2024 18:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9333B1FCFEF;
	Tue,  3 Dec 2024 18:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="y/A7YskV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448511FAC3B;
	Tue,  3 Dec 2024 18:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733251292; cv=none; b=PoWklZMxIABwDdWs7J1TFAS4LZ5xWNLjCgdNGQzLoFzTqmkNwo8vxC3V4DWx4bzmhWWOK9fyayvmhfPK0wzgBb3Wsebq4YRVzYkTjTgPBYIJk4zLSG9DBRfvqacA9OL5l4RZg7EFXoJgsTF0Oh6OYuJt4KSFiM5oRZ9kvoc6DXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733251292; c=relaxed/simple;
	bh=YsjRE7wvyjqMwPSiTn0mscIqqcQ+U4iXrqp5QXGCKhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZuZInQL5u9rLAIiAG6KsOmrxCgCG0WY93imvMiJxnSJg1Tv3PnyzUiYBxX5vUo3gaoogCJgypMiROCmtvDtlBNvl3ZUl4xQlozygtf1FTqTE4iPIhTp6dwfPvs+3jzNSKDHowVkBn3Wy0xhdinOqGCHtrNP+ir6/U2UWJo7aZu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=y/A7YskV; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B3IfKAE1671115
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Dec 2024 12:41:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733251280;
	bh=uXMQo+WuYsPXB2NUy2rccm7kUrI60/qRRVIxHaj3za4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=y/A7YskVSqHZxUkwEHfW11qqVDVj+sVesbGLOC02V4sPGrz/PrQDAUNPNxrvjXC8Y
	 2PXD9uYOXlfaSwuUhN95qgk/RRFR9w0oLqgj4BzHgi+tKtbnf6y2WAEXktKB0lqh0G
	 rAggryd4q+kP1zx0nBrYMaeWf3rPsDzUYoq4vhgk=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B3IfKCv015504
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Dec 2024 12:41:20 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Dec 2024 12:41:19 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Dec 2024 12:41:19 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B3IfJgF038695;
	Tue, 3 Dec 2024 12:41:19 -0600
Message-ID: <213de4bc-3706-4bb0-a827-06c63bfe0294@ti.com>
Date: Tue, 3 Dec 2024 12:41:19 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] gpio: omap: allow building the module with
 COMPILE_TEST=y
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Alexander Sverdlin <alexander.sverdlin@siemens.com>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
References: <20241203164143.29852-1-brgl@bgdev.pl>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20241203164143.29852-1-brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 12/3/24 10:41 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> For better build coverage, allow building the gpio-omap driver with
> COMPILE_TEST Kconfig option enabled.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/gpio/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 56fee58e281e7..fb923ccd79028 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -530,7 +530,7 @@ config GPIO_OCTEON
>   config GPIO_OMAP
>   	tristate "TI OMAP GPIO support" if ARCH_OMAP2PLUS || COMPILE_TEST
>   	default y if ARCH_OMAP
> -	depends on ARM
> +	depends on ARM || COMPILE_TEST

Why do we have this depends on ARM at all? It already has that condition
above on ARCH_OMAP2PLUS which limits to ARM outside of compile testing.

And anything that selects ARCH_OMAP2PLUS also selects ARCH_OMAP, so we
could just do this:

--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -528,9 +528,9 @@ config GPIO_OCTEON
           family of SOCs.
  
  config GPIO_OMAP
-       tristate "TI OMAP GPIO support" if ARCH_OMAP2PLUS || COMPILE_TEST
-       default y if ARCH_OMAP
-       depends on ARM
+       tristate "TI OMAP GPIO support"
+       default y
+       depends on ARCH_OMAP2PLUS || COMPILE_TEST
         select GENERIC_IRQ_CHIP
         select GPIOLIB_IRQCHIP
         help

Andrew

>   	select GENERIC_IRQ_CHIP
>   	select GPIOLIB_IRQCHIP
>   	help

