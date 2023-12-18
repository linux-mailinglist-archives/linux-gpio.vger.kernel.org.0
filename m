Return-Path: <linux-gpio+bounces-1610-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6144816C67
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 12:38:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 341D61F239B2
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 11:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CE77199C4;
	Mon, 18 Dec 2023 11:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/1WQiHA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199EA37142
	for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2023 11:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702899290; x=1734435290;
  h=resent-from:resent-date:resent-message-id:resent-to:date:
   from:to:cc:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=7PCbeZKQ77ffOTRdykmQSmr4UvoOTX24ZrkbW/VDElU=;
  b=M/1WQiHAhXZfyiQifRRctvbpo4ybxNL6v5LZIGa/GNvO/xjkbz8Vep7Q
   35Oz/dPdW18DPQ1ZGPPY8/VKOBaEhd9GXkaULBbKIkRjmF48JPSHm6+Ju
   gfDJ6i2/kkGzSqjp8am+PIPe4VcHvYX92A7Ic0Fd1HR3tSoG5vzlQjMG7
   /F93+GbTRM+/deox61yhNKzxqNMa4GG0i1uZCPLkXOFxYm0FRptfUY2GH
   /1YQHEmKxy9G01RFolSmmfhuIaxxBrBpnNAiYOPA33OgCAJ1NlcvOQpfo
   hqgPNID+XxTXI5mQ85Vg+0GcGn5cAka5ojP7ZVoQPvvXMbgEuvizEKYOA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="459817139"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="459817139"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 03:34:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="866175098"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="866175098"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 03:34:48 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1rFBtV-00000006ubz-3LIn;
	Mon, 18 Dec 2023 13:34:45 +0200
Resent-From: Andy Shevchenko <andriy.shevchenko@intel.com>
Resent-Date: Mon, 18 Dec 2023 13:34:45 +0200
Resent-Message-ID: <ZYAuVWE0lckCmI7G@smile.fi.intel.com>
Resent-To: paul@crapouillou.net, linus.walleij@linaro.org,
	bartosz.golaszewski@linaro.org, linux-gpio@vger.kernel.org
Date: Mon, 18 Dec 2023 12:41:13 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@kernel.org>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v5 03/13] pinctrl: ingenic: Use C99 initializers in
 PINCTRL_PIN_GROUP()
Message-ID: <ZYAhyWxh5sEyK1RC@smile.fi.intel.com>
References: <20231211190321.307330-1-andriy.shevchenko@linux.intel.com>
 <20231211190321.307330-4-andriy.shevchenko@linux.intel.com>
 <fb29c3bca8d245e3f7496539b7293aa4fc4bccd0.camel@crapouillou.net>
 <ZXmv81bJRMqB1GLY@smile.fi.intel.com>
 <9cbaf60cd6cf1a581e7587088f71ca7cf6b6ff37.camel@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9cbaf60cd6cf1a581e7587088f71ca7cf6b6ff37.camel@crapouillou.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Dec 17, 2023 at 03:43:24PM +0100, Paul Cercueil wrote:
> Le mercredi 13 décembre 2023 à 15:21 +0200, Andy Shevchenko a écrit :
> > On Wed, Dec 13, 2023 at 10:55:46AM +0100, Paul Cercueil wrote:
> > > Le lundi 11 décembre 2023 à 20:57 +0200, Andy Shevchenko a écrit :

...

> > > > -#define INGENIC_PIN_GROUP(name, id, func)		\
> > > > -	INGENIC_PIN_GROUP_FUNCS(name, id, (void *)(func))
> > > > +#define INGENIC_PIN_GROUP(_name_, id,
> > > > func)						\
> > > > +	{							
> > > > 			\
> > > > +		.name =
> > > > _name_,								\
> > > > +		.pins =
> > > > id##_pins,							\
> > > > +		.num_pins =
> > > > ARRAY_SIZE(id##_pins),					\
> > > > +		.data = (void
> > > > *)func,							\
> > > > +	}
> > > 
> > > This INGENIC_PIN_GROUP() macro doesn't need to be modified, does
> > > it?
> > 
> > We can go either way. I prefer to go this way as it reduces level of
> > indirections in the macros. It makes code easier to read and
> > understand.
> > But if you insist, I can drop that change in next version.
> 
> I like the patches to be minimal. But I understand your point of view
> as well.
> 
> If you have to issue a v6, maybe state the reason why you also modify
> INGENIC_PIN_GROUP() then. But I don't care enough to request a v6 just
> for that.
> 
> So:
> Acked-by: Paul Cercueil <paul@crapouillou.net>

Thank you!

But as I already noted, the series had been applied (by Linus W.)
and this does not seem to be a critical to fix, do you agree?

-- 
With Best Regards,
Andy Shevchenko



