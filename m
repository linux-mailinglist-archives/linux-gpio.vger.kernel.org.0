Return-Path: <linux-gpio+bounces-33239-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGQrHWyYsmnENwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33239-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 11:41:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D0F2706BF
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 11:41:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25184303A6CB
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 10:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20CE53B8BC2;
	Thu, 12 Mar 2026 10:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GFI2XYKu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28C01FDA61;
	Thu, 12 Mar 2026 10:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773312101; cv=none; b=g+yLaY2gKiXC/MBydUmK9tV/znm0H1B333J1RwgWUbnVXRpaq0ssrs8OWezD2Dzu3/IdKAkAO/Wehy+E/BBmro64ntcJGznJVA67PbsZepvcNtgX8IH07GN08btsjNJjbw4sOFLTjRm+hNXgIa1FYtjheXo7RKS/Tm2z1JHVqTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773312101; c=relaxed/simple;
	bh=q2lTzhr65RcW7dhfxWFZWxgUukU/MnITP1xNzzmxAQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6RFdEleKk9yXA6nT62/htQQ2uoACVjOl9AiV4rjbhgIOPpy6KhB5An0JYSAXoFDotybGVXODi2WDrYOmCGg0/3OYarlNnC6jcj0/efOkPHqx5ntz90qKFb92aQCbXaOJDtG6+l1OKjsTpgvZQ0w2nVN36HC46wSHjkU1VZpmbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GFI2XYKu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773312098; x=1804848098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=q2lTzhr65RcW7dhfxWFZWxgUukU/MnITP1xNzzmxAQk=;
  b=GFI2XYKuOjGnoDd9a0+m6ZbrU1KGBfUEPoeYSEjOXYDcIwbqM+eMCLfB
   oRt5MFs/TiEfyWSvaq1g9VhZnRiimuWJdrhbenoFm14qXM7sFq0q70NMo
   fdeebM/ehp8BHyKf0sh4xOUzEgXPIMswxDL/yCmNlJfsCGpz8zovRKa4z
   w1QfK4W1UfXH94P4bIvhRXxNkoZx7S+T7SZB6wOfGT2gMoY9+OiQbo44n
   2ksFPcGh/2IsQg6syxoEyoyV4FPvEamLAXTFbi/iZjI7hV2wPTHPZq7zw
   tPG0FICE+MMjFFsu8O1VVBLEZRERYGa3GiiQIHMou63g1ePlw/OZCp1EZ
   Q==;
X-CSE-ConnectionGUID: 2Yd7BMXcRTWbbVAl252M9Q==
X-CSE-MsgGUID: dkUQGSSRRtCg/c4igd0Jog==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85485480"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="85485480"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 03:41:37 -0700
X-CSE-ConnectionGUID: rK+Vt53VTVilt6f+idwrdw==
X-CSE-MsgGUID: i8lqrHI4RNKxO8ai5lxSGA==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.112])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 03:41:35 -0700
Date: Thu, 12 Mar 2026 12:41:32 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH v3 7/7] gpio: add pinctrl based generic gpio driver
Message-ID: <abKYXJCXPpVIEVlQ@ashevche-desk.local>
References: <cover.1773150895.git.dan.carpenter@linaro.org>
 <93920f541564bc4e6aaf0f2b6df2f5aca721d452.1773150895.git.dan.carpenter@linaro.org>
 <abHR2nnC9jJWK2eW@ashevche-desk.local>
 <CAD++jLnTJidg20wUYXf+cH4hTsVhAsPwi+CcCdRL5n12kwaTmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnTJidg20wUYXf+cH4hTsVhAsPwi+CcCdRL5n12kwaTmA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,kernel.org,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-33239-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: D0D0F2706BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 11:00:02PM +0100, Linus Walleij wrote:
> On Wed, Mar 11, 2026 at 9:34 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Wed, Mar 11, 2026 at 10:39:24PM +0300, Dan Carpenter wrote:
> >
> > > The ARM SCMI pinctrl protocol allows GPIO access.  Instead of creating
> > > a new SCMI gpio driver, this driver is a generic GPIO driver that uses
> > > standard pinctrl interfaces.
> >
> > Similar wondering here... Can't this code be integrated with one of
> > the existing generic things, like gpio-aggregator?
> 
> The aggregator is very different, it takes existing GPIOs and
> creates a new GPIOchip from them.
> 
> What this does is essentially take the gpio-ranges, find the
> backing pins on the pin controller, and creates a GPIOchip
> from them.

Thanks for elaboration! But why is it done this way? It doesn't sound
like a usual (generic) problem to solve.

> I don't see anything that can be shared by the other generic
> business sadly, but I think maybe another back-end using just
> pin control can re-use this. In this case it is SCMI but any other
> firmware API just exposing pin control and no explicit GPIO
> could use this. (Not that I can think of any.)

-- 
With Best Regards,
Andy Shevchenko



