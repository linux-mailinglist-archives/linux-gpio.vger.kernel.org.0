Return-Path: <linux-gpio+bounces-667-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C947FD875
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 14:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7D20B214E3
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 13:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EAAE208C6;
	Wed, 29 Nov 2023 13:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bTrKy8+F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE10E6;
	Wed, 29 Nov 2023 05:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701265328; x=1732801328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hzAuAJ5s5oCGg7D9BAY5Ac1RZ/MBIy/fgOAKR6StNrI=;
  b=bTrKy8+Fqkzz7L1I3uPXrINxb/Z1BSn+59Df+eMRdxDv0pMObt3ZwFy2
   e02XbNHmZJaFas4s6UnTVZT48L68LBqqPgMeUKmt+bIh+cTa3rEhEmRAb
   BNcrVXuG3qzqqm/g8XIHoIt/6/EmlYDr86zR+dIxtuNUq1QwyFLWAESqI
   rf41bVBKk+j5vJvXXkXaLP+nlzSUsZIvCieHuKg8pxLraVCf+7+BIY8US
   W0hVU+JRYPeYRC1hWJ9FW6XdCM9n+beB0aKFLnyfvUJz+g3hAPTqF6M89
   7zoQ2iudDvyJRgVn3D2Og1/FCEJLneT0n0V0eIxiU5hFXjSPKvzXDJK5z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="378193875"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="378193875"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 05:42:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="912858646"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="912858646"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 05:42:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r8Kp9-00000000S0e-49ct;
	Wed, 29 Nov 2023 15:41:55 +0200
Date: Wed, 29 Nov 2023 15:41:55 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org, linux-mips@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v3 06/22] pinctrl: core: Make pins const in struct
 group_desc
Message-ID: <ZWc_o4Dcsb0v5TGB@smile.fi.intel.com>
References: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com>
 <20231128200155.438722-7-andriy.shevchenko@linux.intel.com>
 <CAMuHMdWt0qq-Umd8udb7fxpNVZ=X9O9eZGMVGFSGRO_d9UkgNw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWt0qq-Umd8udb7fxpNVZ=X9O9eZGMVGFSGRO_d9UkgNw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 29, 2023 at 12:21:45PM +0100, Geert Uytterhoeven wrote:
> On Tue, Nov 28, 2023 at 9:04 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > It's unclear why it's not a const from day 1. Make the pins member
> > const in struct group_desc. Update necessary APIs.

...

> >  int pinctrl_generic_add_group(struct pinctrl_dev *pctldev, const char *name,
> > -                             int *gpins, int ngpins, void *data);
> > +                             const int *pins, int num_pins, void *data);
> >
> >  int pinctrl_generic_remove_group(struct pinctrl_dev *pctldev,
> >                                  unsigned int group_selector);
> 
> Probably this is also the right moment to change all of these to arrays
> of unsigned ints?  Else you will have mixed int/unsigned int after
> "[PATCH v3 13/22] pinctrl: core: Embed struct pingroup into struct
> group_desc", and purely unsigned int after "[PATCH v3 22/22] pinctrl:
> core: Remove unused members from struct group_desc".

Hmm... Can it be done later?

I can, of course try to change the parameter here to be unsigned, but it most
likely fail the build for those drivers means need more patches, more delay to
this series.

Linus?

-- 
With Best Regards,
Andy Shevchenko



