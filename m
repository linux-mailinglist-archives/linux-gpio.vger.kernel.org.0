Return-Path: <linux-gpio+bounces-6303-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E05388C286D
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 18:06:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9265528713D
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 16:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08225172760;
	Fri, 10 May 2024 16:06:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4361A86AC9;
	Fri, 10 May 2024 16:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715357176; cv=none; b=LtBcMCLz+z2NVTtRemp9pNOooQ1ns4ywHPW4n2r1XWbtLMI3Yrc9MFm2KEVIDlqGrJhSYA9GkgfNTdIJ/rOu1IIk0CqpGmLR2HSpnDWvqz3ikgr1NM9IaQ1XWtnK7nr4lIs15APGxIZcPtFzcDvL0J0m/5P/SfoDf3Rx5dxW1f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715357176; c=relaxed/simple;
	bh=j4uybE4YtEbAjUzCWbZKx6q2ZjgRPAq1bLEfLHhDuw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZEG8+gXsCtvaC9c/XAzfXsvidB2evdpLAbVxitIJPl6aoGIh8PKWb/yIfF0iFlXuKGQ627JbTP0iTS0wDMupIP5vaGBwYSmYhq+mMmeAkZuV+PfjOavWL5AKIu8JIx9iEt9JF63ywdOw3756cbiAqZnNhUCURu1lN+qksJL1vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: mVXQsOBkSjygL9ozmWzqgw==
X-CSE-MsgGUID: smyKGbogQi2X0x+5kIInoQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11469506"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="11469506"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 09:06:15 -0700
X-CSE-ConnectionGUID: lUNcjwIEQkGtdFvPVS453Q==
X-CSE-MsgGUID: wQeDrx6eSSGMoqtL4tfOuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="29609303"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 09:06:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1s5Sl8-000000069ns-43Bb;
	Fri, 10 May 2024 19:06:10 +0300
Date: Fri, 10 May 2024 19:06:10 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] gpiolib: Return label, if set, for IRQ only line
Message-ID: <Zj5F8tidsVPkDGEi@smile.fi.intel.com>
References: <20240508144741.1270912-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Me3XOy6HfqjxDQBwnSW9pOCtK_Ry7keJ2LiXGFB88t4nA@mail.gmail.com>
 <ZjzWlNdDVVBRD-Ma@surfacebook.localdomain>
 <CAMRc=MeuAQgos+=GmYr0X+5Pi+foJaRNwuNM0D3b4-FwxoD2mg@mail.gmail.com>
 <Zj5AZMycTCPUoT-l@smile.fi.intel.com>
 <Zj5B5ONDI7DB86on@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zj5B5ONDI7DB86on@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 10, 2024 at 06:48:52PM +0300, Andy Shevchenko wrote:
> On Fri, May 10, 2024 at 06:42:28PM +0300, Andy Shevchenko wrote:
> > On Thu, May 09, 2024 at 04:23:07PM +0200, Bartosz Golaszewski wrote:
> > > On Thu, May 9, 2024 at 3:58 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:

...

> > > Fair enough but I would like to know what your bigger plan is before
> > > picking this up.
> > 
> > I stand corrected, this patch has an immediate effect on the generic
> > gpiolib_dbg_show() which does *not* use the above mentioned call..
> 
> Ah, but it doesn't use gpiod_get_label() in the else branch either...
> 
> I want to amend the else branch there to print similar or reuse the main one.
> For the latter I have locally a patch to modify gpiolib_dbg_show() to show
> the interrupt lines as well even if they are not requested.

I just shared that patch, if you are okay with both, it would be nice
to have them applied.

-- 
With Best Regards,
Andy Shevchenko



