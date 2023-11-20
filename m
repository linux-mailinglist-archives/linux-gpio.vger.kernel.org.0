Return-Path: <linux-gpio+bounces-259-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EB47F1375
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 13:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81A5828221A
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 12:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B150510790;
	Mon, 20 Nov 2023 12:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lBN2rZd+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99490100;
	Mon, 20 Nov 2023 04:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700483817; x=1732019817;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jrl1NcKeDGclI6yuHqty3MsTSpEiHxqZFGSov5T9IeQ=;
  b=lBN2rZd+1wHud6AbLp6cW0ldpY+tP774NPpWLyOuvZO7mIf/3HbaQxq5
   oFuZoOonawBPFnlArhSZmw7mBsKuiJoabz8rlD+ImIyNEW0GNNiwE2LPn
   IlIdX5gxvFhqFczVTfNo9zjjQbIRajC4SNJ55fAvPaOX0KnO9WJcR/OyY
   BDQ+NyJkPzv8FmQc7wy9Q5pmPnIGdLCPGisIdoJ+MFICAwgyR0htxdheP
   aBpxQU7zhawyfONxSJCbvVSpBtorKTrGzrpscRoitXge0k1HpvHm++k5I
   jl3l2x9DGjXH1vc6/PBdGihw/gqWu3p81V9LH5g6UVMPEImcUoCz9zNj1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="381998625"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="381998625"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 04:36:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="716193513"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="716193513"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 04:36:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r53WE-0000000FY0A-2TPQ;
	Mon, 20 Nov 2023 14:36:50 +0200
Date: Mon, 20 Nov 2023 14:36:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Pavel Machek <pavel@ucw.cz>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Lee Jones <lee@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH V2 1/2] leds: gpio: Add kernel log if
 devm_fwnode_gpiod_get fails
Message-ID: <ZVtS4phUMmDD9ztz@smile.fi.intel.com>
References: <20231118124252.14838-1-wahrenst@gmx.net>
 <20231118124252.14838-2-wahrenst@gmx.net>
 <ZVtHZWYl2skpn1Bg@smile.fi.intel.com>
 <9a9486bb-e737-4384-a581-76880b709758@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a9486bb-e737-4384-a581-76880b709758@gmx.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 20, 2023 at 01:02:55PM +0100, Stefan Wahren wrote:
> Am 20.11.23 um 12:47 schrieb Andy Shevchenko:
> > On Sat, Nov 18, 2023 at 01:42:51PM +0100, Stefan Wahren wrote:
> > > In case leds-gpio fails to get the GPIO from the DT (e.g. the GPIO is
> > > already requested) the driver doesn't provide any helpful error log:
> > > 
> > >      leds-gpio: probe of leds failed with error -16
> > > 
> > > So add a new error log in case devm_fwnode_gpiod_get() fails.

...

> > >   		led.gpiod = devm_fwnode_gpiod_get(dev, child, NULL, GPIOD_ASIS,
> > >   						  NULL);
> > >   		if (IS_ERR(led.gpiod)) {
> > > +			dev_err_probe(dev, PTR_ERR(led.gpiod), "Failed to get gpio '%pfw'\n",
> > > +				      child);
> > >   			fwnode_handle_put(child);
> > >   			return ERR_CAST(led.gpiod);
> > >   		}
> > Thinking more about it. GPIO library already issues bunch of messages.
> > 
> > 	"using DT ... for ... GPIO lookup"
> > 	"using lookup tables for GPIO lookup"
> > 	"No GPIO consumer ... found"
> are these errors or debug messages?

Indeed they are on debug level.

> I cannot remember that i saw any of them on info level in my case of an
> already allocated pin (see patch 2).
> 
> I'm open to place the log within gpiolib, if this a better place.

I'm not sure, let's hear GPIO maintainers for that.

> > Isn't it enough?

-- 
With Best Regards,
Andy Shevchenko



