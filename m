Return-Path: <linux-gpio+bounces-28831-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 61333C70867
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 18:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B517C4E15AE
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 17:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751CC27F015;
	Wed, 19 Nov 2025 17:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XpGtgugW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445D330EF92;
	Wed, 19 Nov 2025 17:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763574124; cv=none; b=bxva7ard42zmGtZ7nNHDvRu40/IRsZ0dbUd1Tx8mRNSX2CKX/2b0ZBSxttFvoFafgzkgDA0KdLJYM5Cwu4bImEngTttb0nSPc19pqipw42a1tD9sGjBhZkoU7WUWc8bO+c/Z4QSfYm6mIxcWOX/IlljD20usFBF2taIdfUEi/og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763574124; c=relaxed/simple;
	bh=q4ogyePfvPPVC198borYC1IEQLnRNOOxPn543dof334=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJ+et+PYfeX0YCO/p/6TYnNslRVBaCAaQiVfmW29i8mq3pjel0Fwy3d/+qEs9rcTUkVSq3PCNEVLIYR0VOSuTgSJwTACm/mfnpjGZH3hZufogpbNEUP7egBmVO3tked389ekzGPXfDza5ISUd5sxSDrWV8ZioCHGv7D/+rGaBng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XpGtgugW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763574119; x=1795110119;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q4ogyePfvPPVC198borYC1IEQLnRNOOxPn543dof334=;
  b=XpGtgugWiJbpnOn9yE8Bc4Ks5HYo1MzEfrqXxml0S3mQRgFceAe4YfL7
   echARWs6ZnPpWfTuIwjDPmBKoNyj1z/MbpnUMQZ+5GM6AKZoplWfLWSZw
   7mvNeDza9oZgz6mlmfssyjEzFWwYx83kPWXY4+6v88PUmfuCfEc5hOUO1
   FwtgtOmKv05i2sks6gFxgqPPuPf4PNmhlL2v8FW/qjcDBOQ3ykqTYcjWv
   ju/wENpfJcTlEXdwMjLXq3TGX10tb6qDWXpvOm2sbB0wZtxEo0IFF264A
   0Gt7hYMvGRS5Pro2PQ0GAipklov1LB1ysGb8GD9mishqjUjqDzk0XUPrB
   g==;
X-CSE-ConnectionGUID: jCEgmLDYSJ+rN4jvvOu0lQ==
X-CSE-MsgGUID: ZHqJbs8DSe6QfZcXLKvpBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="69492253"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="69492253"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 09:41:52 -0800
X-CSE-ConnectionGUID: QA3EiLidSZC7kxroBm3LWw==
X-CSE-MsgGUID: ZGup7eNSRe+q+/IkGlUXng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="191918464"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 09:41:47 -0800
Date: Wed, 19 Nov 2025 19:41:44 +0200
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
Subject: Re: [PATCH v4 05/15] gpio: pxa: Use modern PM macros
Message-ID: <aR4BWLo4BdyKhnlI@smile.fi.intel.com>
References: <20251119163327.16306-1-jszhang@kernel.org>
 <20251119163327.16306-6-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119163327.16306-6-jszhang@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 20, 2025 at 12:33:17AM +0800, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.

...

>  static struct syscore_ops pxa_gpio_syscore_ops = {
> -	.suspend	= pxa_gpio_suspend,
> -	.resume		= pxa_gpio_resume,
> +	.suspend	= pm_ptr(pxa_gpio_suspend),
> +	.resume		= pm_ptr(pxa_gpio_resume),
>  };

I believe this needs to be thoroughly checked and thought through as
this is *not* a dev_pm_ops.

-- 
With Best Regards,
Andy Shevchenko



