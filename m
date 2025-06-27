Return-Path: <linux-gpio+bounces-22351-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EC0AEBC2D
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 17:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA4273AC60B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 15:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6232E92C4;
	Fri, 27 Jun 2025 15:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QlbEu2bK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBFC2750E7;
	Fri, 27 Jun 2025 15:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039037; cv=none; b=XAN9PgW0Ig0LxM042rSZFZUtFqEKzgz4cOA2ixZUaElslBRzo2vsaGcorL5mGJuX9kuqAiLVwC9L0Q5bZmL1V15hfTjRYvWJ9Wnd+DzArX6N0lFyvBAl8uxBX2n77vYSxNlFjoaASHK1eGsSJl9JDP4+URc5itdrzhZwAoUn/ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039037; c=relaxed/simple;
	bh=v701UG/S/YZj/dcs0xf6XcvTyfKyjdh0AA1QqbDRy24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ytld2XBayVlMh94P+rgY+a/NmZDDL4yiLyZV1pVxLzQXADBIV4E6OlewsenbnN2+i3EIMEHsfapLc4+t7NoYpfjND/i+uSr4z4rs+clRM/Wpid2evLQcRHM+7i6b+spMbqF/JMT+3dqW63koy+rozJECjnrICrud32l6JJIewjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QlbEu2bK; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751039036; x=1782575036;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v701UG/S/YZj/dcs0xf6XcvTyfKyjdh0AA1QqbDRy24=;
  b=QlbEu2bKzLAEx2W/VC1jbAC9/i6p/z4tiGpvdduFlOy1A//ZIHea6WtU
   r+T1dDcpOzVAAKQmKnvRt+Jd4wrsMd3pAEdzAPHi0jrLVaCDLwjVA2D5F
   sA+f+HhsRMtlnv9gv3lU55lzvg7rXyQpLyd6/7QH5Qm/eq9gawo0HCKrP
   7FV1C+1CxBc0qVZT53tA9pQRTH0YZr41mvpmxUXTL8BTpreYhtLDqfDoD
   1xW3fGoYm/+IYFkqtDfIwnbjcYfxd/KE8yKZFtkqerD70y2uHoHAw76UV
   V55AxL2cdmhK19f+f9BpEjh92kUYtR9q4+N6Ts5YyxjtCSWvT7Ta0RHoF
   Q==;
X-CSE-ConnectionGUID: XQDVvc1DR465/7OzEuKRZQ==
X-CSE-MsgGUID: RYMdFipdQIaAeaSHiEYhjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="64046471"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="64046471"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 08:43:55 -0700
X-CSE-ConnectionGUID: NjOxPtofRuCMb7jMNhhWCw==
X-CSE-MsgGUID: OxJ/GkpaT0ObKM5q9m2lxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="153009466"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 27 Jun 2025 08:43:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 60C042BA; Fri, 27 Jun 2025 18:43:51 +0300 (EEST)
Date: Fri, 27 Jun 2025 18:43:51 +0300
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
Subject: Re: [PATCH v2 5/9] gpio: sysfs: rename the data variable in
 gpiod_(un)export()
Message-ID: <aF68N4ZYKupWHJoL@black.fi.intel.com>
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
 <20250623-gpio-sysfs-chip-export-v2-5-d592793f8964@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623-gpio-sysfs-chip-export-v2-5-d592793f8964@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jun 23, 2025 at 10:59:53AM +0200, Bartosz Golaszewski wrote:
> 
> In preparation for future commits which will make use of descriptor AND
> GPIO-device data in the same functions rename the former from data to
> desc_data separately which will make future changes smaller and easier
> to read.

...

> +	attrs = desc_data->attrs;
> +	desc_data->attr_group.is_visible = gpio_is_visible;
> +	attrs[GPIO_SYSFS_LINE_ATTR_DIRECTION] = &desc_data->dir_attr.attr;
> +	attrs[GPIO_SYSFS_LINE_ATTR_VALUE] = &desc_data->val_attr.attr;
> +	attrs[GPIO_SYSFS_LINE_ATTR_EDGE] = &desc_data->edge_attr.attr;
>  	attrs[GPIO_SYSFS_LINE_ATTR_ACTIVE_LOW] =
> -						&data->active_low_attr.attr;
> +				&desc_data->active_low_attr.attr;

These were added in the previous patch and immediately got rewritten?!
Sounds like a wrong patch order.

-- 
With Best Regards,
Andy Shevchenko



