Return-Path: <linux-gpio+bounces-30603-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C61C0D24A4E
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 14:02:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 022523029D3B
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 13:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2402C39C644;
	Thu, 15 Jan 2026 13:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="inBmfrH6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921B839C633
	for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 13:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768482102; cv=none; b=Bhech3H0tkDtIwogIaSO1BnhtJVMDcN10A6AJJ8gievSnH3TkTZA0Cn/jpYyrr4kWsGXbNiqEet5rZ91yRQ/KHBIRPb4GUAe7hqsdF3MFEP4hMF822EedReif3DR1i3gx7CIs4tNOZnYtf8LkH6lWMcN4Qczn5wYyUV2OGxpWcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768482102; c=relaxed/simple;
	bh=XQfiUl+R4sEcDxYQBvWIeW+Jcqgh9dobQu4zy3hKmuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0TirUDuhfBEWkzcXBQ40/G7VLhke4YlciaRLuOoJlyVjICri0KpqlDcrK/5ujueRajM054xp0BCtk8c8QiONMXL3/RssjHKAQ7ExxgzX+DxvTgwxcPhsek+lo5nBPaFXZKDFhzhLrBExhEecuYyJ6IR1LriATy8uWRtR9qDNOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=inBmfrH6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768482102; x=1800018102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XQfiUl+R4sEcDxYQBvWIeW+Jcqgh9dobQu4zy3hKmuY=;
  b=inBmfrH65iVz2Z+K6UBimA70ReBH20CAOvYW4VclK+KV8ihW9fJlQVYB
   koe8pfexDNR10qe2xum3xv2sdiwu+6uSuFYjDRZX4SYt4PmyML/t/HXEp
   IyoFPfkdCNZ6x4eaLzkfQmSxiboK6jI9FwLFBHc5YlndmlSESp5tdqjet
   jWoMOYhocVBmeDwidBo5wRjmRO54p2jHn+7llD0IS8ZYcCExCEM6pup9k
   E4gtlCeM90cEBI380sV1WbOaLtG4QvTtLzjGVz9fjPfsIJ+ZaDfWBtgUM
   UJDFEwTalCPStFRz4j+xhJzU1ucVvwgJDwCRJVEocSCgNPrCrEWDvO35n
   Q==;
X-CSE-ConnectionGUID: h/st1DxgR3yaT3RMgdVd4Q==
X-CSE-MsgGUID: 91Sx0VQKSI+AOlNta+H+iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80897948"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="80897948"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 05:01:29 -0800
X-CSE-ConnectionGUID: RAJUOfBDT2awqVEuw+N7SA==
X-CSE-MsgGUID: zIq4D9IuT6CerNe48gE3VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="210008951"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.216])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 05:01:28 -0800
Date: Thu, 15 Jan 2026 15:01:25 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Linux pin control <linux-gpio@vger.kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: GPIO direction problems in gpio-shared-proxy.c
Message-ID: <aWjlJTnrI8r0iIMR@smile.fi.intel.com>
References: <CAD++jLkJfyhmpepkanMyvLc_C0v_XZeoEKj8XJ3bw5fJAqJYyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD++jLkJfyhmpepkanMyvLc_C0v_XZeoEKj8XJ3bw5fJAqJYyQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jan 15, 2026 at 10:41:11AM +0100, Linus Walleij wrote:
> Hi Bartosz, Andy,
> 
> Andy is good with problems like this, so I explicitly address you!
> 
> A review of the I2C core brought this problem to my attention:

(and seems it's spreading:
 drivers/tty/serial/mxs-auart.c:1522)

> we have the following confusion in gpio-shared-proxy.c:
> 
> dir = gpiod_get_direction(desc);
> (...)
> 
> This function from <linux/gpio/consumer.h>
> 
> if (dir == GPIO_LINE_DIRECTION_OUT) {
> 
> This define is from <linux/gpio/driver.h>
> 
> So we need to move the GPIO_LINE_DIRECTION_[IN|OUT] to
> consumer.h if you want to use it like that.
> 
> But we don't want to include consumer.h into driver.h or explicitly
> into every driver.
> 
> The I2C core and any external direction user looks like this:
> 
> /* FIXME: add proper flag instead of '0' once available */
> if (gpiod_get_direction(bri->sda_gpiod) == 0)
> 
> So this needs a proper define too and it isn't a driver.
> 
> Shall we create <linux/gpio/directions.h>
> with just these defines and include that into consumer.h and driver.h?

If we talking about header level of splitting, I would do it as gpio/types.h
(gpio/defs.h) as others usually do.

As for the particular problem, and I think Bart has better view on it,
I think the use cases should be revisit first to understand "whu?" do
we even need that in the code. Since we have two so far (or more?) we
can try to address each of them in a better way.

OTOH if we have _get_direction() in consumer.h, why don't we have defined
possible answers in the same header?

-- 
With Best Regards,
Andy Shevchenko



