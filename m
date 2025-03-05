Return-Path: <linux-gpio+bounces-17102-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 802CAA4FCB1
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 11:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EA1F172193
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 10:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0AEC219306;
	Wed,  5 Mar 2025 10:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WGIN5YK+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5881FBEA6;
	Wed,  5 Mar 2025 10:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741171645; cv=none; b=A0wjVK01/XVgfwOi3YWurpzKhD19pe1rZXXE618eWTHzj1tT/ca5q0G0jaWK+daPPiGQYYHgsh2chRChdXadZksbz2z+iJWDXwLaKx3KB6NV7WDQOmF9cNacEka1UVYMVHrf0lVpzlJyqdDszBUPOSV/TEc1FqrtxJLqpthw978=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741171645; c=relaxed/simple;
	bh=UWZD1uJYcxYoUdXpa+LU3Lmk9/jwAXhWGiSry/q8qSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWf91hR5e9Nt1nYclXphDvz2S/TKRqNC8MOl6zDTUlju7Z+c3j2REhoeaM5HPAdsswtY+Ao2pdGdRLMcO3vA3xsW2NoDVuIISTYOixRFc9SXPm0hrwZwP+zgYhAU+QvWdc6BJrrCFgglR5yHEDX36hAEnyE2Tzep6oc4zUAmqp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WGIN5YK+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741171643; x=1772707643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UWZD1uJYcxYoUdXpa+LU3Lmk9/jwAXhWGiSry/q8qSw=;
  b=WGIN5YK+71oXoHVe02TEsrtuvjYaO4VP/KkZs7RcApmeBZWgDcqBrOmq
   I5odh6aLGLrDyVWzZ1utocTQtlZ8H9QCLgjN6Z+APjUP2+i1GqVlhPSpE
   JFBk20bYemxOXdOUn5xxoLsxhGFU6c2+yq2qXDOHLsMbtkA3CE79nGfFd
   pW4XEsIOEK7030jey1LEoSfIN4GrJjh5S1NLVmt4voCd5nuOlrCilcKP7
   sic3KZWVX/HW4Cus7HwQLFT6lRb/4D46e9fw3YH70aypac1kuPm8Efwyw
   jxnAOCJFepBapti57nnvYvjM1fmr54ZJh21JIATXrcZaok25hZrtaqvMI
   w==;
X-CSE-ConnectionGUID: dL/C8xPjTaOsttHdd8NCKQ==
X-CSE-MsgGUID: a0HxiHTvR8GZFfV0z0G/5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="67496838"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="67496838"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:47:22 -0800
X-CSE-ConnectionGUID: f+GAgpAJQRKlq/MjDfgmwQ==
X-CSE-MsgGUID: le6KLnbFQ9OL5Wk3bkAIRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="118482708"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:47:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tpmHT-0000000HO5v-1wQx;
	Wed, 05 Mar 2025 12:47:15 +0200
Date: Wed, 5 Mar 2025 12:47:15 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH net-next v3 3/3] ieee802154: ca8210: Switch to using
 gpiod API
Message-ID: <Z8grs3uva8j2qrKP@smile.fi.intel.com>
References: <20250304112418.1774869-1-andriy.shevchenko@linux.intel.com>
 <20250304112418.1774869-4-andriy.shevchenko@linux.intel.com>
 <20250305-rebel-mysterious-falcon-de1f7d@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-rebel-mysterious-falcon-de1f7d@krzk-bin>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 05, 2025 at 08:04:17AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Mar 04, 2025 at 01:22:34PM +0200, Andy Shevchenko wrote:
> > This updates the driver to gpiod API, and removes yet another use of
> > of_get_named_gpio().
> > 
> > With this, invert the logic of the reset pin which is active low
> > and add a quirk for the legacy and incorrect device tree descriptions.
> > 
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  .../bindings/net/ieee802154/ca8210.txt        |  2 +-
> 
> Bindings are always separate patches.

Okay.

> Please run scripts/checkpatch.pl and fix reported warnings.
> After that,
> run also 'scripts/checkpatch.pl --strict' and (probably) fix more
> warnings. Some warnings can be ignored, especially from --strict run,
> but the code here looks like it needs a fix. Feel free to get in touch
> if the warning is not clear.

-- 
With Best Regards,
Andy Shevchenko



