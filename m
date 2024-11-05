Return-Path: <linux-gpio+bounces-12569-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 997749BCF98
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 15:39:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 521651F2319D
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 14:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45D91D9593;
	Tue,  5 Nov 2024 14:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iq+/qsKa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0857033080;
	Tue,  5 Nov 2024 14:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730817584; cv=none; b=W1NuyASLU5fnNrPvKL1OhFML/ytCIjfzqdP4p8Gd/Ft/m0s3gRN2QNNesL3N8j4WwQIbMt4Lb7HJRvtAxUZmPgGU1JiPJHySGiFV59nZhJvkVikwu5Dhvxgo4V3FiaExbm6BlKe7kAVQziNbXiq4fMu9tTNroYytkvbMQYqys2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730817584; c=relaxed/simple;
	bh=2m/vcaMRZ9wSjJ1Z+5F0MvLfg8dFHQeTrXPjIHVm7ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DWJV9EL4Qp9hjGG+x0SIp8xOlSeMnSModB5OvISbmo9fsjYUWo0+6Q8HjMyadNIhHT33bng66ry/MYgIN7LFjuorcxPYEqnBSUlfxuDRAoJHwdq6sUlCclL4FXejbfEn2j7ztz028jPYiBQMxBc7Q+rmYjBpumzG27m0NpQBVLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iq+/qsKa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730817584; x=1762353584;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2m/vcaMRZ9wSjJ1Z+5F0MvLfg8dFHQeTrXPjIHVm7ws=;
  b=Iq+/qsKaDkJTcdeeDmwWi5sCfEkmm3rYTagiB3BUry7Rs8K6mkIojPwm
   VmgL38C2jrLb45WPsywD5AvqividM8A7HL0ur+ycHd0kQTD5wCfyNDRGM
   +lF3gzi+gftf9xLxMW6EIW/INv7BOvO/wwz5BfHBbldn34v+rS/QkKFdP
   Oluol/ymq4iKXTobsQf2lePv9X0X4Ep+DvHu3bEMDFWOJYsFJOr5wLm6c
   hvPYxU14t5LfRh5u1DCiLfgB1PXpu3KOZ/NpzRZNH7u3n5IcRpBKjja/O
   dKeAhYmLOcG/Mc8GSqmC0Hau3eKvB3jm0SLfEkRAEza32vbgFN7R8a9LS
   Q==;
X-CSE-ConnectionGUID: akWqLfkhQd2u/OZrcjOudw==
X-CSE-MsgGUID: 7xDATENVTCm4YwvR4XqZnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41115570"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41115570"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 06:39:43 -0800
X-CSE-ConnectionGUID: 9sw2g9MUQPm/QHgsQ7pVbw==
X-CSE-MsgGUID: 1KsrsWqCTZGYgNPx0w+5/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="84164389"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 06:39:41 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t8KiY-0000000BQve-221V;
	Tue, 05 Nov 2024 16:39:38 +0200
Date: Tue, 5 Nov 2024 16:39:38 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sai Kumar Cholleti <skmr537@gmail.com>
Cc: bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
	mmcclain@noprivs.com, stable@vger.kernel.org
Subject: Re: [PATCH v3] gpio: exar: set value when external pull-up or
 pull-down is present
Message-ID: <ZyouKu8_vfFs20CB@smile.fi.intel.com>
References: <ZykY251SaLeksh9T@smile.fi.intel.com>
 <20241105071523.2372032-1-skmr537@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105071523.2372032-1-skmr537@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 05, 2024 at 12:45:23PM +0530, Sai Kumar Cholleti wrote:
> Setting GPIO direction = high, sometimes results in GPIO value = 0.
> 
> If a GPIO is pulled high, the following construction results in the
> value being 0 when the desired value is 1:
> 
> $ echo "high" > /sys/class/gpio/gpio336/direction
> $ cat /sys/class/gpio/gpio336/value
> 0
> 
> Before the GPIO direction is changed from an input to an output,
> exar_set_value() is called with value = 1, but since the GPIO is an
> input when exar_set_value() is called, _regmap_update_bits() reads a 1
> due to an external pull-up.  regmap_set_bits() sets force_write =
> false, so the value (1) is not written.  When the direction is then
> changed, the GPIO becomes an output with the value of 0 (the hardware
> default).
> 
> regmap_write_bits() sets force_write = true, so the value is always
> written by exar_set_value() and an external pull-up doesn't affect the
> outcome of setting direction = high.
> 
> 
> The same can happen when a GPIO is pulled low, but the scenario is a
> little more complicated.
> 
> $ echo high > /sys/class/gpio/gpio351/direction
> $ cat /sys/class/gpio/gpio351/value
> 1
> 
> $ echo in > /sys/class/gpio/gpio351/direction
> $ cat /sys/class/gpio/gpio351/value
> 0
> 
> $ echo low > /sys/class/gpio/gpio351/direction
> $ cat /sys/class/gpio/gpio351/value
> 1

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



