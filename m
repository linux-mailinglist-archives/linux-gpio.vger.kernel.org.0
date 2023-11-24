Return-Path: <linux-gpio+bounces-488-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD8B7F7678
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 15:38:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 010241C2128C
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 14:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C0928386;
	Fri, 24 Nov 2023 14:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L1/kyVmI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 875DE19A3;
	Fri, 24 Nov 2023 06:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700836731; x=1732372731;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QKgJEGRCbdv2EWGbewfRTODn2GZOxw9ytLOYIn7uuOQ=;
  b=L1/kyVmIVn1Dddb4n3hQEVXNkMjvRp0P2uctbs5mnDfvYCF85KU+wWWH
   X9T+2UrK5KleGAtP+JeWAASN7z4AvjkyXun7uX6Ry12ktp2WFjU1JN3wO
   SPP8LKF340YlD74jZv6un3ZcdaevZBVgkFlaI37+TiASAHyegMwQ3gpVT
   wvZ4XXGBZrblSZymOccm7KETGJV0p58RpqcmS7a4Lb8SkG3sSJMh07ZF4
   di0kBDViFNRNdhDKU4J5A69UltanAMcxXnRkb11d3byVhN329eOsP0lfI
   QdpVpyeZtzQMsSnFa8OptGY58PPIu/V/SJScVdPNMvC2ecToQqdfIRPx8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="392198719"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="392198719"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 06:38:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="743906526"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="743906526"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 06:38:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r6XCh-0000000GjtS-2kli;
	Fri, 24 Nov 2023 16:30:47 +0200
Date: Fri, 24 Nov 2023 16:30:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org, linux-mips@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH v2 06/21] pinctrl: equilibrium: Convert to use struct
 pingroup
Message-ID: <ZWCzl-EYXdymay4p@smile.fi.intel.com>
References: <20231123193355.3400852-7-andriy.shevchenko@linux.intel.com>
 <202311241401.ZPILPdov-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202311241401.ZPILPdov-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 24, 2023 at 09:19:45PM +0800, kernel test robot wrote:

...

> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311241401.ZPILPdov-lkp@intel.com/
> 
> smatch warnings:
> drivers/pinctrl/pinctrl-equilibrium.c:719 eqbr_build_groups() warn: unsigned 'grp->npins' is never less than zero.

Thank you for the report!

...

>    718			grp->npins = of_property_count_u32_elems(np, "pins");
>  > 719			if (grp->npins < 0) {
>    720				dev_err(dev, "No pins in the group: %s\n", prop->name);
>    721				of_node_put(np);
>    722				return -EINVAL;
>    723			}

Surprisingly (to me) the _count_u32_elems() can return a negative error code...
Fine, I redo a bit the code by introducing a new patch that will use err instead
of ->npins (which sounds better approach anyway).

-- 
With Best Regards,
Andy Shevchenko



