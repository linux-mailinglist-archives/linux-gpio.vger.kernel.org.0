Return-Path: <linux-gpio+bounces-12629-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 326019BE55F
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 12:15:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB8212827A7
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 11:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389291DE3A5;
	Wed,  6 Nov 2024 11:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IopYEF3/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6E01D619E;
	Wed,  6 Nov 2024 11:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730891741; cv=none; b=K00JNOFc5jKc8rykn8yjp/zPsyYtQNbYeN2HBhQ0eZmvHAj2dZtMrsfCkxenQOReU1Kk9i1ixnRLw25OheI4LVHbIJrW2cErt4tciW6p6+S6L4Pm/D9ZDoSk5OlyU7t3AoryuCLfAlV5RNDs6jKIh/Hznuc1EhM6hLAAWp3GCVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730891741; c=relaxed/simple;
	bh=VGxsjJni8GVkPbFXNANcrnf8kZf7wifiipk6hRa1wYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVUK7LqhAYel5wE0OZ1xnmvJObMfozxNAuX+knRtFQe9/lxq1w9bV3mgEqEaSycJxL8Dvuh3bxynuOm9o8bh9rb+k/3y74E9rZy8xKSdM8dmOTUhZafgNoHS4l/W7HjdaQbFDKc0X/akbZ565a4ETPDa+yplZ2Wc58eG0R0OJ2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IopYEF3/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730891740; x=1762427740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VGxsjJni8GVkPbFXNANcrnf8kZf7wifiipk6hRa1wYY=;
  b=IopYEF3/YjTI4cBQSjT1sDMyggMvEghs7+m7KdLkD31wRqeMGUmIf7iH
   0VXbMmsyXo5Ldm/tWw+B1mA5xPeWfpr8D/fOvr1GaxxztfMNPvcgO8pts
   9c9auNjom3n98DrmCD/QKpZw/nsYIXXbHRdQ7fzeb2pO4i/9m0v2zffWO
   KIbmtzMO46PrjvuAyIUvOPxSVIvh+l+PQq5zHN0iEjdCM3MvBa6F+y+LV
   41kvRYYKskqaMsCPNQHIPI22PImmBppLEd9J3W5/g63QqLuHnEkEiDQ6l
   zFesG5nOvn6bbyAelD00xAH4bJMTZDu8GlV6wjXhBSodjRsJl+fTtF1P7
   w==;
X-CSE-ConnectionGUID: 7MDxjCOYQwm/fT62U/O5lA==
X-CSE-MsgGUID: 8stwHEbzSAG39nENVPrUvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41231030"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41231030"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 03:15:37 -0800
X-CSE-ConnectionGUID: 4CW4v63uTKuAVbYgjM7Jtg==
X-CSE-MsgGUID: z+o230JATEmPRbNbc5ytmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84603766"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 03:15:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t8e0X-0000000BlrG-22X7;
	Wed, 06 Nov 2024 13:15:29 +0200
Date: Wed, 6 Nov 2024 13:15:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 0/6] gpio: Get rid of deprecated GPIOF_ACTIVE_LOW
Message-ID: <ZytP0XGgmz_R5gos@smile.fi.intel.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 04, 2024 at 11:34:18AM +0200, Andy Shevchenko wrote:
> This series targets the deprecated GPIOF_ACTIVE_LOW as only a few users
> left. Convert those users to call modern APIs and drop this legacy piece
> from the source tree.
> 
> The idea is to route this via GPIO tree, please Ack.

Thank you for Acks, folks!

Dominik, is it possible to get yours or are you inactive nowadays (I saw
last mention of your name ca. 2023).

Bart, we have all Acks except pcmcia (see also above), and the change is
the same all over the places, do you think it's okay to apply if Dominik
won't respond for a few days?

-- 
With Best Regards,
Andy Shevchenko



