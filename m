Return-Path: <linux-gpio+bounces-28093-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F99C351B4
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 11:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE62D188ACB7
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 10:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E64302CDC;
	Wed,  5 Nov 2025 10:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/e/sh//"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7F7301007;
	Wed,  5 Nov 2025 10:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762338687; cv=none; b=AuTUJziKZxYTLmYTN/thiYKj+0cW+ddvM+tW5Kwza5R67yYncde2PhcCeTQCvofx0RzyqVRt0kLCgnwmByoc++YN6dIDQz2MfqQDpUGCivXQ+yTRAEy9FmME26iFJ6Y+9kLax+TbgrKRFFGnXM1xWS0abNNq+0+FFc+QjDYWoTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762338687; c=relaxed/simple;
	bh=Vn35hLkwmnD21sGOZtp7Ty/VQ60HoGsF3YK6VqmliLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JkVUi4W6gbbcPg7a1p8erdWSgdRLF56/KJ+WhsEkSP0IAomnCW1OUYw+/gIwJq0AJo0dhOXcsv/hXkwOvPHqtCMslIQUBeYMrsDrkM/+aEaQgQTbwqMPRtJHWJcD6+TkwOmJlyA0ojPrL3fnEZR9Sco713kaXPQ41Q2tz0gtdFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O/e/sh//; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762338685; x=1793874685;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vn35hLkwmnD21sGOZtp7Ty/VQ60HoGsF3YK6VqmliLI=;
  b=O/e/sh//hulmEOst5GzSLh1rfEsAYI6jjmYKyfIeLNaVr+6hxR4l0kaU
   H7v2ShaqODVtN6BJWmBN6EQDi6lsLm5PdMKM8/sQm04qX/RH+90XvLv5F
   9S4Ssi9C4dRxll1ibfjaJYJQcV0MAkvYTzFY8uYGSQVC7VSCUQd0AYmc4
   VN52PGb4tdfFea4b1/vuuAcS7r/XJhEcVK6vfZ+CqeYOk7UTX5JaqPJ8s
   0IwZYlUgbcCQSxxxpwAkUK2DMGZv+dVSI2B4jqu+O6XgthOa50DS/Gtd9
   NZMxuGSvG2GY0VNc97TZYPR1c2lJu5t2VVfRpKIRezyd/BJk+5IMTLjfm
   A==;
X-CSE-ConnectionGUID: AzBDp94RTkWt4IFHjt1VUg==
X-CSE-MsgGUID: +B7SDcNnTTeQJadAoh3DFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64486010"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="64486010"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 02:31:25 -0800
X-CSE-ConnectionGUID: zsw8o8U1Qn2QkxfWw4NeNA==
X-CSE-MsgGUID: zGieOCinSo2ALkqP8TNdIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="187089686"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 05 Nov 2025 02:31:23 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 569FE95; Wed, 05 Nov 2025 11:31:22 +0100 (CET)
Date: Wed, 5 Nov 2025 11:31:22 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 02/10] pinctrl: alderlake: Switch to INTEL_GPP() macro
Message-ID: <20251105103122.GL2912318@black.igk.intel.com>
References: <20251104145814.1018867-1-andriy.shevchenko@linux.intel.com>
 <20251104145814.1018867-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251104145814.1018867-3-andriy.shevchenko@linux.intel.com>

On Tue, Nov 04, 2025 at 03:56:36PM +0100, Andy Shevchenko wrote:
> Replace custom macro with the recently defined INTEL_GPP().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-alderlake.c | 68 ++++++++++-------------
>  1 file changed, 30 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-alderlake.c b/drivers/pinctrl/intel/pinctrl-alderlake.c
> index 108eac205aa9..7bf1d5c285a0 100644
> --- a/drivers/pinctrl/intel/pinctrl-alderlake.c
> +++ b/drivers/pinctrl/intel/pinctrl-alderlake.c
> @@ -27,14 +27,6 @@
>  #define ADL_S_GPI_IS		0x200
>  #define ADL_S_GPI_IE		0x220
>  
> -#define ADL_GPP(r, s, e, g)				\
> -	{						\
> -		.reg_num = (r),				\
> -		.base = (s),				\
> -		.size = ((e) - (s) + 1),		\
> -		.gpio_base = (g),			\
> -	}
> -

I wonder if simply doing this:

#define ADL_GPP(r, s, e, g)	INTEL_GPP(r, s, e, g)

is better? Then the amount of changes are smaller.

