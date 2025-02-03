Return-Path: <linux-gpio+bounces-15248-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CA8A2590D
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:14:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AF2E3A3004
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 12:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935572040A6;
	Mon,  3 Feb 2025 12:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GvhFuRnk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D601FA15E;
	Mon,  3 Feb 2025 12:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738584835; cv=none; b=m32vuaKBpftZmUpLVi+MmJo7ZEouCMePeeSAPF7MjkQLXHOPJorNHVcfHvvb7jpqbCQIp5XVGui3w8aSQ+260+TeZomgGHfQNYHt++1fiGWcgKBTiByiucwTch3QEfczoyHI6pqBrGiMmzyyqmHioJO58OLf5tsQ1VZS6AWYasI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738584835; c=relaxed/simple;
	bh=ct1m8qnSRoUG1BuJX26GQpfL2oSAy2xCl3eci1O0qH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7GpAWQS7nXOdBVwABuCcM9bH/j4UTAtylCBWm/h+orOxtvEmeTFddmtPT1A+9UeS8Xl5U3FpbcAlr7zLLTQxOvCPkg10HC6LoNAbr/NbRGphVFrZJnVJWRcQBU4QMfR12UauFZNngC998gS29+zS54/7s1a4RQTPAgnBDYdj8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GvhFuRnk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738584834; x=1770120834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ct1m8qnSRoUG1BuJX26GQpfL2oSAy2xCl3eci1O0qH4=;
  b=GvhFuRnkabjFSK84qxZbjBOSUPhE3f82An2XxS3LVjTx+qPqcu5qYqcW
   /oNMc0LzWyQtwkEfcH8EhDLTEheacI7ykh/CJuUBL/qYlCn8HMEe9wWd4
   4+EhaO/nqkysOmYChesWEB/wqm8zPJaFi7kc4gnOCmNGEc4gGNs+2V7dx
   5IB6LqaBf7f5pqRWKJs056haQ7l6IJIAr7TBLJcR64eM5Ttj84oXNq8GS
   Wy8IxnJjfD4B8snkyeu7s6OqKOKNOg0XCg+9cjnV4WUw1V1p2KsVyvV12
   ESiDNksjvFYzytOSFJNiOX2u4d7+ao2B5Nv0/am8amfUR0SA/TVjGjSGp
   A==;
X-CSE-ConnectionGUID: u0+zT/R4Q7i8LyPf0D4PPg==
X-CSE-MsgGUID: FBsKw/phQfWaH9lauzenRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="26676183"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="26676183"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 04:13:53 -0800
X-CSE-ConnectionGUID: cPOMVMPeRGaRVLvglrh2PQ==
X-CSE-MsgGUID: 03UBfc3AQB2QttB6A11ckA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110095012"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 04:13:51 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tevKn-00000007p5P-0Xuh;
	Mon, 03 Feb 2025 14:13:49 +0200
Date: Mon, 3 Feb 2025 14:13:48 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [PATCH v1 01/16] pinctrl: cy8c95x0: Respect IRQ trigger settings
 from firmware
Message-ID: <Z6Cy_Nap7Euvb7Am@smile.fi.intel.com>
References: <20250117142304.596106-1-andriy.shevchenko@linux.intel.com>
 <20250117142304.596106-2-andriy.shevchenko@linux.intel.com>
 <CACRpkdb=WDLxerQCS4oGoxe4p+A6VZDw-WH9NJuDaxoxju8PeQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdb=WDLxerQCS4oGoxe4p+A6VZDw-WH9NJuDaxoxju8PeQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 27, 2025 at 11:03:02AM +0100, Linus Walleij wrote:
> On Fri, Jan 17, 2025 at 3:23 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Som of the platforms may connect the INT pin via inversion logic
> > effectively make the triggering to be active-low.
> > Remove explicit trigger flag to respect the settings from firmware.
> >
> > Without this change even idling chip produces spurious interrupts
> > and kernel disables the line in the result:
> >
> >   irq 33: nobody cared (try booting with the "irqpoll" option)
> >   CPU: 0 UID: 0 PID: 125 Comm: irq/33-i2c-INT3 Not tainted 6.12.0-00236-g8b874ed11dae #64
> >   Hardware name: Intel Corp. QUARK/Galileo, BIOS 0x01000900 01/01/2014
> >   ...
> >   handlers:
> >   [<86e86bea>] irq_default_primary_handler threaded [<d153e44a>] cy8c95x0_irq_handler [pinctrl_cy8c95x0]
> >   Disabling IRQ #33
> >
> > Fixes: e6cbbe42944d ("pinctrl: Add Cypress cy8c95x0 support")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Patch applied for fixes! (Speling mistake on first line fixed in the process.)

Thanks! Any plans to take the rest of the fixes (except the one which Patrick
rightfully objected on)?

-- 
With Best Regards,
Andy Shevchenko



