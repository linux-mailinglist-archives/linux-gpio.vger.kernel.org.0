Return-Path: <linux-gpio+bounces-19874-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBF6AB1808
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 17:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E64DB228E8
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 15:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14745237170;
	Fri,  9 May 2025 15:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GiC2aRDy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26583236A8B;
	Fri,  9 May 2025 15:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746803288; cv=none; b=RMhPHp48rklkQHk72wzIJGZPMaWQ4gDBNQvqP/DRLa7BwjM4ujGfgqDREB9GU6Kxol3uPOJV/vbi7x2rfaMKwDd9U7LtyGsCb2s6SKzmGN6aC9CylSdsp80I5k9HLdVLVqvNqf8aX4J4PhU5KrhF94TJq4bN//eQvTqff+22sWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746803288; c=relaxed/simple;
	bh=TWki3/gylY/7gFxlIu6QTF0NmeMDbM0qxicq2tmKpIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbbbCAET/IhEwWCXmIwdxmY+xIi69rIt7gPzw1S5AOdof6w3VC+5IqdIKPEh0Z9ZecgeGkneFBTAHipR6r4q3I5WNhTO6bIJdfCBD+GU0TT10JdGkWqsUy9R5Xu6M/7z/nkirGPiO28XCEegmPkT+i3BlZe5bIg9NBzsi2Q8QX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GiC2aRDy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746803287; x=1778339287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TWki3/gylY/7gFxlIu6QTF0NmeMDbM0qxicq2tmKpIk=;
  b=GiC2aRDyb+lN7R9LnaqJVxSdJQkSSGUx2CEQFoQ4kWh+hISC7IYQd8f2
   LVudUWyWNPD/r2Fiasbc8Rc/ThNRD0WVVRqjkSrDlVjmx58+c8AwNOR12
   qk0PtAjgkA7GsfS/4+3uoief5wIlawkDHtr6438y4t6n3W2vA20Oim2vB
   xsplDVAz6QX3ZV0kedBTwKjo0eGpUy75GLeMyh+T7oOF/DI6EYOOVHeiW
   khHqGus1QzGdSnbC08aRX5+oGqmn2g8GYVYlehFZHLuIvCFm1zQgnZqVq
   Fa6ejD9NsPm5E0ru3FeJ8ENHnoRBXPD8kQ80zKTPdgVQR3tz36k4QGNGC
   A==;
X-CSE-ConnectionGUID: pIOmWqmTS5+kgurUaE0uVQ==
X-CSE-MsgGUID: EMwRv245Rsehwuunb/Au+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48505428"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="48505428"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 08:08:06 -0700
X-CSE-ConnectionGUID: FmBArGhXTIW8b1NR/m7elQ==
X-CSE-MsgGUID: PAqN++VwQvSMIs0mmv3vDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="137632081"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 08:08:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uDPKT-000000008BQ-1Bn3;
	Fri, 09 May 2025 18:08:01 +0300
Date: Fri, 9 May 2025 18:08:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Marek Vasut <marek.vasut@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>, stable@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v2] gpio: pca953x: fix IRQ storm on system wake up
Message-ID: <aB4aUAVONloIK0E0@smile.fi.intel.com>
References: <20250509141828.57851-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509141828.57851-1-francesco@dolcini.it>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 09, 2025 at 04:18:28PM +0200, Francesco Dolcini wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> 
> If an input changes state during wake-up and is used as an interrupt
> source, the IRQ handler reads the volatile input register to clear the
> interrupt mask and deassert the IRQ line. However, the IRQ handler is
> triggered before access to the register is granted, causing the read
> operation to fail.
> 
> As a result, the IRQ handler enters a loop, repeatedly printing the
> "failed reading register" message, until `pca953x_resume` is eventually

`pca953x_resume` --> pca953x_resume()

> called, which restores the driver context and enables access to
> registers.
> 
> Fix by disabling the IRQ line before entering suspend mode, and
> re-enabling it after the driver context is restored in `pca953x_resume`.

`pca953x_resume` --> pca953x_resume()

> An irq can be disabled with disable_irq() and still wake the system as

IRQ

> long as the irq has wake enabled, so the wake-up functionality is

IRQ

> preserved.

With above fixed,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
thanks!

-- 
With Best Regards,
Andy Shevchenko



