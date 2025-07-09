Return-Path: <linux-gpio+bounces-23003-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E983AFEBD8
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 16:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9E9C56752F
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 14:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E162E2658;
	Wed,  9 Jul 2025 14:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y7s908IO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B702E0930;
	Wed,  9 Jul 2025 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752070864; cv=none; b=DnLhMETAmvtydlR5hOcJMJUbZC3zzxTRPTGgsJKQETknu6p6nUmOrZ1avXopUisamvAjtR0b18S16F2w7F7nlCDnlNb67RCs1cUYZR/Qw2T0je3l83tyPMImxAV41kUXvaQiQ4OdJFoYnfRGJFMZA8R3Ga+Gf9kyFddTNV4Z8j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752070864; c=relaxed/simple;
	bh=CHnl2dn+aVri4wo5LCKGLJbuGJ6Wteg3asFoEH+a+Pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m4oxagdeKCwZaXI3ykjeFLyjJWBwqc6OLRQVf3va2r+O4rsJOWDbo1+shT+xz4ysHWbtfA8PtM1iffxBTFyXsmzVhMn3TBwTUmHaIQ3kJaKcPjOxs6ZmxktoVIPTcnGcf96C1NBi9P9jh6jTsWPiVgAhWTChXOpoNWjgNk0IUHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y7s908IO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752070863; x=1783606863;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CHnl2dn+aVri4wo5LCKGLJbuGJ6Wteg3asFoEH+a+Pk=;
  b=Y7s908IOFlF9gPkVyv7AeyIimxG4oKz9d+O7vW46Cpg0rw/rvGkyQpTo
   DhvJ39GXorGIg26YyW1oWUqBYmDNtvkOHZRlSVMLMYVCq8jE2O+SFJLsI
   BoTbQtEtlm9pCfBNy6vAV3O06NLwG6aGKrkHR4xatfU/4EMkupEJZxKIp
   aV855ezOmBDLdpz/b2rmDhjrJEpfw9oWPRNLacmj5uphx7i3kWRfGcZUF
   e34HWyq9Dv6cXgioQfWQl/cm3C5+xchiqf8RjCvPDXXdXzKLl3ce++vXj
   e2S5s1J1YmjVwteOWBHfv8WsY3w8AthfnHQoxSk5/j5ZF3KJzCG1O0lnp
   A==;
X-CSE-ConnectionGUID: RIxYnQYRR46K4PUWN5o6yQ==
X-CSE-MsgGUID: MDP1A7a8SEySNy9+JE+fdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54478768"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54478768"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 07:21:03 -0700
X-CSE-ConnectionGUID: h++JGzHmRkuyD3PTYHa4uA==
X-CSE-MsgGUID: x04SK+l3TlOOOFtScIictg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="156273334"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 07:21:03 -0700
Received: from [10.124.221.108] (unknown [10.124.221.108])
	by linux.intel.com (Postfix) with ESMTP id 9123A20B571C;
	Wed,  9 Jul 2025 07:21:01 -0700 (PDT)
Message-ID: <ec773987-b6d8-4fe9-bca9-a41009f27d80@linux.intel.com>
Date: Wed, 9 Jul 2025 07:21:01 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/19] gpio: wcove: use new GPIO line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek
 <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
 <20250709-gpiochip-set-rv-gpio-remaining-v1-4-b8950f69618d@linaro.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-4-b8950f69618d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/8/25 11:41 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Looks good.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/gpio/gpio-wcove.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
> index 1ec24f6f9300f33f5b3f0f8deb539e08392b8188..c50b74ced6364e3c3cfbe9ed385d21c80a2bb2e7 100644
> --- a/drivers/gpio/gpio-wcove.c
> +++ b/drivers/gpio/gpio-wcove.c
> @@ -200,18 +200,18 @@ static int wcove_gpio_get(struct gpio_chip *chip, unsigned int gpio)
>   	return val & 0x1;
>   }
>   
> -static void wcove_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
> +static int wcove_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
>   {
>   	struct wcove_gpio *wg = gpiochip_get_data(chip);
>   	int reg = to_reg(gpio, CTRL_OUT);
>   
>   	if (reg < 0)
> -		return;
> +		return 0;
>   
>   	if (value)
> -		regmap_set_bits(wg->regmap, reg, 1);
> -	else
> -		regmap_clear_bits(wg->regmap, reg, 1);
> +		return regmap_set_bits(wg->regmap, reg, 1);
> +
> +	return regmap_clear_bits(wg->regmap, reg, 1);
>   }
>   
>   static int wcove_gpio_set_config(struct gpio_chip *chip, unsigned int gpio,
> @@ -442,7 +442,7 @@ static int wcove_gpio_probe(struct platform_device *pdev)
>   	wg->chip.direction_output = wcove_gpio_dir_out;
>   	wg->chip.get_direction = wcove_gpio_get_direction;
>   	wg->chip.get = wcove_gpio_get;
> -	wg->chip.set = wcove_gpio_set;
> +	wg->chip.set_rv = wcove_gpio_set;
>   	wg->chip.set_config = wcove_gpio_set_config;
>   	wg->chip.base = -1;
>   	wg->chip.ngpio = WCOVE_VGPIO_NUM;
>
-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


