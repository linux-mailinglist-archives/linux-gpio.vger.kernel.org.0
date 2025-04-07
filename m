Return-Path: <linux-gpio+bounces-18327-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1771A7D8F3
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 11:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7DE2188712B
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D90322A4EE;
	Mon,  7 Apr 2025 09:02:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C48414F123;
	Mon,  7 Apr 2025 09:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744016536; cv=none; b=j9tGSCjAlEzO0vB8QOK67UKyfKxyWz17Ml9nbyF/YFioqB3tkrDLv30YJzFZ4xG3NdED0E+uX0e9wIMWydv5CNi/InqJBpBTzoDz9wdNvMbxsGPm4D/tp4RwkKEM8CZFGfl/GrhuyNeKyv/xXU48ka1QDM9hrVojgBKQmLqZgeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744016536; c=relaxed/simple;
	bh=eVOVBrlz3Cl7Qim70VH0GDhtOXI/yh4jfU2ytKhqAy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VzHE10g6oxFvTEoXUlbpPFX5e4ZM2RKfd3bvllQCpALpPmBQ6Iu6/Sqq9M26IxezwcVybu8FWpoaQelnp/HQ+vwhsNJ2euaPDPJzaL0h91yXm9jTLE1+PVH3FMTz7BzCHPQahr18So1esNOxLP649Cc0pD7oGkDe1pZN4JXPkSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: fHumtPQ7SVCUTeiFFeCwiA==
X-CSE-MsgGUID: i/xtGRNgRM63hlYmzXjKOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="49043893"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="49043893"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 02:02:14 -0700
X-CSE-ConnectionGUID: jeoeFzTPQjqf00fyQ0Oe6A==
X-CSE-MsgGUID: JWC/ymyCRbKiOyWyoZ2yeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="128220051"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 02:02:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u1iMq-0000000A0lL-3CZW;
	Mon, 07 Apr 2025 12:02:08 +0300
Date: Mon, 7 Apr 2025 12:02:08 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Peter Tyser <ptyser@xes-inc.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 06/12] gpio: f7188: use new line value setter callbacks
Message-ID: <Z_OUkBr4ayDimp5Z@smile.fi.intel.com>
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
 <20250407-gpiochip-set-rv-gpio-part1-v1-6-78399683ca38@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-6-78399683ca38@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 09:13:15AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.

...

> -static void f7188x_gpio_set(struct gpio_chip *chip, unsigned offset, int value);
> +static int f7188x_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +			   int value);

Same comment, I suggest you to correct editor configuration to make sure
80 is 80 and not seventy something.

...

> -static void f7188x_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
> +static int f7188x_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +			   int value)

Ditto.

...

But personally I would leave that archaism in the last decade or even century.

-- 
With Best Regards,
Andy Shevchenko



