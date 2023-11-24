Return-Path: <linux-gpio+bounces-478-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9AA7F7281
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 12:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EF541C20C1D
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 11:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114071C6A6;
	Fri, 24 Nov 2023 11:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LlLi0peU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F7B6D7E;
	Fri, 24 Nov 2023 03:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700824397; x=1732360397;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bno8cSNOfIDyBjHnkBz4p3/WS1Ms0Q6QCyL3sjMUeQw=;
  b=LlLi0peUURQjrn9+UYwd/hnx1r/grlvGvX1RP6CkIiG3BnVUjQffJGTV
   7+TpK2LhEBZwT8tEzV/6cGiSTHU2YdL48ynGVDRRoC1g0OaL6uO7xqBiM
   d8ZWyXhbGQOgP6ZIfELi85MdCOYEZ94RI10lU3sSSnhqZJNWeOx+D93I2
   grohAmbhOBMQPxIWaDc5Gnf8H1F4Ow1Z4N2RjVr+vT0Tgbw1gY2WKhDyn
   AD0kzWmmycCKP7kHAY+Cc8+yIqQ+C4TyIBamgh9K9e0Fdc36tz3uHDDp1
   A7ANkMF48T31jMrva0B7962XwxF1/VmvaEws0uvtcsoO6HtHaSvLYZoKp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13963210"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="13963210"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 03:13:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="760933195"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="760933195"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 03:13:14 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r6U7U-0000000GhEu-1RIk;
	Fri, 24 Nov 2023 13:13:12 +0200
Date: Fri, 24 Nov 2023 13:13:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/4] pinctrl: baytrail: Fix types of config value in
 byt_pin_config_set()
Message-ID: <ZWCFSGLB6LEzH979@smile.fi.intel.com>
References: <20231122175039.2289945-1-andriy.shevchenko@linux.intel.com>
 <20231124053339.GG1074920@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124053339.GG1074920@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 24, 2023 at 07:33:39AM +0200, Mika Westerberg wrote:
> On Wed, Nov 22, 2023 at 07:50:36PM +0200, Andy Shevchenko wrote:
> > When unpacked, the config value is split to two of different types.
> > Fix the types accordingly.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> There was one typo which I commented (please fix when applying).
> Otherwise the series looks good to me,
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Fixed locally.

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko



