Return-Path: <linux-gpio+bounces-12707-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC74D9C181B
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 09:35:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE9CD1C20F71
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 08:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837FF1DF254;
	Fri,  8 Nov 2024 08:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nb/mDJXW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97971F5FA;
	Fri,  8 Nov 2024 08:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731054951; cv=none; b=l2SVJR/ABrpgLIbl2lWjT0QP97p4FXQ4gjKoaSSnugjYyPQqWrl3vYA9MbZpSARKzNfF5wjrKfqYP+r1s2ptNNbIc0ZoWkpT1hJjZ4bHKFyB2aEj9qFFKtPwsSrdPnU/xCNysA6SRmQ3mGdnzCMjNA0AM6XdDyznIF4tc9HKtPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731054951; c=relaxed/simple;
	bh=9UA99/45VPMOgVasNo9nRRbOr9t2v7Wo/0I1uXKF4qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Am0bYl1huhWtbuBHwX6KPXfmA97hk/VA++WgsmBmvd3V+A894ceq29bAOvJCqqjiiUScni3/iMXoh7gqMdhRnyxPnCVnrSwrXNP1YKTKmfcA4bjm/cwqkXg7nkrrR+MsQJV/mEuO27KPyQND1xhwmERiNFKb77cyHiaILpODvaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nb/mDJXW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731054949; x=1762590949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9UA99/45VPMOgVasNo9nRRbOr9t2v7Wo/0I1uXKF4qo=;
  b=Nb/mDJXW/9XeORnob9iqx/EYlXAW/gfxLDXdwGcL9tM8lZ5kjJxDiblz
   wRA99JTgjADvB5wNGd7XKv9K/Vm52EWBeLrpWibRG8AzKaWkQsmklj/f8
   AOETgJkcOEMxyMwToTnmTkuM+/s1plbulkmeZmJi0fpqtn13f2r2qkrPm
   1p4rBPxgc8FfKXRV+OgGWgSToLNE65sL0lbOZsUFJtQL2l/yN9rlcjcBs
   sP4vhcK7J23ufNlkhtJLpbxv0adsGU1La3F6glvGyHIo6lZv46TiVia2D
   8RjAGv7d695NgZx53dyEPV3wdWr2c454g+qjLo3Drc1dGgNvnFrHGYyLn
   A==;
X-CSE-ConnectionGUID: u4jgzwCmRYiuEFj0lhYtZg==
X-CSE-MsgGUID: 0uhUO7IJQI2hPZQRvToIbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48390349"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48390349"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 00:35:48 -0800
X-CSE-ConnectionGUID: nptTQUc8R1+KrtE0Py8XKw==
X-CSE-MsgGUID: oiAvJIL7Rhm2hlOVPkYvxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="86267023"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 00:35:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t9KSz-0000000CXOf-1fEb;
	Fri, 08 Nov 2024 10:35:41 +0200
Date: Fri, 8 Nov 2024 10:35:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 4/6] pcmcia: soc_common: Avoid using GPIOF_ACTIVE_LOW
Message-ID: <Zy3NXXFFw4l-vfvr@smile.fi.intel.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
 <20241104093609.156059-5-andriy.shevchenko@linux.intel.com>
 <CACRpkdYF-_6vb3SsJ9EHh1mCbqeW5=qoYkLF7Re+XyGq36OJSg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYF-_6vb3SsJ9EHh1mCbqeW5=qoYkLF7Re+XyGq36OJSg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 08, 2024 at 09:28:19AM +0100, Linus Walleij wrote:
> On Mon, Nov 4, 2024 at 10:36 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Looks right to me, some testing would be even better
> because I never trust these flags to get right.

I also would like to have this, but seems the only odd fixer was active ca.
2023 last time, I'm not sure we may hear from Dominik in time, otherwise the
series will be postponed for unknown period of time, which I do not prefer,
rather I will fix any regressions later (but I doubt there are here).

-- 
With Best Regards,
Andy Shevchenko



