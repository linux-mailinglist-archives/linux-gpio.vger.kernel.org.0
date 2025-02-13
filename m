Return-Path: <linux-gpio+bounces-15953-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DC4A34E0E
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 19:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9AA416D3BC
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 18:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B55245AE4;
	Thu, 13 Feb 2025 18:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O5yi+iYr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241E828A2D4;
	Thu, 13 Feb 2025 18:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739472690; cv=none; b=sF5/uuro2I9ZVV/tpwCH6OLyQJ8umJSZRPOTdLnMFr+Gb/3cXFVBdeJqIl6NCR4ESr9F35XPpNaaIB0Ift3vzpPetNbvBcMjI+cIe2cAWIKfRA+EXDeiXmXsqerfemijKB5jRvIbm+MguQMxnpAGHLhWPsv+XtQV4xkn4fis59o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739472690; c=relaxed/simple;
	bh=Z4JIzyla/zB42IIdyq9rsiYIJ4BG8zZIFXJSyVMSn5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSFPT3tg53T/oaSGs1PRnwb3AVOlvTo1d1blDJNOLJSCoduRq2SW7Xi/XBbYAN9JoHZL7AMhIr5XBJ0srHUPp+lDtjAKtaDSYgsDzEt+33UwyazIEDvPbcRAsrxKvH22bs2NUHlZGjs9c/F8fo7nH51pkVPnP8NrOdpoWSRFuSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O5yi+iYr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739472689; x=1771008689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z4JIzyla/zB42IIdyq9rsiYIJ4BG8zZIFXJSyVMSn5A=;
  b=O5yi+iYrXxKqvWzjL3L9IAMDOS8ziGCquYhC+S7VElPmYLtHrLf++Cr3
   mp1ui1gVtf6tODkubyDD/Na156Ew6Hi7qDBPG26sEJipnVYEpdub0SUhW
   9X44ngE7oKd2RINb3JH+wSrqShNHC3ieb4McxV70ss3NyhKG019v4q9KK
   X5yf87/tR8I+xApeRoG4Tcy9hprqaXre5BwzAuKvKPyG2wQu0C5r9KUJJ
   hJl1DCBtTBrMeEtcJft8+saQ6CYMPWlL4mqX5QdoRgUwTYOv4p7kSy4WR
   PLUwo6Xea0TzUCGt7xIX8HhPppODqws2TZ6nmPRuOIdNdsHp4R1Ky8buJ
   A==;
X-CSE-ConnectionGUID: t9K6O2jlQSy+KjJXsHQdaQ==
X-CSE-MsgGUID: g+6C0P0TTq6qAaG7KNSc0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40123366"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40123366"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 10:51:29 -0800
X-CSE-ConnectionGUID: h8dHvQ9XTBSbZoTu5XPOSw==
X-CSE-MsgGUID: u5xXpwf1Sh2wFmPfe87bCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113108142"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 10:51:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tieJ0-0000000BFtK-2TtO;
	Thu, 13 Feb 2025 20:51:22 +0200
Date: Thu, 13 Feb 2025 20:51:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Alexandru Ardelean <aardelean@baylibre.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 1/2] drm: Move for_each_if() to util_macros.h for
 wider use
Message-ID: <Z64_KheQ_b0TtBDn@smile.fi.intel.com>
References: <20250213182527.3092371-1-andriy.shevchenko@linux.intel.com>
 <20250213182527.3092371-2-andriy.shevchenko@linux.intel.com>
 <87msepy93x.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87msepy93x.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 13, 2025 at 08:48:02PM +0200, Jani Nikula wrote:
> On Thu, 13 Feb 2025, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > Other subsystem(s) may want to reuse the for_each_if() macro.
> > Move it to util_macros.h to make it globally available.

> Acked-by: Jani Nikula <jani.nikula@intel.com>

Thanks!

> If you want to go down the memory lane, see [1]. ;)
> 
> [1] https://lore.kernel.org/r/20180709083650.23549-1-daniel.vetter@ffwll.ch

Yeah, I have read it a few hours ago to refresh my memories.

-- 
With Best Regards,
Andy Shevchenko



