Return-Path: <linux-gpio+bounces-703-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 987287FDC44
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 17:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A8011F205A8
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 16:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C56939ACC;
	Wed, 29 Nov 2023 16:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B38ACD66;
	Wed, 29 Nov 2023 08:10:25 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="397080488"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="397080488"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 08:10:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="772729723"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="772729723"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 08:10:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1r8N8l-00000000Tvw-3QdB;
	Wed, 29 Nov 2023 18:10:19 +0200
Date: Wed, 29 Nov 2023 18:10:19 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Boerge Struempfel <boerge.struempfel@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andrew Jeffery <andrew@aj.id.au>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, bstruempfel@ultratronik.de
Subject: Re: [PATCH v3] gpiolib: sysfs: Fix error handling on failed export
Message-ID: <ZWdia1rDg9pH2Fhu@smile.fi.intel.com>
References: <20231129152307.28517-1-boerge.struempfel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129152307.28517-1-boerge.struempfel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 29, 2023 at 04:23:07PM +0100, Boerge Struempfel wrote:
> If gpio_set_transitory() fails, we should free the GPIO again. Most
> notably, the flag FLAG_REQUESTED has previously been set in
> gpiod_request_commit(), and should be reset on failure.
> 
> To my knowledge, this does not affect any current users, since the
> gpio_set_transitory() mainly returns 0 and -ENOTSUPP, which is converted
> to 0. However the gpio_set_transitory() function calles the .set_config()
> function of the corresponding GPIO chip and there are some GPIO drivers in
> which some (unlikely) branches return other values like -EPROBE_DEFER,
> and -EINVAL. In these cases, the above mentioned FLAG_REQUESTED would not
> be reset, which results in the pin being blocked until the next reboot.

Thank you!
Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko



