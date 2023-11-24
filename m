Return-Path: <linux-gpio+bounces-485-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D72EC7F73DE
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 13:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43EA9B213BD
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 12:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D51418041;
	Fri, 24 Nov 2023 12:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUxRDH8e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB1A7B6;
	Fri, 24 Nov 2023 04:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700829179; x=1732365179;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ua9WzBIueklW0+q3gIH97GV61BDNLh+kPw+aWwuovUk=;
  b=IUxRDH8eW1DtuOP8ZBMeRPovkV7fjYpJk0CL3+g1BlZVJtbhfRWD3aiS
   qkJlLyZYb2qXzAStaDZAbOlY8u+hNYOTaFAZOJXJJdcO7ppF83esjEbev
   N3iQb25/vBqaOPoNGbWsT5BiVmjUUeqw79qpN2XCMLnk0/mkb2FBv/vk8
   rI7DE3RmjVr55ytQ5iUnZsswFnG9Y3jAbHO5XMckrOU/eb3BMMqXVpt3o
   7sppvncGiOSUYqdvgVC5dwGCSB20guVYErXw47K1hXKWLSMe0weHcunbU
   DqMBzMD3Fyu8nvBrvNm7ZEKZqfmKrAuemziExatH9f6JxqBwiTpRH+kYy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="391291470"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="391291470"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 04:32:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="1014895116"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="1014895116"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 04:32:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r6VMd-0000000Giba-2QBm;
	Fri, 24 Nov 2023 14:32:55 +0200
Date: Fri, 24 Nov 2023 14:32:55 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] pinctrl: tangier: simplify locking using cleanup
 helpers
Message-ID: <ZWCX9_rv4Tn5L_RF@smile.fi.intel.com>
References: <20231123140212.12135-1-raag.jadav@intel.com>
 <20231123142816.GE1074920@black.fi.intel.com>
 <ZWCEXZrgafGqwBKT@smile.fi.intel.com>
 <ZWCSJQoJ1m9PtF_e@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWCSJQoJ1m9PtF_e@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 24, 2023 at 02:08:05PM +0200, Raag Jadav wrote:
> On Fri, Nov 24, 2023 at 01:09:17PM +0200, Andy Shevchenko wrote:
> > On Thu, Nov 23, 2023 at 04:28:16PM +0200, Mika Westerberg wrote:
> > > On Thu, Nov 23, 2023 at 07:32:12PM +0530, Raag Jadav wrote:
> > > > Use lock guards from cleanup.h to simplify locking.
> > > > 
> > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > 
> > > Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > 
> > Pushed to my review and testing queue, thanks!
> 
> Awesome, I noticed a few commits having duplicate Acks in Intel tree.

You are right, I have mistakenly run a msg-filter before applying my byt
series. Thanks for spotting this, now should be fixed!

-- 
With Best Regards,
Andy Shevchenko



