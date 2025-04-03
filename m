Return-Path: <linux-gpio+bounces-18205-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 278C8A7A464
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 15:56:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F9321754AC
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Apr 2025 13:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C6724E4A7;
	Thu,  3 Apr 2025 13:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SpouTwDT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC41210FB;
	Thu,  3 Apr 2025 13:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743688483; cv=none; b=DST36k3pD9I9eqqj3mj/g7ovJ65WR+c7AyA/02Q/Uhmmb1mvq/nTJCw1QSz735wGSkibuZUjoPusO5VJ0xWznNbgPEVKHJPD9lre1F7c9125j7gYR7spnFLFwylNU6NQfRxHPGQ8JSNRXjCzCokYelUidO8wngzV9jwFyQ5Kj0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743688483; c=relaxed/simple;
	bh=C/2lNKCtcMdL2waYvteBoPKvVh6u11IOio+TDWQ94BU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JN2H7A8H8UTLY8GOHX13TGerg6iR6h+thErGBaMIlXF1kwrvc0aff/PnOnDv+Vy2DKU80ncSxb/EjKKpysQj8SRJ2mBBRGKgOOE3C/A+zefJt8klZSt8ezIwpGwNPpeOI762sGiKJcjBt5vaKJDZJsZmNXDM3P19MLSrhnuH1Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SpouTwDT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743688481; x=1775224481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C/2lNKCtcMdL2waYvteBoPKvVh6u11IOio+TDWQ94BU=;
  b=SpouTwDT4/7Wu4khE2E1HjLDkTqvpOYYxKfewXyVY+0xkBzb3eSI1FwS
   ymX3+5aspHnbLARwOXZlZLBR+D+G7RlPRrLZMTiN5B4UPz2u3WoLs3YSp
   MSqZUYxqrQo6rg70rxaHArmlqE3CKSWR5I9Xlyaltgsd0tykHIiCZ5j/H
   c1paV+uY+37Tasx3U9HX1quLILQhpc0XZLA9Snc7f6KTYY1L8hjSxXTIf
   j9L3w9SpKz5FoByDrbQ036AORXIT2WHtUeqK4iv8LeQmAUPndbnIXh9by
   N7myCawB1A0SbVzKqYdix0jIdlaLRQbtfg3odw6v4XW2xImXkThYlC6og
   w==;
X-CSE-ConnectionGUID: CH1R2TWAS7WWyDyOUfmAtQ==
X-CSE-MsgGUID: sYkCggyuQ8aYD1hUNPlkDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="62498719"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="62498719"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 06:54:40 -0700
X-CSE-ConnectionGUID: rjfWbgZxSE+kbe/u45enGg==
X-CSE-MsgGUID: 5L00g1VcQsq2DcyLzWP96A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="127869992"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 03 Apr 2025 06:54:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 66BF8129; Thu, 03 Apr 2025 16:54:34 +0300 (EEST)
Date: Thu, 3 Apr 2025 16:54:34 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Marek Vasut <marek.vasut@gmail.com>, stable@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] gpio: pca953x: fix IRQ storm on system wake up
Message-ID: <Z-6TGnGUEd4JkANQ@black.fi.intel.com>
References: <20250326173838.4617-1-francesco@dolcini.it>
 <174368202234.27533.1000100252310062471.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174368202234.27533.1000100252310062471.b4-ty@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

+Cc: Geert

On Thu, Apr 03, 2025 at 02:07:05PM +0200, Bartosz Golaszewski wrote:
> On Wed, 26 Mar 2025 18:38:38 +0100, Francesco Dolcini wrote:

> > If an input changes state during wake-up and is used as an interrupt
> > source, the IRQ handler reads the volatile input register to clear the
> > interrupt mask and deassert the IRQ line. However, the IRQ handler is
> > triggered before access to the register is granted, causing the read
> > operation to fail.
> > 
> > As a result, the IRQ handler enters a loop, repeatedly printing the
> > "failed reading register" message, until `pca953x_resume` is eventually
> > called, which restores the driver context and enables access to
> > registers.

[...]

> Applied, thanks!

Won't this regress as it happens the last time [1]?

[1]: https://lore.kernel.org/linux-gpio/CAMuHMdVnKX23yi7ir1LVxfXAMeeWMFzM+cdgSSTNjpn1OnC2xw@mail.gmail.com/

-- 
With Best Regards,
Andy Shevchenko



