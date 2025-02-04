Return-Path: <linux-gpio+bounces-15336-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A46BA278EE
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 18:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC1CD165A99
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 17:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA0B212F9E;
	Tue,  4 Feb 2025 17:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nTlFMg3F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8795814A0B5;
	Tue,  4 Feb 2025 17:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738691293; cv=none; b=PlJ7L6qusZiqvXiVWY0wJb3iqHoBtFgssdEu7dK42KIl0GTtOX+zQsdKvQ2jB2Pd5yn37tdoB3yVRuMvutYaCtLu3Ww+ErBy2pdTIwzjUjVWEKdcVMWl6Yhzquym/0OPXewFJH0oi7X7D2f+X1goSqq3N5fDSLdO8106GiAwLv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738691293; c=relaxed/simple;
	bh=GrtYPHIRxK6ejmdmBjYfylNuez1nnTdyjrxoZB41C18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3GWLsqWxf6Uhd0RrRUpr6gLGPKmAHlaXUXFlxVUWWFFp8aUYMiGuQ5xVg+DrpYGoxzypPcKac/JvBqaEfMmp4LQ9XlJR8aFEOuHhgEj2Hkmr8PyJ11ASCpvgCxkH7g4C0b0Z1jKIVd6tzdFBGRRgA5QLkzbrLl2Q1UwSb6v8CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nTlFMg3F; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738691291; x=1770227291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GrtYPHIRxK6ejmdmBjYfylNuez1nnTdyjrxoZB41C18=;
  b=nTlFMg3FZ5v/9uMO9ofjWqn3/Gib9lvIiEhGIPqcd2eLbPt7f4GQgQYs
   sVZNY+PtUQmwH8uUmTsznExZLjDol0am7vzEFiWZkLfX8AsTLtPFEFblC
   jOKcKT2dNhM+TgQFTf3V9SO8M0LjuJFo+FnZ3ZClL9Wz7Q+hpc2a3t33R
   SfvJTWUWdOxGHClg+QR/gD1mwy/v5hcPqoyMgMLWnSga4xisuApPU7lTI
   CyrPQtarRtVxpBiAXlnWaq23CVcZYXusrj/+8vwFnuSbmhle0pq8VnRvh
   Z0hsGlSwqHvrHTUoM2CMjMBV1wAyAGHuMKvEm7fvMQzJfQl8B/wE/NAEx
   Q==;
X-CSE-ConnectionGUID: kSXgKCdJRFCkErm0mGmPaw==
X-CSE-MsgGUID: XNa+4gKUSZCABx8QwujlQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56656462"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="56656462"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:48:11 -0800
X-CSE-ConnectionGUID: gO76lXoCR02m+tI1+VeYww==
X-CSE-MsgGUID: oUrDKHvRQsmJ//eVPC7Vnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="141526712"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:48:10 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tfN1r-00000008DdG-0pqA;
	Tue, 04 Feb 2025 19:48:07 +0200
Date: Tue, 4 Feb 2025 19:48:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [PATCH v2 00/14] pinctrl: cy8c95x0: Bugfixes and cleanups
Message-ID: <Z6JS1pLWIAdIYRTv@smile.fi.intel.com>
References: <20250203131506.3318201-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdYPAa3NYDz4_ch9NG_bno8QfO7g9QTHfDB--XrDRd2NXA@mail.gmail.com>
 <Z6DToVmi7L7iR07T@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6DToVmi7L7iR07T@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 03, 2025 at 04:33:05PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 03, 2025 at 02:35:46PM +0100, Linus Walleij wrote:
> > On Mon, Feb 3, 2025 at 2:15 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > 
> > > This a set of the bugfixes and cleanups I have collected so far while
> > > testing the driver on Intel Galileo Gen 1 last year.
> > >
> > > Patches 1-2 are kinda important fixes, patch 3 is half-half, it helps
> > > a lot when debugging, patch 4 is semantically a fix, but can wait.
> > > The rest is number of refactoring and cleaning up changes.
> > 
> > I applied patches 1-4 for fixes since we are early in the rc cycle.
> 
> Hmm... But I do not see the first patch from v1 to be applied. I was under
> impression that you have it somewhere in your local trees and now it seems
> disappeared. Can you check on your side what happens?

Okay, now it's there. So far, so good.

-- 
With Best Regards,
Andy Shevchenko



