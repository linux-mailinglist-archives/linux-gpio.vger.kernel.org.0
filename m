Return-Path: <linux-gpio+bounces-28832-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E86AC7088C
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 18:53:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6E5264E4307
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 17:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75EF23559EF;
	Wed, 19 Nov 2025 17:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mbfsSKJl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA30732E15D;
	Wed, 19 Nov 2025 17:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763574329; cv=none; b=HDAZK+35WdxIOY7yYs2fjAawwGc7t6UV2mVY+8+6Oi3gwZ08tLFM4hOJ2wt2ZFyZkd1SwWJGLHaxlCcjLLTDoM/KwX76AtUDZXJgoFNDltx//sIDxp6oV6AuWTji5H74ZkYc6KVAdRPhYZjkJ57Ki/zY4vJqLrznkLFy0F3lxcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763574329; c=relaxed/simple;
	bh=ZvJCsNM8gCRFeXG3xspjSuRDvUlSdVawzrxA3IrXDdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFyTt4du0P0OFz5QSpwJw1qWoBUPfLzLQkb8p1cmkEsqqOTUaxjvsJThDWEF79cp86umhF0q/SGZMgU4CKBAt9q9f5uXLogtboWU9zuuN2Tof8WYbC0IYi7Q4b8x0/sAqXAOv98sQjxG+4jnAJBbqjRvVJLqiRVmN6uet8nHGAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mbfsSKJl; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763574326; x=1795110326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZvJCsNM8gCRFeXG3xspjSuRDvUlSdVawzrxA3IrXDdU=;
  b=mbfsSKJlIRdZ0dI10YH3clTRSiSDIzeoyXRwf/rh5birL/7Ra9H9Fqj8
   eAFYH071G21lBMOvLSoslrTxDT3iIVbEO7hPCmQrSWZQHUWz8cugYzUOf
   P7b5DTNQoWAJhNlmCJaXvDvLnbCbI/2pJ8djVaBG8xVX7dvDzPOkS9acA
   sAmTUS2bjvWrZuzcjwRHMu4I6CD9TqeEBb7bKKGTTDZkDFRrTt4glV//t
   GUsgNrYn5Tq9CztJmgIXsslvt7bjUXnGoodB8OLJQbcM0Wf8GWkV56Cjd
   /GaxZkmi8GNCnr5MxiQ3ztO+sNSyZol62jtal680fE3SkFFgLAWLUltyF
   g==;
X-CSE-ConnectionGUID: GCIWkKdnSk+8E3qSuC7EGA==
X-CSE-MsgGUID: qgh/7SVPQwq4AlXX4pm7Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="68231294"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="68231294"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 09:45:24 -0800
X-CSE-ConnectionGUID: 2amsmZZfTxG9s2IGlSkIQQ==
X-CSE-MsgGUID: A+3PCHlDS9WC7/jHTAEagw==
X-ExtLoop1: 1
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 09:45:19 -0800
Date: Wed, 19 Nov 2025 19:45:17 +0200
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
Subject: Re: [PATCH v4 02/15] gpio: brcmstb: Use modern PM macros
Message-ID: <aR4CLQ_2-kUM-e2F@smile.fi.intel.com>
References: <20251119163327.16306-1-jszhang@kernel.org>
 <20251119163327.16306-3-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119163327.16306-3-jszhang@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 20, 2025 at 12:33:14AM +0800, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.

...

>  static const struct dev_pm_ops brcmstb_gpio_pm_ops = {
> -	.suspend_noirq	= brcmstb_gpio_suspend,
> -	.resume_noirq = brcmstb_gpio_resume,
> +	.suspend_noirq = pm_sleep_ptr(brcmstb_gpio_suspend),
> +	.resume_noirq = pm_sleep_ptr(brcmstb_gpio_resume),

Can it be DEFINE_NOIRQ_DEV_PM_OPS() / NOIRQ_SYSTEM_SLEEP_PM_OPS()?

>  };

-- 
With Best Regards,
Andy Shevchenko



