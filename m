Return-Path: <linux-gpio+bounces-28696-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1EEC6B4F2
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 19:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3410B4E69B4
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 18:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A71F2E1C57;
	Tue, 18 Nov 2025 18:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mUacco/C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2151B2D8791;
	Tue, 18 Nov 2025 18:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763492130; cv=none; b=gMX5Y2rOum3eHOuGlj4sppefdjT5ex6YGqN0o4CtG61tP367y4VnVQUnqUkb1ywvDLdeP8ce5FvmmtqOiz4ytiaFtY8XBRg1RwWV49jo6b0qweQiTsuIDnOPWGNnTo5tJ8oq7lsaFV5r+EURaV+4avPRDFIGzMM9lX47hfSOaf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763492130; c=relaxed/simple;
	bh=1O8m4DzAq2qQfLv4uPzP1F3rFq5YJcb948PtTbFrbiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUI5sr2TugvZJOh7Z186Buu9W5+KsT0K5uJ64eQYrLwsbr6Zw1vXGo+pJ7cOTdLwASKrfgGsPXJbY62pOHas2H/Vpl8eqWnJqmReicpCNb7QNpfbKyJycu0MdeZLyvIdwQv+7mgenbTmx/qMx+DU9OCgAayT/+zuAJ17Mzkn7o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mUacco/C; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763492128; x=1795028128;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1O8m4DzAq2qQfLv4uPzP1F3rFq5YJcb948PtTbFrbiI=;
  b=mUacco/CCGV3/2yr7JH06rqF+rpx/jcBjZV8BMV4DDQcUvn0IQIrLvl8
   3nVWaPaihfQnZFNFCTzzatYvQ7OH4G/AU8P4odF8OcwBnovw6WNcQoWtK
   fsAtPcTtgktx3YPciB77vLlETkaWjBtzwWbJZV3FJKoa989sijaMZTZLv
   BvvyXfxZp/51BfKetbKT+XPC7WsZGQPZNOUPppgbXhzz9RTHayBEjHgyt
   3cQXxsEkbUBLg5kfgQwPwuP2RXksRK6sh0gFmvvdFTllgmst3QQt1Lm/l
   7ag63uRmwaG8hCw/4FlaE1Seuu09ql5y6skDo6omfc+RgengmsTA03NG+
   w==;
X-CSE-ConnectionGUID: 1txtVZeEQMeq6MSXQZZwmA==
X-CSE-MsgGUID: sjAdcTouQ56PAhksvJzZtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76133998"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="76133998"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 10:55:27 -0800
X-CSE-ConnectionGUID: Qe/jp7EkRI2D0jE1k0Zh0A==
X-CSE-MsgGUID: 285PhKSmT/i4DcEjpdWTTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190096324"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 10:55:26 -0800
Date: Tue, 18 Nov 2025 20:55:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Levente =?iso-8859-1?B?Uul26XN6?= <levente.revesz@eilabs.com>,
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v1 1/1] Documentation: gpio: Add a compatibility and
 feature list for PCA953x
Message-ID: <aRzBGhsLA_s1rJbM@smile.fi.intel.com>
References: <20251112224924.2091880-1-andriy.shevchenko@linux.intel.com>
 <aRfWouKGA7q2ufCV@archie.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRfWouKGA7q2ufCV@archie.me>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Nov 15, 2025 at 08:25:54AM +0700, Bagas Sanjaya wrote:
> On Wed, Nov 12, 2025 at 11:48:20PM +0100, Andy Shevchenko wrote:

When answering to the long email, please remove unrelated context.
Thanks.

...

> > +I went through all the datasheets and created this note listing
> > +chip functions and register layouts.
> 
> Nit: above first-person intro can be instead edited to:
> 
> This document lists chip functions and register layouts for all chips
> supported by PCA953x driver.

I believe it's fine to leave author's original text here. Also the proposed
version is not so clear how these document was assembled.

...

> > +.. note::
> > +     This is followed by all supported chips, except by pcal6534.
> 
> Do you mean aforementioned banks offset arrangement?

Yes. The chapters are per the stuff explained in them, so everything in one
chapter or section is related to the entire chapter or section.

...

> The rest LGTM.

Thank your for looking into this.


-- 
With Best Regards,
Andy Shevchenko



