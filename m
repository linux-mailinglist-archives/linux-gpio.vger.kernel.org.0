Return-Path: <linux-gpio+bounces-19031-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB0AA9232D
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 18:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57A8B19E7D02
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 16:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA0A255244;
	Thu, 17 Apr 2025 16:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BL0cGvRi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6812E254B11;
	Thu, 17 Apr 2025 16:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744908903; cv=none; b=lS02ic3pFXIvcKc2QWAhhKPgTgRYcmLDXIksjZqH+irGW1cwD5xGnnTE9rIPALzb0IQOW6JLF/jxjTcjd3b3vZunJzblc6/TkZSE7vFLyOYYcNpvZ/n4lx7Iwp/sNeXGd5NxsJrnBU+SWbvtufWhLUS4JCobjNx9WPyp6ANONNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744908903; c=relaxed/simple;
	bh=UJtSO3yMvSEim1jitNFZfnL41L1kkq4cSwWmKFb9HCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRRs320hzmzvQ7KVxM20Hu/xj0pRRoBJn5Tm7H98kuVzE7ktbVy6mFDYsdb18rZ0fVMg9N4Ya9dR1aaUgkAcjmqRazaE5H5CfhUb3tNB3gd1N1Cwum75VgOWeORbYzcfttWZZCgW0aKX8VbmleXc44Ur3icbjighnfF7JKv0nyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BL0cGvRi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744908902; x=1776444902;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UJtSO3yMvSEim1jitNFZfnL41L1kkq4cSwWmKFb9HCw=;
  b=BL0cGvRimYKWfGrm2IFwxuS30+z70uJqyVjGkqTx7v6fgvrScPhrMB3I
   /oXIaC7JgbimbjWLIs54M6aFlpSvvM0nXuoBmnC/yoRiwxA8VTrdMiSeO
   oV6QAMKTPdpiRFudmiYSep6lhPGjw4xZ1C160nO1XSA8rcngz23WltrzZ
   R4KNlCXYaBdhBBvdMfZGWn70Um+XP4czGgRmexXfLq7pNbYgWxvorxi6w
   98cPG4UzTYm0y5KtlCZu8NE0xv8P1T4RUGWQ8ph0awHRWJcNVMRHhuUn9
   ejYXZsbb310aYp/OfPjLN60DR/I31BEjJsLi6Z7DpKli3WrLrdeDmf8DD
   A==;
X-CSE-ConnectionGUID: ZBJqG2IjSRyEQyiTW6BKOg==
X-CSE-MsgGUID: aZReXIzOT3y0ijoXPB+2mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46676674"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="46676674"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 09:55:01 -0700
X-CSE-ConnectionGUID: 1ph/G9w9Se+vHawsJT0RXQ==
X-CSE-MsgGUID: KLRhZ+U1R/inljDuL7fNng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="168054428"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 09:54:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u5SVr-0000000DG6U-26De;
	Thu, 17 Apr 2025 19:54:55 +0300
Date: Thu, 17 Apr 2025 19:54:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw
Subject: Re: [PATCH v3 01/10] gpiolib: add support to register sparse pin
 range
Message-ID: <aAEyXxgcU4wN3QXK@smile.fi.intel.com>
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com>
 <20250416-aaeon-up-board-pinctrl-support-v3-1-f40776bd06ee@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-1-f40776bd06ee@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 04:08:09PM +0200, Thomas Richard wrote:
> Add support to register for GPIO<->pin mapping using a list of non
> consecutive pins. The core already support sparse pin range (pins member
> of struct pinctrl_gpio_range), but it was not possible to register one. If
> pins is not NULL the core uses it, otherwise it assumes that a consecutive
> pin range was registered and it uses pin_base.
> 
> The function gpiochip_add_pin_range() which allocates and fill the struct
> pinctrl_gpio_range was renamed to gpiochip_add_pin_range_with_pins() and
> the pins parameter was added.
> 
> Two new functions were added, gpiochip_add_pin_range() and
> gpiochip_add_sparse_pin_range() to register a consecutive or sparse pins
> range. Both use gpiochip_add_pin_range_with_pins().

...

> +	if (!pin_range->range.pins)

This change looks pretty nice, but can we use positive conditonal?

> +		chip_dbg(gc, "created GPIO range %d->%d ==> %s PIN %d->%d\n",
> +			 gpio_offset, gpio_offset + npins - 1,
> +			 pinctl_name,
> +			 pin_offset, pin_offset + npins - 1);
> +	else
> +		chip_dbg(gc, "created GPIO range %d->%d ==> %s %d sparse PIN range { %d, ... }",
> +			 gpio_offset, gpio_offset + npins - 1,
> +			 pinctl_name, npins, pins[0]);

With that done,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



