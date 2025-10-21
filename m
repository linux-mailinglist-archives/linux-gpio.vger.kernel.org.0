Return-Path: <linux-gpio+bounces-27403-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 670E1BF73EA
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 17:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B40C4646CE
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 15:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EAA2342175;
	Tue, 21 Oct 2025 15:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iOqSZyig"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA58355033;
	Tue, 21 Oct 2025 15:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761059107; cv=none; b=TLM5gRLJeYCqrC4s6vTr1r7nMsgxqH59IfF/5MvIABEd62LM+eSp0bDII7h8WS47aSO7kwyhizNbKiJCIbJ9OjMq8McgZqa7gd2ISB4WRzaNDhlHPKWsXt5aKedlzwlq3CvMkmAq8HbmVHcnd0z/qS1m1R0TIFw4yfNqs6b5OJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761059107; c=relaxed/simple;
	bh=FaUP+ZJCRLG0XK7J7G8wDX9g9uWPgDASzWD4tjirebI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/FqyApTQpOx1jarRGaEfWc/O6yZF7lajmAaAmbDqc+xHzHHx2ke/0y8DvxHa6tqqJlGtdqRRqTX+nW4IxUTSeJnpleLz6di6EtS2ppFuWC88ckZwxSWkWIoQFnakRolMaR9kQjOKBJmc/hVLuux/YwkSNIXclPr7vCOoX8b+Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iOqSZyig; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761059106; x=1792595106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=FaUP+ZJCRLG0XK7J7G8wDX9g9uWPgDASzWD4tjirebI=;
  b=iOqSZyigBGwFTfQeiVmKbJ01pjUB4TIMFH7+/dFOmgOgG2cLvTJyOWSA
   Bq4bRSMHP3uSe9cIYOXiq2xseYMIuKXe7f1Q+wcTMvlkFrGXM/TEC0tgn
   80QbAImayn28ne/ws+nkhlbTJWt3iOfxYl5Y8NyUDsixbWEMLNPZUYAcU
   UMCFxA5n1s10vHgvhGCcjtRehnRla8YPmmkUyNK11f6Inlv5ZuGzCTIRe
   3mBmxozrrNo1wq11nhN/M4QF8unJ0KNEb6eKgRHjw6q9n8mHJ1way3Gn8
   YsvfuJI8b37psv98GM2qXUudv5FlH/6Ta1vvCVjPBLGpI+ROUHHY+o6lp
   w==;
X-CSE-ConnectionGUID: hf3arhGPS5+2OBPn5ySbpw==
X-CSE-MsgGUID: ImXOZqA7SUe7seTBIbzi0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74529333"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="74529333"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 08:05:04 -0700
X-CSE-ConnectionGUID: 5AgqhxHRTraMQY2jY6FzJQ==
X-CSE-MsgGUID: LuP6kbcrQFGthA2nK0lz+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="188723725"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.148])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 08:05:01 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vBDuz-00000001Wcu-3wOh;
	Tue, 21 Oct 2025 18:04:57 +0300
Date: Tue, 21 Oct 2025 18:04:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Cave-Ayland <mark.caveayland@nutanix.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 3/3] gpio: idio-16: Define fixed direction of the GPIO
 lines
Message-ID: <aPehGYRf9vCtzOA-@smile.fi.intel.com>
References: <20251020-fix-gpio-idio-16-regmap-v2-0-ebeb50e93c33@kernel.org>
 <20251020-fix-gpio-idio-16-regmap-v2-3-ebeb50e93c33@kernel.org>
 <CAMRc=MeFZTDk4cgzEJNnkrJOEneFUBLwtKjkpV3-cLSm=xsxNg@mail.gmail.com>
 <aPebhGETy_3MIwkf@smile.fi.intel.com>
 <CAMRc=McPP6obWpnd7Y7duJDC=NLAOE7bjFN-iytDJ524nDr9mA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McPP6obWpnd7Y7duJDC=NLAOE7bjFN-iytDJ524nDr9mA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 21, 2025 at 04:49:05PM +0200, Bartosz Golaszewski wrote:
> On Tue, Oct 21, 2025 at 4:41 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Oct 21, 2025 at 09:21:38AM -0400, Bartosz Golaszewski wrote:
> > > On Mon, 20 Oct 2025 10:51:46 +0200, William Breathitt Gray
> > > <wbg@kernel.org> said:

...

> > > > Cc: stable@vger.kernel.org # ae495810cffe: gpio: regmap: add the .fixed_direction_output configuration parameter
> >
> > > Turns out, this requires commit ae495810cffe ("gpio: regmap: add the
> > > .fixed_direction_output configuration parameter") so I cannot queue it for
> > > v6.18. What do you want me to do? Send the first two ones upstream and apply
> > > this for v6.19?
> >
> > Why can't this be pulled from some IB/IT as part of the fix?
> 
> These kinds of things should be signalled before applying the patches
> that should go to an immutable branch. I would now have to rebase the
> my for-next branch.

No objections on this one, this is unfortunate.

> Also: the commit in question brings in a new feature, not a fix.

I can argue that this is part of the fix.

-- 
With Best Regards,
Andy Shevchenko



