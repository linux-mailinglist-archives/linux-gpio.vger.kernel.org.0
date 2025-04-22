Return-Path: <linux-gpio+bounces-19152-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B037A974F2
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 20:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B587189B86C
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 18:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B152980B0;
	Tue, 22 Apr 2025 18:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ODwmztY8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383D41DE3C3;
	Tue, 22 Apr 2025 18:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745348110; cv=none; b=BvEYitnp5dWzohYNkRV6aVWSfDceMvhhGFBFVuyCYykHsJHTBKW8mO/15wpusPcwZEWqCRo+N0RT7vGjuFIDCGaq8OsVVPH7Fdy7GT9t1pxXG5Wv8y5bUYeraKC03uLDV2sNeUqO/uGDd792DchUPI1bvjfxQ9mQcMAC3fD9AkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745348110; c=relaxed/simple;
	bh=CxS7ehfDRRrqQl0Wv9/+uU3ayMNpuNzblOq2YmeACaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOuvgAT9fDljYN8NcIqEvM5w7NmMuYxHE7zGvQi5TOSXLQdIgHGVojzKiWWh+COZp75H6MBvyRKNrzTMV4VlSBaN3A7bR07rWqhXyED3r5ORmgF8km3Q8vFL52xR2gwMTC9a28P/oHEFD8B8ExqxM17BJpPDDueX1GDr7fnM9ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ODwmztY8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745348108; x=1776884108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CxS7ehfDRRrqQl0Wv9/+uU3ayMNpuNzblOq2YmeACaM=;
  b=ODwmztY8xMiwThvaWMUsArBfgR4zzMPLluxaZUnz2xgBcopZheNfYKTj
   EpbzdI6Gpw87dtSUOHoSc7SRPhzmYkTR7hfOufcwOO+lb2ryGyzASJROT
   EW31LYwOHgv11iWcFaH7M0R8BnTeFVPv61QvXdwgLKBd6ElQbxNJiMYBB
   Veyo4IqJjFphepXi2E00OsuV8xFRWdJmcGX293R7mraMnwexzXE56mJZk
   Kay4kE8QWxNfmLcZQ+yNO+TZ9EicQagwIud6FyTwc1uZweQ0dXdTxUUHr
   48ym1gRYlXt09ZQM/WuIqoQ8b2u5MEJ9T2wHBck1YeZYAtbevpLeNYHCn
   A==;
X-CSE-ConnectionGUID: TYkXAG9+SQCYMmzkpFOyFQ==
X-CSE-MsgGUID: WCf31QMmQ+aTgNqjuQlBSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="72307510"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="72307510"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 11:55:07 -0700
X-CSE-ConnectionGUID: 1gJ+rKg4TYq9GEbA9DlR7g==
X-CSE-MsgGUID: CiZpku3ZSb+cJx2+PVXr3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="136883444"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 11:55:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u7Ilq-0000000Eouz-1GrV;
	Tue, 22 Apr 2025 21:55:02 +0300
Date: Tue, 22 Apr 2025 21:55:02 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Raag Jadav <raag.jadav@intel.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 0/3] gpiolib: finish conversion to devm_*_action*()
 APIs
Message-ID: <aAfmBlE3ZXU65PQR@smile.fi.intel.com>
References: <20250220162238.2738038-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220162238.2738038-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 20, 2025 at 06:20:25PM +0200, Andy Shevchenko wrote:
> GPIOLIB has some open coded stuff that can be folded to the devm_*_action*()
> calls. This mini-series is for that. The necessary prerequisites are here
> as well, namely:
> 1) moving the respective APIs to the devres.h;
> 2) adding a simple helper that GPIOLIB will rely on;
> 3) finishing the GPIOLIB conversion to the device managed action APIs.
> 
> The series is based on another series that's available via immutable tag
> devres-iio-input-pinctrl-v6.15 [1]. The idea is to route this via GPIOLIB
> tree (or Intel GPIO for the starter) with an immutable tag for the device
> core and others if needed. Please, review and acknowledge.

Greg, I know you are busy, but do you have a chance to look at this and give
your Ack if you are okay with the idea? The route is assumed to be via GPIOLIB
tree.

-- 
With Best Regards,
Andy Shevchenko



