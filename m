Return-Path: <linux-gpio+bounces-28792-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE71C6FC9A
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CDE0E4FBBD4
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 15:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B3C2E9737;
	Wed, 19 Nov 2025 15:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L2dYgX5E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9300E2E8B64;
	Wed, 19 Nov 2025 15:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566990; cv=none; b=ggjxPnpn7lnmdFRfczXkwBsmfql35jFv5kDvgDK8rGOSudJ8ASG5hLivOru4pRUVTQUtVE29MVXhKCA4/3ZeuG99l4UBflhyrxnoXuJ3Mx6+zDeI+1+gMSmlj7ySnvIUAQjME5HVlufZptZ9u74OQbE2g88iunWTY85GI4EaLSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566990; c=relaxed/simple;
	bh=0RZPFAONQ4eeFMXT+CMJvWTBqEYsuVS8uhy75HjL4yU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g61O9D9lo3hKSHM2hGEPwdFeJsOJsH12kQwH3nYhh+hBkRSgGRdj6lYoqjWy0m3pWKD7hhuQUguNzgOP2/bvxiYWyImSBbpV1xAaQ2mgKvEyeenzLVbjGK2EmMMiP9mkBZ6jnsbBCoh0qvgZK89Im7Q1Tt7ujGM6rfOEhf0Tk10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L2dYgX5E; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763566988; x=1795102988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0RZPFAONQ4eeFMXT+CMJvWTBqEYsuVS8uhy75HjL4yU=;
  b=L2dYgX5EMbwLWdnuSknVyqTwAZyN9IRnm+wZPa5heX/tdqQopQZRhJEH
   0hCurfUlzAcBN4Ixx1M3cRRryQUSkcwrIQDjcx9ga11RFl5TkT0QWQamH
   bWWtBGI0TtH4P1n19tnsDzUEX1Zkta09FfN8m9c7+cixRgd0taatlji/J
   z2j6rwTg0fkgLlsn+54Yrw2CEn5bv3RFFfrc5Y67JeBpz0JhJ6lmYkty8
   ZjcljGHEuDA76KPKb9KYQZEJWKFPVs+Um92IXG+i24StvRwTd2pdNSWXe
   OUcMqhLCCDrcIVeQ0ugtnhA87JMkAAoKuS3DH5xk1orHUJoH57Y3hoP4M
   A==;
X-CSE-ConnectionGUID: Q9AG34fCTBu9cpxAV+Fe7Q==
X-CSE-MsgGUID: BWp3ibKUSIOqTyUyVlj6Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65546336"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65546336"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 07:43:06 -0800
X-CSE-ConnectionGUID: r4NEVHUqRaW1JBPgUKX4DQ==
X-CSE-MsgGUID: lkuTqTpcSSuluJvpOUgoPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="191126714"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 07:43:01 -0800
Date: Wed, 19 Nov 2025 17:42:59 +0200
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
Subject: Re: [PATCH v3 01/15] gpio: dwapb: Use modern PM macros
Message-ID: <aR3lg0aNaoT-_7SM@smile.fi.intel.com>
References: <20251119144327.13345-1-jszhang@kernel.org>
 <20251119144327.13345-2-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119144327.13345-2-jszhang@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 19, 2025 at 10:43:13PM +0800, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.

...

> -#ifdef CONFIG_PM_SLEEP
>  /* Store GPIO context across system-wide suspend/resume transitions */
>  struct dwapb_context {
>  	u32 data;

>  	u32 int_deb;
>  	u32 wake_en;
>  };
> -#endif

This ifdeffery is to protect the type definition? It may be removed for sure.

...

>  struct dwapb_gpio_port_irqchip {
>  	unsigned int		nr_irqs;

>  	struct gpio_generic_chip chip;
>  	struct dwapb_gpio_port_irqchip *pirq;
>  	struct dwapb_gpio	*gpio;
> -#ifdef CONFIG_PM_SLEEP
>  	struct dwapb_context	*ctx;
> -#endif

But why this? For the PM_SLEEP=n cases it will give an unrequested overhead.

>  	unsigned int		idx;
>  };

Otherwise LGTM.

-- 
With Best Regards,
Andy Shevchenko



