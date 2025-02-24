Return-Path: <linux-gpio+bounces-16487-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC4AA41E2E
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 13:03:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2B124429B1
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 11:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117F723BCE6;
	Mon, 24 Feb 2025 11:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMT+Gg/u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CBE1863E;
	Mon, 24 Feb 2025 11:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740397516; cv=none; b=WtO7vB/JBNyNHFXQTESH8bbA7mbnJx9rK5r8aaUnvz74XVzHNCGe4OQAtQqqybg8BemAMUe3yogKz3jxKchlg4rGR/1OuBz8iMKWKLqKvvrxyNNfHV+Va1eZruC2JEYy9R5D5ATTY3q460DShO8UPdvKtSJIRvcExKVCLxCafi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740397516; c=relaxed/simple;
	bh=a0Gu+lD9oj96GYmuEZPjUSxbpQsQJkD4AxoAjGpcW1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q23C30XwjAuMCcE1UE7H5FHZqy9AbFY7VB4chyF8S6TphuJj+A2FxGqgE3Y8UinZPWHvPgrZ0vR6yh8kgNKzVsUAyYqTqqGEZUPmvBo7eFCBwuYcdb+xpxEz1UhzW9fZh4WtnLojMoHzk2tvdS/C5hATk3Re9bJbPqVL02Pxj9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMT+Gg/u; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740397514; x=1771933514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a0Gu+lD9oj96GYmuEZPjUSxbpQsQJkD4AxoAjGpcW1M=;
  b=YMT+Gg/uvxoDnqIhv5kge2QRinfIitVdfkthzehvs1YuPzFxZnwWukU1
   FDKIUEaEawsMREVR43TkPaDXuGOHvttiAWNGaZ3LkrfPyG/+IKdLnM/fR
   t/TDkzhE9A57sIztRNOHY6LRWCYCiRBBEz4rqKjD48NAPhRlc9+aQg/4c
   XbemVKrKxkw8iTQxxftqxSGdrhdK9zT5K+XBUrFQrP1tmHmNtwx3TSKeG
   FmbZRLpHvzt3nET1tuLOhPBNzeHIzauMWsSb+ogDeN6Mv4UaIZl9Rspzu
   KakiEllZYvqrmIB9s1QS5BaAH7FTUxbgEvdKeBxML6tWvMUXwrAnm4YUe
   g==;
X-CSE-ConnectionGUID: TWWfOEs6TGi31IGmK5jdIA==
X-CSE-MsgGUID: peKchv+/Qf2Bar2BoBqdtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="40853903"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="40853903"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 03:45:14 -0800
X-CSE-ConnectionGUID: jsn3bgY9Q3q7kbMFFMLyTA==
X-CSE-MsgGUID: SzBbv3ZZRgSFjOdBylY0aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="139266681"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 03:45:12 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1tmWta-0000000EgPS-1D9Z;
	Mon, 24 Feb 2025 13:45:10 +0200
Date: Mon, 24 Feb 2025 13:45:10 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpiolib: use the required minimum set of headers
Message-ID: <Z7xbxv-fkpXR4RXs@smile.fi.intel.com>
References: <20250221123001.95887-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221123001.95887-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 21, 2025 at 01:30:01PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Andy suggested we should keep a fine-grained scheme for includes and
> only pull in stuff required within individual ifdef sections. Let's
> revert commit dea69f2d1cc8 ("gpiolib: move all includes to the top of
> gpio/consumer.h") and make the headers situation even more fine-grained
> by only including the first level headers containing requireded symbols
> except for bug.h where checkpatch.pl warns against including asm/bug.h.

>  #include <linux/bits.h>
> -#include <linux/bug.h>
>  #include <linux/err.h>
> -#include <linux/errno.h>
> -#include <linux/kernel.h>
>  #include <linux/types.h>

...

> +#include <asm/errno.h>

> +#include <asm/errno.h>

> +#include <asm/errno.h>

These are redundant as err.h guarantees to include asm/errno.h
Dropping this will also satisfy the `make includecheck`.

-- 
With Best Regards,
Andy Shevchenko



