Return-Path: <linux-gpio+bounces-29222-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E9536C9EA26
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Dec 2025 11:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D45324E1009
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Dec 2025 10:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C612E6CD4;
	Wed,  3 Dec 2025 10:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KhJlfalS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3887A2877CF;
	Wed,  3 Dec 2025 10:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764756268; cv=none; b=HvAWqVLPv9omR30DLNXcqAufzowTggDqBg6KCvj2R6V/kpZpAEwPMbJqGHYSIriE2Bi8zfaYK4ciPVQaPEnGBuNiZZ9iIY5520dV1XQMsFXPrc503fqosO7/AEBJnKuXxe3hl9idbVSW6Vd0z0RdoqYjyVW7qdFCoT4iXDCJ4Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764756268; c=relaxed/simple;
	bh=VF8qTvPp9T7RO7Z6FV+KSoKOalmk/O5v48iAD3Ll2g4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qP2b4JOAaGiljoe5Vg4YztI0IQIEssNQItjgr72abRbsh0yLe5O77Fl0niftVvyrpWxph/sg8PCjSx2CJq0PuWQSG+u2R3g/wCCgLArlO3KdtPJ9CJNGSURRer26Ihs1paNHhrbJrSCHYxsaf+6Tu7MhcdiRBt8JyH9Mb7KZYjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KhJlfalS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764756268; x=1796292268;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VF8qTvPp9T7RO7Z6FV+KSoKOalmk/O5v48iAD3Ll2g4=;
  b=KhJlfalSEERZmcRsYoRjdfvgCULgbESllEsVFMM8ONA4ow5rs4Y7y43m
   vSwvjvOUCtFUWtCuWLnFnCC6ArNBdpwBBzngk+/9CWqyjpefGd0ZaSf2x
   tFVxkEh2YaAi67ctPOvIpS625S4RU3OScbkBBa/sqnyYnu1WO3lyUrZ3l
   qJo6pm9bgqWUYyJ3oQu5DOMhc/7r/A9yvPmSt5Y1y89jdMQa4qn4vmimL
   +CfmCDh+gzWDVkl3j/Wsn+efYB4cG5V+vStC4I47pZjFvHdxha2Y1IorK
   7KvvJV1ErkHefreyjJ8Kd0XcEwpRCBibtOtz2jTWMUyLFjbMALuJPlYQQ
   A==;
X-CSE-ConnectionGUID: i9c4kTqnR/mvhb6oIYj2Hw==
X-CSE-MsgGUID: 57yY1DrWQLW0YHcRSeiFzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78091841"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="78091841"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 02:04:26 -0800
X-CSE-ConnectionGUID: X6jZggesQyuCA+GoJYcHCg==
X-CSE-MsgGUID: kM+5QMqyQNuoSzVbHT4Ucw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="199764083"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 02:04:23 -0800
Date: Wed, 3 Dec 2025 12:04:21 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Wentao Guan <guanwentao@uniontech.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: andy@kernel.org, mathieu.dubois-briand@bootlin.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com, niecheng1@uniontech.com,
	stable@vger.kernel.org, WangYuli <wangyl5933@chinaunicom.cn>
Subject: Re: [PATCH] gpio: regmap: Fix gpio_remap_register
Message-ID: <aTALJckmUxkyeMBG@smile.fi.intel.com>
References: <20251203020342.2564767-1-guanwentao@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203020342.2564767-1-guanwentao@uniontech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

+Cc: Ioana

On Wed, Dec 03, 2025 at 10:03:42AM +0800, Wentao Guan wrote:
> Because gpiochip_add_data successfully done, use

gpiochip_add_data()

> err_remove_gpiochip instead of err_free_bitmap to free
> such as gdev,descs..

What does 'gdev,desc.' stand for (also notice dot at the end)?

> Fixes: 553b75d4bfe9 ("gpio: regmap: Allow to allocate regmap-irq device")

Perhaps you also want to add this
ae495810cffe ("gpio: regmap: add the .fixed_direction_output configuration parameter")

As the patch changed the logic from the original commit.

Interestingly the 3bd44edd6c55 ("gpio: regmap: fix memory leak of gpio_regmap
structure") fixed one leak and missed this one.

...

> struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config

>  						 config->regmap_irq_line, config->regmap_irq_flags,
>  						 0, config->regmap_irq_chip, &gpio->irq_chip_data);
>  		if (ret)
> -			goto err_free_bitmap;
> +			goto err_remove_gpiochip;
>  
>  		irq_domain = regmap_irq_get_domain(gpio->irq_chip_data);
>  	} else

-- 
With Best Regards,
Andy Shevchenko



