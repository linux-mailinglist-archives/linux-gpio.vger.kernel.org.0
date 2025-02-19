Return-Path: <linux-gpio+bounces-16228-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA23EA3BE2E
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 13:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87BE71896395
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 12:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 717361E0DCE;
	Wed, 19 Feb 2025 12:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RoGlhI8t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD39E1E0080;
	Wed, 19 Feb 2025 12:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739968377; cv=none; b=SAF1jAA+sJTY2IVcQ7cCgbc6Jr2N1BCwnb4/AtUcDfCQ9RAwk19GT81n80l1yjKEqxqcfRSIClKOraXquF1BgycITCfSuhA6H4jeRflb7foEJ6URz8HtyP5KfQXvJSpX1TZisiRSi7g8pHG0stMFCDgSTfO3x45mSxdsnJn19Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739968377; c=relaxed/simple;
	bh=yDIUhMyqlYHrRY20nMSXqUJxRAG2s+oBiIMHyGosyBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJop2aDB33R6oa0or0Z2HlQGMMvs0/A1vQ6rjYUJFrzFT6rNqGiXAR2i2OryTUdXbV/UglKQcdxs8Y0HlHQ/xmGhQbfZWiGp1RLPHTd3Oyn50svG8nXrbIU+OexjaWXqg6WiT9/3qjq2A17ly/5BMAw+//GDQiF7zf0QN63yeWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RoGlhI8t; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739968374; x=1771504374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yDIUhMyqlYHrRY20nMSXqUJxRAG2s+oBiIMHyGosyBg=;
  b=RoGlhI8taAGKT6PI9qqJtbIT0Tmj9MmI7smPws2BxN9gAKJVG7YVSgHC
   w+8PiVqXMfCbumv4+oowLm+sAf3L6ggdKETj42gzk80uzEcuS7fviaEom
   L5jXHdfqGFjxBV5xZMuhg/VH0MBV0aqKNLgnOmd1eFPeOrRpcGiguieZs
   QKiLswICX5kXviKVMyYADHzVhDaMKB+iCYMBndx/8BjKxGQLwP5xQZd6w
   fCZUAYwSqDTHimd7VkQMc2YXkurG25KkRYFVAZtQ+fIdR4+sAz2vBCM8j
   aJSXm3dlkWmStEMZIoprFHR64TrUGUXCbzXwm9tVydcQZ60SIxrcKwNQo
   A==;
X-CSE-ConnectionGUID: INzGqisJTJa9JyRLp60uDA==
X-CSE-MsgGUID: Q3yLY/8oQgiZTx4+0BbUQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44618012"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="44618012"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 04:32:54 -0800
X-CSE-ConnectionGUID: P6SoXoDrS4CFvqkEzYPl/Q==
X-CSE-MsgGUID: ubcoNE6GTcOEyO+gJYZUDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="114622799"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 04:32:51 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1tkjFx-0000000D1RH-1Vab;
	Wed, 19 Feb 2025 14:32:49 +0200
Date: Wed, 19 Feb 2025 14:32:49 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dipen Patel <dipenp@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	timestamp@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v4 1/2] gpiolib: move all includes to the top of
 gpio/consumer.h
Message-ID: <Z7XPcYtaA4COHDYj@smile.fi.intel.com>
References: <20250217103922.151047-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217103922.151047-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 17, 2025 at 11:39:21AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We have several conditional includes depending on !CONFIG_GPIOLIB. This
> is supposed to reduce compilation time with CONFIG_GPIOLIB=y but in
> practice there's no difference on modern machines.

It's not about modern machines. If every maintainer will think this way,
we end up in the complete and utter dead end with the headers.

I believe you at least had read the cover letter for the infamous Ingo's series
about headers and how it speeds up the build (in some cases up to 70% on as you
said "modern machines").

> It makes adding new stubs that depend on more than just GPIOLIB harder so
> move them all to the top, unduplicate them and replace asm/ with preferred
> linux/ alternatives.

NAK.

This makes dependency hell things much worse and this is a step back on the
untangling the current situation along with the slowing down the speed of the
build. Please. consider to revert or discard this patch.

...

>  #include <linux/bits.h>
> +#include <linux/bug.h>

Okay to replace, but not okay to move.

>  #include <linux/err.h>
> +#include <linux/errno.h>

Please, double check that it uses error codes from it, otherwise err.h includes
asm/errno.h with basic codes already.

> +#include <linux/kernel.h>

This is definitely no. Please, read what's written in the top of that file and
here is just a proxy for should come in the future a kind of might_sleep.h.
Do not move this one at all, please.

>  #include <linux/types.h>

-- 
With Best Regards,
Andy Shevchenko



