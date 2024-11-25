Return-Path: <linux-gpio+bounces-13249-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B37BE9D7C21
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2024 08:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39717B2135C
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2024 07:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D46B155747;
	Mon, 25 Nov 2024 07:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="el8Y6miP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DC52500CD;
	Mon, 25 Nov 2024 07:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732520970; cv=none; b=S2x62Zmt4afbnIIKQIJchMxVqYEEIS+pDsZ1DM9ejNpi+gXtlbl9PofEr4MGEqYpESu99N/vLMBoMgP1ory9aI3WuKVu5X5XsQFWlM4H0d7m+yXsG2juLFLV354ZHpppXwtsWjMufJSrhpEvlKdXRqnJTH7JV0u45b/W7G/N2JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732520970; c=relaxed/simple;
	bh=Q9pwQZ367/dYdTXJasRylk1GyYiolNOY2J8AWlFyzwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F50a61czkaJ7KiRmhhr1rbQcwBuZ1CCF8H140hDaekrrikaowaLFXbYoh44E4zfd54SQB8SyNC+4NhLe2clVH2UsRIXK1H+mJF24FLeptxfDsXqKZmrTGYSYHkkkAU3Y9ZrD9MVnvSai909IlUERvt1IMpHnsL56A8ksTsR+P8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=el8Y6miP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732520968; x=1764056968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q9pwQZ367/dYdTXJasRylk1GyYiolNOY2J8AWlFyzwE=;
  b=el8Y6miPxY0C37BHWkIBdk5kLS4dSNquIddkqTV3xmiCC41e2uI6oh0b
   H+M1Kjb51ThO0ab3ruMl2KHhu8z06SJsE2dIQ9/d7NGLTjgpt3SQPWagq
   UHuu9Zg1Um9Q18jPWiSHV7Q9fsxp/T3AwwFyjjf798AIUXd8bkn1767dl
   w5DbRH/Flk5K1YBUfiXUQ28vZ4IdaJPKQyQPG8hcznR4fnkGXKvk6ZrYa
   foYW2YnRq5w99hWTfKtloYWR1XL8ARftJOdhMHzYSdICn5V54gcR88ldO
   zykL0LGofx0BPnf09P3LBNit0Z1xEKmC/txSg4NSiMkX9L63/wm4HMQ1R
   w==;
X-CSE-ConnectionGUID: 0TXTjPXJQNudr5DmyHKGRQ==
X-CSE-MsgGUID: Ke2qRtTQQu647/b0M8xDgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="32740347"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="32740347"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 23:49:28 -0800
X-CSE-ConnectionGUID: pxY7O9fcSuGdYlHOInkmPg==
X-CSE-MsgGUID: R4o3wtvdTCW5wO1mRjziiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="122036046"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 23:49:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tFTqU-00000000fmp-1knr;
	Mon, 25 Nov 2024 09:49:22 +0200
Date: Mon, 25 Nov 2024 09:49:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Raag Jadav <raag.jadav@intel.com>, gregkh@linuxfoundation.org,
	linus.walleij@linaro.org, mika.westerberg@linux.intel.com,
	broonie@kernel.org, pierre-louis.bossart@linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 1/5] devres: Introduce devm_kmemdup_array()
Message-ID: <Z0QsAm3FdZDJ8kY0@smile.fi.intel.com>
References: <20241123200527.7830-1-raag.jadav@intel.com>
 <20241123200527.7830-2-raag.jadav@intel.com>
 <Z0LPyMed-4a8cajD@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z0LPyMed-4a8cajD@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Nov 24, 2024 at 07:03:36AM +0000, Dmitry Torokhov wrote:
> On Sun, Nov 24, 2024 at 01:35:23AM +0530, Raag Jadav wrote:
> > Introduce '_array' variant of devm_kmemdup() for the users which lack
> > multiplication overflow check.
> 
> I am not sure that this new helper is needed. Unlike allocators for
> brand new objects, such as kmalloc_array(), devm_kmemdup() makes a copy
> of already existing object, which is supposed to be a valid object and
> therefore will have a reasonable size. So there should be no chance for
> hitting this overflow unless the caller is completely confused and calls
> devm_kmemdup() with random arguments (in which case all bets are off).

Don't we want to have a code more robust even if all what you say applies?
Also this makes the call consistent with zillions of others from the alloc
family of calls in the Linux kernel.

-- 
With Best Regards,
Andy Shevchenko



