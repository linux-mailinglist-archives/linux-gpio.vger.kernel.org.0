Return-Path: <linux-gpio+bounces-24360-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63323B249C1
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 14:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10E5F1665C2
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Aug 2025 12:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13192E2657;
	Wed, 13 Aug 2025 12:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AtzNDVBj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB78778F3E;
	Wed, 13 Aug 2025 12:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755089270; cv=none; b=YfxKEH1ohSpYmAGH8+42uea9vRxIeuWzeK+6vavhOrp4Ifjr4B5dZ/oLwuC+UOt7FsdAIX83aXuUbsHnWKTRUiObcquMejlX//UrRq7doTEv7tTB8nQJ5LxdXv4wHFLCkJruCG2kFTXve7BsuQF3DzBIfvSRh00O5IQywI4LNFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755089270; c=relaxed/simple;
	bh=dPsVq0VpMR/3HvlCxmqumTs5UZtt/X4uN6+C0RcD/Pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pVWMkl5r0SPUoIwixKRvfo74gpERO31MAMpHZyLl1psBiYudoyEZKBXw7AkFqbINjEU5oFH43eQ+GF/PH0Fy6Eum17+9OB3aQyxcHcupw8UvFrR8pXIH9pzvqvcrS/OqsIMdxEvTIB7A2dMydxxIn6dJUwffzFAcQroEB+Libus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AtzNDVBj; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755089269; x=1786625269;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dPsVq0VpMR/3HvlCxmqumTs5UZtt/X4uN6+C0RcD/Pk=;
  b=AtzNDVBjCGV5pDNTBGXzyO8xF0ZgUBYnbONO56lRv2BkYgScMYe6VfA+
   89PcXljvcSyXgVgOC4l6hvj4S/fnNtaETLsDYtDNd17jKFlkpVd4GGNxR
   L/nJzR2orjsdm3Lf8t6MZ/mPfTCCNP5dADrFAQxewvPuGh63WOoVUKugx
   xTM24KP6Ez7PlU11M+Z3tRkr4jADd/r5ezR6bsoX8/hHYVBbaFS5QTWiN
   gr2T/83f3oa5iN5rJUI3Gj/D6MhzZR/fb5ZPM8gfhCTalEZz6aONHh/My
   2tMc+4CbmeBrB/Kd4yA2geGpfUJYVLxRGqy10pk3NVIA0rJbd95bY8sQ1
   w==;
X-CSE-ConnectionGUID: /ZwfJHnUSXekwxDKwQSzaQ==
X-CSE-MsgGUID: KvUwrgqxRUqRQBY83+V1/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="67983849"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="67983849"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 05:47:48 -0700
X-CSE-ConnectionGUID: Q7t7L81FT92tTi0mGLpNJw==
X-CSE-MsgGUID: 0gYCDJ+tSAG8832oxYL6hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="190172181"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 05:47:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1umAtL-00000005RDE-0azf;
	Wed, 13 Aug 2025 15:47:43 +0300
Date: Wed, 13 Aug 2025 15:47:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@kernel.org>,
	Hans de Goede <hansg@kernel.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: gpio: add documentation about using
 software nodes
Message-ID: <aJyJbmNY_21_PMU0@smile.fi.intel.com>
References: <b52lpk2vqr4asp5iaqwcvcac3b6gen52rbu4cwy5kcnxszc3fj@6i77jr53kzje>
 <5cd1c94c-e122-45e6-8333-9eff3ae6303e@infradead.org>
 <csgmuaw2ret5qamcuwyenhw3sgb7hbso5dei7lshrz4pdga2tp@5mbv4an3q5cu>
 <b666c4ec-3aee-4917-86ed-bd65b5b7e051@infradead.org>
 <mztcugybpsp47mmw4253djjuw5bpqlrvyb57youx2jt7gqkyj3@tifd34ke76i5>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mztcugybpsp47mmw4253djjuw5bpqlrvyb57youx2jt7gqkyj3@tifd34ke76i5>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Aug 12, 2025 at 09:10:23AM -0700, Dmitry Torokhov wrote:
> On Mon, Aug 11, 2025 at 10:37:04PM -0700, Randy Dunlap wrote:
> > On 8/11/25 10:17 PM, Dmitry Torokhov wrote:
> > > On Mon, Aug 11, 2025 at 05:46:02PM -0700, Randy Dunlap wrote:
> > >> On 8/11/25 2:30 PM, Dmitry Torokhov wrote:

...

> > >> Thanks for the additional documentation.

+1, thank you for this, it's really helpful to avoid mistakes and confusion during reviews.

...

> OK, I  was trying to make html output look pretty. If we want to favor
> .rst readability that is fine, I'll drop the :c:*: annotations.

I'm with Randy on this, let's try to make the text (source reST file) less noisy.

-- 
With Best Regards,
Andy Shevchenko



