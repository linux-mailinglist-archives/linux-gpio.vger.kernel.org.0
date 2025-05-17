Return-Path: <linux-gpio+bounces-20265-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA60ABAB1D
	for <lists+linux-gpio@lfdr.de>; Sat, 17 May 2025 18:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F71F18984BC
	for <lists+linux-gpio@lfdr.de>; Sat, 17 May 2025 16:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C133020AF62;
	Sat, 17 May 2025 16:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbTUAr7p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC6915748F;
	Sat, 17 May 2025 16:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747499320; cv=none; b=byc+l0AHHvk4ivFPlfXcNzSWMqxV28uBBxCl0R4+4AiMOSFQkTEhE+QPTVMalRIjwkpSvbEBhU3s72Oco5I3+5dqS0M6IXdsjWpMSqvB0ZhTENSZhd4W+PcPAw/Vvh2r6+8jQnuaifBjufsoEU7yntdJMFX9XQzXYsU10FEpYOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747499320; c=relaxed/simple;
	bh=WJbQgRZO8pBaUF67/UjtlS0RvUVsOBvvMvIIb35Oaso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BpkBPMfkTzZHzRlScAmHGzuxHNtjUpDdRme95st0G2vOVAnahB6JosG6Lmsa6GtIRozoxU4e+tvR+jKQcsjfw1OsCcuMn2MvxffDcEkmSDuLBCxVsm87egpj5z17sldqu6lTc0TAQpM4ijYWCrELoMhJjkmLc2ZjLkmc/y6cua0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PbTUAr7p; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747499319; x=1779035319;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WJbQgRZO8pBaUF67/UjtlS0RvUVsOBvvMvIIb35Oaso=;
  b=PbTUAr7pXHXoFXFVdoffUkDyD6t0qGoAWV8CC53tjTMW/jPA+s56+Tls
   Dqd2ahSGLU5BiNv4wD7QAgRzQizJYuhBXdSqUSYfxrTFLwdVfA63yzKK7
   p7oN5d7s5lOPhSNPxjOEvMrP37ysVz/5qLltunFLWTEuAAwMuORooKP1N
   qHGha4KWzR48PefCb1bKEpx5GpnjNitpCaIMG5Obd1mTekcJVWKgkME/R
   fbFYfD10ZUenU7I+1uQ108ddagsSq8a6avGnQ36l873NdDKmvE82pyEyT
   9/cwETtaRjQyzVFw5bjV9NbiMuXt0YYYEELwC91auRjlz4EESTEgKWIyY
   g==;
X-CSE-ConnectionGUID: nqCwJXSQS4ClQU+GCLhxUA==
X-CSE-MsgGUID: hF9AxtVuQtOMLpgvrwsYwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="49381462"
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="49381462"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 09:28:38 -0700
X-CSE-ConnectionGUID: Sq/Jz2YURICyO09R2idEew==
X-CSE-MsgGUID: N510eJ5qQimeFD2btNcvxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="138711331"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 09:28:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uGKOl-00000002Teu-1Rtb;
	Sat, 17 May 2025 19:28:31 +0300
Date: Sat, 17 May 2025 19:28:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	platform-driver-x86@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v1 1/1] gpiolib-acpi: Update file references in the
 Documentation and MAINTAINERS
Message-ID: <aCi5LitM88RnoN73@smile.fi.intel.com>
References: <20250516095306.3417798-1-andriy.shevchenko@linux.intel.com>
 <02bdf242-cbfd-18e2-fabc-82f20823dcbb@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02bdf242-cbfd-18e2-fabc-82f20823dcbb@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 16, 2025 at 03:19:11PM +0300, Ilpo Järvinen wrote:
> On Fri, 16 May 2025, Andy Shevchenko wrote:

...

> Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Thanks!

> I assume this goes through some other tree than pxd86 ?

Yes, via Intel GPIO.

-- 
With Best Regards,
Andy Shevchenko



