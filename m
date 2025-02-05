Return-Path: <linux-gpio+bounces-15371-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0771BA286DF
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 10:45:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 280283A81A2
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 09:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4FD22ACCA;
	Wed,  5 Feb 2025 09:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QUt2RiuL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720CE22A4FE;
	Wed,  5 Feb 2025 09:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738748703; cv=none; b=UEwomVERiord46wsoC5o23Qo7ZGbfVzfJtPR6PR7TKcQD2G170N9RevMEvey5hlPLPgEp0cYDzN8ZFDWPZS7At57GMVkPP3wSiTFA2CGkNwrVpamnP7TpJakcmc72kdDyVJ5C73yReTqhdEaeVELFd+MClMkQwSnqqrO+1Qdqdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738748703; c=relaxed/simple;
	bh=RGt9by5OF1ibBjUOCxac7nIzMILjF1azzQF42QP/cE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mzof8pwt557iwC2NkwGKDh1Itv0Mcmi5TYnyLpgBB+tKJapoDGgwxAXCfH8YbG1plQ7N4DGPM8Slx3mB84PdsvcnT2SZCcw9PvTwfskQenW84VFYCy7PkFgbirogxmWQGyCW6kgRLtJC/lil1WFPWWw1PTLgo2rjdnQi7sgcd3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QUt2RiuL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738748698; x=1770284698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RGt9by5OF1ibBjUOCxac7nIzMILjF1azzQF42QP/cE8=;
  b=QUt2RiuLf16oY6L8EG+RqK5choG9d2hVJWlrDaEoG5MHWf09dbNr6QYH
   ANyRlK9XW5gKUtNMFp98DaGGBmAN39nFJ5eU7NA3571B/24n/sGrHqWJt
   EcqOBeohnBWXVnxx9UYvzTuWDu4OCedPxYOFe8BqHz84sP6BmkCKwccBX
   QST6uDOosMYQ8Qqz4rw69gbifztj1fMIymsnL0LtDfFtQvgi4ImYoD4wo
   kgBT3hZ7f0mDZaXCVr2S2PMM1O9opeqldfsHHAvzUT+/G7fRomE1YZWmO
   BnAjivpnB7lrta79wmEZ1JpSxymWEwrO2mHByiQ6i9/aHW04afjxP7wfp
   A==;
X-CSE-ConnectionGUID: WA4q0vapRDa4tNQHJ08SNw==
X-CSE-MsgGUID: EkoN038ASZSEaoanSw+zFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43225698"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="43225698"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:44:58 -0800
X-CSE-ConnectionGUID: 5BIQZlN9TqKjZXBctn9/Zg==
X-CSE-MsgGUID: LZvEaLh5R26ShhVJP8CvUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="115845952"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:44:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tfbxj-00000008RX6-22T6;
	Wed, 05 Feb 2025 11:44:51 +0200
Date: Wed, 5 Feb 2025 11:44:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 0/2] gpio: xilinx: Replace custom bitmap APIs
Message-ID: <Z6MzExQFcIz9HlkN@smile.fi.intel.com>
References: <20250205093200.373709-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205093200.373709-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

+Cc: Yury

On Wed, Feb 05, 2025 at 11:31:09AM +0200, Andy Shevchenko wrote:
> Relatively recently bitmap APIs gain a few new calls which may help
> to convert the GPIO Xilinx driver to use them and become shorter and
> nicer. This mini-series does exactly that.
> 
> Changelog v2:
> - fixed a regression in patch 2
> 
> Andy Shevchenko (2):
>   gpio: xilinx: Use better bitmap APIs where appropriate
>   gpio: xilinx: Replace custom variants of bitmap_read()/bitmap_write()

Yury, just FYI, after this series, if applied, the bitmap_remap() and
bitmap_bitremap() may be moved to the NUMA only APIs. Or i.o.w. the
commit cde3d0f81e67 ("bitmap: Make bitmap_remap() and bitmap_bitremap()
available to users") may be reverted.

-- 
With Best Regards,
Andy Shevchenko



