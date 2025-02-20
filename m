Return-Path: <linux-gpio+bounces-16309-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32484A3DB86
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 14:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3017C1897EE7
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 13:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C371F8AE5;
	Thu, 20 Feb 2025 13:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LmtXvGtK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7053F1F4262;
	Thu, 20 Feb 2025 13:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740058912; cv=none; b=sZBUadgVr2H0w3gGFbfs6Xoqm0zn+UwLa81xplgFgbKqYmPElcuK0NIo66G8J7R19WGl4b16bNFfvaW7xJcI9wpLI+7c2rKG+eKAhvVpCyh8od3f0oZLay6+V5kLCmQC0AONSrkdVH180lv//1CeWc9d6NymOFqvPiAoXMs/2OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740058912; c=relaxed/simple;
	bh=tam+zzNSNkRi2geatV3GfIp4YodLGy4tyK06NdCYjcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ggWg+d1YnMKPibo5BfClVkCxtCEBWjO1MIvk07PY8M0YVfU5YzAmRN0ojYGuGpAVyWMN0y4vlKvcNj9RDfpA4iDOn332qvIw+CjpfuMv0m68SoJnC+RrmDRYydnFkj6e0BxxfE/2X3hl10/6X5dynvHPh8cawBvHDLOpCmnXW08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LmtXvGtK; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740058910; x=1771594910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tam+zzNSNkRi2geatV3GfIp4YodLGy4tyK06NdCYjcA=;
  b=LmtXvGtKGyJWcgL20/+qDmH0ohD1pkFvkF6z13U6+wa2WBBg/yyXKfsq
   eW7ZnUCqv9nkuG0c634ccysqkI2gk1loqs5/naIwb11ZzrB+94advpjIq
   pgH9oD+sZoqXjhImrmktCIlPNB2cDh6mcf8D+GsnNs3xiCABD70Wr+J30
   s76h/MRWSoG0v3CjoxMK3k/Wca+8DPkq1Rg7mQ+65Oz3ikfU8qvImvN7E
   CQV+UdZV7hcdSN0ZRZ/9+oJXsLkBi8yIlXMqSb6t/mPYg4laM4IqcbugA
   RGfv47Cf+Nm0RKayZusUNHP7jNRDoAwJhbnVQ7JdMXTng6vE971C0t76O
   Q==;
X-CSE-ConnectionGUID: Tl0TU7HATzOlvNk9Is6LzA==
X-CSE-MsgGUID: CH5BoYqjQuqIFlLSrn9PrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="66196015"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="66196015"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 05:41:49 -0800
X-CSE-ConnectionGUID: gQoRxpfcSJKsA+rG7BdvSw==
X-CSE-MsgGUID: iptE7rVvQf2YXl2zJt2aQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="115243794"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 05:41:48 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tl6oD-0000000DLeA-0aG2;
	Thu, 20 Feb 2025 15:41:45 +0200
Date: Thu, 20 Feb 2025 15:41:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>,
	athieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: Re: [PATCH v1 0/5] gpio: regmap: Make use of 'ngpios' property
Message-ID: <Z7cxGOmwMIkkTRLs@smile.fi.intel.com>
References: <20250213195621.3133406-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdao27pu+9qFH2LBYNwYkBbWq1B-hE9nZGfTTCnQxhTiAQ@mail.gmail.com>
 <Z7crrgl2iFn34gck@smile.fi.intel.com>
 <CAMRc=MfSn6xB4eNkFG7E2gQPiF+AmnaidO5=FbvPtvW0N4iDjQ@mail.gmail.com>
 <Z7cwv0gxRFFGBjR1@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7cwv0gxRFFGBjR1@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 20, 2025 at 03:40:15PM +0200, Andy Shevchenko wrote:
> On Thu, Feb 20, 2025 at 02:22:29PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Feb 20, 2025 at 2:18 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Fri, Feb 14, 2025 at 11:50:53AM +0100, Linus Walleij wrote:

...

> > > Bart, do you think it can be applied?
> > 
> > Andy,
> > 
> > I really rarely lose track of patches. It's been just under a week
> > since this was posted. Please don't ping me to pick things up unless
> > I'm not reacting for at least two weeks. I typically leave patches on
> > the list for some time to give bots some time to react.
> 
> I see, I thought your cadence is one week, that's why I have pinged you.
> Will try to keep this in mind for the future and sorry to interrupt!

Btw, if it's easier to you, I can just combine this to my usual PR to you.

-- 
With Best Regards,
Andy Shevchenko



