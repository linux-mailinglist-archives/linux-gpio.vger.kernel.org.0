Return-Path: <linux-gpio+bounces-19047-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D06BA92E26
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Apr 2025 01:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A544919E2CFD
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 23:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76FC221F0B;
	Thu, 17 Apr 2025 23:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kqsrSOiO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915CB204F8D
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 23:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744931938; cv=none; b=S4yHW0ADkv0Q/ofx8y9ok+Pb7CQKmwdv56HD/NR83uUCg9seTA/tEbvig4dIaabG/cWs8yqZNiwV/bstCiuxL/U+JvzvWWzYrP6UhySLmd4s4hhnOqS7u5MyMm5fMFt5ekc7k/seKTPH2nrZ8uCsbVPzRB5k0/W/0hEhkazDvZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744931938; c=relaxed/simple;
	bh=xNpdN58KqfLs1bBu8Zm8cetTpvvDUBtlJlLnVrT2i5E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=b4NciwfmGIqox2tFVy+HsU2MGh+0Mj8ryudRzpuEg9YYXzjWH/T7zYbuUwB96O1ieWXRKuCS1m6YJgZptOgkrQ8lfSL71vMNZELybi4D6qAe2PejGrnkQ3nI3v5n97mG3MpBKoMrTL0P0+yiQfINODRcXuHrdnbkfSHUNEcV8Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kqsrSOiO; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=wgYpqekx1jL/h4ptlYtzKKct8rV5vKCPe514bQlZANQ=; b=kqsrSOiOMksVWa1YqEFfwSOpHx
	sgP8DrOTshU0kzrMckwLyNe7w/XJnfME/OBIVYWZeKCHppFeJ1RkoYTfnEk0EvBpokYB3Iq6lkbdh
	IH2v3JP4tllnJ/I+qo6ymole+daVHu1T9UJAwJesR+Gs7TZmuilyPEq/4w9+JgtjKITlvzVf2pJzR
	PrtWY1U9BudhuMD5wMzO/H66/4krAUMHQzueMGcv7cFRP4WGA0tZ/gi+HAwXhDex1uFpNLE+1HgrZ
	z9mjS3E/pDronkR08OFTw2hdKydnr5Ig8f0+1QCgNlrp4qR2s/9BF8tFNnJjk3pzlVKd81eU2M5SM
	ZnU3L7MA==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YV6-0000000Bonb-0jEG;
	Thu, 17 Apr 2025 23:18:33 +0000
Message-ID: <da34a013-cb08-4d7a-865a-221f2664e6cf@infradead.org>
Date: Thu, 17 Apr 2025 16:18:28 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] pinctr: nomadik: abx500: Restrict compile test
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-gpio@vger.kernel.org
References: <20250417-abx500-pinctrl-v1-1-0691ad29e2a6@linaro.org>
Content-Language: en-US
In-Reply-To: <20250417-abx500-pinctrl-v1-1-0691ad29e2a6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/16/25 10:22 PM, Linus Walleij wrote:
> The ABX500 module depends hard on AB8500_CORE it cannot
> be compile-tested in isolation.
> 
> Fixes: 720abc5c58d8 ("pinctrl: abx500: enable building modules with COMPILE_TEST=y")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/pinctrl/nomadik/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/nomadik/Kconfig b/drivers/pinctrl/nomadik/Kconfig
> index 2c1f8a4f5d24d116da50b7fc29f8db628170efe0..1b4fe2a4c30283b8f9914b0a71275694d46aca36 100644
> --- a/drivers/pinctrl/nomadik/Kconfig
> +++ b/drivers/pinctrl/nomadik/Kconfig
> @@ -3,7 +3,7 @@ if (ARCH_U8500 || COMPILE_TEST)
>  
>  config PINCTRL_ABX500
>  	bool "ST-Ericsson ABx500 family Mixed Signal Circuit gpio functions"
> -	depends on AB8500_CORE || COMPILE_TEST
> +	depends on AB8500_CORE
>  	select GENERIC_PINCONF
>  	help
>  	  Select this to enable the ABx500 family IC GPIO driver
> 
> ---
> base-commit: ccde4ddfe04f3c01e80591f4e0a53ddb9ac7d265
> change-id: 20250417-abx500-pinctrl-29447c4e5a7a
> 
> Best regards,

-- 
~Randy

