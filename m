Return-Path: <linux-gpio+bounces-15952-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99833A34E07
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 19:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54B9516CBA0
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 18:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1C124292D;
	Thu, 13 Feb 2025 18:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KCUDzJ2P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E79E28A2C4;
	Thu, 13 Feb 2025 18:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739472621; cv=none; b=ZZbWZRyuofma9vFRJfjkgIfOodJcsKEePFCdgeLpJ2kJsAp8diJITRExpcBgxh6T3qpFdOJFyMVsv/p6WDdli7C+gZVZP9f0vQ9hSWnU08bWKDVK6vE/Yk/djMi69GY/K5ddSVDwiAj48t64i5L+eUiNNQOtt0Gm9Nh7CWUWfq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739472621; c=relaxed/simple;
	bh=tkmdP2cO4XckmU9OHEIRQibCs4HpgedOOCQZKsOnvc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrhmSIlA+52OtLipj/eiUZP+0sxXoJZMruk9ywRWByCP21NJ3kmDBV/fViKN2EBZgqvS0GfsiZxrOGaKr+ScUmXQI0ApnFQ31Fz4Udp+BanKH93eB8351UAGyI8swKqFOSrzvQSECeZyvYOzRy6WSfG9y4s6Ii29bjHQjVz5J8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KCUDzJ2P; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739472620; x=1771008620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tkmdP2cO4XckmU9OHEIRQibCs4HpgedOOCQZKsOnvc0=;
  b=KCUDzJ2P4TKc4D0nW72Qvxm5kZNSrMPxlsEQCuRx4g3lNRv6aGtO4yso
   NqPt4cZsP/Us3Xrc9kV32qUC2s6toOHfY2xuVJZSsEq/QVC50B/xjvAQb
   3dBJ0i6aMRuZgtYFYG/H0xajE2wILRHyl4xWQcyCdA4tU3W2MB9KF3O7v
   FaZ+3XKXwgSQO2gt7eVU8KhQyuf7ftT+A3j3YExjwfQQoEGy+R1w3ERYh
   0tmJ6cx4qwYqXhAuIZaS8Du1jkGgvhz+EWzGwqJH8vJXvUj9B+MZd8fQ9
   V/sYsO+2SZrZah+veHn/J9N0368u9DLwVvV6Ny4SNyhFFBacb5OP5Jgmj
   A==;
X-CSE-ConnectionGUID: aCDLm3rxQGWS/tW8LnVDqg==
X-CSE-MsgGUID: rqf0ZYRCSUCa437TyjjoJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="39902546"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="39902546"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 10:50:18 -0800
X-CSE-ConnectionGUID: iSxNiRQPSQ268skEF3KY9w==
X-CSE-MsgGUID: XHULq+8MTtC54XbUm1Gg8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113205221"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 10:50:15 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tieHs-0000000BFsL-0Pmm;
	Thu, 13 Feb 2025 20:50:12 +0200
Date: Thu, 13 Feb 2025 20:50:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Alexandru Ardelean <aardelean@baylibre.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] drm: Move for_each_if() to util_macros.h for
 wider use
Message-ID: <Z64-4xcWmlpOkG98@smile.fi.intel.com>
References: <20250213182527.3092371-1-andriy.shevchenko@linux.intel.com>
 <20250213182527.3092371-2-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mf0MMKB40gC1hJLwY1i1Bjj+aKKDfFN9sYUzG_Z5Hu1iQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mf0MMKB40gC1hJLwY1i1Bjj+aKKDfFN9sYUzG_Z5Hu1iQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 13, 2025 at 07:36:38PM +0100, Bartosz Golaszewski wrote:
> On Thu, Feb 13, 2025 at 7:25 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > Other subsystem(s) may want to reuse the for_each_if() macro.
> > Move it to util_macros.h to make it globally available.

> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Who would pick it up? Should I take it via the GPIO tree and provide
> an immutable branch for the DRM tree?

I believe it makes sense as the first user outside drm is GPIO.

-- 
With Best Regards,
Andy Shevchenko



