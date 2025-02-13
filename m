Return-Path: <linux-gpio+bounces-15950-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 810A6A34DFC
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 19:48:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F9BA7A113C
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 18:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2FE024292D;
	Thu, 13 Feb 2025 18:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4p+OTWK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F4328A2C4;
	Thu, 13 Feb 2025 18:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739472494; cv=none; b=dCiPaZ79R5bQV8D/LroK+lPaX4mq03tE1MzSkPw3w8ZY2laZJHItwVNvcTU49UOCLyYr9yGZkUGO/vnEmxWlt6X5kE6AF0Zo3B8c/foNq9dxgPV0TvgxQkh52aXJSZfh3WkRDbOcJUn8FjMAXx3ta5ICzvOPe+XsFHXLlfGjgRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739472494; c=relaxed/simple;
	bh=t2j9sCGbQIRyHgbP76ZlMlLU9OQTCcx8w8sYQUuOJXo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YqrEbulKC9FDVrtZR21j9yoSf2aKH3kIp7X0kosrgYIqt9LnHZQPpsxzntReAqb5ekwLSwBKy5I0joldpBQHx2FpgNpBE7qugdJWJza2mLlFn65ZmtrvSTvlj4Wc0bEcQj3tcEl3g4hz+5WB1Xz/xTcW2m0huxc5OGuo1Ehmac8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4p+OTWK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739472493; x=1771008493;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=t2j9sCGbQIRyHgbP76ZlMlLU9OQTCcx8w8sYQUuOJXo=;
  b=A4p+OTWKaShtuQRXMQeNsEjtvUN2WJiLwx9gAU94ITXMbG+I69YyXDS3
   qRivsYwc3JI+B5gcDYserY6Wa2rejZfBQikf6F2AAbmzM3QRUnYcGXOsw
   l9KxRTUmptlxhoRIqYxm5S0G4pxI375Mz3q75oRLMVQ/EL0XyADrd63J5
   bx4jHej4+d+Eq/SZp3842Ld1p4LYcuq1fVLRUxU82fL7GafdOYDc/ibCX
   r4r6PyiMFeIMmBiaGPPG923Gq2NTlmWwYZvIREqu0OToKm3nWa+/qTbgU
   2RTbMxUneNWGLTlhOtqj1HZ5Vs3DkHfkSRtRKia4MIlNUanMvZE1Y76hX
   g==;
X-CSE-ConnectionGUID: jCxPKp/sQammNt78V1iAlQ==
X-CSE-MsgGUID: FDPl5agNQ5mJBk4DzMrWkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="43964345"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="43964345"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 10:48:12 -0800
X-CSE-ConnectionGUID: QEsi/t42T6GRXflvKDGtTw==
X-CSE-MsgGUID: 1qeSg+lTToahOc2h8flgSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="112974156"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.30])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 10:48:07 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, Alexandru Ardelean
 <aardelean@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 1/2] drm: Move for_each_if() to util_macros.h for
 wider use
In-Reply-To: <20250213182527.3092371-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250213182527.3092371-1-andriy.shevchenko@linux.intel.com>
 <20250213182527.3092371-2-andriy.shevchenko@linux.intel.com>
Date: Thu, 13 Feb 2025 20:48:02 +0200
Message-ID: <87msepy93x.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 13 Feb 2025, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> Other subsystem(s) may want to reuse the for_each_if() macro.
> Move it to util_macros.h to make it globally available.
>
> Suggested-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Yay!

Acked-by: Jani Nikula <jani.nikula@intel.com>

If you want to go down the memory lane, see [1]. ;)


[1] https://lore.kernel.org/r/20180709083650.23549-1-daniel.vetter@ffwll.ch

> ---
>  include/drm/drm_util.h      | 16 +---------------
>  include/linux/util_macros.h | 15 +++++++++++++++
>  2 files changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/include/drm/drm_util.h b/include/drm/drm_util.h
> index 79952d8c4bba..440199618620 100644
> --- a/include/drm/drm_util.h
> +++ b/include/drm/drm_util.h
> @@ -36,6 +36,7 @@
>  #include <linux/kgdb.h>
>  #include <linux/preempt.h>
>  #include <linux/smp.h>
> +#include <linux/util_macros.h>
>  
>  /*
>   * Use EXPORT_SYMBOL_FOR_TESTS_ONLY() for functions that shall
> @@ -47,21 +48,6 @@
>  #define EXPORT_SYMBOL_FOR_TESTS_ONLY(x)
>  #endif
>  
> -/**
> - * for_each_if - helper for handling conditionals in various for_each macros
> - * @condition: The condition to check
> - *
> - * Typical use::
> - *
> - *	#define for_each_foo_bar(x, y) \'
> - *		list_for_each_entry(x, y->list, head) \'
> - *			for_each_if(x->something == SOMETHING)
> - *
> - * The for_each_if() macro makes the use of for_each_foo_bar() less error
> - * prone.
> - */
> -#define for_each_if(condition) if (!(condition)) {} else
> -
>  /**
>   * drm_can_sleep - returns true if currently okay to sleep
>   *
> diff --git a/include/linux/util_macros.h b/include/linux/util_macros.h
> index 825487fb66fa..3b570b765b75 100644
> --- a/include/linux/util_macros.h
> +++ b/include/linux/util_macros.h
> @@ -4,6 +4,21 @@
>  
>  #include <linux/math.h>
>  
> +/**
> + * for_each_if - helper for handling conditionals in various for_each macros
> + * @condition: The condition to check
> + *
> + * Typical use::
> + *
> + *	#define for_each_foo_bar(x, y) \'
> + *		list_for_each_entry(x, y->list, head) \'
> + *			for_each_if(x->something == SOMETHING)
> + *
> + * The for_each_if() macro makes the use of for_each_foo_bar() less error
> + * prone.
> + */
> +#define for_each_if(condition) if (!(condition)) {} else
> +
>  /**
>   * find_closest - locate the closest element in a sorted array
>   * @x: The reference value.

-- 
Jani Nikula, Intel

