Return-Path: <linux-gpio+bounces-489-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E16597F76D4
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 15:47:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8D571C21233
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 14:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2976D2D62B;
	Fri, 24 Nov 2023 14:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nbjffjun"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E0419A4;
	Fri, 24 Nov 2023 06:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700837257; x=1732373257;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=kuw3+1Pm03Ibm+MVDWAtmPGqCx+P0c0EstmoCAQl4jQ=;
  b=Nbjffjunu+vcoywq0V49QHxI6C0dNhFBspFeEDLZVtz7dJEx7BVUE50H
   ViaiOXJ8oRXaJIeuWtlMCqbRzCoyAK55e072msxC1wOHv3caTNE0QJM73
   4Rt+iFpBz4VMmPOVzAasEAFITaQ6/0hHy1Jsyp2WP+ivYX6+ghAf1cb1O
   X+gWpARHCbqQWRWJtyI0QdJZImkpslMk+3iMRwGMsRcQYoJiyFuPL55gv
   FDcnEFnQdFBzZKVxv/g3I8Zu0epeWezptu0XQBQyWHltuBYVf4TSIBNLS
   gPG8TFkLU/y6PSf90eG1wpZ/CQZRR+LIo1qynPCLo2j7UgQlHjTEsVDD4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="395249771"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="395249771"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 06:47:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="767501852"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="767501852"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 06:47:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r6XSm-0000000Gk4Z-1lzv;
	Fri, 24 Nov 2023 16:47:24 +0200
Date: Fri, 24 Nov 2023 16:47:24 +0200
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
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v2 00/21] pinctrl: Convert struct group_desc to use
 struct pingroup
Message-ID: <ZWC3fNnYM9qDKT-5@smile.fi.intel.com>
References: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdbEoAvTs4c5e910bsBZej2Gs6H+SPLAXUnKM2qRk+5MTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbEoAvTs4c5e910bsBZej2Gs6H+SPLAXUnKM2qRk+5MTw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 24, 2023 at 11:17:53AM +0100, Linus Walleij wrote:
> On Thu, Nov 23, 2023 at 8:34 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> > Linus, assuming everything is fine, I can push this to my tree.
> > Or you can apply it (assumming all CIs and people are happy with
> > the series).
> 
> I would give people some time to test the changes and ACK it,
> but admittedly it's a very tasty patch set and I am eager to merge
> it ASAP.
> 
> Shall we give people a week and then we merge it?

Yes, and since it's again some small issues, I want to send a v3
next week (presumably on Monday).

-- 
With Best Regards,
Andy Shevchenko



