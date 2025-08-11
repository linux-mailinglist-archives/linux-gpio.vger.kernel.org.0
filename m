Return-Path: <linux-gpio+bounces-24214-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 356F1B2163C
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 22:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 933321A2433E
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 20:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79792D9EEA;
	Mon, 11 Aug 2025 20:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1Z02SCr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD711FAC34;
	Mon, 11 Aug 2025 20:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754943004; cv=none; b=BOHhkU0TuU9yUVgR4bcf+80aX6FdKh6M9YvcCEsMbQgX1M0W/+hHiCY8737qgnv7bZHcNnGKRxsde9e0u9L3Ln0L5n0IKS/E3ySFjsEzKHFRynL+E7d5Jp7vi4Pv0DLZlY+2YsnEhL3ScAS8HGizMUV5Chs7KR6qK0+Z5xrM2mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754943004; c=relaxed/simple;
	bh=JFuwCjEA2XffvzEG1pozhniBvW9lRwHxQYEK7PJwjTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mfwtvJs6rwTgCcX+MN8+jHPCYQ+FDV4cRVWuVpj+SBp3Bh6qWTrezTa85c1AsrNp7b7AONox2au3236Egci7Q2hRO/VXHbWLluL2PKHCXSgRmqi3m2TkJS/pgLYiGEJe2MrtrKG2MGIAf7cS3bvUwSgu91Z0kytgylAR0aMybig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n1Z02SCr; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754943003; x=1786479003;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JFuwCjEA2XffvzEG1pozhniBvW9lRwHxQYEK7PJwjTM=;
  b=n1Z02SCrtwKiVVYPO00SJZSaiBUnMCvafAXh0Wm4TJbyooZ04s8+i9UF
   YiRKmwe7bD5ZgGDivXDvmFbeg6XvAjZv8jTO3oiEJWOnJI7GasSRCAm1n
   PitiwN4PRsem+XwJKSTgmRr9tHR4xIES8iT8+j8sDTqu9uYb3MzaVkJXu
   tez+BpMCqR4UXbit7UqASSapBDYMH382wRwm8rt81/Mw0ITjkBK7CKCR0
   4XDrzqasD3+AMb50djRa7LYHyP//iUIx65b13pxrltw2yEb/RctWQFhf0
   ax4dDYHC6P2q4duBI2sTUi1B/qgIMznpngnXjSLMUYlfA0u/XaiVC7fDw
   w==;
X-CSE-ConnectionGUID: PrcwZCAKSvaSzpHJC9IadA==
X-CSE-MsgGUID: XbUnO7JxSVy/27liiE9SYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56233448"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="56233448"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 13:10:02 -0700
X-CSE-ConnectionGUID: RK1gevKTSDGiU2DE77ZMfg==
X-CSE-MsgGUID: 8cDgNFJVThq1RLGhgEg5wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="165629458"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 13:09:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ulYqA-000000056Uk-3HZa;
	Mon, 11 Aug 2025 23:09:54 +0300
Date: Mon, 11 Aug 2025 23:09:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/21] input: gpio-keys: make legacy gpiolib optional
Message-ID: <aJpOEq_5jqGTUr4x@smile.fi.intel.com>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-10-arnd@kernel.org>
 <b7e97aa3-8f2d-4a59-8a38-577717404865@gmail.com>
 <aJnng9z9pUTFI49x@smile.fi.intel.com>
 <mrqxggv7vhclnranoc3uacfyzccod6dmc54kip4f7wjdpngjzz@falnsjwnfcjc>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mrqxggv7vhclnranoc3uacfyzccod6dmc54kip4f7wjdpngjzz@falnsjwnfcjc>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 11, 2025 at 12:21:51PM -0700, Dmitry Torokhov wrote:
> On Mon, Aug 11, 2025 at 03:52:19PM +0300, Andy Shevchenko wrote:
> > On Mon, Aug 11, 2025 at 01:34:43PM +0300, Matti Vaittinen wrote:
> > > On 08/08/2025 18:17, Arnd Bergmann wrote:

...

> > > As such, this patch seems Ok to me, you can treat this as an ack :) This,
> > > however made me ponder following - is this the tight way to handle the
> > > power-button IRQ? I don't see any other MFD devices doing this in same way,
> > > although I am pretty sure there are other PMICs with similar power-button
> > > IRQ...
> > > 
> > > I see for example the "drivers/mfd/rt5120.c" to invoke
> > > "drivers/input/misc/rt5120-pwrkey.c" instead of using the gpio-keys. This,
> > > however, feels like code duplication to me. I'd rather kept using the
> > > gpio-keys, but seeing:
> > > 
> > > git grep KEY_POWER drivers/mfd/
> > > drivers/mfd/rohm-bd71828.c:     .code = KEY_POWER,
> > > drivers/mfd/rohm-bd718x7.c:     .code = KEY_POWER,
> > > 
> > > makes me wonder if there is more widely used (better) way?
> > 
> > FWIW, on Intel platforms that use power button by PMIC we add a special driver
> > for each of such cases.
> 
> If we can make gpio-keys work for various power buttons that would be
> great IMO. The MFD drivers in question already are using device tree,
> but they do not define/expect nodes for the power buttons. If the nodes
> were there then I think gpio-keys would work out of the box?

Looking at the, e.g., https://elixir.bootlin.com/linux/v6.16/source/drivers/platform/x86/intel/mrfld_pwrbtn.c,
I am not sure it's as simply as it sounds. Basically it's an IRQ, which
requires IRQ handling and proper acking/masking/etc.

-- 
With Best Regards,
Andy Shevchenko



