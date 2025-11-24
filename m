Return-Path: <linux-gpio+bounces-29002-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3000C7F420
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 08:52:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66EC63A17EA
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 07:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3608C2C3248;
	Mon, 24 Nov 2025 07:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EabSMIdt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2492550D4;
	Mon, 24 Nov 2025 07:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763970714; cv=none; b=OMymg8sRELsrBAEx7Sr571YwQ4UQHsoYz5mSpvoeOc8SwbYHxEITd00u8m0OVPDc4Wo4qmczaS6fdx5H5NT7xMJ+4httJXIx/QOmCxPrZsN+hSC99vK7jU2tA9C/aWpe0fBciTNIMLWfFb65/faRzJ1nTymcGb8s9USVcOzDTRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763970714; c=relaxed/simple;
	bh=FXdcsNT83bzISlwMMljD1n6AKms9qZXmDn9X2sjfCng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQdi0QbXBDIQgXXcpbyFxZBCfcu7K1mn2QZBJr3KUT3NNjCwEQqWNm2nBWa1FKpaG7o4rYSXD2ijkgsJBmBKxPXqzdBrUXhDlu96J60FXc2lR9wwPleoCklD6H7Fbad09TYVnXER/IEma0ZV4bGsFJuq3IdlwiOwEZO9jsBTCsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EabSMIdt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763970712; x=1795506712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FXdcsNT83bzISlwMMljD1n6AKms9qZXmDn9X2sjfCng=;
  b=EabSMIdt75hfEJy/3Yg1c5DIGvenK4uQDz0J+hG5ssZPqKihJ+ZPwLdf
   vUPTaYSGjuoHs8KqBUqn9GJXeyjYH2M9AkkRYN+7KbcqYtS3jCadzQeAg
   su/AQZ54WUlHS1Hc/KCVKVK6nxfVDGwC5IS5G5m2XOeELYA3IfmvQ7p6D
   XhRhcP7eg/z7QxBG9RBpsLPezI061uGUXy7TpFVH5ZYjUzt7KLeHvN2s0
   A5vz+tRf6uglbHwRBJ98qwUgs1l1BR4v27Y8P560dTX0shw5F3sq8y/Ny
   nxY7hMCuCnjPrH6BESO+JnnssUGLNEzq3FSIww8xVBE6IefGobz/Fi4ef
   g==;
X-CSE-ConnectionGUID: 14ObPUaJS6C9lmA3dyOFnA==
X-CSE-MsgGUID: zMTr96dDT5SBrUbV7dc7MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76576948"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="76576948"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 23:51:51 -0800
X-CSE-ConnectionGUID: ksLs+7wdSoqwQVozj0FSGg==
X-CSE-MsgGUID: 3C/TwgOxSCGblUyziKv2mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="215612518"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 23:51:47 -0800
Date: Mon, 24 Nov 2025 09:51:44 +0200
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
Subject: Re: [PATCH v5 02/14] gpio: brcmstb: Use modern PM macros
Message-ID: <aSQOkP0fPZfFEytq@smile.fi.intel.com>
References: <20251124002105.25429-1-jszhang@kernel.org>
 <20251124002105.25429-3-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124002105.25429-3-jszhang@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 24, 2025 at 08:20:53AM +0800, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.

I think converting to the respective macros for NO_IRQ case makes sense in
the same patch. But I leave this to Bart, I'm not going to give tag here
due to the above.

-- 
With Best Regards,
Andy Shevchenko



