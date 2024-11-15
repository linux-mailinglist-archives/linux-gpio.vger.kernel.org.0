Return-Path: <linux-gpio+bounces-13040-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 022C79CDBB5
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2024 10:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF4241F22A01
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2024 09:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F5018FC81;
	Fri, 15 Nov 2024 09:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ewXU9HWa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0F5189F39;
	Fri, 15 Nov 2024 09:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731663390; cv=none; b=P7Y8iO/hWEhTtSJALE/PKVr60Zjq0mHKtvUJ60MRJh2WaiNOmGQfyW66bDfiB/mm0Aa2DipXPnxi6urCwWG3L2Ws9vXwhM2X4avqrLnWXFBgN0BNDshMl0rVXDbEP5DJ4j2WaSKtodbYjFRYVqs3oRuIe16BE9rLP9iV0/nl7Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731663390; c=relaxed/simple;
	bh=/smof6d1pDmoWNJzjWUlX00xHDmg17Z1RvZy10ndAug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NcthG9iySKUHk1Cig3kM48O7XuOzp3Gi0hd7F+vPm04JaXn5t/KW4vQ68ujVwh2TOTrcoWNaAgaetTcrOazVuMd0WgU0kVI/HDD5dyDJEfaRnMEaazJmNvWHn4mPrWM6Eg+Lpe8g6qK0Ja2zMZMnVf7qJJCrVuI8vEU8xQUjF4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ewXU9HWa; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731663389; x=1763199389;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/smof6d1pDmoWNJzjWUlX00xHDmg17Z1RvZy10ndAug=;
  b=ewXU9HWafIF/zasXj/HXnT5cwKXHItU7i3Accyb2lc3Cvileq4DcFbWt
   VyobG/BxyoOk1NvfwVZH3grgePYZk3D0UcVYSoJZislXF0tz8bQG+GXl5
   YH7uxv+kZnfPeU3+WaFFfI+KyjrSoJveen3cZnmUdPyD8+tca64Sh/DNN
   l7VHEmSyU3pBa8j2Ket1rEml4TNeKFllJgL6RoaxzbAGetKngOx79Su1h
   iniUCe1dNU3broixgh3gObZbpdEij5ULh3UvIRnPgB2jG4Wo0PEV0hNn5
   Akr4XeLm1+JeJDWr7XY7yw4cgGS/TzNjipkjx6dAt5H78fv6jsl0Nm/Ua
   w==;
X-CSE-ConnectionGUID: QGhAzRqqSgOZbt+Mq3fWVA==
X-CSE-MsgGUID: dU3K7XJTSualY0Rc8MTqRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="35592489"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; 
   d="scan'208";a="35592489"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2024 01:36:27 -0800
X-CSE-ConnectionGUID: gvFOJB/uS1KoyvwC/QID9g==
X-CSE-MsgGUID: 0wR8Wdk2QHu+jNOLzO/i8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; 
   d="scan'208";a="88920814"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 15 Nov 2024 01:36:25 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 4AB241AC; Fri, 15 Nov 2024 11:36:24 +0200 (EET)
Date: Fri, 15 Nov 2024 11:36:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Suraj Sonawane <surajsonawane0215@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: gpio-exar: replace division condition with direct
 comparison
Message-ID: <ZzcWGJxqMJVYd4Tp@black.fi.intel.com>
References: <20241112201659.16785-1-surajsonawane0215@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112201659.16785-1-surajsonawane0215@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

+ Dan

I have to comment on this change as it's a bit controversial.

TL;DR: this patch is not more than a (harmless?) noise.

On Wed, Nov 13, 2024 at 01:46:59AM +0530, Suraj Sonawane wrote:
> Fix an issue detected by the Smatch tool:
> 
> drivers/gpio/gpio-exar.c:52 exar_offset_to_sel_addr() warn:
> replace divide condition 'pin / 8' with 'pin >= 8'
> drivers/gpio/gpio-exar.c:62 exar_offset_to_lvl_addr() warn:
> replace divide condition 'pin / 8' with 'pin >= 8'

This message does not really explain why.

> The division 'pin / 8' was used to check if the pin number is 8 or greater,
> which can be confusing and less readable.

It's inaccurate description. Everyone who is familiar with GPIO HW is
also familiar with line grouping in banks. Here is the clear statement
"get the bank number (where 8 lines per bank), and if it's 0 do this,
else do that". It might be in the future that (new version of) HW will
gain more banks and we would return to "division".

> Replacing it with 'pin >= 8' makes the code clearer by directly
> comparing the pin number.

I don't think this statement is fully true. See above.

> This also removes reliance on integer division,

On top of that "division" here uses power-of-two divisor, which any
optimizing (and this code I think won't ever be built without
optimization turned on) compiler (I think from the very beginning of
the Linux kernel project) knows how to convert to right shifts on
the platforms that support that (and how many do not nowadays? 0?).

Additionally in the cases when we have a / 8; a % 8 type of expressions
coupled together, the compiler actually may issue an integer division
assembly instructions on some ISAs where it gives two values in one
go. Replacing like the above might break that (if the compiler is old
or not clever enough).

> which can be harder to understand

No, "division" by power-of-two numbers is very well understandble.

> and may introduce subtle bugs in the future.

What bugs?

The bottom line is that: I recommend to work with smatch developers
to amend smatch instead.

P.S. I wouldn't like to see similar patches to other GPIO drivers,
especially those that use a / 8; a % 8 type of expressions together. 

-- 
With Best Regards,
Andy Shevchenko



