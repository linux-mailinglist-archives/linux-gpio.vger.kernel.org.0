Return-Path: <linux-gpio+bounces-22349-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E4FAEBC19
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 17:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 859291C6025B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 15:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8B12EA15E;
	Fri, 27 Jun 2025 15:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHYLw1yR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBAE2EA166;
	Fri, 27 Jun 2025 15:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751038651; cv=none; b=MmfBtqbwjXtWwmMKI4OrSV9/BS6imLWODz1xq21qWciSGaGwrXtDJ+6v2OhQbtuldtXWrPdOTJnKoTU8wcqPHTsN8Pxc9xyi9Qrq41jZDg8NCx62a9j4dhYaPpUklo1W46KAqzN3CBzgcoT3+uU0B1kaOqrJqM7RoucfooRGjXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751038651; c=relaxed/simple;
	bh=4bXjRTrSttngexMb09nZLHOUH8CT95m/KVGcbwXf7/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yjm3XmKPmSCyaIB9EUaiO0LiUHhe0sMia5HDPypf5uRXC50+mDK5M0tLv9x9/wlENeQip0YdoxrESNYBgqiDmxMDc/dQh6wcivydPde8BMXwN4kuPNY/E283nEXr5xr28JilUjsh88oRPjH9RkDMCYWQ1Y0iov2VlSOOApw5MSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHYLw1yR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751038650; x=1782574650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4bXjRTrSttngexMb09nZLHOUH8CT95m/KVGcbwXf7/M=;
  b=iHYLw1yRLv0jnYDx7D3CZW0cQfoIYzx3AQHCswDJGYAh6+gkHrMNz4ty
   IsyiveMd9FKHkXURQFrnvo5Rd5ZzXxIeIepQAKd17+m6jUdu5Gk+ZyWAW
   3MjVo3TDI1gSSyH6OTgA7Yz6t9NlIG3f144i0PD5LIjIK0yVyVRbyqO3m
   hdXDVwBFSVM+GeiydcLDxecut7rKlPocnP6Z1zjVb6LA9Tlku8fJZ5mXx
   /Xb1Q/N/S6VW2/RLVVjW36pRUAE57pJ40eTIt2xP6SWcj2AO9Nhq7HBx7
   SSOI/SVULvkJ/X9CX96/rCpjwXXYYHTRlicTkzeeZje4tjiQBNHH8354B
   g==;
X-CSE-ConnectionGUID: 4K+zGIb6Rp+YrJHejc10iQ==
X-CSE-MsgGUID: WoxZSQ92R5GPblpdrxfbmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57161267"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="57161267"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 08:37:29 -0700
X-CSE-ConnectionGUID: c/XXDrGwSmWra88lpY2ptg==
X-CSE-MsgGUID: ZxHHPmTNRqaV9PU0q1pQGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="183734614"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jun 2025 08:37:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C5C1E2BA; Fri, 27 Jun 2025 18:37:25 +0300 (EEST)
Date: Fri, 27 Jun 2025 18:37:25 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Kent Gibson <warthog618@gmail.com>,
	Jan =?iso-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 3/9] gpio: sysfs: pass gpiod_data directly to internal
 GPIO sysfs functions
Message-ID: <aF66tcXgrJCLjLvT@black.fi.intel.com>
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
 <20250623-gpio-sysfs-chip-export-v2-3-d592793f8964@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623-gpio-sysfs-chip-export-v2-3-d592793f8964@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jun 23, 2025 at 10:59:51AM +0200, Bartosz Golaszewski wrote:
> 
> To make the transition to not using dev_get_drvdata() across line
> callbacks for sysfs attributes, pass gpiod_data directly to
> gpio_sysfs_request_irq(), gpio_sysfs_free_irq() and
> gpio_sysfs_set_active_low() instead of having it wrapped in struct
> device.

I would improve the commit message by mentioning why using data over dev is
better. Something like "since we do not use anything from dev, pass the data
object pointer ...".


-- 
With Best Regards,
Andy Shevchenko



