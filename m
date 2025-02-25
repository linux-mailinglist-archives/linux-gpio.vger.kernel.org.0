Return-Path: <linux-gpio+bounces-16559-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C00BA440AB
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 14:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4D9E3BA81E
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 13:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941192690FF;
	Tue, 25 Feb 2025 13:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iSHSoA9w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D052690CE;
	Tue, 25 Feb 2025 13:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740489647; cv=none; b=Zh1EO7fGe+n/h6I/fatOGYvmLHmZDprTzvzhcfpGdNMkjzH4OnSxFs7Np5DY3tuIGcUj8FeOtRCGi7J5fAaiz+sxR6GWw9TEmDy+gV/LZ6vBFc3VPV8nhT93MgC/bTZiMg99uXs3VJUTcLiSAUIghXFxcCBb4c4tq33klMlTuNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740489647; c=relaxed/simple;
	bh=1A13FZECMkoqrJtBXrU7NR0L2ARqxaUUuSaWU3FtDwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkwAWTzer25ngb4XTuSKvC6154kX02oGsTW+ENviNZLkq8vVoIvaQZ37Ri6ZFRRcBNXs8lROtLjyOBGpfCu36pwgD2ddQktFq/fV5TTAH3GofSNETQBYfuiMLp/4POdMFiKSL6AK6vBW7/G3iJsSupBb7Nc2No9zWcw11qRpd1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iSHSoA9w; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740489646; x=1772025646;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1A13FZECMkoqrJtBXrU7NR0L2ARqxaUUuSaWU3FtDwI=;
  b=iSHSoA9wGeZHJR0GB+rWv7BJYIcR5EBFPAcvVqJrpVX1Q7Wl++cviC8O
   jEOk7KwC+v/V2icfzZZjz0A6BdWQjuJbQfkKLKY18sk1EDjibvXAsxYjT
   PFZNI12AkFiwH/P1yr1Vgd9c07XQihTvPY+o/a0vvrHDHaOIVwnFrZMJi
   DeE/HiaOqMgJcOla+dDfn/IUT7xXzjKZvZ8o4jRu8O6yDh1GLngPewRcG
   hsy6p+UlAHBhHDGAhHditOonq+lwewuZApz8Nf9z7HYJg9VC7HYxX7029
   aTVbXb7z8JhK4DMWrF1yM3Bu4AyRINmc5XJawkzD/8Kwv+Qop++y7TX+J
   A==;
X-CSE-ConnectionGUID: Ll7oWkK+T7ytetfHYHBmXA==
X-CSE-MsgGUID: 2T5nvjAcR62nl6HqszwAkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41175587"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="41175587"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 05:20:45 -0800
X-CSE-ConnectionGUID: 6i21MTHnTLKl04xdRt63zQ==
X-CSE-MsgGUID: yHRYqWq7TreSahEUq+lDEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="116368175"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 05:20:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tmurY-0000000F0AZ-0Oqr;
	Tue, 25 Feb 2025 15:20:40 +0200
Date: Tue, 25 Feb 2025 15:20:39 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 3/3] gpiolib: don't double-check the gc->get callback's
 existence
Message-ID: <Z73Dp5EH3sHMZDZ7@smile.fi.intel.com>
References: <20250225-retval-fixes-v1-0-078c4c98517a@linaro.org>
 <20250225-retval-fixes-v1-3-078c4c98517a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-retval-fixes-v1-3-078c4c98517a@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 25, 2025 at 12:56:25PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> gpiochip_get() is called only in two places: in gpio_chip_get_value()
> and in gpiochip_get_multiple() where the existence of the gc->get()
> callback is already checked. It makes sense to unduplicate the check by
> moving it one level up the stack.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



