Return-Path: <linux-gpio+bounces-9676-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 423DA96A363
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 17:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7C15B22E59
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 15:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC56618893F;
	Tue,  3 Sep 2024 15:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DSb0XFoV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437391509B4;
	Tue,  3 Sep 2024 15:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725378989; cv=none; b=OhLLte8cozEqmCN5AhBGzAnmEX24zZsmTGj8zHlBJxvDjp3jR/GuJw8RUn3X5bk9ebe5WTYdh9nYJZrrV3OGmfwqu8UfQN3edYgurB9fFhc5ATKXFskV2WzyFDxZZSdbDE43HyNZm+1S2joku5cRi3bpJE9OLRKuHsSTODG4iN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725378989; c=relaxed/simple;
	bh=sLyMt245ao8HwCeSNglehwfeUM8MKbh7j8GGEGBOtwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DszifCOr0BYZjiKmqBptJiE0zHMHn7fiTGyJxTkjBOzKaC+JjncGHrLQ18FxZliXfNt6CVw0CbrXVxz6YMuQFipo/Kz5IJea/LCKDGVypchvzHYUO5NS3w3GNW3hYQODk6KxknrvBep1U/9Dz8JrJqwBJeSPhmTBYsUIJ2fHVGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DSb0XFoV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725378989; x=1756914989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sLyMt245ao8HwCeSNglehwfeUM8MKbh7j8GGEGBOtwQ=;
  b=DSb0XFoVo1BXpPfnbF5VO5x6ruv5lJdmRbsj1JFzHWcMw+rKDiUKKzVA
   gXRXCQoQLU/fYvUN3Ej+wdlqZBms1yJkdfN6RF4CO6uOcWkR+BsTT8Vf+
   i7G4lgo79pF072kSRN9PM4UbtkOkp82NOICdQl9LZJPwaFCMNqul9TRxz
   R8kRHYODyK4BQKmykWCDRrzwR4wyQbMVy6+lOm70TN5wZz4jX5Abh+DrP
   jrGBWNAQjlMgYjP1QqwWutG2U9xNDYgHMaJpEOpvyuqSW2oYTSLMOd2vr
   MqVs0ZKE9Y+rmZoWpa/RaDe5NyW3vCVZ8Xj0KPb6VCo5oldvKFrtfABX+
   w==;
X-CSE-ConnectionGUID: hisyNepnSYGVOuh5+Hg3aA==
X-CSE-MsgGUID: iqvVLAc2Q4+uhIFa8dTZqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="27780030"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="27780030"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 08:55:09 -0700
X-CSE-ConnectionGUID: 8xByilQxRY+quXw0JAbhpQ==
X-CSE-MsgGUID: 8muKQu41R8CTNwk0s9FEEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="69340599"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 08:55:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slVrx-00000004lBc-1N3K;
	Tue, 03 Sep 2024 18:55:01 +0300
Date: Tue, 3 Sep 2024 18:55:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: Re: [PATCH v3 04/12] gpio: rockchip: resolve underflow issue
Message-ID: <ZtcxVdAdGNOkaOuD@smile.fi.intel.com>
References: <20240903073649.237362-1-ye.zhang@rock-chips.com>
 <20240903073649.237362-5-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903073649.237362-5-ye.zhang@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 03, 2024 at 03:36:41PM +0800, Ye Zhang wrote:
> div_reg may be < 0 if debounce is zero, causing the unsigned int to
> overflow.

...

> -	if (bank->gpio_type == GPIO_TYPE_V2 && !IS_ERR(bank->db_clk)) {
> +	if ((bank->gpio_type == GPIO_TYPE_V2) && !IS_ERR(bank->db_clk))

Stray change.

-- 
With Best Regards,
Andy Shevchenko



