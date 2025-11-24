Return-Path: <linux-gpio+bounces-29004-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A65C7F4D4
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 08:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E618C4E3E5D
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 07:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371992EA723;
	Mon, 24 Nov 2025 07:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X5Wz8yl1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810702E6CA0;
	Mon, 24 Nov 2025 07:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763971086; cv=none; b=SCpaGizWOOptOrISIYveKeqj4AFw5v4qBOTkErZf879k3D92U6oUN1DMGloylEdmgvrYsbGznTAVky4ZfGhy1I6I9UZZEPrY6OLp3vkdbRPU6aOf8GQQfWol3td86RKLy2ZgoeTGWAl7JjpJFbNOwu9eZtIQJWO0a0b/G+IRpSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763971086; c=relaxed/simple;
	bh=EmHKU2xxJbu/DLF8gf4ZAIzPPmfTU9pQIr7ysaaEXI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7N09/MGvcJsT8RCeFEkqOjaPoist1YZ7NygM5Z25DYNCjqgXT39+4ZL6uLujtjtwU5TZCC/PtDnJ9oxUehZ+8k6kzFuTyrvwSG953GtbgtK/d03sFmKus1msdvfeDr5JCwKYebxUkyjoXl/VA5O0ZVvG1BV2ZOIVfyRnRj4cRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X5Wz8yl1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763971085; x=1795507085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EmHKU2xxJbu/DLF8gf4ZAIzPPmfTU9pQIr7ysaaEXI4=;
  b=X5Wz8yl1e1tKqYqdziGH6IoMvE0GBqs2rUFCBZbGbH+KC3AJYfU6AZgC
   AWaT3FAuaRfMInngNjOC968zBTd97P6vlMUvK4YqoYNT5RSr8RxSbHMLQ
   zVIvAVSDvgWb6FN7dZT/z1PIUUUumbG/d4mjOWTCOBvzUo6f3uqNjOVKt
   yRAqV4quROshvf8KSynynfoMrUii39NGDWDreF8rcZKo/jUA0cmNkAYBu
   5s8As5xa0XbdDlq8Sdn2QFv0nOcunAf9AEDCc2kT9qc2avU3VVxdWpGbC
   ZQXcPZ3/IdAG5nyhzgMSj4ka7YJj6v4Z2xWTg50JnuJyk0MwqQLkxncDK
   w==;
X-CSE-ConnectionGUID: 2Uu519V7QmqUuCDOHqWlJg==
X-CSE-MsgGUID: GNMlthPqQii+cqxuTzPFTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76290071"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="76290071"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 23:58:01 -0800
X-CSE-ConnectionGUID: 4DrC24XPQASVE85LhLaYSA==
X-CSE-MsgGUID: Q5rBk3MoQKma6GTN3gswXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="196549379"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 23:57:58 -0800
Date: Mon, 24 Nov 2025 09:57:55 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael =?iso-8859-1?Q?B=FCsch?= <mb@bues.ch>
Subject: Re: [PATCH v2] gpio: dwapb: Fold dwapb_context into dwapb_gpio_port
Message-ID: <aSQQA1pCyFN2rppy@smile.fi.intel.com>
References: <20251124003206.25618-1-jszhang@kernel.org>
 <aSQPwEJhsUxuDAmH@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSQPwEJhsUxuDAmH@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 24, 2025 at 09:56:53AM +0200, Andy Shevchenko wrote:
> On Mon, Nov 24, 2025 at 08:32:06AM +0800, Jisheng Zhang wrote:
> > Fold dwapb_context into struct dwapb_gpio_port to further simplify
> > the code. Sure this brings a tiny 36 bytes data overhead for
> > !PM_SLEEP. After grepping the arm/arm64/riscv dts dir, the max dwapb
> > GPIO port number is 6(the berlin2q soc family), so this means we will
> > waste 216 bytes memory in total which is trivial compared to the
> > system memory.
> > 
> > From another side, as Michael mentioned:
> > "The driver currently allocates the struct with kzalloc and stores a
> > pointer to it in case of PM=y.
> > So this probably has an overhead in the same order of magnitude
> > (pointer + malloc overhead/alignment/fragmentation) in case of PM=y
> > now."
> > 
> > So let's Fold dwapb_context into struct dwapb_gpio_port.
> 
> Fold --> fold
> 
> Given more thinking on this, I believe the approach with kmalloc() is
> preferable, but what should be done is

> - making context a global variable

I mean global _per device_, so moving it to the DWAPB device level structure.

> - considering allocation for all ports at once
> 
> If this is done, the embedded approach will look less efficient.
> So, please try that one instead.

-- 
With Best Regards,
Andy Shevchenko



