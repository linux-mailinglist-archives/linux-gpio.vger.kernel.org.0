Return-Path: <linux-gpio+bounces-20406-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09953ABEF3F
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 11:12:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04CE51BA5A39
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 09:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2114523958A;
	Wed, 21 May 2025 09:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bp/mfY0O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767A81A9B4C
	for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 09:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818752; cv=none; b=WTkUwpts/fF1w+oTFrrk6dggdXskRNPC3kDdfKbJbb49HdDRCdltxjUCo6nRwblpI2+07gvxVmC2Il53/tlAsMxmDTzRdMD5btA+LmtgjdVvpXXV0FbRR7i1G5+XzMtomo8pMoUHy4HQ0oixwAz+puiyT+p06Lj1gNybPyf6jkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818752; c=relaxed/simple;
	bh=Gnf8v3g/l7+75uwgjV2D9UdOsYzymMiuUsLs6DBS02U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3IhF8hupsaBggjnwul99lI0+vmkFxwQD/tWSM4/C4i+cjupGQl2k7EXvLiIJaz9JZLuGf5BIl8yQ3KQ4vjp/uIKBNVDxgPmxjMNewW9/DPQkcYHz6YVHv7RiGDCOFNKiCJHQ1QbWeZa+GeFhxHRTTGKhxVtkD4YAO4ra5i3Y/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bp/mfY0O; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747818751; x=1779354751;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Gnf8v3g/l7+75uwgjV2D9UdOsYzymMiuUsLs6DBS02U=;
  b=bp/mfY0OxJ2Yd7VB/HGBJn25umCqiuiR8pZWyuVfg0ecFSt85lpCSFhN
   he2qefrLKQGJdnhoQ+nIIE4rbwVbDwSRL/jBSQKp9fra3lYqBG3CWycVu
   pSYz7/TuqCYNWBK4asrFNJRRLX83UPn2+ruKbL/77BGIMIj+XR+SIeF0C
   p0Sjmy0H+lsUdwW8oUCbj88o+DAYr5312VwIP4pLeIFKPZ+hWL0bQemMR
   u0xkyf4wrA/OGIo5JEzbexhi+LvWGSFJUxzRgo8ZehWq7l/eSUN/Sy3+r
   8FwLgude147kwFdPvz4x9FTDPY0KgqGorWIAjB4lzRZdRy1pVZzK1qVrx
   A==;
X-CSE-ConnectionGUID: V6Ma3SBTQdKT+Lc5FyGVcQ==
X-CSE-MsgGUID: 2AokF8FbSLCx88v3BkDeEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49691496"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49691496"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 02:12:31 -0700
X-CSE-ConnectionGUID: 84blBU46TeeOLzGrSf8Rhg==
X-CSE-MsgGUID: XPYLjA63Q4ClRpXyVT4OYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="170849200"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 02:12:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uHfUx-00000003ZK2-0yaC;
	Wed, 21 May 2025 12:12:27 +0300
Date: Wed, 21 May 2025 12:12:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linux GPIO <linux-gpio@vger.kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] intel-gpio for 6.16-1
Message-ID: <aC2Y-4wSILoS-Rol@smile.fi.intel.com>
References: <aCzbya_FW7hg1Wkr@black.fi.intel.com>
 <CAMRc=McMOH_S8Kf1TPV3Z0QYPz+cfS9hxZh++fNvMc_U+TssLQ@mail.gmail.com>
 <aC2W84mKGzgbRsL9@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aC2W84mKGzgbRsL9@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 21, 2025 at 12:03:47PM +0300, Andy Shevchenko wrote:
> On Wed, May 21, 2025 at 10:44:16AM +0200, Bartosz Golaszewski wrote:
> > On Tue, May 20, 2025 at 9:45 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:

...

> > > Bartosz Golaszewski (2):
> > >       gpio: graniterapids: use new line value setter callbacks
> > >       gpio: ich: use new line value setter callbacks
> > 
> > These have been in my gpio/for-next branch for a long time and the
> > ones in your PR have different commit hashes. Please remove them. I
> > don't see any notification about you having picked those up neither in
> > my inbox.
> 
> Really? I though I commented a few weeks ago that I prefer to take them
> when Stephen complained on dups. After that there were no dups noticed.
> Since you haven't answered to that email, I (rightfully) assumed you are
> okay with the proposed course of actions.

FWIW, check your mailbox:
https://lore.kernel.org/linux-gpio/Z_OUr5xvoXh-sFne@smile.fi.intel.com/
https://lore.kernel.org/linux-gpio/Z_OS4nx2E12yjL7_@smile.fi.intel.com/
https://lore.kernel.org/linux-gpio/Z__xUsSeYNQAvnNp@smile.fi.intel.com/
https://lore.kernel.org/linux-next/aAEkrx0P5LFj1r6a@smile.fi.intel.com/

Note the last one, you didn't respond. So?

-- 
With Best Regards,
Andy Shevchenko