>  #define ADL_N_COMMUNITY(b, s, e, g)			\
>  	INTEL_COMMUNITY_GPPS(b, s, e, g, ADL_N)
>  
> @@ -316,28 +308,28 @@ static const struct pinctrl_pin_desc adln_pins[] = {
>  };
>  
>  static const struct intel_padgroup adln_community0_gpps[] = {
> -	ADL_GPP(0, 0, 25, 0),				/* GPP_B */
> -	ADL_GPP(1, 26, 41, 32),				/* GPP_T */
> -	ADL_GPP(2, 42, 66, 64),				/* GPP_A */
> +	INTEL_GPP(0, 0, 25, 0),				/* GPP_B */
> +	INTEL_GPP(1, 26, 41, 32),			/* GPP_T */
> +	INTEL_GPP(2, 42, 66, 64),			/* GPP_A */
>  };
>  
>  static const struct intel_padgroup adln_community1_gpps[] = {
> -	ADL_GPP(0, 67, 74, 96),				/* GPP_S */
> -	ADL_GPP(1, 75, 94, 128),			/* GPP_I */
> -	ADL_GPP(2, 95, 118, 160),			/* GPP_H */
> -	ADL_GPP(3, 119, 139, 192),			/* GPP_D */
> -	ADL_GPP(4, 140, 168, 224),			/* vGPIO */
> +	INTEL_GPP(0, 67, 74, 96),			/* GPP_S */
> +	INTEL_GPP(1, 75, 94, 128),			/* GPP_I */
> +	INTEL_GPP(2, 95, 118, 160),			/* GPP_H */
> +	INTEL_GPP(3, 119, 139, 192),			/* GPP_D */
> +	INTEL_GPP(4, 140, 168, 224),			/* vGPIO */
>  };
>  
>  static const struct intel_padgroup adln_community4_gpps[] = {
> -	ADL_GPP(0, 169, 192, 256),			/* GPP_C */
> -	ADL_GPP(1, 193, 217, 288),			/* GPP_F */
> -	ADL_GPP(2, 218, 223, INTEL_GPIO_BASE_NOMAP),	/* HVCMOS */
> -	ADL_GPP(3, 224, 248, 320),			/* GPP_E */
> +	INTEL_GPP(0, 169, 192, 256),			/* GPP_C */
> +	INTEL_GPP(1, 193, 217, 288),			/* GPP_F */
> +	INTEL_GPP(2, 218, 223, INTEL_GPIO_BASE_NOMAP),	/* HVCMOS */
> +	INTEL_GPP(3, 224, 248, 320),			/* GPP_E */
>  };
>  
>  static const struct intel_padgroup adln_community5_gpps[] = {
> -	ADL_GPP(0, 249, 256, 352),			/* GPP_R */
> +	INTEL_GPP(0, 249, 256, 352),			/* GPP_R */
>  };
>  
>  static const struct intel_community adln_communities[] = {
> @@ -680,35 +672,35 @@ static const struct pinctrl_pin_desc adls_pins[] = {
>  };
>  
>  static const struct intel_padgroup adls_community0_gpps[] = {
> -	ADL_GPP(0, 0, 24, 0),				/* GPP_I */
> -	ADL_GPP(1, 25, 47, 32),				/* GPP_R */
> -	ADL_GPP(2, 48, 59, 64),				/* GPP_J */
> -	ADL_GPP(3, 60, 86, 96),				/* vGPIO */
> -	ADL_GPP(4, 87, 94, 128),			/* vGPIO_0 */
> +	INTEL_GPP(0, 0, 24, 0),				/* GPP_I */
> +	INTEL_GPP(1, 25, 47, 32),			/* GPP_R */
> +	INTEL_GPP(2, 48, 59, 64),			/* GPP_J */
> +	INTEL_GPP(3, 60, 86, 96),			/* vGPIO */
> +	INTEL_GPP(4, 87, 94, 128),			/* vGPIO_0 */
>  };
>  
>  static const struct intel_padgroup adls_community1_gpps[] = {
> -	ADL_GPP(0, 95, 118, 160),			/* GPP_B */
> -	ADL_GPP(1, 119, 126, 192),			/* GPP_G */
> -	ADL_GPP(2, 127, 150, 224),			/* GPP_H */
> +	INTEL_GPP(0, 95, 118, 160),			/* GPP_B */
> +	INTEL_GPP(1, 119, 126, 192),			/* GPP_G */
> +	INTEL_GPP(2, 127, 150, 224),			/* GPP_H */
>  };
>  
>  static const struct intel_padgroup adls_community3_gpps[] = {
> -	ADL_GPP(0, 151, 159, INTEL_GPIO_BASE_NOMAP),	/* SPI0 */
> -	ADL_GPP(1, 160, 175, 256),			/* GPP_A */
> -	ADL_GPP(2, 176, 199, 288),			/* GPP_C */
> +	INTEL_GPP(0, 151, 159, INTEL_GPIO_BASE_NOMAP),	/* SPI0 */
> +	INTEL_GPP(1, 160, 175, 256),			/* GPP_A */
> +	INTEL_GPP(2, 176, 199, 288),			/* GPP_C */
>  };
>  
>  static const struct intel_padgroup adls_community4_gpps[] = {
> -	ADL_GPP(0, 200, 207, 320),			/* GPP_S */
> -	ADL_GPP(1, 208, 230, 352),			/* GPP_E */
> -	ADL_GPP(2, 231, 245, 384),			/* GPP_K */
> -	ADL_GPP(3, 246, 269, 416),			/* GPP_F */
> +	INTEL_GPP(0, 200, 207, 320),			/* GPP_S */
> +	INTEL_GPP(1, 208, 230, 352),			/* GPP_E */
> +	INTEL_GPP(2, 231, 245, 384),			/* GPP_K */
> +	INTEL_GPP(3, 246, 269, 416),			/* GPP_F */
>  };
>  
>  static const struct intel_padgroup adls_community5_gpps[] = {
> -	ADL_GPP(0, 270, 294, 448),			/* GPP_D */
> -	ADL_GPP(1, 295, 303, INTEL_GPIO_BASE_NOMAP),	/* JTAG */
> +	INTEL_GPP(0, 270, 294, 448),			/* GPP_D */
> +	INTEL_GPP(1, 295, 303, INTEL_GPIO_BASE_NOMAP),	/* JTAG */
>  };
>  
>  static const struct intel_community adls_communities[] = {
> -- 
> 2.50.1

