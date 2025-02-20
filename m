Return-Path: <linux-gpio+bounces-16308-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBA7A3DB81
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 14:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79FA517EDED
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 13:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8833B1F8BCD;
	Thu, 20 Feb 2025 13:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ECkvBnVU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F08C1F460D;
	Thu, 20 Feb 2025 13:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740058822; cv=none; b=dywdvpJkjbQ7Si1jymW1m0gaZeQQ8hLz4Deu+Vf1OhMs8b8eQjvPFXQId0igN26ssw7iEaetYJFt0TnOV3ciV3/RHuxnwCGaLAqmIoIbZq9XEzx9tfNG4yVJXgMsffCFqC+IPrZzzcXgbmCbhywJVNIx21+AQyRw2p/C3IS7ojU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740058822; c=relaxed/simple;
	bh=0xdYAA6+DWqySxuO6drgGplF4cczXTQrd5HfR1XAN3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZIIfc5HkR9cH9PtkhAF6kjCQQG4dJhYeEqExcgoYzviNkU9/i9VrzD1KlN8+dTO2PBNI76djsNdZcnuKcjMPQEMCMPQMA791xYiPKbOCF8Ub3ykI064Tofq/82asrK055XO13Rj/s8XkxKxnMNF7mj87RGu6RFx1s5NVBFj180=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ECkvBnVU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740058820; x=1771594820;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0xdYAA6+DWqySxuO6drgGplF4cczXTQrd5HfR1XAN3w=;
  b=ECkvBnVUNwBfvJuNVnjvbjix5p+OI+stZjT2ursaBQMOMnj0RRgEA7bj
   BUgWS1eq6/spXxKEmUTk0IgjCj90d26OAsp6En1jisD5gYAoGHpVIsBVi
   xERGWWvvPvrnl7bp1yGIJ/+t13oYK8pDEw7nSsN0/Q/OfvnQMaEgPjcEq
   hBZrjKdqRelXTF/aY3ra+h8StqrjTfUh7YbAg6lFx+8bjxozGioA2vZTa
   dqFGX0HAk4Lwq6p6QXoiEWjAszSBHX1WiUDGWFbDU7TNv+hM1VgJk3bMJ
   QCnUQb2RspaTPQNxWR/zy9a+JB77p7D+jePASZNVLJ0nDuTMpjPTYW6gU
   Q==;
X-CSE-ConnectionGUID: JKewUSJJQ5ClfCC8+LWKHA==
X-CSE-MsgGUID: AS/CdZOZQmS7uULuAWERIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40026442"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="40026442"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 05:40:19 -0800
X-CSE-ConnectionGUID: d4EYzsF+Q/GXIRdGXLB+lw==
X-CSE-MsgGUID: 0vR/qgd7TbSxrzuOcT5GSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="115019243"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 05:40:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tl6ml-0000000DLcR-26xQ;
	Thu, 20 Feb 2025 15:40:15 +0200
Date: Thu, 20 Feb 2025 15:40:15 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>,
	athieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: Re: [PATCH v1 0/5] gpio: regmap: Make use of 'ngpios' property
Message-ID: <Z7cwv0gxRFFGBjR1@smile.fi.intel.com>
References: <20250213195621.3133406-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdao27pu+9qFH2LBYNwYkBbWq1B-hE9nZGfTTCnQxhTiAQ@mail.gmail.com>
 <Z7crrgl2iFn34gck@smile.fi.intel.com>
 <CAMRc=MfSn6xB4eNkFG7E2gQPiF+AmnaidO5=FbvPtvW0N4iDjQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfSn6xB4eNkFG7E2gQPiF+AmnaidO5=FbvPtvW0N4iDjQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 20, 2025 at 02:22:29PM +0100, Bartosz Golaszewski wrote:
> On Thu, Feb 20, 2025 at 2:18 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Fri, Feb 14, 2025 at 11:50:53AM +0100, Linus Walleij wrote:

...

> > Bart, do you think it can be applied?
> 
> Andy,
> 
> I really rarely lose track of patches. It's been just under a week
> since this was posted. Please don't ping me to pick things up unless
> I'm not reacting for at least two weeks. I typically leave patches on
> the list for some time to give bots some time to react.

I see, I thought your cadence is one week, that's why I have pinged you.
Will try to keep this in mind for the future and sorry to interrupt!

-- 
With Best Regards,
Andy Shevchenko



