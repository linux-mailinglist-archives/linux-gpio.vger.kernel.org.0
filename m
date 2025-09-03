Return-Path: <linux-gpio+bounces-25528-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD94B425F5
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 17:51:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 321796862EC
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 15:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9407A28C5A4;
	Wed,  3 Sep 2025 15:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gcFyzXhA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A8D28B4FA;
	Wed,  3 Sep 2025 15:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756914673; cv=none; b=HwdXMEIyhW79j+toUQiNlk2rQauOYynQHSWUNLXAsT/Oyx1u0lhTkMNXotB1Ll7upyEsH0yIBzT4Crho6UQRkSLNUsDoLWLrI9ufaKS6IZFQKp8I1yKo6ytY3R9gcAluN/GT+RZd/dnbbaCxKUr8yht1u4WuGEHVOWKRcPA3VOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756914673; c=relaxed/simple;
	bh=jDcu9ohaMsZLetBVvF384J1O7tyKxslm3o1sZzCQpa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HjfDeXEEoJ/bWYAFgfRs4x2sfOukW3ugRHDloL33cPyI+0C2m0B33OytjdHjsoz7puK0mch0uWzml4AAgOlgXimkzd/eyPBhpkPU2P7nehZZh173f6zhlQl1SuNB6mkStsE+LWHS4n/gi/zcVmnjgsX6FSmhAORCMrGRF9YO2R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gcFyzXhA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756914672; x=1788450672;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jDcu9ohaMsZLetBVvF384J1O7tyKxslm3o1sZzCQpa8=;
  b=gcFyzXhA3OfwzxMjSxuu1yk+X/YH3bEv/CsSU9TDmBFV+JF7u4PU2NwL
   suXObSi62B4e/3lPSLVzGCemxvhgT20YPV2XHaNASDuJRfknZ4kfPMfsT
   LD4r0kozEI14QrFMAs8VW8Z4FrC9XN4S211yKu1dXxNfoEEQYsmttPS76
   Ve3mObE6oVIHB5P3yje4CCpvhKtgANrLsvgsoq2aj8k+4ZraMqD550VMM
   6Dulu6S5H0yx2M6uCbfPuCr+v4FKeQQL8/Y9lo3pAC9HpKoZDdw+KG7/1
   XTLQ7VqjZm2uaB3eB8MOHPNgO0IAmrFOUvsbiKcYpW5BMXl+86s5lt5R6
   Q==;
X-CSE-ConnectionGUID: DtIM5X/2Qa6Izs7O7uxzyQ==
X-CSE-MsgGUID: gqxISdfITtWxZY/Bs4iR4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="62876678"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="62876678"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 08:51:11 -0700
X-CSE-ConnectionGUID: y+zVVm5HRl+ykJu1eu0XDA==
X-CSE-MsgGUID: EwAhWLTbTHaszJY20N5Kcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="195272489"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 03 Sep 2025 08:51:08 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 40C9294; Wed, 03 Sep 2025 17:51:07 +0200 (CEST)
Date: Wed, 3 Sep 2025 17:51:07 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Yang Shen <shenyang39@huawei.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-unisoc@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RESEND 09/14] gpio: dwapb: use new generic GPIO chip API
Message-ID: <aLhj6xsR-NepfRx0@black.igk.intel.com>
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
 <20250825-gpio-mmio-gpio-conv-v1-9-356b4b1d5110@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-gpio-mmio-gpio-conv-v1-9-356b4b1d5110@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Aug 25, 2025 at 11:48:50AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.

...

> +static inline struct dwapb_gpio *to_dwapb_gpio(struct gpio_chip *gc)
> +{
> +	return container_of(to_gpio_generic_chip(gc),
> +			    struct dwapb_gpio_port, chip)->gpio;
> +}

Since it's not a macro anymore it can be done better:

	struct dwapb_gpio_port *port;

	port = container_of(to_gpio_generic_chip(gc), struct dwapb_gpio_port, chip);
	return port->gpio;

Also, have you checked the bloat-o-meter before and after, wondering if we gain
something with this.

-- 
With Best Regards,
Andy Shevchenko



