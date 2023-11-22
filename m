Return-Path: <linux-gpio+bounces-345-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCC37F434F
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 11:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 186B8281443
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 10:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE113B7B4;
	Wed, 22 Nov 2023 10:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bG+5qaBy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08803198;
	Wed, 22 Nov 2023 02:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700647918; x=1732183918;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gaoHnn56Y6+Ub/jBzpLAMFS55DafKsAcyZeW1d0lVsw=;
  b=bG+5qaByjIRAe6nnV5gDC6pGjKLGkaGryXkL2YENzqfOQCtalsQz50b+
   ob3d4Do8daRoPXoOtbF+xSv26T2U9zqS3FEXRLC5Eryb7LPY3tiyOsOuD
   Ji2YzlmsmHjcvkw7vRNIXTxI/rujTIudng0lV+I2Jc3yzsycBZ6l9+xeZ
   6Oz6sULUloGdWmmm61aBWENQNsfAbzB7Xo450ZsKD82XniBQoIKwGKgPp
   PXnkK5+QxBe9Qwo31SZGNKrKxbQkPR7vdVOI76q2h8O53l5NG+/gPTE4R
   3vXgYgr/awI0dtmBbQG+2e4GuulQneuypWoNIk2rmN/XW+SqdW4b8JmWZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="371374800"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="371374800"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 02:11:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="884546050"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="884546050"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 02:10:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r5kBP-0000000G3iF-0D7Y;
	Wed, 22 Nov 2023 12:10:11 +0200
Date: Wed, 22 Nov 2023 12:10:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 1/1] pinctrl: mediatek: Switch to use no-IRQ PM helpers
Message-ID: <ZV3TglMV4A43OVnd@smile.fi.intel.com>
References: <20231120171754.1665539-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120171754.1665539-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 20, 2023 at 07:15:31PM +0200, Andy Shevchenko wrote:
> Since pm.h provides a helper for system no-IRQ PM callbacks,
> switch the driver to use it instead of open coded variant.

...

> +EXPORT_GPL_DEV_PM_OPS(mtk_eint_pm_ops) = {

> +EXPORT_GPL_DEV_PM_OPS(mtk_paris_pinctrl_pm_ops) = {

These should be EXPORT_GPL_DEV_SLEEP_PM_OPS().

I'll fix it in next version.

-- 
With Best Regards,
Andy Shevchenko



