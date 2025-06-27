Return-Path: <linux-gpio+bounces-22348-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD25AEBC0D
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 17:36:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD6B51C60345
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 15:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30CDB2E92D1;
	Fri, 27 Jun 2025 15:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WVIeog+T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8EB2F1FF0;
	Fri, 27 Jun 2025 15:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751038537; cv=none; b=GataNAXA+mxgjNKE2RG217slZqxocVyH3xOM4jq7ANuQGaHaxg0P7AKm+QLlWD2T8YMCLYxbRR2qIbMmixU9Lv2tArEMDnSPlqTvmAxlQPoWmALSeuUzC2fId6uYaw5EVErwMZpGZktmL+/cbRYYH3j4Qv01ovxTwLLjA7DItyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751038537; c=relaxed/simple;
	bh=Qzm4XBJbx1tU6JCdEQJhA4IJzTG36TjHd0c11RIy/rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bwUhQ8UTaCzGjHHp5tf4/sxRTRG0sowyQj3nuj/qlHaute7i9NSJZI4bbjkYvaC8IbnvXF5JYnwWwgsIpdMmCl8sDP8MjV7MgGrIFz0DR4ojOB4TLMiOmMRstJv9nwlR7nRV2nwz75NtCi6yhpJ/e2Wp1dUhpbtUtksWp+ifhMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WVIeog+T; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751038536; x=1782574536;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qzm4XBJbx1tU6JCdEQJhA4IJzTG36TjHd0c11RIy/rg=;
  b=WVIeog+ThEMqSoi3nl6ZtmnRjtLba/jdbPoCRQyLJe1R/CI05mopMn1Z
   drHFA4rfksJE4Plys3lY1oWa0CenQo/XWUB1ZdqgteChbccmSjNkHxxh2
   rsgOAOpVpGzY0Z3750q7eyLIkm3OeHP6XTY9MZ4SXTrysBokYiR+9ZOGI
   Ju+BBM/v5xxIPsT0I5T51VopswMIQLrJpnlmiLGEy3keI9YwovMoIoUeH
   Ir8dazajmIXdIe1kQcETvWpeUuIMEXMYDMh7JNMcFNIkrPi8zBeupKZ8G
   nmJzyTHHX6gzkx77FDJqZv+buRnFguBwUQ4lfcxxMkhzKl97IIdZOpuYE
   Q==;
X-CSE-ConnectionGUID: QKpcSv3DTN+iTh8v1Ybwig==
X-CSE-MsgGUID: cEg9S5sATv+p0IxpDNDLwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="70925400"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="70925400"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 08:35:36 -0700
X-CSE-ConnectionGUID: elraCIasR7+8YFOgW/o1hA==
X-CSE-MsgGUID: aTmWZ/aeTkudkqOH+vD0IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="158563601"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 27 Jun 2025 08:35:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 79B0D2BA; Fri, 27 Jun 2025 18:35:31 +0300 (EEST)
Date: Fri, 27 Jun 2025 18:35:31 +0300
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
Subject: Re: [PATCH v2 2/9] gpio: sysfs: only get the dirent reference for
 the value attr once
Message-ID: <aF66Q3Jtx1c6rmki@black.fi.intel.com>
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
 <20250623-gpio-sysfs-chip-export-v2-2-d592793f8964@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623-gpio-sysfs-chip-export-v2-2-d592793f8964@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jun 23, 2025 at 10:59:50AM +0200, Bartosz Golaszewski wrote:
> 
> There's no reason to retrieve the reference to the sysfs dirent every
> time we request an interrupt, we can as well only do it once when
> exporting the GPIO.

...

> -	struct kernfs_node *value_kn;
> +	struct kernfs_node *value_class_node;

This change is not mentioned in the commit message. Why?

-- 
With Best Regards,
Andy Shevchenko



