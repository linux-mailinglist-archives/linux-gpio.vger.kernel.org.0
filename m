Return-Path: <linux-gpio+bounces-18239-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A71A7BDB5
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 15:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DBE017BE72
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Apr 2025 13:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53C181EBFE2;
	Fri,  4 Apr 2025 13:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f32fnwEf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9757D18D656;
	Fri,  4 Apr 2025 13:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743773196; cv=none; b=Cj0LvcVU0YPDZ4yo4BvyXMNCMTtEEEJbRclMXzq/Nh6Y87//j7NepQkjcinuCp8Rnccujvjq49eH2AqlI/pL48aRk3h22oILWBw6bnIILCrdGKDvFsRtngI7Ss4pBZ06CT91eVQevdfxkYYBAv2LdzbkroApCcIT8DyLA2rM2Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743773196; c=relaxed/simple;
	bh=GlYv4RJx/qddduKvUDY+jA46vAIVO1n4cjmqtnn2Vok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uzH507yvqwcodvuw2/G76twz/4qfA328jbZliurU/m4eDGTtf5z8dgXwj6BOp/KYnblzmeP4MLJxkZ2G9fSSyTlJECVG4+hSX6txQy8e+jddPpie0GfiRVW/fNpOmp5rYUUCFMmKblbMtP7CAb9GvNnecH1PPLo3ITJetX9F0l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f32fnwEf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743773194; x=1775309194;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GlYv4RJx/qddduKvUDY+jA46vAIVO1n4cjmqtnn2Vok=;
  b=f32fnwEfXuYR1dIFAFzwLOTiZcY+jpO81h4l8dhK68JsRXUcjkf8CTRZ
   mzL40gd1ez4rGJHvX3nTuCBWjfhaukfU2k5W9+EvY8HKsGalmNtUMAfAi
   8FP2cigR+6Hl0aLvD3/U53r+zLvERMsEw2YQox5X55IFyjZ8xnLv0p+84
   5t6fEYpOjQtcshglzewA7LMK/nNyesxLIUmFfBuQEK0eOe+TpaGUDaxOi
   SiiQn2lhH67p5sNjX0XU659HDl2LyFgwv1gp/+2GSdykznq++SFmKDvNJ
   NlNVzNXZwr30czffqSNVz0hCEUpDFqz38r+YaMj2dsggmNmWJ55bOIbZP
   w==;
X-CSE-ConnectionGUID: UQgfiA8xRzOuixszqRt9Sw==
X-CSE-MsgGUID: TP0yiXFnQMuGAz7xERjgOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="49006313"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="49006313"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 06:26:34 -0700
X-CSE-ConnectionGUID: LNYqZ3tQTYylWxtp7lrjlA==
X-CSE-MsgGUID: iC9M8m7UTuyq7KAcEoOL+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="127124237"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 06:26:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u0h40-0000000990o-0CJv;
	Fri, 04 Apr 2025 16:26:28 +0300
Date: Fri, 4 Apr 2025 16:26:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw
Subject: Re: [PATCH 4/5] pinctrl: Add pin controller driver for AAEON UP
 boards
Message-ID: <Z-_eA-gUPJt57DRK@smile.fi.intel.com>
References: <Z4Tg-uTVcOiYK2Dr@smile.fi.intel.com>
 <b50444f7-4dd1-4440-af36-783b1b4f8625@bootlin.com>
 <Z4jNZPcDd89-HfAd@smile.fi.intel.com>
 <e273428e-3ebd-4116-b317-9aae0c8c603b@bootlin.com>
 <Z4j8NmKMEL7PALmw@smile.fi.intel.com>
 <8b9dd766-ae7e-4817-a093-536ae9646cd3@bootlin.com>
 <Z4kUWxR9VWkzQ9aW@smile.fi.intel.com>
 <5e5f7635-86ed-4814-b26f-b1c45fa4f29a@bootlin.com>
 <Z6NOfUG3QZyYW0rw@smile.fi.intel.com>
 <cb07335e-8dc0-4cf1-8524-40770d5419cc@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb07335e-8dc0-4cf1-8524-40770d5419cc@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Apr 04, 2025 at 03:11:00PM +0200, Thomas Richard wrote:
> On 2/5/25 12:41, Andy Shevchenko wrote:
> > On Wed, Feb 05, 2025 at 12:17:29PM +0100, Thomas Richard wrote:
> >> On 1/16/25 15:14, Andy Shevchenko wrote:

...

> >> So I'm not really convinced by all this complexity for only one driver.
> > 
> > I am not sure if I asked you to show the excerpt from DSDT for this device.
> > Is there any link I can browse the ASL code (for that particular device,
> > most likely I wouldn't need the full DSDT)?
> > 
> 
> I'm currently working on the V3, and I just remembered that you asked me
> DSDT file. So for the UP Squared board, please find the full DSDT, and
> also SSDT1 (which contains the FPGA declaration).
> 
> DSDT: https://gist.github.com/thom24/4d24c2a2f58d93f799e512c2485efd45
> SSDT1: https://gist.github.com/thom24/2da44ef86eacfa5d2d492ce43fa41aa4

Thank you!

-- 
With Best Regards,
Andy Shevchenko



