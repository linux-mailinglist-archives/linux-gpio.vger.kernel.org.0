Return-Path: <linux-gpio+bounces-6841-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF65E8D3732
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 15:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C9B51C21F50
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 13:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2555AC136;
	Wed, 29 May 2024 13:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W4v67Zyj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0341F17C67
	for <linux-gpio@vger.kernel.org>; Wed, 29 May 2024 13:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716988276; cv=none; b=TF7RGJtqfAqOaPkyUGiFZXZ8DAH985Z8ZpFuWyfPkf9gMQzWTJtCoo/p/HwsxfEwCXWb++4V/eNLXRMYKVU1w1MJlaxfVa2gLdTmaq1GaT9Q/pipVQ2WTWnlZuU10fd6hv1HtLKUl4+gS6aS3cz2G5938Z9RHyYpYEnQbSWztAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716988276; c=relaxed/simple;
	bh=/JehxSbeUDJfDGfvbwphWrIuaIJRd9kDO82Teb2w2OM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oiYrXanwR8h+ZlqJp5QqGAfSDwiW/BwO7vs/TCJIs65G6mO3H+LDW6VMcH91c3PaBne0jWmSQ2ZnpSq5xWztovqEL9rAskb6YlF0+R7aUY6x2Df+C6BBLKnw9rmOCS1KSaF9kv/g+i5jjSCCQfCbyjpPg1agUanN9AvnPybd3s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W4v67Zyj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716988275; x=1748524275;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/JehxSbeUDJfDGfvbwphWrIuaIJRd9kDO82Teb2w2OM=;
  b=W4v67Zyjad3boWrIlTA0HMf2+0Ikc03i0zU21ZLAGGANplmxNKLsCpxJ
   zJ+HmcV98xUTnP9pco5gUX+EYTknXYN2Xd9sMTKcKvwZHJllSORBgerH+
   wjUgjNpec3JHHFeyhuUU1+aQzzDbYT5+wIIhSYeKXhPPNLus82aqiY1i8
   Km7ve7Uyeb7RGZe1/OfvRBIR+/x/ff+nKVaxKJiOx9MbzzyXbaR4QR1RC
   hQldOeo6VlZfvWOsvR1mJNyRO1kFV19mCb1R5eBVsKmGfe/4D3eV2KPBE
   K+j21cf7rGwdYkuVHRgQURExEyJtCVCwc0xHTqOCHMWBftmxvPg6p+pjY
   A==;
X-CSE-ConnectionGUID: A4Yst0DDSm+SBy+slWnEmQ==
X-CSE-MsgGUID: hQw+44SdQGGAQE/52xJ22g==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13238089"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="13238089"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 06:11:15 -0700
X-CSE-ConnectionGUID: eLlgkaW7SBy5r+15/h4Evg==
X-CSE-MsgGUID: vri4mTPmTKmcUGTvZHoaIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="39950712"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 06:11:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sCJ5C-0000000Bnni-3MwU;
	Wed, 29 May 2024 16:11:10 +0300
Date: Wed, 29 May 2024 16:11:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v2 2/4] tools: tests: use "$@" instead of $*
Message-ID: <ZlcpbgjXpPQng7qP@smile.fi.intel.com>
References: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
 <20240527-fix-bash-tests-v2-2-05d90cea24cd@linaro.org>
 <20240527124420.GA108041@rigel>
 <ZlSyscNCrZv0LRHL@smile.fi.intel.com>
 <20240527235426.GB3504@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527235426.GB3504@rigel>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, May 28, 2024 at 07:54:26AM +0800, Kent Gibson wrote:
> On Mon, May 27, 2024 at 07:20:01PM +0300, Andy Shevchenko wrote:
> > On Mon, May 27, 2024 at 08:44:20PM +0800, Kent Gibson wrote:
> > > On Mon, May 27, 2024 at 02:02:34PM +0200, Bartosz Golaszewski wrote:

...

> > > It also doesn't like looping on find results in patch 4[2], though that
> > > is not related to your change, so leave it and I'll fix it later?
> >
> > Does it really mean _to fix_ rather than _to "fix"_? I mean how do we know that
> > shellcheck is 100% correct tool and has no bugs?
> 
> How do we know anything?
> 
> In this case you can read the description of the faults, which I had linked,
> and see if that makes sense to you.  And we test the fixed code to ensure
> it still works as intended.
> 
> I'm not claiming shellcheck is fool-proof, or 100% correct, or 100% complete,
> but it is more available and repeatable than Andy's Eyeballs.
> And if we do find bugs in it we can always fix those too.

Sure, any tool has its own limitations. Esp. Andy's Eyeballs!

> As I stated earlier, if you have a better metric to use then I'm more than
> happy to compare, but so far shellcheck seems a reasonable option to me.

No problem!

-- 
With Best Regards,
Andy Shevchenko



