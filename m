Return-Path: <linux-gpio+bounces-9293-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 218F59630E0
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 21:21:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CC481C22038
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 19:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E518A1AAE02;
	Wed, 28 Aug 2024 19:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cCq+RNIi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217922868B;
	Wed, 28 Aug 2024 19:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724872880; cv=none; b=jeQ+B293Nk2a3pbAauYptK6TD05NmFiETJvsx9jeaRBfrW4IDj8jgFHn3YNitJSJBUlddMYA6i67wTlgYo36x7d6XxoIK/5a+YrXCTR9imtON+G2CqRGTZV6bf8o6MZZukqetiYH23rVeeJ0AR4cUfBQrTdiIZiRVOehSX+1BAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724872880; c=relaxed/simple;
	bh=rQNHLGP80loKvgFLR7dACFXe+uYxwCiPBrgPZKvC0hY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJIWIvCUes/t08waMUYYTvRXa4ayOj0qivdZ49XqNBXfLl70r2NMvos1Fobut6Y+2At5CC2jkcpZB7d2KS1YR4qkBx/sVYItsqIiGPH4md87Vf/rCRhkR1BP/1hzd+MIHiPbSLDYmmVNyt0J6kF7SIv5ZtrRDNvF4CxVhAzUoLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cCq+RNIi; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724872879; x=1756408879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rQNHLGP80loKvgFLR7dACFXe+uYxwCiPBrgPZKvC0hY=;
  b=cCq+RNIiSzC/21RW9AvTUjDu83Lhs6Um11ET8RLYy+Z1udq00NVpRYnv
   ywoMhB1LgjcJg3pWqzotRttm6j7BtcFcbIJ+DLaTY62sRef4avZYeBxq8
   cEI+0EShYyPEfyZDBoWZjTXVOrmkjeKaHCC4e4+82vkYoCjRNOqo3K3J8
   9PQdN5YDAdb9BT7fNKIFwVseQ8j7gGtagACRfLFWPXbAWjlJqm3OgFGD5
   9p/W6cuPQLWyUzLmglTxqPLwoWddtTguB5CWylTt9klK6DwMjh64jvUpA
   kN3rAMv+gwyeFvN7mtuGldaGRmTjFpXM7JuAbJDG9ND4SMHbZaVZX/fw4
   g==;
X-CSE-ConnectionGUID: D/rjD00LT5+8vxPLlNuO7A==
X-CSE-MsgGUID: PpVB+tAFQfyIJri4JkvQgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="48812095"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="48812095"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 12:21:18 -0700
X-CSE-ConnectionGUID: EMbAMVIWQ2KI24pCoCUg4Q==
X-CSE-MsgGUID: Vps4oXyRRW2GpIBs+JzKHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="68225169"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 12:21:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sjOEE-00000002lWW-3sjd;
	Wed, 28 Aug 2024 22:21:14 +0300
Date: Wed, 28 Aug 2024 22:21:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/5] pinctrl: intel: Move debounce validation out of
 the lock
Message-ID: <Zs94qgBBXtF2csH8@smile.fi.intel.com>
References: <20240828184018.3097386-1-andriy.shevchenko@linux.intel.com>
 <20240828184018.3097386-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828184018.3097386-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Aug 28, 2024 at 09:38:34PM +0300, Andy Shevchenko wrote:
> There is no need to validate debounce value under the lock.
> Move it outside.

...

> +	if (v) {
>  		/* Enable glitch filter and debouncer */
>  		value0 |= PADCFG0_PREGFRXSEL;
>  		value2 |= v << PADCFG2_DEBOUNCE_SHIFT;
>  		value2 |= PADCFG2_DEBEN;

This has a bug, I fix it locally for now and will wait for the comments for
the rest of the series.

> +	} else {
> +		/* Disable glitch filter and debouncer */
> +		value0 &= ~PADCFG0_PREGFRXSEL;
> +		value2 &= ~(PADCFG2_DEBEN | PADCFG2_DEBOUNCE_MASK);
>  	}

-- 
With Best Regards,
Andy Shevchenko



