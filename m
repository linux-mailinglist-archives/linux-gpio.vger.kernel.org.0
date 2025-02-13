Return-Path: <linux-gpio+bounces-15963-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1989A34EDF
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 20:59:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 979AD188C494
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 19:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C06A24A079;
	Thu, 13 Feb 2025 19:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bPLZTLDk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8669520764A;
	Thu, 13 Feb 2025 19:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739476740; cv=none; b=nc2Fseq9Nyn544inF+YLB6RnRXcEDOrv+y2Rei3NfwANhemLOlQw9/3VqRpFJJ+wBaZdnAxp4W8Bd/yUNEEOgyVD5goeowMi+q9vKQR8w9ZquBmU0iy60w5+1FILNoZG35LBw45RWURHkrKyQcwLr0fpQd+Ka0cYDEf6UW9LR1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739476740; c=relaxed/simple;
	bh=RyreHDxBizlFiBJyVrYaLJTxuTc8Y9j30c42u9G6/UU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TITEwhYk3aogoDBAFicpw/0lHIctnepvtervQOyhkPvX1kvYkindNPd3VgGOSrwNT32A4t+fkPAxscHQnVJj46nZ551LU3RuX309G3/eBtZQWfqdyZUJjiHytIvuViz09R+pwR0dq1Pb12JIVN1XAfPagOkTS3/6C7nS4ncpEwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bPLZTLDk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739476739; x=1771012739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RyreHDxBizlFiBJyVrYaLJTxuTc8Y9j30c42u9G6/UU=;
  b=bPLZTLDkVchks+IH7FOwrA3oXr089NiQS8blMg08Xsj02uFYPmveesxE
   JV5v8ZDhW4CuFZLCDSxPm24Z8vYIBTu22s5Y/7EzOfrnOO2106NV2e5OY
   W8czmsAiK2KutRbASW5mbYGazGit75Wu86anSJbl3ATYvR+xky8hQEY0z
   ZOsAphbcGchmEPVMJpGKbXbfXN8cNV2hq01X1/zaQ8/vNMxbyYjcH6Oqf
   iM+SEMh3mNTTHzUKvyZPoaJL9cWeLbZcW1Am9gyk1Uu6TRz+mUXmC811q
   MG8R4b73aXoSgMeunBUOgqDfIeAOkuRQM8eRNnTAXbR20qzZ1bHDofM+k
   Q==;
X-CSE-ConnectionGUID: 51ssCiAEQS+z1KgrRA4YGg==
X-CSE-MsgGUID: pjbd9bCVTM2P6wPiE8TCYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40355413"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40355413"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 11:58:58 -0800
X-CSE-ConnectionGUID: RZOTy1WsQEiPhZdbmarpAQ==
X-CSE-MsgGUID: zdlZnutgQw+nzLEJWQLRWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117373760"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 11:58:56 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tifML-0000000BGwD-3DSN;
	Thu, 13 Feb 2025 21:58:53 +0200
Date: Thu, 13 Feb 2025 21:58:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: : Switch to use for_each_gpiochip_node()
 helper
Message-ID: <Z65O_SaoSUcAY-rt@smile.fi.intel.com>
References: <20250213193152.3120396-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213193152.3120396-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 13, 2025 at 09:31:52PM +0200, Andy Shevchenko wrote:
> Switch the code to use for_each_gpiochip_node() helper.
> 
> While at it, correct header inclusion as device property APIs
> are provided in property.h.

Linus, I forgot to update prefix. So, I will wait for other comments, etc.
If no problems appear, can you fix that when applying, please?

-- 
With Best Regards,
Andy Shevchenko



