Return-Path: <linux-gpio+bounces-18569-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9989A827F8
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 16:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A52BB4E1874
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 14:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6F7264618;
	Wed,  9 Apr 2025 14:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uc5iuJ6S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EF61E489;
	Wed,  9 Apr 2025 14:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209163; cv=none; b=uTn5vHDRi8wqLeiXcqqFxPfz2BhqGchSb1Q83ZardOb/040abZe+1ApZ1JxiHB1mox+k81zSiv8lq2NwkPtS1UH5gGGKiGuxjbvWj6b5YyEN2JpsFfJWQpQtiN/YX4ZfXzI/jfy+96gWjvNn7Jb7wgIPJ3+pMGw6iXrjyuSb+gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209163; c=relaxed/simple;
	bh=/B7ieXeyq9Pl8GC2SXs1ZShYI/s9cw8vS3i86aaHvW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GkTHwXJoQma1kv40m0GJ52PyNfyQ9yg+eJfIuj115N8Sb+IfoyixnL/AXg5STdbD9pcmL61ytN3ooCglvWCBMDec0sQXCH4JCdXP45hmVzHqNPmMS0+LzfpKr9T5oy7jJAwUR8ed2b8/wmp3KBdNKtK37QBi9JQxgbKgP36pJRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uc5iuJ6S; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744209162; x=1775745162;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/B7ieXeyq9Pl8GC2SXs1ZShYI/s9cw8vS3i86aaHvW8=;
  b=Uc5iuJ6SBeFzTwvGvYzha0/0+W4x3FwbCDqUXtZ7VBploTM1Gx86vWcb
   LYBi4tF2sLMfclY2ETHDdICB3rrzFu/FHgZ7CLNSQKGLWcZy0UuTU9bho
   lEYNruZFRdCDSz0EjwtfByoOtx66ewsXK+DwbjOiFkPj54Acuwwe/FVPB
   b8AOYOSDfV/GsZH5t2IvtwkG4i6gEO16OZQ8J3bzh3xsO2opUkXkMZNnI
   QJ/RZwYMpljH4v1KO7k5y7lJ9mcY0L2a+i3XRVSATBK8pluxKI6oXtqex
   iLYREjr7plyuWZc2kINcsnpDjWTIKRAbj7k0Lk2fe/MW9zXvquodA8Iig
   A==;
X-CSE-ConnectionGUID: H+kyrjEOTBef0eqDsaaHeg==
X-CSE-MsgGUID: jrpn5SmnTGmjz4jgjU7ziQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="48391947"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="48391947"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 07:32:41 -0700
X-CSE-ConnectionGUID: I6hb22jTQ9KXDdtj7qDjCQ==
X-CSE-MsgGUID: bl4dSxpqQRyIHMCXZQUaOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133469535"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 07:32:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 97127554; Wed, 09 Apr 2025 17:32:37 +0300 (EEST)
Date: Wed, 9 Apr 2025 17:32:37 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/2] gpio: provide gpiod_is_equal()
Message-ID: <Z_aFBfjb17JxOwyk@black.fi.intel.com>
References: <20250407-gpiod-is-equal-v1-0-7d85f568ae6e@linaro.org>
 <20250407-gpiod-is-equal-v1-1-7d85f568ae6e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-gpiod-is-equal-v1-1-7d85f568ae6e@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 09:08:14AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> There are users in the kernel that directly compare raw GPIO descriptor
> pointers in order to determine whether they refer to the same physical
> GPIO pin. This accidentally works like this but is not guaranteed by any
> API contract. Let's provide a comparator function that hides the actual
> logic.

...

> +bool gpiod_is_equal(struct gpio_desc *desc, struct gpio_desc *other)
> +{
> +	return desc == other;

I think it's better to have the one checked against NULL. That's how
comparators make more sense, see, for example, 1b1bb7b29b10 ("drivers:
base: Don't match devices with NULL of_node/fwnode/etc").

Ideally it should be IS_ERR_OR_NULL(), but we have here a principal disagreement,
so this might be yet another (buggy) function in GPIOLIB.

> +}

-- 
With Best Regards,
Andy Shevchenko



