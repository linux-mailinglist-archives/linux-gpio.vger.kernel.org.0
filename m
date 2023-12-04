Return-Path: <linux-gpio+bounces-976-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAD2803777
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 15:49:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0654B20AE7
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 14:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D2228DB9;
	Mon,  4 Dec 2023 14:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4IcTeDj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DCC2C1;
	Mon,  4 Dec 2023 06:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701701381; x=1733237381;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OyK5xaD2gXFqzuWV1aJ86M25ufVghrDbW/job7rkqCU=;
  b=Q4IcTeDjeXpM0Ct2d8lWqp13TfLfbNE5dkv0JJx2N6M4r+WAIogE+gYi
   SGub6xk+nijfHK4Xh/rRBZgWHB8GtEr3blBSunOgn4Bp6vxgRpCcIOdWV
   adS5/Q8l2Vg1hIVNshlRzohricjXChG++qmN8MMc0RthtGUl65/ASliKn
   sUGVmlSNUzFX0W7A6SZHmG0FfGZk0WaBhw+7ES7Ew6qZcZYfoHo3DHYP4
   E+ft2/rxVHfYv//rKl7G33vPeOSsEJ0/HogVqTCk6efF4TvjZ1l4f+6Om
   j6VqtHZ9rGQZaPGKao1EbxWoYsE6zx4zXpN2E2t0A/uaqKGWtbwTFNroT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="591897"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="591897"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 06:49:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="841075936"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="841075936"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 06:49:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rAAGG-00000001mUw-3BG5;
	Mon, 04 Dec 2023 16:49:28 +0200
Date: Mon, 4 Dec 2023 16:49:28 +0200
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
Message-ID: <ZW3m-KDhs39i0E5n@smile.fi.intel.com>
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZhpXcx2FZYKM69j3x4dP5Nu-=3sXW+BQAw3k6c5aRrWw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZhpXcx2FZYKM69j3x4dP5Nu-=3sXW+BQAw3k6c5aRrWw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Dec 04, 2023 at 03:38:43PM +0100, Linus Walleij wrote:
> Hi Andy,
> 
> due to compile errors on arm32 and arm64 I had to drop most of the
> patches again but I kept the preparatory patches so your
> patch stack don't need to be so deep.

Thank you!

...

> >   pinctrl: core: Make pins const unsigned int pointer in struct
> >     group_desc
> >   pinctrl: equilibrium: Convert to use struct pingroup
> >   pinctrl: keembay: Convert to use struct pingroup
> >   pinctrl: nuvoton: Convert to use struct pingroup and
> >     PINCTRL_PINGROUP()

Hmm... Why these to be dropped?

> >   pinctrl: core: Add a convenient define PINCTRL_GROUP_DESC()
> >   pinctrl: ingenic: Make use of PINCTRL_GROUP_DESC()
> >   pinctrl: mediatek: Make use of PINCTRL_GROUP_DESC()
> >   pinctrl: core: Embed struct pingroup into struct group_desc
> >   pinctrl: bcm: Convert to use grp member
> >   pinctrl: equilibrium: Convert to use grp member
> >   pinctrl: imx: Convert to use grp member
> >   pinctrl: ingenic: Convert to use grp member
> >   pinctrl: keembay: Convert to use grp member
> >   pinctrl: mediatek: Convert to use grp member
> >   pinctrl: renesas: Convert to use grp member
> >   pinctrl: starfive: Convert to use grp member
> >   pinctrl: core: Remove unused members from struct group_desc
> 
> I dropped these (because they all cross-depend...)

-- 
With Best Regards,
Andy Shevchenko



