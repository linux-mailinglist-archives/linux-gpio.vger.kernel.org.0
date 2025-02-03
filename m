Return-Path: <linux-gpio+bounces-15286-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA22A25D6F
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 15:53:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D50FF3A382C
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 14:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72EB020F088;
	Mon,  3 Feb 2025 14:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FmXt/NsL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC69C205E23;
	Mon,  3 Feb 2025 14:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593192; cv=none; b=P4xJakt1g/gl+WKBKOQpKTVX6dX6EJXU2Ynp3V7pf2yif4xe7PCZlqM2ulfPnz+Ni+Y8Mxafflx5kWYshYU1WmfRlPn1XdcHavInPR9MHQt229LBy+PHBwxw5Tz1GIzdpQFJk3t8Uf363EK1Nwkvh0atGE2WJwcZsmBdRj6quGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593192; c=relaxed/simple;
	bh=K/LHRMmP0Mzblslf0XqZjm2hCwF1Uj1G6IU1qoGoW44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wx/ROQon72bF0JXMUnJ6+Is7wsZP8dNzgEr0T+R+Zln1O+Qc00WdrCgRgOU2U5XGmkHOGEDjUoxT+Qgw0qmDy8/ljCaZbJTlvGyXA1/3iF+BvAEsFC8lByyA6s2etAAnN39dD644GJDhHRECIab/OyqzHVK1zytesoXejWxAPC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FmXt/NsL; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738593191; x=1770129191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=K/LHRMmP0Mzblslf0XqZjm2hCwF1Uj1G6IU1qoGoW44=;
  b=FmXt/NsLvUBWvkY4IDIOJJwP8YPxILbj/H4qX7MVB72lANnXia8eud9H
   eDUJGKNLyefswTiGxPxveJPwzS4qISzEHLTDXiBgJOYDf77e9GjL5x3YU
   D9g8M9T7sCp3UTbS4rxkpsEIQ8tGq6pIQcdhwOa1gEg0Ha45JRFjmEL9t
   96AGU5+Rmk/47Q0730af/7EZIodgBnhNagxmFC9JEIQv9/YzjIDn+T84k
   fyKS/5Inobj3zqZeGkjVQ1WP7w0HRMHHLPmYSs4HsyUjIO8ZSvpsr1nBK
   XR1g6vtscMTCz2kcR+jnhJRwTEjzhBBKw49qB65RFzxmiBmOxJf/74I0e
   g==;
X-CSE-ConnectionGUID: XANK1Ys3RdWLuYB/QHE5Xw==
X-CSE-MsgGUID: cMMqsZyoQO+/1KddYtfrrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39117580"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="39117580"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 06:33:09 -0800
X-CSE-ConnectionGUID: KmrdOKy0Tbq7skZpYkqEMA==
X-CSE-MsgGUID: t5WKyPOBRTCsxGrDkcWYXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="110470313"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 06:33:08 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1texVZ-00000007rCW-36HY;
	Mon, 03 Feb 2025 16:33:05 +0200
Date: Mon, 3 Feb 2025 16:33:05 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [PATCH v2 00/14] pinctrl: cy8c95x0: Bugfixes and cleanups
Message-ID: <Z6DToVmi7L7iR07T@smile.fi.intel.com>
References: <20250203131506.3318201-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdYPAa3NYDz4_ch9NG_bno8QfO7g9QTHfDB--XrDRd2NXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYPAa3NYDz4_ch9NG_bno8QfO7g9QTHfDB--XrDRd2NXA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 03, 2025 at 02:35:46PM +0100, Linus Walleij wrote:
> On Mon, Feb 3, 2025 at 2:15 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > This a set of the bugfixes and cleanups I have collected so far while
> > testing the driver on Intel Galileo Gen 1 last year.
> >
> > Patches 1-2 are kinda important fixes, patch 3 is half-half, it helps
> > a lot when debugging, patch 4 is semantically a fix, but can wait.
> > The rest is number of refactoring and cleaning up changes.
> 
> I applied patches 1-4 for fixes since we are early in the rc cycle.

Hmm... But I do not see the first patch from v1 to be applied. I was under
impression that you have it somewhere in your local trees and now it seems
disappeared. Can you check on your side what happens?

> I will probably start devel off -rc2 or so and then I can queue the rest
> on top of that.
> 
> Thanks for fixing it all up Andy!

Thanks for taking them in!

-- 
With Best Regards,
Andy Shevchenko



