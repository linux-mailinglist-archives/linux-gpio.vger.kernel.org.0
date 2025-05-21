Return-Path: <linux-gpio+bounces-20415-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F4AABF06D
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 11:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 150AA4E43E6
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 09:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10DA259C8B;
	Wed, 21 May 2025 09:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mIwmONkT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F1320ADF8
	for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 09:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747821015; cv=none; b=GvCjJXLkL3EZteeZUbwXlJHeQQfW3pSG+0HzDayHtdajDd9ISVdbUKhDBvwO6ge7xsSlVQKoS2NSjGfn8cr56hx4E08V9fc1yCMAfgCpPbg5uHRt6vdeAEHHqRPAOh0zUacy/SMr4arWG36/tqHHZaaI3nKJVKzLpCT134D+R7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747821015; c=relaxed/simple;
	bh=6k2HQDF99u57iWfvJnamyvhbuhlUSq7eHy+Aniig6wI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WUEWlS0/+cta9m3vhvrfLAQCVWJBKX7nuF/kO7WmM8ZezetsxuqPBX/Q9cGN3DAs3pvKe+9sTVu2vRbEoin2OOIHO1YMNEgvk5RQ547KKoPePg4tlrV8usYJOuYo/v7N0nMEmHYfn8p4ds54zxq0b4b9ylZM4c9/jZRTy4PSyIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mIwmONkT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747821014; x=1779357014;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6k2HQDF99u57iWfvJnamyvhbuhlUSq7eHy+Aniig6wI=;
  b=mIwmONkTPOLBG7cArue0r5Wwq8R78w/f8LJJhlJS+z0va6TfRQ5grBot
   l18qj570VPQsprGkCCplGg5Rx29ClVkrf1RjvZnnbMmWKRkf1p6srsSEd
   luSngNI6cdmvmTdXq6ZarN6nDDN0dZPIC//QCpAuzF+jNrJ2KUegnJTKv
   NTTNCGKRzF2n8SHCwh2nqv872dp6/YndZjSZ7mHUtIoS+R3VDWe69pGWw
   N46aeXGd/MH1f+21aqV3z+oOTWwdHsAacWIZjfIMccHXIlWeBIbgeoOQo
   RCVcWz5V1LHwCH2nT4p9mEJiJAMDM4hyANxalzrm6vuFllzX+bSruzUW1
   Q==;
X-CSE-ConnectionGUID: /+yio7TWTu6v1NkIUIVDmQ==
X-CSE-MsgGUID: VvJ15BBzT9uKy6TajkQmxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49050840"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49050840"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 02:50:13 -0700
X-CSE-ConnectionGUID: N+GAbNnsSEeyTW14v3IskQ==
X-CSE-MsgGUID: LqU2mKB1RbOWWPYz3OWtMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="177138139"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 02:50:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uHg5R-00000003ZuQ-2sFZ;
	Wed, 21 May 2025 12:50:09 +0300
Date: Wed, 21 May 2025 12:50:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linux GPIO <linux-gpio@vger.kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [GIT PULL] intel-gpio for 6.16-1
Message-ID: <aC2h0Wpxh-8ekr24@smile.fi.intel.com>
References: <aCzbya_FW7hg1Wkr@black.fi.intel.com>
 <CAMRc=McMOH_S8Kf1TPV3Z0QYPz+cfS9hxZh++fNvMc_U+TssLQ@mail.gmail.com>
 <aC2W84mKGzgbRsL9@smile.fi.intel.com>
 <aC2Y-4wSILoS-Rol@smile.fi.intel.com>
 <CAMRc=McwUF-668OYqctaahRQFPOTpXqnCZKE3R5zKsoWWEyU+w@mail.gmail.com>
 <aC2b2L5h4-0U5qjT@smile.fi.intel.com>
 <CAMRc=MfE=m+_jYKwAU0jcyopUZYFnY6kOdZJmAY29dJEHO+gPQ@mail.gmail.com>
 <aC2djJxol61MmuyO@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aC2djJxol61MmuyO@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 21, 2025 at 12:31:57PM +0300, Andy Shevchenko wrote:
> On Wed, May 21, 2025 at 11:29:41AM +0200, Bartosz Golaszewski wrote:
> > On Wed, May 21, 2025 at 11:24 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:

...

> > Ok, sorry for the misunderstanding but if I were to drop them, then
> > I'd have to rebase tens of patches that came later, it just makes more
> > sense for you to do it.
> 
> I understand that, but it's an exceptional situation. Shouldn't be like
> this ideally... I'm about to send an updated PR.

Here we are (in case you missed my email):
aC2gABILEj1yRCxF@black.fi.intel.com


-- 
With Best Regards,
Andy Shevchenko



