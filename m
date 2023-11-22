Return-Path: <linux-gpio+bounces-378-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D0B7F4FB5
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 19:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBD261F20CFE
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 18:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A45058AAB;
	Wed, 22 Nov 2023 18:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bPmszwYK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5566D62;
	Wed, 22 Nov 2023 10:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700678213; x=1732214213;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c0xFg9deCV85cczPKWp2cY1uCXt2E2OindP8iQIcnNs=;
  b=bPmszwYKtyPKJx26DKefGFJjHK2VqowWv9nCa+Wag5wU5ildmYXUa9kT
   rIHY53U5bP4IRC5611Dsy5QeKa4McIZyiV6PPJVRksATNVIBRXG38VKUh
   BcrUE0u0VGYaI0SSDcSPwssNP8Z7WU2XYcV0RxutFE4HDr6S+X7v4e6sP
   gNOT9Tzvq8A2alFerazUAkNGq+Y7vpgkIowonzYGUC/XHPQ0fuv/ZWL0R
   D7WytgVfTshVkvf/fDVbpW/SLMowLboWatu5saJDk5CUN4QrKnb+wdINO
   XgelYf6pWX3tKb4RBUg8zNxjmET9GdDu5Vi1+U0Jyke9Gw2Y4mxc54e2+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="423227842"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="423227842"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 10:30:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="716789936"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="716789936"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 03:17:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r5l1m-0000000G4Mg-2yei;
	Wed, 22 Nov 2023 13:04:18 +0200
Date: Wed, 22 Nov 2023 13:04:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] pinctrl: intel: use the correct _PM_OPS() export macro
Message-ID: <ZV3gMilp-vhSPxc9@smile.fi.intel.com>
References: <20231122105401.11006-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122105401.11006-1-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 22, 2023 at 04:24:01PM +0530, Raag Jadav wrote:
> Since we don't have runtime PM handles here, we should be using
> EXPORT_NS_GPL_DEV_SLEEP_PM_OPS() macro, so that the compiler can
> discard it in case CONFIG_PM_SLEEP=n.

Obviously correct fix, I've pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



