Return-Path: <linux-gpio+bounces-24104-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7798CB1F3FB
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Aug 2025 12:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 125F3725F3F
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Aug 2025 10:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05CD25524C;
	Sat,  9 Aug 2025 10:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GbfEm9Dz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D36F256C9F;
	Sat,  9 Aug 2025 10:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754733655; cv=none; b=GF+iMuyc8yubWY1Kj5QSLtn7XO9KCEnp7O+N2XV957jRR+rfW4KmU0TyhRXRahLIxugpxvh6KyMPPC4qr+G+HeF+HhIQ0h0XvlnC+iO/9JdVl3Rd9qWE9YLZpVVXUK+Pb4E+T43wLj0BUA/I8sQf/9nwsa0/zq50Y4VVFUnlMgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754733655; c=relaxed/simple;
	bh=O9yzI25O8NSIWGcrb+Gut9g134POOu2r1v8V94cBxGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAwUIXAZMCSF2fl420FbHzRVSyj40MsHsMrHadniy2+aGgcIv/WsWu0cJLXVYzEdjIb9QBKKEtwksXM7epfIvAD4WbR53cvhIaa55nyqvDmTLGSCMWg5725OgN90EtlJFbdITTXElczb66PHAhmyaeBvQNjt075l5yMOif4f/1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GbfEm9Dz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754733654; x=1786269654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O9yzI25O8NSIWGcrb+Gut9g134POOu2r1v8V94cBxGk=;
  b=GbfEm9Dzu88K2Ka3TTrhEpLJW31po4hQkabNldYUiM/Ug8UJFgi62qWk
   qnHSPeJxoEcJ2a8zjBjeeOdf0ZxCMIYyMYvZIETT9oVHodEEcWb4/AxIi
   +zQKx1b0kLQc97Qro0lHE5iFw17vwGQKrsrzKBPTXWU+8SJrDqcI6SBj6
   cI3GA3icGdaL/LRFeyrskPM/OIxPFfLPJ5U57DFDmvBhfnW+C89BimMx9
   26FfQ8lB/GFBfK+lNXxOsXd2qAaE+VXC2iR5WdnMWAZcPMTilI8gn8sbY
   fPNAlGxaD0Jd7N6ina5lTVY7lPjfYMrI8Hkgqo7L6OchdKp0F5Q2Az/75
   w==;
X-CSE-ConnectionGUID: y5lpSWtaRw+i1GKANAA3IQ==
X-CSE-MsgGUID: FLlUuRhYQDKfljicRkusTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68146232"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="68146232"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 03:00:52 -0700
X-CSE-ConnectionGUID: TVQAju9BSDGGPQ+TQB4hCA==
X-CSE-MsgGUID: Oyn9zOaxTLaSo+3gI7Hl/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165166672"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 03:00:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ukgNY-00000004ce5-0zPC;
	Sat, 09 Aug 2025 13:00:44 +0300
Date: Sat, 9 Aug 2025 13:00:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Guenter Roeck <linux@roeck-us.net>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 05/21] x86/platform: select legacy gpiolib interfaces
 where used
Message-ID: <aJccS7fdcx0INYTA@smile.fi.intel.com>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-6-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808151822.536879-6-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Aug 08, 2025 at 05:17:49PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A few old machines have not been converted away from the old-style
> gpiolib interfaces. Make these select the new CONFIG_GPIOLIB_LEGACY
> symbol so the code still works where it is needed but can be left
> out otherwise.

...

> --- a/drivers/platform/x86/x86-android-tablets/Kconfig
> +++ b/drivers/platform/x86/x86-android-tablets/Kconfig
> @@ -8,6 +8,7 @@ config X86_ANDROID_TABLETS
>  	depends on I2C && SPI && SERIAL_DEV_BUS
>  	depends on GPIOLIB && PMIC_OPREGION
>  	depends on ACPI && EFI && PCI
> +	select GPIOLIB_LEGACY
>  	select NEW_LEDS
>  	select LEDS_CLASS
>  	select POWER_SUPPLY

Hmm... This is a surprising change. But I leave it to Hans.

-- 
With Best Regards,
Andy Shevchenko



