Return-Path: <linux-gpio+bounces-29170-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C83C910A7
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Nov 2025 08:32:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 175B24E2A7C
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Nov 2025 07:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A5B2DC780;
	Fri, 28 Nov 2025 07:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j2HfOGyq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B5A1D88D0;
	Fri, 28 Nov 2025 07:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764315156; cv=none; b=JhX2zsDZeYBKfTdR6N8CAbCeI+BO+B4G4AqLNDYXiqDdPuU/COwT/zxV0u65sqC0rjSEKbiltEtueQlkVTS5uY2S2SAXyFFTumKT+vKkHgxv1t1T9MJJyQ8RCITrVZYPonL9rMrJo76s4a8t0zAPb5Py0F5GWRoT8u/VKHzGEx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764315156; c=relaxed/simple;
	bh=2sw8CHQwM1jJuUzpZI4vy4VqT7dXyYx+mZpuM5yQfvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/JvxuJfYxsHkt2zbrm2ueHiIUXwaBws21FE3v9pgR5JHL5VRtbtlE4rLJE/rHImp3lvzAFeLQMRraN1VXE94bfC7lGTjXaMQwkrLj27x1AXvBj8eTwF+IQzij/XgW2aYDNn5mLKqBuODvIXjXd5xa9wAe8Mp+RZUkNb+/m82jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j2HfOGyq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764315154; x=1795851154;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2sw8CHQwM1jJuUzpZI4vy4VqT7dXyYx+mZpuM5yQfvQ=;
  b=j2HfOGyqPx+m/32lhhisfkHuBWwRD8Qmp6V3B0lP47TfTB+qDLZVMGqE
   y8QPEZsIpkb3ibGl3nxOyLaqtv60bavUWbWzyTxqPfCRBUB//2ePZlzRr
   UTgQCvtrkhJGSJRjo/eE70eA+Bu1op2nEuL3c2AzM9LBU8Xue7Km9PFT5
   T0bj6tkqBPVMXneLghG63w3m8X4fMoSW4b8UlMb2YD5X4dVPZgDBTxEQ8
   yocAs1QPFDOPcEhQ7FL5pHDZ6Z079LxXD3LMtwzRxIzFNgq34KlSxGcUH
   kCd2WpVsIiUu/2y6L+4XIH/lz13xIU4pLFw+9UqVEO1dkrdjKe+g/oG10
   A==;
X-CSE-ConnectionGUID: bhCYDBAkTVW8Ks29RjgPrw==
X-CSE-MsgGUID: 4HCEjun1Spqmks79LEIo/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="53914940"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="53914940"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 23:32:34 -0800
X-CSE-ConnectionGUID: 5YMq8Z6IQ1CyPi8JC+FmPg==
X-CSE-MsgGUID: L6Nu9JLjRiu0NwUlIB7Gaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="193063282"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.154])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 23:32:32 -0800
Date: Fri, 28 Nov 2025 09:32:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] gpio: regmap: fix kernel-doc notation
Message-ID: <aSlQDc0NL7TyB4pQ@smile.fi.intel.com>
References: <20251128062739.845403-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128062739.845403-1-rdunlap@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 27, 2025 at 10:27:39PM -0800, Randy Dunlap wrote:
> Add a ':' to the end of struct member names to prevent kernel-doc
> warnings:
> 
> Warning: include/linux/gpio/regmap.h:108 struct member 'regmap_irq_line'
>  not described in 'gpio_regmap_config'
> Warning: include/linux/gpio/regmap.h:108 struct member 'regmap_irq_flags'
>  not described in 'gpio_regmap_config'

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Thanks!

-- 
With Best Regards,
Andy Shevchenko



