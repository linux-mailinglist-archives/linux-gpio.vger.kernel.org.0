Return-Path: <linux-gpio+bounces-476-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CB87F7271
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 12:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52F291C20CB8
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 11:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264411B271;
	Fri, 24 Nov 2023 11:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h8vDMejD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92C02D64;
	Fri, 24 Nov 2023 03:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700824180; x=1732360180;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3b0450yeKOhsXHRbmaL0w0QDUDUm2b2Mw4scsYFWfU0=;
  b=h8vDMejDiRfiMosg4KR+zieClq1aAKQDQuks2pV4iopZ0EOJXZVdOEO7
   FW5LR8tA81HnKoTUPmkfIMWn+Wt6gypjxjqTBy2HN7MoyzESVHVVrLMz+
   vP+DOsY65OoW9OVIhudJQiirAOZJEXQJMnZ28gYAm1ZWD7tORFLi1eshm
   PNAQRYjA45R58JMLnJXkAqDj7JY2RT0vf3Cn9tW3l4CO2JZ3DUUNu+siJ
   hnmf4fOQy5D+WJ/mq3J75Dl6ePx99wqyZbWOvDAEALHmpLkg0yLWSQKFp
   2uf/N6vF/zIPqowrOmKU80D+G3Iu6wBgrd+6+gD2mfEsCIiuKED10wHcC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="396313079"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="396313079"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 03:09:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="940899614"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="940899614"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 03:09:38 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r6U40-0000000GhBd-08JK;
	Fri, 24 Nov 2023 13:09:36 +0200
Date: Fri, 24 Nov 2023 13:09:35 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: lynxpoint: Simplify code with cleanup
 helpers
Message-ID: <ZWCEbyCsLbCinq1V@smile.fi.intel.com>
References: <20231122175444.2316719-1-andriy.shevchenko@linux.intel.com>
 <20231124053429.GH1074920@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124053429.GH1074920@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 24, 2023 at 07:34:29AM +0200, Mika Westerberg wrote:
> On Wed, Nov 22, 2023 at 07:54:44PM +0200, Andy Shevchenko wrote:
> > Use macros defined in linux/cleanup.h to automate resource lifetime
> > control in the driver.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



