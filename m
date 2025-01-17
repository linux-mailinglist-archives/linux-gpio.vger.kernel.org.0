Return-Path: <linux-gpio+bounces-14911-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D948A1529E
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 16:17:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44DAD1890121
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 15:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1970C19CCF4;
	Fri, 17 Jan 2025 15:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kxBkmetL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11A719CC08;
	Fri, 17 Jan 2025 15:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737126912; cv=none; b=ACq2Z8Q0oSvHTzgeRcfdl6Z7F6UGRMFVINKza9oJd0hvsi/eQLuSJjSfkdvo+EhhxMm/kaCkEPE386NyhOjqDf/OslJgOA3BSCHMLPSThuO8QfjFc8QiQ2tijOomIVvyJ8ylU0N/IdPic4A+sBnVwUoZfOappIUCK75yvIimY4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737126912; c=relaxed/simple;
	bh=tYuE6+LWJ+KU8JbMTTiL+iu8GQW9wbrNplldv7CtS6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTnSEld/gnUrzn03Gq2pIJhZh9RiGZknU06ulW59FmNJdqkoMkh/hI/UyzwnUlNAfm6JJCs+gOPPGfxT9zDDn0YIZqrVwyn7CmjvwcDo8McbLdNwHWd42CZWdNaMxLtCp7/Y+vnFh7xADhSne5OCJstgF5In0gOP7kuoH88aD48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kxBkmetL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737126911; x=1768662911;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tYuE6+LWJ+KU8JbMTTiL+iu8GQW9wbrNplldv7CtS6g=;
  b=kxBkmetLuhtH0kMLispm8Pu1FR2cruAzfkSaTt/kGFjL4+1vX/mp/cN9
   3Kutb8o1xFA5CpgMgvP51GnsYSQ81o0+DMV8MqKKhAI9zF0TFZ6rLcceK
   XRTjm16hugj6xDFzU/Y5dVsGM60gWHgDUmwoWfuMuWkM4puf/jxb0imDw
   S5JZEKK3q/V7f59gBciEgEzp2oOH3W0w5228WyHcYLVM35AK6F/Z1RjWq
   FiDP2ARfP3SiUaqNEl0lQ0Wue2mwc21dDOAbkfP9yFeiM4YtOgZ3OQAeS
   uJ7+dAMr/TuNkAS+2W1TpwmyKEzrlICqOEl0RqtaRHwQTLihgbgY0CsV6
   A==;
X-CSE-ConnectionGUID: QIvnRXvtQCa9QVVHj6s6rw==
X-CSE-MsgGUID: 61XDmXwfTb+5Kna8oWRDuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="25155517"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="25155517"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 07:15:10 -0800
X-CSE-ConnectionGUID: s/7xQBf1TJ2DKMJSKpXG8A==
X-CSE-MsgGUID: L0QbOaoXSwOgxosIruzLWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="105680740"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 07:15:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tYo3u-000000026i6-2Gp6;
	Fri, 17 Jan 2025 17:15:06 +0200
Date: Fri, 17 Jan 2025 17:15:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 05/16] pinctrl: cy8c95x0: Remove incorrectly set
 fields in regmap configuration
Message-ID: <Z4pz-gmfermTjZ77@smile.fi.intel.com>
References: <20250117142304.596106-1-andriy.shevchenko@linux.intel.com>
 <20250117142304.596106-6-andriy.shevchenko@linux.intel.com>
 <CALNFmy2qGCt8OTb3qx+0PsPivbfY89gWe74Moeeu7r7hCp_UaA@mail.gmail.com>
 <Z4pzoNInabOHWjK5@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4pzoNInabOHWjK5@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jan 17, 2025 at 05:13:36PM +0200, Andy Shevchenko wrote:
> On Fri, Jan 17, 2025 at 04:01:43PM +0100, Patrick Rudolph wrote:
> > Hi Andy,
> > On Fri, Jan 17, 2025 at 3:23 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > We don't provide defaults for the regmap, we shouldn't provide
> > > the number of them either.
> > The intention is to read back the defaults from HW to initialize the
> > regmap cache.
> > The defaults are applied at each POR from the device's internal EEPROM.
> > See regcache_hw_init() for details.
> 
> Yes, I was looking a lot and that code and it doesn't work as intended.
> I can reproduce the issue, but it's real issue and I don't think we need
> to read back anything from the HW forcibly. It will be done naturally, no?

I think I now remember, it has a NULL pointer dereference.

-- 
With Best Regards,
Andy Shevchenko



