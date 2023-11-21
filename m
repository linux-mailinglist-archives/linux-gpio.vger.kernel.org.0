Return-Path: <linux-gpio+bounces-333-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CAF7F35B8
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 19:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A83021C20F7D
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 18:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05212209A;
	Tue, 21 Nov 2023 18:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NY7Hjabj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C636F9;
	Tue, 21 Nov 2023 10:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700590309; x=1732126309;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6gNaIiHSkGOx3pUPJYXxwWlzVU2Zgy4WYJYQocOPIYw=;
  b=NY7HjabjmQ+PvDEkKeFzMNvRXxjMUv1eJsLq8aLVy10sgUngp9lE2lYL
   XaT8lKc2KRgOiUrQ7ujfqeurlvrAlN2zpko7cKnG0rE0V1x2waOGQR138
   lXcGX1/OK2PH4MG6DgnlNcdgwkoiYiRdT0VH3hEga33BmU0wd1Lod0xwy
   IkNgVRqD5/kYH570/O3TIgCazGSSLJyw7PJc631oEPDt1yOjEsSQON1B5
   ++rkYBp5RWfTIeuWYJoXRkgbs6S4dXusAjqYdT/tL0c650c1B+sw6P+ns
   2APk0f44tnkQnjlnebgqHSC3X7hUgnemMUHHu3unt+4eBtEzgSu3zt3lP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="13443304"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="13443304"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 10:11:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="1013992261"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="1013992261"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 10:11:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r5VDo-0000000Fsrj-1UCn;
	Tue, 21 Nov 2023 20:11:40 +0200
Date: Tue, 21 Nov 2023 20:11:39 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: nuvoton: Convert to use struct pingroup
 and PINCTRL_PINGROUP()
Message-ID: <ZVzy227f3cIiTmtE@smile.fi.intel.com>
References: <20231120194802.1675239-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120194802.1675239-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 20, 2023 at 09:48:02PM +0200, Andy Shevchenko wrote:
> The pin control header provides struct pingroup and PINCTRL_PINGROUP() macro.
> Utilize them instead of open coded variants in the driver.

Linus, I dunno if you are going to apply this sooner (assuming Jonathan is okay
with the change), but I have a bigger pending series where this will be a
prerequisite. So, when I will be ready and if it's not being applied (yet),
I'll include it into the bigger series as well.

-- 
With Best Regards,
Andy Shevchenko



