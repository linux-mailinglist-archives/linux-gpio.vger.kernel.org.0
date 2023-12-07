Return-Path: <linux-gpio+bounces-1097-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 897DF8087F5
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 13:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32D721F225C7
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 12:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C23364DB;
	Thu,  7 Dec 2023 12:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XnnA7Bw5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB6C01721;
	Thu,  7 Dec 2023 04:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701952643; x=1733488643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uoIOAcneX9AofP4JnfDFkqufIngyLWMkLfkJAUEGqpI=;
  b=XnnA7Bw52mhYR1l5GPVvCTAy30yJiC2dN5svROW2Fo0/bf5yyHGqW0Ns
   oWPcse6TYEcgcQ1UhwpSzYEVjeFCIVPknJzdNJ94SeA5d7dpZI+uQ4Rv1
   uXOTPeuO1KacwloNgJ2KyOE5OFuJG6T59VeWWmx0VpEGWlTjNGuxbFrsx
   HlEWvk9tKExq+B0jBTRUUlYpqKuaWiGbyaq4FltT+k+VtQVNvQJN1FOiG
   c3CYTNqroIyv3Yn5g30XEOJcptyZ/TqhdMtCGpB0f0rd5vhsSebV/ZGZh
   eML6ZqAQKLTS15PjNS//GAV38lpvq2RcG1p0ZbXlKU7/RZWsOeZU1PSYO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="384628704"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="384628704"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 04:37:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="837702740"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="837702740"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 04:37:20 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rBDcz-00000002bDf-3Wqj;
	Thu, 07 Dec 2023 14:37:17 +0200
Date: Thu, 7 Dec 2023 14:37:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Subject: Re: [PATCH v1 0/5] pinctrl: Use struct pingroup and
 PINCTRL_PINGROUP()
Message-ID: <ZXG8fQpWBQ8eag6x@smile.fi.intel.com>
References: <20231204160033.1872569-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdYVTgNCdDE6qK8wnbPAL2=S6RyDQYwPUVdtfQSSTratnQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYVTgNCdDE6qK8wnbPAL2=S6RyDQYwPUVdtfQSSTratnQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Dec 07, 2023 at 10:54:58AM +0100, Linus Walleij wrote:
> On Mon, Dec 4, 2023 at 5:00 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > This is an excerpt from v4 of the "pinctrl: Convert struct group_desc
> > to use struct pingroup" [1]. The series has been compiled with GCC 8
> > for ARM64 besides x86_64 GCC 13 and LLVM 16.
> >
> > Changelog to the mother series [1]:
> > - added a new patch against Renesas code, so no warnings will be seen
> 
> Patches applied!

Thank you!
I will send the rest after this part appears in Linux Next.

-- 
With Best Regards,
Andy Shevchenko



