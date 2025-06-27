Return-Path: <linux-gpio+bounces-22350-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B055FAEBC27
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 17:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14A4C16C998
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 15:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600F92E92CC;
	Fri, 27 Jun 2025 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lyeUzAJX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7950E2E9720;
	Fri, 27 Jun 2025 15:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751038887; cv=none; b=cMxS4pU1vjFeiGzTgSIipiF0UPleUp86JZgETxNCK7MX2UcZqT6RttWGC1iDeq+GVLBViN9TTiu78OQNO08p5dJzt0M6q+1I+A0FoDxKwZyMA0zEAiPepiFK34Ofpke+lYiH0r9U0/rypHw5tPtEkkE3/pfsq4/uc0gcq5F3jGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751038887; c=relaxed/simple;
	bh=AMMhxPjfPHiKsXXCrVY3AlFG6GR2RMVIafGOqDBRDAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxyIgYDww94tz+8REYxspHUMSShdQ+jDqbXBWBhO2rsv9eNP6bWVG93rwTiS7SoUPeqxYIkfH7/9g06JQvb56wIIHSSh6MixD9mPBBsJy1pvu0ZK06N4AFgxIq9vnkDQQ1mELC9o/ztFgJA/4FgkUvBX51lOj8nmT3mBQt4u9go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lyeUzAJX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751038885; x=1782574885;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AMMhxPjfPHiKsXXCrVY3AlFG6GR2RMVIafGOqDBRDAw=;
  b=lyeUzAJX4fM3519iYjrZm0Z9DgT+dPBKs2DaXiFE9pdzayJ5VC1j9iQ9
   dVUcyK44AnUWGimkRQy/OqMvSwkz24I4ac3OEopApFIIgK7y1lAiDlnPn
   hZUTxb9XuJ+524yIpHLsCVY5zSWyY65vtmqWl3WGQrXi8nE1EnCjC2Rl2
   WiR4ylhFEai69kG3+E8lThCjS/vlRhGiPQe7ALV6/3BG0nAqDNAHvaIQl
   uBe9D8Ld4J88izHDBTNmhLdpEFIcaQnx6FV3ueQoO7TgKrgzoAvTZ3Eic
   QGPM+nh1vkQkDClFAX3H8ooQiBw1xKZE6Iax6HcGAA0NnKhCQef+uBGqT
   Q==;
X-CSE-ConnectionGUID: Vbsz8A1rSYSmz0XwVNWpGQ==
X-CSE-MsgGUID: 1CJBV7MIQlmEdTiNHMM0dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57161860"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="57161860"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 08:41:24 -0700
X-CSE-ConnectionGUID: h1Q+P2efRs+Y4U7Kz5IDaQ==
X-CSE-MsgGUID: RWi81dJLR8OELq/E3CcPtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="183736007"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jun 2025 08:41:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id CF5212BA; Fri, 27 Jun 2025 18:41:20 +0300 (EEST)
Date: Fri, 27 Jun 2025 18:41:20 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Kent Gibson <warthog618@gmail.com>,
	Jan =?iso-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 4/9] gpio: sysfs: don't use driver data in sysfs
 callbacks for line attributes
Message-ID: <aF67oAqLmRJzy4Zt@black.fi.intel.com>
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
 <20250623-gpio-sysfs-chip-export-v2-4-d592793f8964@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623-gpio-sysfs-chip-export-v2-4-d592793f8964@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jun 23, 2025 at 10:59:52AM +0200, Bartosz Golaszewski wrote:
> 
> Currently each exported GPIO is represented in sysfs as a separate class
> device. This allows us to simply use dev_get_drvdata() to retrieve the
> pointer passed to device_create_with_groups() from sysfs ops callbacks.
> 
> However, we're preparing to add a parallel set of per-line sysfs
> attributes that will live inside the associated gpiochip group. They are
> not registered as class devices and so have the parent device passed as
> argument to their callbacks (the GPIO chip class device).
> 
> Put the attribute structs inside the GPIO descriptor data and
> dereference the relevant ones using container_of() in the callbacks.
> This way, we'll be able to reuse the same code for both the legacy and
> new GPIO attributes.

...

> -	struct gpiod_data *data = dev_get_drvdata(dev);
> +	struct gpiod_data *data = container_of(attr, struct gpiod_data,
> +					       dir_attr);

Defining once something like

#define to_gpiod_data() ...

we may leave this and others as one-liners.

...

> +	attrs[GPIO_SYSFS_LINE_ATTR_ACTIVE_LOW] =
> +						&data->active_low_attr.attr;

What's the point of two lines here?

-- 
With Best Regards,
Andy Shevchenko



