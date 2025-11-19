Return-Path: <linux-gpio+bounces-28794-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A8DC6FEAA
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 17:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DD75B384043
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 15:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED883A79A2;
	Wed, 19 Nov 2025 15:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQsfMwjN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEA83A5E97;
	Wed, 19 Nov 2025 15:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567445; cv=none; b=TF+BSZredtWjfkuvNYi0If5OvgcyNz68X7MXo3ssVF8G+djQt7EihOOSrHq+UgbB6MmoISatz1jUTMdKw0odXGAc3xX5RzBXu4u+9qGeZ4R58Qth8Kypm/ydjhnFZ//HEUGQOKz9BR5GaeLtRjs3UrlH5cQ07pYxPijaZRATkTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567445; c=relaxed/simple;
	bh=sKe7PQga7mEwwmr43fx8AUl/x1ZKsYGU49c5RjNn8dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G04olkjjpH25LoHvS1WJS0vaRx7ZNvw6ZGaaun/lbrG0E/AJbmG/uZZxAgLoJJW6Nj5yt4U7+KtIJFj/SZ05q25h/KqLIHLTzExZ9/oRtcVyBzIRd0jQb89jcsKUtSiIwDHc3CNVg8FS+dycse/tpGu4AYRyq8fgtCotM97sK10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQsfMwjN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763567443; x=1795103443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sKe7PQga7mEwwmr43fx8AUl/x1ZKsYGU49c5RjNn8dg=;
  b=MQsfMwjNU6aHA68AOQHXFJ0qfFwpXy66rX8Fa/csWXU2iGZMUAh5JM0q
   ZmfvzZlpwj4RN9/GHuS+LyuTpHDotXs5yDgqCQDlcRbwGWvXhMJKnNvuI
   bp95VMB2Y2BUetBrkozVG2GrFRAc55uKe4a2/gkC0Zz0Q5xTX1j21SCmx
   Lmmr6IB4OzHktAttdg/Ohv1ldXi9N1b8ftIad+fEtDf8l0qmpqO2wamSr
   MCaSWqa+I7QvHQns24EzJgMw+xBK2ft7RcCrJ5W08WstTm6wIhkxT44mv
   s6dxBIGR3zUjz0fqVHPbVwxYMugFZonfrGYnGyJgza6AqUScfZo+lVJzq
   A==;
X-CSE-ConnectionGUID: 0Nm0yFXUR5OiWl08Dy0ZHA==
X-CSE-MsgGUID: T7k/FPajR3mrY04zn8P0Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="69466188"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="69466188"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 07:50:41 -0800
X-CSE-ConnectionGUID: njUuKHcIS1Sr/heLazlIfg==
X-CSE-MsgGUID: TOrmaFR8RRyFFpf7JmhZ2Q==
X-ExtLoop1: 1
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 07:50:37 -0800
Date: Wed, 19 Nov 2025 17:50:34 +0200
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
Subject: Re: [PATCH v3 04/15] gpio: pl061: Use modern PM macros
Message-ID: <aR3nSmSlV9bfqi3k@smile.fi.intel.com>
References: <20251119144327.13345-1-jszhang@kernel.org>
 <20251119144327.13345-5-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119144327.13345-5-jszhang@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 19, 2025 at 10:43:16PM +0800, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> The pl061_context_save_regs structure is always embedded into struct
> pl061 to simplify code, so this brings a tiny 8 bytes memory overhead
> for !CONFIG_PM_SLEP.

As I pointed out you have a typo here

_SLEEP


...

> -#ifdef CONFIG_PM
>  	struct pl061_context_save_regs csave_regs;
> -#endif

Just leave it here, and drop that paragraph from the commit message.

The rest is fine.

-- 
With Best Regards,
Andy Shevchenko



