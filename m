Return-Path: <linux-gpio+bounces-24164-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87001B20955
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 14:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 491273B6553
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 12:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46F12367CC;
	Mon, 11 Aug 2025 12:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5XNTjBH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149182E370F;
	Mon, 11 Aug 2025 12:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754916749; cv=none; b=iIJDU6ZgpePnlyO9fvSAHDQo3JxdXodbQ32S7noahDQlY6aYCR95/IN0Vszk3HVw6Bbi8XzXnu5Z/2TLHXRX5dnftdMPoHK/4eg/VxB2vw8hGpIv8LE+V+mw84o9kfMBKuKcnXkJ5NjgyWTY8xWLurf5d0Aq7td3zSXij8TC3r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754916749; c=relaxed/simple;
	bh=sKcDxReHvOjMWuRz/JJIjfs2GC55bod9+lD6K9tF16k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEz3z8jrRELXMwdpxVQazfohNrXtoAzOz+CzSuhuI6NrFRz9GBzfP0aI9ZSYcP+Ub5Rq9c/H84EjRUEtjUbWXNZtsAUYpkrWixIJAUvunkgim+v+yDYRy7ptYJgoX5B27N7VXe7bYHTx1bRcDs7YQzQCUcMTIaIccuhXj/ErsgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5XNTjBH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754916748; x=1786452748;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sKcDxReHvOjMWuRz/JJIjfs2GC55bod9+lD6K9tF16k=;
  b=S5XNTjBH7Y2WCbXYIKDTjDR5mrAnUZYYcWXcR+pT4v2jMTTZ/nEEbiAy
   vOA9+9c/eK/lCZzRaPf1Q1SlxG0VVFwzZd0VXCotiRIOmAyk6nuRvKU5I
   lj8P/VFcgw+ifwgumVxpykW3K69c45WAdzKGItOdB4V+Wlc87XBcL4M6k
   o6kdHfeWuTfzZuR3nnsiMNxJfQqubjnu6z6HtYulSUOVLv8QhrZBRxYR6
   XzPJz4ZHUxbX8ce31UPWbOGIm0mLTQTST0/PT51vKbqQdHr14FLEm7UUR
   YMvKg9EZyxOQGTc1PShbOKL6CaB566gXB2KNGOpXTfVEosj8WoMuYdUdA
   g==;
X-CSE-ConnectionGUID: b6lVElART9eyo31z69buCQ==
X-CSE-MsgGUID: +d13Y+FPSUWis5NArG2mbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57089243"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57089243"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 05:52:27 -0700
X-CSE-ConnectionGUID: xFz4n3B8RWuruOLSnyLmXg==
X-CSE-MsgGUID: bBnKF4ZXRJqsXLbK/cPS6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="166709515"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 05:52:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ulS0i-000000052c0-0OQj;
	Mon, 11 Aug 2025 15:52:20 +0300
Date: Mon, 11 Aug 2025 15:52:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/21] input: gpio-keys: make legacy gpiolib optional
Message-ID: <aJnng9z9pUTFI49x@smile.fi.intel.com>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-10-arnd@kernel.org>
 <b7e97aa3-8f2d-4a59-8a38-577717404865@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7e97aa3-8f2d-4a59-8a38-577717404865@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 11, 2025 at 01:34:43PM +0300, Matti Vaittinen wrote:
> On 08/08/2025 18:17, Arnd Bergmann wrote:

...

> As such, this patch seems Ok to me, you can treat this as an ack :) This,
> however made me ponder following - is this the tight way to handle the
> power-button IRQ? I don't see any other MFD devices doing this in same way,
> although I am pretty sure there are other PMICs with similar power-button
> IRQ...
> 
> I see for example the "drivers/mfd/rt5120.c" to invoke
> "drivers/input/misc/rt5120-pwrkey.c" instead of using the gpio-keys. This,
> however, feels like code duplication to me. I'd rather kept using the
> gpio-keys, but seeing:
> 
> git grep KEY_POWER drivers/mfd/
> drivers/mfd/rohm-bd71828.c:     .code = KEY_POWER,
> drivers/mfd/rohm-bd718x7.c:     .code = KEY_POWER,
> 
> makes me wonder if there is more widely used (better) way?

FWIW, on Intel platforms that use power button by PMIC we add a special driver
for each of such cases.

-- 
With Best Regards,
Andy Shevchenko



