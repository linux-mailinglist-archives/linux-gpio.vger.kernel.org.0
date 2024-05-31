Return-Path: <linux-gpio+bounces-7014-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF3E8D640C
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 16:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D178FB22719
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 14:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB8F15B96A;
	Fri, 31 May 2024 14:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2hHdIsi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B728A1E492;
	Fri, 31 May 2024 14:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717164591; cv=none; b=pRJvENlIVEMy6jN+Ybktoccjtprckvt9PaQZQ4iw2sRyHL9KHG57MX/bF9d0VU9WIOFtp8cakUAFaZEYO9/vTaKEPlsX8JbLKNsIAmUrnqj5PcZOT3tD4TmRva4ZmrlnBl96QLEZH6qkgGtbfBX3/TGFg55taG4YCf0E5w9yd2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717164591; c=relaxed/simple;
	bh=bKJdKPEFTKZXEr9iR4gqIE1B2c04d4PUgFrrRtcVpX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7Bl58/fB/+iceA8iSYCAsyrGNayBeS8KEcT4fcwObNfioxbVY3svXgTW1g4UuTmmGfSg5KJrbczTZW6EbHTEDQYVNAUZIKBXycmDr7wilyxQYoSSmv+J1NWbe0NVwM+RuWSCJabnRbpR0V1vARDHwV5i4o1fAaVlawRZ4XdVPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2hHdIsi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717164590; x=1748700590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bKJdKPEFTKZXEr9iR4gqIE1B2c04d4PUgFrrRtcVpX0=;
  b=Q2hHdIsiBm3p3lyh7OOcuwmTiaUvUBSCgZ6bze3hbGoaAWRxNWbxvLaD
   Uh9eLEA8hStH5k3hKwgYH/GaxuSKmAC0k3tABbuJziGoUC5lwbJ8wBiwm
   YwP4V1hOQsSRSzBZA6FYQCo5MxTHPvWgpiMVXRNlaWqtTFE/G6+tJVn0y
   rXDXA/0qttGw9W+ApX/7OEvX2ua3U6w9pPqGvyPNbnKmzrTDupMhbY4aD
   +5bQGDxxWgzjsnp2e/HTXcKnBbUIB9+WQDYuLAsz9GbzjsXa1KJp5B/bL
   3yzydHUQcC6E5qt95YTSlWqb4AbkNyd/iEQrLiI1OZ10+uhdErl2O0Eqc
   Q==;
X-CSE-ConnectionGUID: Iwxr0dtyRAG/+p3FQeOsng==
X-CSE-MsgGUID: XDSIg4oHQt++NC0nDqrD4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13932960"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="13932960"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 07:09:49 -0700
X-CSE-ConnectionGUID: RMniXizQQpim/35YAUurlA==
X-CSE-MsgGUID: 2fNH8rNLQoiXG+lJfBa5Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="41088899"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 07:09:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sD2wy-0000000CU4l-3HjR;
	Fri, 31 May 2024 17:09:44 +0300
Date: Fri, 31 May 2024 17:09:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 2/2] gpiolib: Show more info for interrupt only lines
 in debugfs
Message-ID: <ZlnaKCz8Yz2rfX-c@smile.fi.intel.com>
References: <20240530191418.1138003-1-andriy.shevchenko@linux.intel.com>
 <20240530191418.1138003-3-andriy.shevchenko@linux.intel.com>
 <7750850.EvYhyI6sBW@steina-w>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7750850.EvYhyI6sBW@steina-w>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 31, 2024 at 01:19:56PM +0200, Alexander Stein wrote:
> Hi,
> 
> Am Donnerstag, 30. Mai 2024, 21:12:30 CEST schrieb Andy Shevchenko:
> > Show more info for interrupt only lines in debugfs. It's useful
> > to monitor the lines that have been never requested as GPIOs,
> > but IRQs.
> 
> I was trying to test this on TQMa8MPQL (i.MX8MP) using gpio-mxc.c.
> But apparently this series only has an effect when gpiochip_lock_as_irq()
> is called eventually. I'm wondering what needs to be done so IRQ only
> GPIOs are listed in debugfs. Using irq_request_resources/irq_release_resources
> similar to what pinctrl-at91.c is doing?

For the record on Intel Galileo Gen2 I see this difference

Before:

gpiochip4: GPIOs 8-15, parent: platform/gpio-dwapb.1, gpio-dwapb.1:
gpio-10  (                    |spi169 CS0          ) out hi

After:

gpiochip4: GPIOs 8-15, parent: platform/gpio-dwapb.1, gpio-dwapb.1:
gpio-9   (                    |irq                 ) in  hi IRQ ACTIVE LOW
gpio-10  (                    |spi169 CS0          ) out hi

but it's handled via gpiolib-acpi.

-- 
With Best Regards,
Andy Shevchenko



