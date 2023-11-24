Return-Path: <linux-gpio+bounces-482-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 323187F72C1
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 12:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E23872818B1
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 11:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5B51DDD6;
	Fri, 24 Nov 2023 11:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 473B710DB;
	Fri, 24 Nov 2023 03:31:35 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="395225662"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="395225662"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 03:31:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="771235102"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="771235102"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 03:31:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1r6UPB-0000000GhXG-1NjR;
	Fri, 24 Nov 2023 13:31:29 +0200
Date: Fri, 24 Nov 2023 13:31:29 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tzuyi Chang <tychang@realtek.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] Add GPIO support for Realtek DHC(Digital Home
 Center) RTD SoCs.
Message-ID: <ZWCJkddstjpXTtQx@smile.fi.intel.com>
References: <20231116111441.2339-1-tychang@realtek.com>
 <20231116111441.2339-3-tychang@realtek.com>
 <CACRpkdZTFWnH1iwLCeJy02OXJAgTSSVTomzDNEQ3ebWocwkgPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZTFWnH1iwLCeJy02OXJAgTSSVTomzDNEQ3ebWocwkgPA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 24, 2023 at 10:38:42AM +0100, Linus Walleij wrote:
> On Thu, Nov 16, 2023 at 12:14 PM Tzuyi Chang <tychang@realtek.com> wrote:
> 
> > This driver enables configuration of GPIO direction, GPIO values, GPIO
> > debounce settings and handles GPIO interrupts.
> >
> > Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> 
> Apart from the missing kerneldoc that the autobuilder is complaining about
> this looks good to me. If you fix the kerneldoc:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I think I might have comments in the future.
I haven't looked at the series due to noticing LKP complains.

-- 
With Best Regards,
Andy Shevchenko



