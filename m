Return-Path: <linux-gpio+bounces-47-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A4A7E9B3B
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 12:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F0AB280CCC
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 11:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D7F1CAA8;
	Mon, 13 Nov 2023 11:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKeP69VQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9641CA8C
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 11:35:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19482D69;
	Mon, 13 Nov 2023 03:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699875335; x=1731411335;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RD/WCvfoV+16HLNd+5scZiuZFdL49rMcOLxi/EFXgWc=;
  b=fKeP69VQJItiQxGhFH8h/A6AfOCUbNkIeV4wPOT6qiENhlYscUW6qqBP
   Zqi8c8LBKWN/1msphO3qWHyj2Jim/MuhDzEb8F6zMFRdzfaUm3UElxBA3
   gYqdIFcytKmkrAXefWyeDc8vPr5Dz4A/gXlJ4yiCuWMQ5llWaEEQX9WJw
   2TvWKnGMzikrBMOiYFmwhr+0BUC04s5Chn5lLXYmu+i0QkpO2yPxt9xsw
   c1VQ9+kJWt242YJTRYZMLKNuGFGoa0IrpRqqXY7kAbOT0kDd18oSc69pz
   SXjtoAGhNbTIaawpOhvs4fOqSqGDsn7q7We3aJ/spRyxBpYtkbV2C1VUL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="393283370"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="393283370"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 03:35:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="1011515730"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="1011515730"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 03:35:32 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r2VE1-0000000DXp0-1KRo;
	Mon, 13 Nov 2023 13:35:29 +0200
Date: Mon, 13 Nov 2023 13:35:28 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v3 00/17] pinctrl: intel: Use NOIRQ PM helper
Message-ID: <ZVIKAB1cjEeyFf_E@smile.fi.intel.com>
References: <20231030120734.2831419-1-andriy.shevchenko@linux.intel.com>
 <20231110061422.GI17433@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110061422.GI17433@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 10, 2023 at 08:14:22AM +0200, Mika Westerberg wrote:
> On Mon, Oct 30, 2023 at 02:07:17PM +0200, Andy Shevchenko wrote:
> > Intel pin control drivers use NOIRQ variant of the PM callbacks.
> > To make them smaller and less error prone against different
> > kernel configurations (with possible defined but not used variables)
> > switch to use NOIRQ PM helper.

...

> Nice! For the series,
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



