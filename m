Return-Path: <linux-gpio+bounces-15635-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5333FA2E60C
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 09:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1381E3A4E85
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 08:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85A11B87F3;
	Mon, 10 Feb 2025 08:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HVtO7A3d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACF318E764;
	Mon, 10 Feb 2025 08:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739174995; cv=none; b=Ku/lgGhJvUguytIOhan7Il9F2NBrGVwHi9WoEbP4WjtWperB5uCuYXWFBm9WTfarwba5BHsFm8X/NhNqaTYhFVftgrY2pVtdBRv6YGm9XeQMXtgoekfAgjRSWLg8TqFWf7Vk2GD46e/daN5wztZzul4MsF/OqkcgH9c/svl5oLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739174995; c=relaxed/simple;
	bh=U0WYcS19MsIrktm50+bHvEQL/Euj82Fu7ea08jiBPOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oEjfiLIq2QFL9bXe4H9A73Nz1i358081JBKqoF7RVl3yv8UEfrIwx7XcKxMl7tRtS2kzmlYRBMLqDo+PdtdHjqP6zGn37IomMP9LRrzqMRgzAU65s4/ZykW5RctcqJi5xaPPu3AY++bJ4FQc02Glr+Pa3jgcm/NZCNpT7HQt9QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HVtO7A3d; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739174994; x=1770710994;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=U0WYcS19MsIrktm50+bHvEQL/Euj82Fu7ea08jiBPOw=;
  b=HVtO7A3dgp1TYdZM5bW24bUsSpsiT9ky2MU5qt6HRglNl/byT/uwJyBV
   AAZqjcUyHxey5IioI/gbl5tE/DySZkAyS/9lxkMIt2MUm83vpP1PC5Iz6
   EoxE9IiOI9NNEEQi7jTW+Z+31WUkEIX+uic6/eA5Ujj2CWCouficZT2Oq
   TIEyjS5ZWVO3Mt0jZXd+PCZy0rHFmCAMvYDSOVMT2ug475VuJas5atp3R
   ujNKxRKO/8ylHWvjYIEzFLr39pdXxfLsKvUdnsEbDRTyYJMYq8OQ9bYyE
   c2HLatjY2aK5h+/+KJSZx+6TNIbfLKjVfurRmri7/go1VGco4Of4ZyUmm
   A==;
X-CSE-ConnectionGUID: nvU0en+8TIuk0Pm6e8imbg==
X-CSE-MsgGUID: AsUrcfv0SCmYfyMVSsJYlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="57278509"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="57278509"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 00:09:53 -0800
X-CSE-ConnectionGUID: ILEs/rIXQKe8CLHpL8xoJA==
X-CSE-MsgGUID: 7Q40UtIKTduMSkzoqk/cMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112555207"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 00:09:51 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1thOrU-0000000A3oY-0oB4;
	Mon, 10 Feb 2025 10:09:48 +0200
Date: Mon, 10 Feb 2025 10:09:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v2 7/7] gpio: 74x164: Utilise temporary variable for
 struct device
Message-ID: <Z6m0S0qnZVfyijWt@smile.fi.intel.com>
References: <20250207151825.2122419-1-andriy.shevchenko@linux.intel.com>
 <20250207151825.2122419-8-andriy.shevchenko@linux.intel.com>
 <Z6Ypww-xXAvoCCq1@smile.fi.intel.com>
 <CAMRc=MeTgjHYCmZcDhvZGKCaKyHhxUU=3EF6OvsLW-H-Dv+Y6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeTgjHYCmZcDhvZGKCaKyHhxUU=3EF6OvsLW-H-Dv+Y6Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 07, 2025 at 08:56:45PM +0100, Bartosz Golaszewski wrote:
> On Fri, Feb 7, 2025 at 4:42 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Fri, Feb 07, 2025 at 05:17:14PM +0200, Andy Shevchenko wrote:
> > > We have a temporary variable to keep a pointer to struct device.
> > > Utilise it where it makes sense.
> >
> > Urgh, this seems incomplete...
> > There are more lines to convert, however they do not affect ą statistics.
> >
> > Tell me if I need to send full v3 or just this patch.
> 
> No worries, I may fix it when applying.
> 
> I'll still give this series a few more days on the list.

Sure, thanks!


-- 
With Best Regards,
Andy Shevchenko



