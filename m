Return-Path: <linux-gpio+bounces-685-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC27A7FDA62
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 15:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AFA0B20E81
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 14:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD45F34568;
	Wed, 29 Nov 2023 14:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYshQqF6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9BC9130;
	Wed, 29 Nov 2023 06:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701269514; x=1732805514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fs4nT3+fIuEHZgrTiCBSWoggoTMx62a/i65Penk/AKg=;
  b=cYshQqF6HsMYWw2pa2+WIpxPIhikwVmcY42KhGtpwQ/tn8PibjUqeZYU
   GQJ3D3eoXNXe662U3ktEXFsztAM+bFhcyMGpMZg8WXZxbwe2/xuL4lkT1
   61jIYvBIx7CvqwV8u5KveZzONviquMN+c74JJQBeUVXVgwDtPMuYXrubI
   7CpV8M99J2PtpOBxwDGZvyYREi3+Ecmnz9xRajEVqpcJYleOQWjBioWYO
   NjiWvtvjxQwreuziv1uzGWSK8eyy8PSMNOexaVQm70FbEXYqOhmH7sD73
   EDcURoopqJIxu3+Am9XtGS4DuUNAnseE7gj96PMXYSzN6D49YvYZ1Lj5k
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="395987008"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="395987008"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 06:51:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="839453277"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="839453277"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 06:51:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r8Luo-00000000Sxl-06bR;
	Wed, 29 Nov 2023 16:51:50 +0200
Date: Wed, 29 Nov 2023 16:51:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 07/10] pinctrl: baytrail: use gpiochip_dup_line_label()
Message-ID: <ZWdQBWRNwPWXZqqo@smile.fi.intel.com>
References: <20231129142411.76863-1-brgl@bgdev.pl>
 <20231129142411.76863-8-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129142411.76863-8-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 29, 2023 at 03:24:08PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Use the new gpiochip_dup_line_label() helper to safely retrieve the
> descriptor label.

I don't think it will be any collision with other Bay Trail patches,
but I would like to have an immutable branch that I can pull into my tree
(Intel pin control drivers).

-- 
With Best Regards,
Andy Shevchenko



