Return-Path: <linux-gpio+bounces-28829-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 802AFC706EA
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 18:22:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 7368D2FA6B
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 17:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6DF361DB4;
	Wed, 19 Nov 2025 17:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S0dtU+cx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5F130ACEA;
	Wed, 19 Nov 2025 17:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763572809; cv=none; b=oQ6wWZ615Rx6+dx1uDbF5nC3K0D5RtRVmyOy9b8D8oTzX+Owz7dJqE09K6QirU7fbiG6mCxOeCjGP4nXbalnslRgWtZesvpvboyq/e/YUfobNjKxDEfwlmlKxOb2TYIc9E41MyrsI8Q0id+20TO7zucR1napakcJx0BuRNo3uPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763572809; c=relaxed/simple;
	bh=yRC3ZjX4yKs1fHPYIaMuMJ9xkm2PhgZ57PbRcPxNYnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MbBT3HbON6A04EBxLUyQa6v1xt7n9qaHf6brdHRLIasITbT1ymPOKLAjLM/FZuf2F0kjbbglC0y283GwHvnmoYNOd2zg2Rft+N98ngeCY+BBzWSOvN+ALpSY667dHUXYnQcJ01zSYnPPE+JoPcqgF3+GtdmvmOwtRCOZO4ZmWBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S0dtU+cx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763572807; x=1795108807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yRC3ZjX4yKs1fHPYIaMuMJ9xkm2PhgZ57PbRcPxNYnQ=;
  b=S0dtU+cx3PYWCPWvSaB/+Xg/xe0bC6scJfVfUI/2ckrH5o+svakOdv9t
   2dTe19E9rH9klzMgGY7d4mskYFTBeV++Ositjc7E0r1qGVh96Z5IfBsXz
   5d/7a1J+DiKSWBZpWA6hs+rkxd66mAj747r6fOFlVxw9KgSbUx1B+NOu0
   D7muc+3CcnwA7NZ1csXkvCLS/bpetp7Gsaw4knrqfWd6YJLyyuVVG9Jcv
   1nnzByH1i7nm68FL5MTtRHd8kWiBOgMY8erMUgr9f7vYjcwqJZXA7HRcu
   D5XTNLuX0Nbei3Su1x7Dh5tVHl3KqJJMMaeC6lw64e7sErvtqjCnktwxW
   w==;
X-CSE-ConnectionGUID: pyInrXfbTt2DVVxqDL2WZQ==
X-CSE-MsgGUID: 3HraLo7jQaW2Klx9tehOPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="83014561"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="83014561"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 09:20:06 -0800
X-CSE-ConnectionGUID: AC+1iDvmQ8u//B1fcrQoXg==
X-CSE-MsgGUID: PAbH0ctoRdWb1viWqMOHYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="191241800"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 09:20:01 -0800
Date: Wed, 19 Nov 2025 19:19:58 +0200
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
Subject: Re: [PATCH v4 11/15] gpio: tqmx86: Use modern PM macros
Message-ID: <aR38PkERpLxXhNfD@smile.fi.intel.com>
References: <20251119163327.16306-1-jszhang@kernel.org>
 <20251119163327.16306-12-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119163327.16306-12-jszhang@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 20, 2025 at 12:33:23AM +0800, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use __maybe_unused

...

>  static const struct dev_pm_ops tqmx86_gpio_dev_pm_ops = {
> -	SET_RUNTIME_PM_OPS(tqmx86_gpio_runtime_suspend,
> -			   tqmx86_gpio_runtime_resume, NULL)
> +	RUNTIME_PM_OPS(tqmx86_gpio_runtime_suspend, tqmx86_gpio_runtime_resume, NULL)
>  };

...

>  static struct platform_driver tqmx86_gpio_driver = {
>  	.driver = {
>  		.name = "tqmx86-gpio",
> -		.pm = &tqmx86_gpio_dev_pm_ops,
> +		.pm = pm_sleep_ptr(&tqmx86_gpio_dev_pm_ops),

For RPM this should be pm_ptr(), no?

>  	},

-- 
With Best Regards,
Andy Shevchenko



