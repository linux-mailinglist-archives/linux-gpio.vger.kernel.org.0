Return-Path: <linux-gpio+bounces-9049-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAB995CBC1
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 13:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E304B232E7
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 11:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD47181B88;
	Fri, 23 Aug 2024 11:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="XZ5NWY1N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m1973184.qiye.163.com (mail-m1973184.qiye.163.com [220.197.31.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D504315382E;
	Fri, 23 Aug 2024 11:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724414078; cv=none; b=HLZuz1koCFATsT7Cw7NisGI+xtGlxSLz+2suvV2WN1lA6BS9FXEvMw9RLjfdSWfMXfm70x41RZUc8rNG13Et4VtagUsoXDrMM24mLrUk6RmMCuJB0O2PTUCBxKobetw5XkQapH9fFEfyeenT4ehltR94hSOoAv+ZJGOCArlh5HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724414078; c=relaxed/simple;
	bh=xhhjgR4b3ryvNw4XR755idnVzCGr444FojZgMD43hl4=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nPil1jXlaKzi8FxkeWK9sAPGprruVVFzfSocQccWwUm1b3qwRKIGp3LE+GjyyLZYCVA1Znu6sVr7Zy/jxsKxG5lqf5km0QHoTRARvqkCg15hBvYiIxP49YNsrgtq6bS9r+W50s7GVNhHldynd6+SNe4i3rIf7/rGVnPiyKgMcOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=XZ5NWY1N; arc=none smtp.client-ip=220.197.31.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=XZ5NWY1NksoUqasmCIPKLAaYvmbpjTYCxXe4ZmXyCSVl5hQylYW3+3gGwzEHYcI3ztXrj/X24KuLn7iGI6ak/1PoEJEHTG0Lh/ef/V+DQmMG2Sx1V3f09xgXXvl9dokdO61m2sSR4XZB2GCeYuHLTAn/ndDw5BkIAb8wiwNvV8s=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=slXIvyEC5u+xJtYhVdeMPrVz7yrxqYPEwoc8/W9zJUM=;
	h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.45] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 5C013460143;
	Fri, 23 Aug 2024 18:59:40 +0800 (CST)
Message-ID: <f2194489-c637-4034-9077-951f74d621a5@rock-chips.com>
Date: Fri, 23 Aug 2024 18:59:40 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com,
 andriy.shevchenko@linux.intel.com, tao.huang@rock-chips.com,
 finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
 elaine.zhang@rock-chips.com
Subject: Re: [PATCH v2] gpio: rockchip: resolve overflow issues
To: Ye Zhang <ye.zhang@rock-chips.com>, linus.walleij@linaro.org,
 brgl@bgdev.pl, heiko@sntech.de, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240823034314.62305-1-ye.zhang@rock-chips.com>
 <20240823034314.62305-4-ye.zhang@rock-chips.com>
Content-Language: en-GB
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20240823034314.62305-4-ye.zhang@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU1DGlZIGh9DQh9NTk5KSEpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a917ee45e3203aekunm5c013460143
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MUk6EQw4OTIwHiJWCQsQEk0p
	DCgaFC5VSlVKTElPT0pLTENKTUhJVTMWGhIXVQgTGgwVVRcSFTsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUhLTkI3Bg++

在 2024/8/23 11:43, Ye Zhang 写道:
> Prevent overflow issues when performing debounce-related calculations.
> 
> Fixes: 3bcbd1a85b68 ("gpio/rockchip: support next version gpio controller")
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> ---
>   drivers/gpio/gpio-rockchip.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 5f60162baaeb..bf22b103b6a2 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -209,11 +209,12 @@ static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
>   		freq = clk_get_rate(bank->db_clk);
>   		if (!freq)
>   			return -EINVAL;
> -		max_debounce = (GENMASK(23, 0) + 1) * 2 * 1000000 / freq;
> +		div = (u64)(GENMASK(23, 0) + 1) * 2 * 1000000;
> +		max_debounce = DIV_ROUND_CLOSEST_ULL(div, freq);

can't max_debounce = DIV_ROUND_CLOSEST_ULL((GENMASK(23, 0) + 1) * 2 *
1000000, freq) work?

>   		if (debounce > max_debounce)
>   			return -EINVAL;
>   
> -		div = debounce * freq;
> +		div = (u64)debounce * freq;
>   		div_reg = DIV_ROUND_CLOSEST_ULL(div, 2 * USEC_PER_SEC) - 1;
>   	} else {
>   		div_debounce_support = false;

