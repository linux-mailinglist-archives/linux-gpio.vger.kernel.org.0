Return-Path: <linux-gpio+bounces-22353-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50984AEBC46
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 17:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85B537A9B5C
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 15:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA8A2EA161;
	Fri, 27 Jun 2025 15:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OSqlapg9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4C42E9ED1;
	Fri, 27 Jun 2025 15:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039230; cv=none; b=OQynphgXXLWdfb25orh99ImdZwoAsRngMlNdZGHCv001OEa5C4GdXHG51/W9QJyincAziH2AypYS/I9RJC3fKjazECAjRMJEq4ZWTXJe5cKDiiSjv650OfiomnhbHH7IBZJ9GGBLDahPkGXk1OX8uLGVcBQ7B1FsQtm/TlXyQUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039230; c=relaxed/simple;
	bh=hWldz509Ecg7vn63i4HIbfM5Ub5P/sb0NDpEA8t8rv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6nbAi4MgyOliytteFgjAjlc+9vcF8btIt+0+SsmaCUvapLj4NSs+Zdgyiq9eK6IjZ1vmp1cgNp4ayoV4rFE8qS/qlKdYyD7V9Wa/YOQmaMxaFI5XyzN0RJNbCEn2x2MBhW8oKMZlsZ9EagB37O/Mb68ilGh+A0+rxsEeGnLDMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OSqlapg9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751039229; x=1782575229;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hWldz509Ecg7vn63i4HIbfM5Ub5P/sb0NDpEA8t8rv8=;
  b=OSqlapg9ImGXBTTok8V4+g63o0//mbaoPk7bHUbOlDpXYUCR09diLfzG
   6WXjsT9cziSfPMl1xWdv1WrKLTV2Md9XkjaKMt2v5xa3vYxqA4meHFkJs
   ndL/2/M5kO55C1xgTswrY7/aArBdoq0Bl77nGmbrqcLleTfhqy/ScPn/1
   rPzLC9mnXfRaLDLFKQ8UtiLoz/lAHRlrEV88OeBezBPeg/z/5u15ibR7J
   IZkL1bxukx/+TOBm2rr13sxfYpJgSepoig3W5O1rVvRM5VETaa5JfSEuZ
   Ap4PL0+8CM2V4KoHpS7un0iqzsZXDVmNMCcGxM1f1W/oMl4Hhzgm/dHLt
   A==;
X-CSE-ConnectionGUID: To6bSzlxTNGX8/8kKRxfjA==
X-CSE-MsgGUID: k5QjRW/zS1KQIgnd8KRfHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57162625"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="57162625"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 08:47:09 -0700
X-CSE-ConnectionGUID: lBuLRyojRvCRZswe7X7Q7A==
X-CSE-MsgGUID: b/2BFrnQRle/TvlWTRz6mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="183737516"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jun 2025 08:47:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C65C52BA; Fri, 27 Jun 2025 18:47:03 +0300 (EEST)
Date: Fri, 27 Jun 2025 18:47:03 +0300
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
Subject: Re: [PATCH v2 6/9] gpio: sysfs: don't look up exported lines as
 class devices
Message-ID: <aF6895xeiB19A6ig@black.fi.intel.com>
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
 <20250623-gpio-sysfs-chip-export-v2-6-d592793f8964@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623-gpio-sysfs-chip-export-v2-6-d592793f8964@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jun 23, 2025 at 10:59:54AM +0200, Bartosz Golaszewski wrote:
> 
> In preparation for adding a parallel, per-chip attribute group for
> exported GPIO lines, stop using class device APIs to refer to it in the
> code. When unregistering the chip, don't call class_find_device() but
> instead store exported lines in a linked list inside the GPIO chip data
> object and look it up there.

...

> +	struct list_head list;
>  };

If you make this to be the first member, you may make the container_of() (from
list_entry APIs) to be no-op. Have you checked with bloat-o-meter the difference?

...

> +	struct list_head exported_lines;
>  };

Ditto.


...

> -	desc_data->value_class_node = sysfs_get_dirent(dev->kobj.sd, "value");
> +	desc_data->value_class_node = sysfs_get_dirent(desc_data->dev->kobj.sd,
> +						       "value");

In such cases I find the following style to be slightly better to read.

	desc_data->value_class_node =
			sysfs_get_dirent(desc_data->dev->kobj.sd, "value");

-- 
With Best Regards,
Andy Shevchenko



