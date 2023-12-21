Return-Path: <linux-gpio+bounces-1786-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE91581BBF6
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 17:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D7771C25705
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Dec 2023 16:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A1E5820C;
	Thu, 21 Dec 2023 16:28:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163DC55E63;
	Thu, 21 Dec 2023 16:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="394889620"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="394889620"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 08:28:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="920377335"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="920377335"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 08:28:47 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rGLue-00000007tW2-1EUm;
	Thu, 21 Dec 2023 18:28:44 +0200
Date: Thu, 21 Dec 2023 18:28:43 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Jim Liu <jim.t90615@gmail.com>
Cc: JJLIU0@nuvoton.com, KWLIU@nuvoton.com, linus.walleij@linaro.org,
	brgl@bgdev.pl, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v9 3/3] gpio: nuvoton: Add Nuvoton NPCM sgpio driver
Message-ID: <ZYRnu8Jl56cgbWJX@smile.fi.intel.com>
References: <20231212065147.3475413-1-jim.t90615@gmail.com>
 <20231212065147.3475413-4-jim.t90615@gmail.com>
 <ZXnNRoGmeibdRAwq@smile.fi.intel.com>
 <CAKUZ0+EDdBnPdY828L3DUTHKyXX209cJEuFWBs7xff_6bbDWPg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKUZ0+EDdBnPdY828L3DUTHKyXX209cJEuFWBs7xff_6bbDWPg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Dec 21, 2023 at 02:27:13PM +0800, Jim Liu wrote:

...

> > > +     in_port = GPIO_BANK(gpio->nin_sgpio);
> > > +     if (GPIO_BIT(gpio->nin_sgpio) > 0)
> > > +             in_port += 1;
> >
> > This is strange... So, you are telling that offsets start from 1 and not 0?
> >
> > > +     out_port = GPIO_BANK(gpio->nout_sgpio);
> > > +     if (GPIO_BIT(gpio->nout_sgpio) > 0)
> > > +             out_port += 1;
> >
> > Ditto.
> >
> Yes,  if the customer has defined the in/out pins the offsets start from 1.

Why?

> The NPCM_IOXCFG2_PORT register is the set number of in/out ports.
> NPCM_IOXCFG2_PORT register define as below:
> 0~3 bit is the number of input ports
> 4~7 bit is the number of output ports
> Each module can support 8 input ports and 8 output ports.

Right, this doesn't answer why.

-- 
With Best Regards,
Andy Shevchenko



