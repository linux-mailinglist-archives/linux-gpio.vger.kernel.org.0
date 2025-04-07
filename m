Return-Path: <linux-gpio+bounces-18325-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4689A7D8BD
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 10:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB71418962AC
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 08:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E86F22B8A5;
	Mon,  7 Apr 2025 08:55:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3810228CBE;
	Mon,  7 Apr 2025 08:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744016105; cv=none; b=mIj1HuJqnRM6w6baWWv7YcjA0jmOtoVnpT0ELpCnNpTb0kRB+snC/dMhne3wXt25uZ1zKmNDKvdU56LsuI6YYy4gGyUtKz4WOqbm61ZrL2dYv3xH4N3hgb1z/5mi1fG2l0k0v9sJqAb6VVcvGSlEu69UyW1Dmx4/SMNVk/nzrWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744016105; c=relaxed/simple;
	bh=f/LcNa6GPRTKbdOQ0J6Rx6Ux/UEHkLRKdixOCrp5Zw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SgzHU2VdnpKAveM9hdVq/Cd6ujiLq658RVrIGTFp/MCLqITitrYrrHlj0s+0qGb0nM6PG0RYQqgQpVHfhwat8kIHymGuf8WNf9CkHWsyndfE3q8qoLPygsJEJiuVSbLBNmtnj6U2NAXmZZ9FpygSu4ZcJEN0w7Wf0iQFJWHGZBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: o7xd73c8QbevuoL69pUt3g==
X-CSE-MsgGUID: w0ZHCJaTQTyhq5xX/d2dsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="67864445"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="67864445"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 01:55:04 -0700
X-CSE-ConnectionGUID: MqkqK+M3Rou5JYPj0Gvznw==
X-CSE-MsgGUID: ITP6GFcDRhyw7vd/CvRTSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="151079832"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 01:55:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u1iFu-0000000A0dr-1kCv;
	Mon, 07 Apr 2025 11:54:58 +0300
Date: Mon, 7 Apr 2025 11:54:58 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Peter Tyser <ptyser@xes-inc.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 12/12] gpio: ich: use new line value setter callbacks
Message-ID: <Z_OS4nx2E12yjL7_@smile.fi.intel.com>
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
 <20250407-gpiochip-set-rv-gpio-part1-v1-12-78399683ca38@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-12-78399683ca38@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 09:13:21AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.

I'll take it via my tree. Thanks!

-- 
With Best Regards,
Andy Shevchenko



