Return-Path: <linux-gpio+bounces-16395-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 852A3A3FA70
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 17:13:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8129619E3D27
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 16:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D29215F7A;
	Fri, 21 Feb 2025 16:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1sHyE9E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FE622686F;
	Fri, 21 Feb 2025 16:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153654; cv=none; b=Hy/m3rfXpnbPQhx885BZBvYShXXQoYE3WYpxvuq8NudmGnm4ObIl5zwy2aNz5LWarcw9eajOHL3+1nwMm4wWrF/m28Z5OVEQBYGZgH3f/90UyeSZJj/XyPpDPDtUyqi/KalYQsU2zstJZipp72+S8QM+IAunvg6y4HjU1fJZewo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153654; c=relaxed/simple;
	bh=Kyt411Ml4/q3/FUQb7tZJ7Wzv7BDpStAZNsCgXD6sp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GuIs6hmxL6CnWHEH/PvmSIwI6xtZchQuU0KdSSZNutonswJkPydYwM7eTe1WMpSEiZhsxiHFw2DMNXkx5XZSt++0RDAq+eH/YvnEoEY/jBxyVZIRgUH/OKC4Zfvda1ietybgY9xiJeTKMbs8msrNKY5k68PS/PizClHJTn/UPRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1sHyE9E; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740153652; x=1771689652;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Kyt411Ml4/q3/FUQb7tZJ7Wzv7BDpStAZNsCgXD6sp0=;
  b=F1sHyE9EuQw1C3VVLtv2JQxUQLWz7v6F4ZploZfxt4jPJnt+507Rl7S8
   93EfW9AUhKHqzTqoVv0dMcVqRuSSYHcMvc0E91oWKGCQPomyOMblN1+W+
   hYuqgNICUmdA+wa/MrRC2ujtl/Ss1CTuL5h8e9HadyG1PGMC/+OG0t6sG
   QX5Ndq+ZcbRxEkNjfIvkR9tUclZhl31VSrBvX6Hv0W6CawCO5hN/d8wF5
   NxnYqrxSdzjQYJ4SfIQaZrpq1IjbUU32cLj5+dQipZNwtiErqCj5RdTAR
   SzjsTUIXTeQ0blC1AMG3Job3QhSJYkfupU/htQv4xqlHDNvc1/MYYDCxA
   g==;
X-CSE-ConnectionGUID: /pvxjgwnRaW2nwUQpfXgsg==
X-CSE-MsgGUID: dp48bTVBRF+g1yNQet3qWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44891224"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="44891224"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 08:00:51 -0800
X-CSE-ConnectionGUID: NR56zFtfS3mSzPRC3zs6YQ==
X-CSE-MsgGUID: iO/9mQl/QZ6Px/5MgzlFKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="120382098"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 08:00:49 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1tlVSI-0000000DgW9-1iA1;
	Fri, 21 Feb 2025 18:00:46 +0200
Date: Fri, 21 Feb 2025 18:00:46 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpiolib: use the required minimum set of headers
Message-ID: <Z7ijLu5Z9MiW4IAp@smile.fi.intel.com>
References: <20250221123001.95887-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221123001.95887-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 21, 2025 at 01:30:01PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Thanks for taking my suggestion into account!

> Andy suggested we should keep a fine-grained scheme for includes and
> only pull in stuff required within individual ifdef sections. Let's
> revert commit dea69f2d1cc8 ("gpiolib: move all includes to the top of
> gpio/consumer.h") and make the headers situation even more fine-grained
> by only including the first level headers containing requireded symbols
> except for bug.h where checkpatch.pl warns against including asm/bug.h.

I'm not sure we should consider the checkpatch.pl in this case.

...

This change is definitely an improvement from the current state in your
gpio/for-next branch, if you are really strong about linux/bug.h, let me more
time to check that header and see if there any potential issues.

-- 
With Best Regards,
Andy Shevchenko



