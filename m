Return-Path: <linux-gpio+bounces-28793-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F219C6FFAC
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 17:13:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 00DBA4ECD2A
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 15:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1584B35F8B7;
	Wed, 19 Nov 2025 15:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gnGDiBw8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405F62EBB86;
	Wed, 19 Nov 2025 15:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567272; cv=none; b=Ek9IUY+CKttDROi1C/Iua4hy0qLNaiXEEezWBt7a1pQzpeDiorkBRzJ6DZIQ3VkEFKGpXR2LMs2CWS4tG/8i2PKbTKTTFgNA6juSnTItKiF2A+4eVSFhAdG1blvNX0sr/d5a7wb45YzLQbpZUwb9pL0jN+WRH2rfgtlzrkJtdJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567272; c=relaxed/simple;
	bh=MjS6qANrG66ZEpC560m0ZY+4OoXsFOnALao2kMmuR28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NklSfqZjnGuibe6Z6YnltpTDGL9UX465n0LZoyYYn8qmssdEsWbYn4ygNYSJ9udHN46ldtW1bpSP9CJXDfjkyzgKWJQhJZoTpWDpzHvKv735xGiukT0QBPHese1UsNNIrEmO4IFF37WiFLU9uXcqqXOeKSzdz3wK5JvuC8OBuOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gnGDiBw8; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763567270; x=1795103270;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MjS6qANrG66ZEpC560m0ZY+4OoXsFOnALao2kMmuR28=;
  b=gnGDiBw8b55Iaj1ndjM6G7sq/O9EuiInZBOD4nCS4Cj6Umf/Ok0sf39G
   2kz0twvo2mttJlhXcW0O0CXkeXwDxWdcWZ/ZAB09HjshXVQQzy3FuQYxp
   HatVoYdDZRLG6Idcft/Dk8/1jnFyxXS/u74SNqMm3qHEcBGd8Q3RlZOxF
   8yso/4TJy4keEYmvrlfAezPKHoXro4rLx+vx3GbqrHN7B3nKLFATIvCE+
   qn85vQpaKnadU2SBOU+h6TYg4AxrNpAJjsrbAtKQsjkLQOsmCzbfu4AaQ
   VsssciqM32yDm8S6lcF+puzXYGr1CgtZMlXbUqkBt8G3zu+/f607mlAcd
   g==;
X-CSE-ConnectionGUID: 1caIjtkBTASmKY4X81eS7A==
X-CSE-MsgGUID: duCufqd9QxmTsMqRFjp6YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65546810"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65546810"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 07:47:49 -0800
X-CSE-ConnectionGUID: qARCDVdDSRq4Jvica6pVbw==
X-CSE-MsgGUID: 9q3MyH01SZm07qrscShvYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221740025"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 07:47:44 -0800
Date: Wed, 19 Nov 2025 17:47:41 +0200
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
Subject: Re: [PATCH v3 05/15] gpio: pxa: Use modern PM macros
Message-ID: <aR3mnWQedt7SMRP0@smile.fi.intel.com>
References: <20251119144327.13345-1-jszhang@kernel.org>
 <20251119144327.13345-6-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119144327.13345-6-jszhang@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 19, 2025 at 10:43:17PM +0800, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.

...

> struct pxa_gpio_bank {

...

>  	unsigned long	irq_mask;
>  	unsigned long	irq_edge_rise;
>  	unsigned long	irq_edge_fall;

> -

As I already pointed out this is stray change. Why you ignored my comment?

> -#ifdef CONFIG_PM
>  	unsigned long	saved_gplr;
>  	unsigned long	saved_gpdr;
>  	unsigned long	saved_grer;
>  	unsigned long	saved_gfer;
> -#endif

Same Q as per dwapb driver. The CONFIG_PM=n doesn't need these.

>  };

...

>  static struct syscore_ops pxa_gpio_syscore_ops = {
> -	.suspend	= pxa_gpio_suspend,
> -	.resume		= pxa_gpio_resume,
> +	.suspend	= pm_ptr(pxa_gpio_suspend),
> +	.resume		= pm_ptr(pxa_gpio_resume),
>  };

This is not a device PM ops actually. Is there any guarantees on the
relationship with CONFIG_PM and these callbacks? If so, I think we
need to have special macros somewhere in include/linux/syscore_ops.h.

Otherwise I'm not sure this will be a good patch at all.

-- 
With Best Regards,
Andy Shevchenko



