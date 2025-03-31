Return-Path: <linux-gpio+bounces-18110-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3619FA75FDD
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 09:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88C403A8CC6
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 07:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E290189F5C;
	Mon, 31 Mar 2025 07:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WP0yXhFk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C8EF9CB;
	Mon, 31 Mar 2025 07:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743405561; cv=none; b=V+eHDpSzzlxSNXvohKTSHjE3RXjpIm78T5JuzkYSMFS/VJIiKpws3VzNpB9WblsXpTdEXBVo1xdmCIkp93T6Yv5Tbr2Fys0lWVoisLfUOUuqJ71BkH5nvEu+4Vt/ATLXSFWE5it+xVNFSwDXA/m/GqQ82bJxfqoFZAnczRaHfTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743405561; c=relaxed/simple;
	bh=7YYwu/iFhApVfDi4f6XpUCJpwOl04lSljLQoy/EIDTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TJ5/vW/VvCR4uURP1srMmJue0wQfK+tNhJJMLEHXiK4WGgR+UN0e+qEBjItjN98oHFRW63sblg79BaQTCScmp8Gc2l5urghsKVAjAfVRpLG1kBSgi2awmM1Ajp6bDA74cq8Ej3Db4ObpFbnDLrwa7LfArNlEU2Qbu4JqOGZDsyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WP0yXhFk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743405560; x=1774941560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7YYwu/iFhApVfDi4f6XpUCJpwOl04lSljLQoy/EIDTo=;
  b=WP0yXhFk0y4aqpTfvhCcCIBd+9V/WjF/alAYoMKCn4j/GyWin9dCwzEY
   7PczHQRHrlILPjMb7HdIL2Q9z8kZk9ARhwNEIhPzwvOefYxnQS5jaSINs
   w/GtWNcK9D2ac65p7cw4VMvTAshy/8HjBpwu3n5H2u4U0du4NvSsMMHYd
   45Hmwm81hlLxB9qjqpP2WqPqs4CEu6ohB3qxCDW3CWykISIJRKMyEAOOw
   xy9Krx406IOT3+HjjQdvdM5zb1wxdrq07eIgUMefqOv9HcP4eNK6w+jJf
   1i6PbkfGFTYDl7lbGbc1x3MAAKsUq9bG9tH3mDUqJA78+WzLh4qiPMm9e
   w==;
X-CSE-ConnectionGUID: 5P2kEb2uRZO4dgvsXESbBg==
X-CSE-MsgGUID: ihuIwl0LQ/ubDZY8ymEZLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="48346603"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="48346603"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 00:19:19 -0700
X-CSE-ConnectionGUID: kbhe+3ouRbCNDBXrEHtUPg==
X-CSE-MsgGUID: Sluib5vgQoOK6cErw6CTUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="156939952"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 00:19:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1tz9QO-00000007aa1-3RJs;
	Mon, 31 Mar 2025 10:19:12 +0300
Date: Mon, 31 Mar 2025 10:19:12 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Peng Fan <peng.fan@nxp.com>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)" <linux-gpio@vger.kernel.org>,
	krzk@kernel.org
Subject: Re: [PATCH]  ASoC: codec: ak5386: Convert to GPIO descriptors
Message-ID: <Z-pB8IQTWKXze6jd@smile.fi.intel.com>
References: <20250328113918.1981069-1-peng.fan@oss.nxp.com>
 <Z-alF-gK5TpGliCj@smile.fi.intel.com>
 <20250331060359.GA6762@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331060359.GA6762@nxa18884-linux>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 31, 2025 at 02:03:59PM +0800, Peng Fan wrote:
> On Fri, Mar 28, 2025 at 03:33:11PM +0200, Andy Shevchenko wrote:
> >On Fri, Mar 28, 2025 at 07:39:17PM +0800, Peng Fan (OSS) wrote:

...

> >>  The Documentation/devicetree/bindings/sound/ak5386.txt not specify
> >>  polarity(this seems bug), so per code and datasheet, I think it
> >>  should be active-high. I could add a quirk in gpiolib-of to force
> >>  active-high or acitive-low if you think needed.
> >
> >I don't think we need a quirk as long as the default is the same,
> >I mean if the DTS is written without setting polarity, would it be
> >active-high or active-low?
> 
> Per current gpio driver, of_gpio_n_cells should at least be 2,
> Not find any driver using 1 in current linux tree.

Yes...

> Without polarity, I think of_xlate will not work as expected.

...and yes, but how is it related to my comment? The default should be sane
to make it work, since there is no in-kernel user with wrong polarity there
is nothing to fix.

-- 
With Best Regards,
Andy Shevchenko



