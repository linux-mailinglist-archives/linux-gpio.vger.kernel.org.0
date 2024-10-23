Return-Path: <linux-gpio+bounces-11858-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E11349ACDB5
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 16:59:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9197D1F219E6
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 14:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B67D1CDA27;
	Wed, 23 Oct 2024 14:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1HPxVZ+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E90B1C331A;
	Wed, 23 Oct 2024 14:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729694801; cv=none; b=vGetQTLm7YWMTgBKTrv6iIUtNYx3F0tAniJXKddAakMyx0MOzFevo3giuvICsUIkKMk7AKzothUsP5Pm3b7R6fHY5Z30F2RSkhNyNjofUzjnqU3bXX8vidtdMmj0YtQpGyZeXRv2UzGCiYn9/ego9IhBII0RCBBMvyr6j8mL0I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729694801; c=relaxed/simple;
	bh=SFOGnBiupLKBx4sj/9NbGao1pH8tCSEFbJ4C2PRu1wM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fHOavcc5Qh/kr9j+EBOcbcoDsjpxGFOUXvmtV2YRRqkaGLV7O9QH4Os29kPiQ+Ol5PeZToqTzu8Bpf/w+QeD/Xr3ep5e4PuuQWA5V3wrUQciNSzBLXu6H2a/ATfNW6QLHDh5j2jAmXGFkqCWediloql2PUIDSVQBgNrcb8i+CS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m1HPxVZ+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729694799; x=1761230799;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SFOGnBiupLKBx4sj/9NbGao1pH8tCSEFbJ4C2PRu1wM=;
  b=m1HPxVZ+v+1oyA2BYYtGbGHmPrtJJApszzXpmaCwEc5c4Gd+3v90hSuT
   zqB42DXIA/wP0ohf3zVyFOV45N6KmwjvS0baTbevhdxoVYQeyDQ/7ZdgF
   C0MJFUQeMmIJyyDtd1DRb0pwrHUh6CkSLWN4OxgQ10HMRUAeqOhGSfM+N
   1eeUahCgEOB3IWN6GtHL16R1eZE30kfuPKkvtepEpEsoIeETPCirimhUM
   gjDDzCl3vbft6DmCeywhHFeTG/696hRWgUFj0iVRfV3kep8vkeY2XbTsY
   y7dRFzFKXTIYrDR9URoGUzFn3E7KhZIXFeq8jzYB0gmNdQa7jOaiHJupk
   Q==;
X-CSE-ConnectionGUID: BU29DCWySG6CdQA6kOmNpw==
X-CSE-MsgGUID: HECTgzZuQTiDlyHmkxm6Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39835544"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39835544"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 07:46:38 -0700
X-CSE-ConnectionGUID: 2/65XuWbSqOXkpkL/CkXww==
X-CSE-MsgGUID: fXm8mDTFSLqVo/P33V2kJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="84216607"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 07:46:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t3cd8-00000006F3P-2wFe;
	Wed, 23 Oct 2024 17:46:34 +0300
Date: Wed, 23 Oct 2024 17:46:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] gpio: mb86s7x: remove some dead code in
 mb86s70_gpio_to_irq()
Message-ID: <ZxkMSsBRhCa-foit@smile.fi.intel.com>
References: <b7f3a78b-7163-42a0-bd09-8b3184f29661@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7f3a78b-7163-42a0-bd09-8b3184f29661@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Oct 23, 2024 at 11:35:53AM +0300, Dan Carpenter wrote:

...

> I have written more about the history of platform_get_irq() on my blog:
> https://staticthinking.wordpress.com/2023/08/07/writing-a-check-for-zero-irq-error-codes/

FWIW, this patch (see https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git)

commit e13724956849975ef40cbc9898643f3074a1ed8a
Author: Russell King <rmk@arm.linux.org.uk>
Date:   Tue Jun 8 02:28:02 2004 -0700

    [PATCH] Add platform_get_resource()
    
    This patch adds management of platform device resources to the
    device model, allowing drivers to lookup resources, IRQs and DMA
    numbers in the platform device resource array.  We also add a
    couple of functions which allow platform devices and their resources
    to be registered.

added it.

-- 
With Best Regards,
Andy Shevchenko



