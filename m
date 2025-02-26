Return-Path: <linux-gpio+bounces-16630-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B09EA4619B
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 15:02:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AF2F172F12
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 14:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEBC621B9CA;
	Wed, 26 Feb 2025 14:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kkIpI2cc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BD51494A8
	for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 14:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740578567; cv=none; b=gHStjyZbrnnpVUlZ+hmmf9xj1VV9dOc4xvJ2xJs9ZovYxKbi98e1VJG3aJzzf7MhYYO+oDLARBsPlCgAuU3KxLJvvxPCyQLOIJvAhHpJt9dr76AKM26tuEc4jfFINbpIdy8Em3ueI58yWbA/83F2mceGnjDXB+WZjuoXlYYugG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740578567; c=relaxed/simple;
	bh=Z0529ZcpiUSpyQ78O/00iH6aBbVc2Ua0WtpGt3fBs/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hoy2pkHo7rNcGFOqSjexDfwkoNeoC7byGGs/RxWtuvUg7fu+yYeD4x+9SIhyF0UeC87AmzAe1USiRXl4SJq8N8wED3kBLspeAidIqDKUqIqsPQYHwINKQ8nkjn8cGFuv0YrsszTnMMGyh+SDLFw84xkmX48/youXC7hr5L9nqU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kkIpI2cc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740578567; x=1772114567;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Z0529ZcpiUSpyQ78O/00iH6aBbVc2Ua0WtpGt3fBs/I=;
  b=kkIpI2ccCLJaR7muT4vMZc2+sGjVLJt9Re2r6bCWAwAspdodiYnBz8fO
   +rQro4PBXaLxo6NfdnkmFcuT29nSrKR8yDnM0J+ASkccXPXjO8yQ364in
   s8zKRyajmkrXKm0iZJbTumnYxT+namqPExUCO94NT+pBCKFdPbESakFFI
   3j3T3xBZxJNnugagZGWw+wHLFWJ3qF2Yyy60rkO3OvhdGNFP3aGi8tBK+
   d+UC39lKNFmVbJDqjeWoRw0UIZnY82ce+wIjLcv7lkLdbDGqmv+TPc9ox
   TxdOL2S8GhydEItg3UmdQBzqGu8FoA/CQyQF0ZSGUdndBY4ykmGmsyu7r
   g==;
X-CSE-ConnectionGUID: DY3c+l6HT0Gl17uuqn2kjA==
X-CSE-MsgGUID: nEYVzCbiTpqMhedw7hQwGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52060494"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="52060494"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 06:02:32 -0800
X-CSE-ConnectionGUID: LyGIY9JbS/yMyPpAQ9NEUA==
X-CSE-MsgGUID: 8B9NWSMZQ+KRMlMzVCvzTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="116728520"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 06:02:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tnHzV-0000000FLD3-1ZfA;
	Wed, 26 Feb 2025 16:02:25 +0200
Date: Wed, 26 Feb 2025 16:02:25 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Levente =?iso-8859-1?B?Uul26XN6?= <levente.revesz@eilabs.com>
Cc: Martyn Welch <martyn.welch@collabora.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
	Justin Chen <justinpopo6@gmail.com>,
	Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
	Nate Drude <nate.d@variscite.com>,
	=?iso-8859-1?Q?D=E1vid?= Jenei <david.jenei@eilabs.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 2/6] gpio: pca953x: Add PCAL953X as a separate chip
 type
Message-ID: <Z78e8YkT0Iz7JKgl@smile.fi.intel.com>
References: <cc987520-d95b-01b9-5b65-53442ce122f6@eilabs.com>
 <9bdc962c-1cfe-8240-963c-491f3992b2cb@eilabs.com>
 <Y1luUgS25ddeSCT9@smile.fi.intel.com>
 <8b94b5a6-fac8-5087-b4da-ddba098d2265@eilabs.com>
 <ea34ed6788923b8be496317f7a962d7073946ff4.camel@collabora.com>
 <Y1q52efyv93/z8BC@smile.fi.intel.com>
 <67bba210-09ac-32fb-bb97-8bfc40c2c200@eilabs.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67bba210-09ac-32fb-bb97-8bfc40c2c200@eilabs.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Oct 28, 2022 at 08:57:29PM +0200, Levente Révész wrote:
> Hi,
> 
> I went through all the datasheets and created this note listing
> chip functions and register layouts.

Thank you much and sorry for the very late response!

Are you okay if we put this file into the Documentation, so it won't disappear,
because I really appreciate the work you done.

-- 
With Best Regards,
Andy Shevchenko



