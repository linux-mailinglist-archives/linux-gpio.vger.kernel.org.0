Return-Path: <linux-gpio+bounces-22495-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B66AEFBB5
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 16:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B0E61C07FAC
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 14:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E614279DB5;
	Tue,  1 Jul 2025 14:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FXP8Ee1T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CED027933C;
	Tue,  1 Jul 2025 14:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378738; cv=none; b=LCnNsvI1MQKeV03CFai6molHHz0Ls26YvaTvvngABE6/dnMcxMvxEuUo1PoBtnlrYTr7oBb5YLXgfR1cErNW69pF0zu4gEAZTAfTsqrXWEbWb1MSEmzrCHsFFVCXDxzTAIKoVfwBtbVV5S7YiZQiVhlAHPpGOygOAvwnUf+dq7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378738; c=relaxed/simple;
	bh=jqbR7/NyDmIF13xvO+mFNOe/6ZhXOEw8ed4ZA0zowqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H62ow41cvH1bTFJnLcthz70VymQynIMHbC5KSOgnq4wtPj73rYiPG4ADvbELLKIwR2aPjyZ3oXmzrHVo+33dNXEBm75X3RylnAymZNUfRS4LX4yFNSY6zu1AlnjJPwUyGnjjcHK/Aqf15OHuLW+aMyrA+5GkVSEpMH9N0zFT0Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FXP8Ee1T; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751378736; x=1782914736;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jqbR7/NyDmIF13xvO+mFNOe/6ZhXOEw8ed4ZA0zowqQ=;
  b=FXP8Ee1TLzPllFma17UaLcKHTmb9I5i4oZB2BGtbAPF76nBtn/Gzsx0d
   mbMTNwwbfK2IMqKR2m+dLEloJEIB39DUFiz+IBLVAsFTmuZ6gPy625FQr
   ztz2uTLtL1gLXg9RG6AdUIAaKzpvtvramdeCbGccvXYQA5oVNE66zD1Ua
   lVCWb1HAcDZ+5o7U3H5tNoc7XgLtAgrpcBMjD4ZK+kNqvXCwCL2dX7Ema
   F4vpIwd0b2O+KGY8Md66zKahHsA5oqumWiuYouHhz5R/d7uOA/u7wwKZX
   zpmnzn+EBJSnmvHKRdp+2/L7M26IHbel7zJ7SnRNUDuOmVyuax5/ynxn3
   g==;
X-CSE-ConnectionGUID: Aj2OjS9EQhqrsyxYyhOhew==
X-CSE-MsgGUID: Rloer8fHTfGooRGxgsKNCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53605232"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53605232"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 07:05:17 -0700
X-CSE-ConnectionGUID: LZHszaDtS4WELO/lcmv3iw==
X-CSE-MsgGUID: WodDSK+ESXC/NyEOSbZLSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="154507854"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 07:05:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uWbbj-0000000BcA1-0rlF;
	Tue, 01 Jul 2025 17:05:11 +0300
Date: Tue, 1 Jul 2025 17:05:10 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Kent Gibson <warthog618@gmail.com>,
	Jan =?iso-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 00/10] gpio: sysfs: add a per-chip export/unexport
 attribute pair
Message-ID: <aGPrFnDxG4W7S9Ym@smile.fi.intel.com>
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jun 30, 2025 at 02:37:07PM +0200, Bartosz Golaszewski wrote:
> Following our discussion[1], here's a proposal for extending the sysfs
> interface with attributes not referring to GPIO lines by their global
> numbers in a backward compatible way.
> 
> Long story short: there is now a new class device for each GPIO chip.
> It's called chipX where X is the ID of the device as per the driver
> model and it lives next to the old gpiochipABC where ABC is the GPIO
> base. Each new chip class device has a pair of export/unexport
> attributes which work similarly to the global ones under /sys/class/gpio
> but take hardware offsets within the chip as input, instead of the
> global numbers. Finally, each exported line appears at the same time as
> the global /sys/class/gpio/gpioABC as well as per-chip
> /sys/class/gpio/chipX/gpioY sysfs group.
> 
> The series contains the implementation of a parallel GPIO chip entry not
> containing the base GPIO number in the name and the corresponding sysfs
> attribute group for each exported line that lives under the new chip
> class device as well as a way to allow to compile out the legacy parts
> leaving only the new elements of the sysfs ABI.
> 
> This series passes the compatibility tests I wrote while working on the
> user-space compatibility layer for sysfs[2].

It seems I never expressed my overall opinion about this. I think the poking
sysfs and making it working with a new schema won't solve the issues that
character device was developed to target. If so, doing this just brings yet
another broken interface. I would be happy to be mistaken!

If I am mistaken, I would like to see a summary here that explains that clearly
that the new sysfs approach does not inherit design flaws of the original
implementation.

> [1] https://lore.kernel.org/all/CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com/
> [2] https://github.com/brgl/gpio-sysfs-compat-tests

-- 
With Best Regards,
Andy Shevchenko



