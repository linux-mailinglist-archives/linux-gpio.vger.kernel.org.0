Return-Path: <linux-gpio+bounces-19036-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EE3A9241D
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 19:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 779167A631B
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 17:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC703255235;
	Thu, 17 Apr 2025 17:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H8MD+GSM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9865F1DE8A0;
	Thu, 17 Apr 2025 17:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744911290; cv=none; b=crLAwXIhUeqTOFbU6yHSSXPTcV8MZRPDRstVcZyQGfxkMu7/nPxiea+8lur9U3MqCzbLD1BG3RGi+z5vuK7azxGW+2Zti74OjzsNfXblS981SDu3X6J28Ad3vXnexoiw9oCPNdZr9+6RLX45jNGgeG2laLoxE4vo8CWSCmy/0FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744911290; c=relaxed/simple;
	bh=EHZc5LMdgJ00DcUsoV0jPdgjkEA6ta40k6qpttoth8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVhq1gsqNWW4kW2Gru63uH27cMuBMVxEWMqQheEY+5bTT5GoLbFWk6tpLA+g2Mx8wmzxgQhIdWSU1zJAb/nzCbr1wsh0SX8VuvPklJR2OeY7Sbz2+6q0b91et0TmrITH5fxO8JV7X57LLU+twmMi0KHN+oSqtujwprkP94pViz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H8MD+GSM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744911288; x=1776447288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EHZc5LMdgJ00DcUsoV0jPdgjkEA6ta40k6qpttoth8o=;
  b=H8MD+GSMngBR4Cr5xknuW7XFKp7Xl3cobwvY8qQKhV+KeiRf+OzU2vNm
   TH6vrShrciqQ3FAn3rmrLpRQQU2EUnQRhcEMo6gAjap3+Ypl9BpNPIn+a
   vq2TcefJomGgthWLJVPw344ppMIgjfPm7thwdl5wzRzlPIesBwvjZbHP3
   ZnTN/2OT9J+eDlsnAGEgp6e8+Pzozp21A8LwmVSxyzIVXFSPr2Y5kSGM/
   7tnOEtGq/RrIo6wxoJj1W/nksEPW5/JX0qDwl/onc4GheIL3coy9MGIJr
   AI/bfdQ5EGdTHjII7iIlN2MA7rVSMkAD/7ih2di7JPEU8gcA4puo6zH0M
   g==;
X-CSE-ConnectionGUID: c351F0N2Q8qmZSNC1cJ+bw==
X-CSE-MsgGUID: 34oQHdL8TXifUSbbifr7JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57899720"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="57899720"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:34:47 -0700
X-CSE-ConnectionGUID: YDg0VbreS/OpgF+Gy/FaGg==
X-CSE-MsgGUID: ls8Qr6NGTgi39WVQ6RC6gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="161920992"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:33:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u5T7D-0000000DGhE-0RSO;
	Thu, 17 Apr 2025 20:33:31 +0300
Date: Thu, 17 Apr 2025 20:33:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw
Subject: Re: [PATCH v3 07/10] gpio: aggregator: export symbols of the GPIO
 forwarder library
Message-ID: <aAE7akcsktz1wc2w@smile.fi.intel.com>
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com>
 <20250416-aaeon-up-board-pinctrl-support-v3-7-f40776bd06ee@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-7-f40776bd06ee@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 04:08:15PM +0200, Thomas Richard wrote:
> Export all symbols and create header file for the GPIO forwarder library.

...

> -struct gpiochip_fwd_timing {
> -	u32 ramp_up_us;
> -	u32 ramp_down_us;
> -};
> -
> -struct gpiochip_fwd {
> -	struct gpio_chip chip;
> -	struct gpio_desc **descs;
> -	union {
> -		struct mutex mlock;	/* protects tmp[] if can_sleep */
> -		spinlock_t slock;	/* protects tmp[] if !can_sleep */
> -	};
> -	struct gpiochip_fwd_timing *delay_timings;
> -	unsigned long tmp[];		/* values and descs for multiple ops */
> -};

I don't like this piece at all. It will repeat one of the biggest mistake done
with many (old) subsystems and core.

Looking at the last patch ahead, I can tell that this is not needed. Instead
add a couple of APIs:
- getter for the gpiochip
- getter for the specific private data

and use the error code filtering for the existed GPIO descriptor, I actually
don't understand why for the existed descriptor you return there 0 and not an
error.

TL;DR: Follow OOP and make this an opaque pointer, no need to move it to the
header. The rest looks okay on the first glance.

-- 
With Best Regards,
Andy Shevchenko



