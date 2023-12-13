Return-Path: <linux-gpio+bounces-1098-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DCB808915
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 14:24:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2B2F2818DA
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 13:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4705405ED;
	Thu,  7 Dec 2023 13:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BkX+5ZMl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 295ACAA;
	Thu,  7 Dec 2023 05:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701955440; x=1733491440;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NyaA+nnXoQWzMmCkDluoshiTF/uj4vBECGOztPiEMCQ=;
  b=BkX+5ZMlvtt4w5iDW9qDRKG995jUElR3xAn8U77VRx8NO9zPVOGQMtU5
   bJxY03E4m8jqIHdA8Cha/ZHCUXXy+cbuKu5Z3AEUt7j/zegOwwbvCfWbh
   fgQxMlY0iBZO2878mWnx9Kz/jN+QrimfnoyuVUA90x7AIIgNZHHObXZG4
   Foz4n7PMh9+xGv9Zl0z+9JIwqHL7vb7pRusWXnzEkLcOKbKtDVkoSbV2r
   EsogKuV4bG3hScIF6T2Qv8JxALaTPAL6IcxTmRhC0hMZg/iPd8rMiYGKK
   uWpjnSWVIcot1ppaQ4MOyxHADEmhY0tCL9NFJdsJocEdjJaN38ECjOzBz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="480418401"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="480418401"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 05:14:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="895143152"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="895143152"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 05:14:19 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rBECk-00000002bf1-3JAj;
	Thu, 07 Dec 2023 15:14:14 +0200
Date: Thu, 7 Dec 2023 15:14:14 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
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
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v4 00/23] pinctrl: Convert struct group_desc to use
 struct pingroup
Message-ID: <ZXHFJgs5y4RxhtBf@smile.fi.intel.com>
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZhpXcx2FZYKM69j3x4dP5Nu-=3sXW+BQAw3k6c5aRrWw@mail.gmail.com>
 <ZW3m-KDhs39i0E5n@smile.fi.intel.com>
 <CACRpkdaDDJfDznGZE1OGNt0Rc6Wbh0-0suu6PgL+veJea9rBRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaDDJfDznGZE1OGNt0Rc6Wbh0-0suu6PgL+veJea9rBRQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Dec 07, 2023 at 10:50:29AM +0100, Linus Walleij wrote:
> On Mon, Dec 4, 2023 at 3:49 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Dec 04, 2023 at 03:38:43PM +0100, Linus Walleij wrote:

...

> > > >   pinctrl: core: Make pins const unsigned int pointer in struct
> > > >     group_desc
> > > >   pinctrl: equilibrium: Convert to use struct pingroup
> > > >   pinctrl: keembay: Convert to use struct pingroup
> > > >   pinctrl: nuvoton: Convert to use struct pingroup and
> > > >     PINCTRL_PINGROUP()
> >
> > Hmm... Why these to be dropped?
> 
> I couldn't tell apart which ones could cross depend on the others,
> simple as that...

No problem as I have noticed a warning which had been fixed in a separate
series I sent earlier and which you already applied today. Thanks!

-- 
With Best Regards,
Andy Shevchenko



