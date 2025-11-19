Return-Path: <linux-gpio+bounces-28796-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4B4C6FF73
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 17:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5F2D0387B5F
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 15:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F889373744;
	Wed, 19 Nov 2025 15:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="imHgQu9f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CC8371DF6;
	Wed, 19 Nov 2025 15:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567583; cv=none; b=d3go4/Lwl2s9pXge338HcbytT/o5rhg1czeCmoVQhYVPy7KkBBpdby7o5STiQUKlWWT2aqR1Le8ezZkDQdix1s5EGAn5NOzQL/tEZDcn+5rlatLi1zABz4SSfsa1y+WvFnuBkPxUAJ/OhWYzXbmbsnqSsKQoqFYiRhM1ZtrkaJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567583; c=relaxed/simple;
	bh=wZZ20Jbxwtey+hKr4JAqc4oi5EtZrmk607QHTRC7VK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gqza+9blPs7wZ9J8vQI4cNwfUXrFBZhbd0leRhpshlumczZFQQ52gXsXjdqG3FIlTL6bdTLUwX5rgjHARk01EE5/e6y5knOju7gUHSfriRm5t3sFMlhr7zlLThf3L3ZlYzZiMUgbJXfk2LJiNPEgZ3bMl+R2UfxL61KWQu1mlIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=imHgQu9f; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763567581; x=1795103581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wZZ20Jbxwtey+hKr4JAqc4oi5EtZrmk607QHTRC7VK4=;
  b=imHgQu9faokdoOmrAOzkds3Z6v2yp/WYGubCr7D5eduMa9oYdG8op3Gp
   KFQOwsUTWBYZIO9SYKkjtJBZNEed/OFYvTNp7F/H1fr3o9mqTTjRMUlvS
   F4FvLKAU9vDCWTrTEfAz5lVWjw+cdXZX4yHgDIvctrs9OBWB4/BkDykop
   le/D8h6yryEa6MBK6JCnuJfaeqrjw8Q5BC0a+WXaHIcFZ5ybZBTqSGxtG
   qtXGMV2jte432Ii+WqIFPD46YZ4s8X8JE90MKOgHTe5qRokuhL6L6W2UT
   PBi1onG3fUqDeKOSlfcttHrG3DPbqAfaRfWQ23SrguNqpA0HUSBZrievj
   Q==;
X-CSE-ConnectionGUID: tj0E8uuCTtaubusnJuyesw==
X-CSE-MsgGUID: IiPGkIVVTBK3IYnWS+x2Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65555777"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65555777"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 07:53:01 -0800
X-CSE-ConnectionGUID: LwkW7kmFRzK+rznZqdaZEw==
X-CSE-MsgGUID: FSDd044QTvaX8eIBSGsrEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="196042855"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 07:52:56 -0800
Date: Wed, 19 Nov 2025 17:52:53 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v3 00/15] gpio: Use modern PM macros
Message-ID: <aR3n1Y6YnR_tGmrk@smile.fi.intel.com>
References: <20251119144327.13345-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119144327.13345-1-jszhang@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 19, 2025 at 10:43:12PM +0800, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards or
> __maybe_unused.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Almost all drivers are converted, only gpio-tegra and gpio-mlxbf are
> left as is, because the memory for saving HW context is not trivial,
> if we convert them, then the two drivers' users may complain for
> !CONFIG_PM && !CONFIG_PM_SLEEP case. So I didn't touch them.
> 
> patch to gpio-dwapb.c is tested on real HW, others are compile-tested only.

Thanks for the changes, but...

This series still does additional things that make the memory consumption grow
for no purpose. I suggest to leave ifdeffery around members and do it in a
separate series with all reasoning and good points. With this split done, I
will immediately review and give tags for the patches as I'm totally in favour
of using pm_ptr() and pm_sleep_ptr().

-- 
With Best Regards,
Andy Shevchenko



