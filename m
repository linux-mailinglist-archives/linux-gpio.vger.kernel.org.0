Return-Path: <linux-gpio+bounces-23297-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA70B05CCF
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 15:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0076217016A
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 13:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CE32EB5AC;
	Tue, 15 Jul 2025 13:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CkFrg3m+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3241A2E613E;
	Tue, 15 Jul 2025 13:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752586163; cv=none; b=XfhytAyGhTIFidrfkKWEOPPx1VZmgztryKUdum3fGtDPrZepx5ORyW2kbdfbRhEjpA7KRcP4jqTCTKnDp3nh/ukNOqsMWfc21DZTBMjH4KZ5xuKeW4lzH4HBSOkfQ79FC7P9TzUVlY5MhmlplHewu1KGDYmwe+wpYlF+tjdtblg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752586163; c=relaxed/simple;
	bh=IS0zMYjCeG1sUzA/o870BnonfbFqvWBqq05l3BrL5EM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hhukp+sU+A5Sw25n9zNXdKWpsTIxLNbPpRcFtaDKTS9Jf+TqQW0oUK63POSlH807aUTcW6AOb0gHsrxK+jtbmao5DLI/KcKbPglGD2BE+gADDKd9uqrrh1WearGc89uAZvI63EChu2ecxLDx/mgWon85MIvPi78yDCvXyl5RvFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CkFrg3m+; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752586162; x=1784122162;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IS0zMYjCeG1sUzA/o870BnonfbFqvWBqq05l3BrL5EM=;
  b=CkFrg3m+tPBS2PbKpAfjvfDFC7+be8bcJ2XSXQ86ymv4XlcTNF05f+Gc
   zyCGXcAOEnz4zds55Y9kq8GFzHqkvcfCqSWqo8Y+4WeTkDTLJv8ce4EcG
   /2CfEQwINyMYqhgsvl4gyVs+LaYQKBXS0/oywvcCAD2U8cMrAyEgWEWy9
   tWzCudx47faxG9/Qyv7sh52lShlEDj2lWDi2Jbv2IJ0ksyAVHxRophQAz
   FRMB30iT3k+PcsrJuOae2i2fLDz949U/Xb/z6N+AnUCqaDCFLt0mWCegz
   bRJ2LKAYWQv3YKeYZjZIvSDEDqZH0Zm/Y52lnBjV0KSzSEaiW2aZhpM3U
   A==;
X-CSE-ConnectionGUID: 3tIhMmgVQQ2JGuG68iB4Eg==
X-CSE-MsgGUID: C4TFG/krROmx490N3y5FLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54023333"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="54023333"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 06:29:22 -0700
X-CSE-ConnectionGUID: tExs557lSFySzJsjo1bguQ==
X-CSE-MsgGUID: /N6sNHUsRACGHIy570/EYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="161534986"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 06:29:21 -0700
Received: from [10.124.223.222] (unknown [10.124.223.222])
	by linux.intel.com (Postfix) with ESMTP id 5FCBC20B571C;
	Tue, 15 Jul 2025 06:29:20 -0700 (PDT)
Message-ID: <3357db65-279f-4f43-880a-966b10e10287@linux.intel.com>
Date: Tue, 15 Jul 2025 06:29:20 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] gpio: wcove: use regmap_assign_bits() in .set()
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250715-gpiochip-set-rv-gpio-remaining-v2-0-072b4cf06330@linaro.org>
 <20250715-gpiochip-set-rv-gpio-remaining-v2-1-072b4cf06330@linaro.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250715-gpiochip-set-rv-gpio-remaining-v2-1-072b4cf06330@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/15/25 1:19 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Replace the if-else with a direct call to the regmap_assign_bits()
> helper and save a couple lines of code.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/gpio/gpio-wcove.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
> index 1ec24f6f9300f33f5b3f0f8deb539e08392b8188..816fb8d113e66b27070f286755f3192b2a8f8512 100644
> --- a/drivers/gpio/gpio-wcove.c
> +++ b/drivers/gpio/gpio-wcove.c
> @@ -208,10 +208,7 @@ static void wcove_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
>   	if (reg < 0)
>   		return;
>   
> -	if (value)
> -		regmap_set_bits(wg->regmap, reg, 1);
> -	else
> -		regmap_clear_bits(wg->regmap, reg, 1);
> +	regmap_assign_bits(wg->regmap, reg, 1, value);
>   }
>   
>   static int wcove_gpio_set_config(struct gpio_chip *chip, unsigned int gpio,
>
-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


