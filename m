Return-Path: <linux-gpio+bounces-28636-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC7FC678BF
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 06:27:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id BB17728C68
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 05:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4817624BBFD;
	Tue, 18 Nov 2025 05:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bgl5Heoz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CB5263C8F;
	Tue, 18 Nov 2025 05:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763443656; cv=none; b=QOuCH1VcUlNGYv41iycQJsZ1BOARs68O2BE+IJfAQ861meZdRhyQ7EK1cWKRLpmhDuG+YID7bW0R28+foIO12zlasRFVseWuLqZMjpvNrar+y9fqY3igXHi87oD2nAx8jDhxf/adcWpI/9Yr0kAbwHMxX6TzooQaLQhZd/kJr5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763443656; c=relaxed/simple;
	bh=0w86AFoOhRF2HSSWOVKaO3XXQ1FgNLgY3kuDnUVezZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxhZPm5N3cQzim4dvqRkMghA0Isee/+hSwXON7gmcK/e0vcUf7p0itY1uARS0vVKg+2fVS5ZS219W0Ivazp+8UZr41W1CUVazSuxfgqPt7YxLJgg01Dxs49osJPnRkdwh6p6OU6Tz65/bUbRdNToRMl5q63ERsw+xkZVSymULd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bgl5Heoz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763443654; x=1794979654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0w86AFoOhRF2HSSWOVKaO3XXQ1FgNLgY3kuDnUVezZE=;
  b=bgl5HeozzriGvSuSLeC6CYw8TcuLsNub/3w4YUtvsSgaPPHROpY2P2tZ
   4o3zbyMeNUNKCoAmWah17y1hUeIS9TolnSVRnM30pz6Xyu4q4URUlVQUW
   cxu1q6RecrIwzkhouIMq0Fa8zDqJ7EY1UY/I/EuqqcyHONWw4JkxLUWy0
   qYm9VGgn2cGxm31QUaWfUFRjyMT7BZ2eERqcq+UL81rKo4KLnfOff+ZxJ
   lmNbFevsRR3UZMxFJG8C1ndgHd/pilLqMpFYCOPXw0RvpirBJfwzEh4Nm
   StHL8FUTwpt2SVpFvllYqUTN5ReUaT7QV7lif6Mtv1HETiB1Vean+L3Wo
   A==;
X-CSE-ConnectionGUID: /Mp37Yw7Qm+8+u++OI0s3w==
X-CSE-MsgGUID: o+a2Sp1lRPK4I/HxlrgQ9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="68060061"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="68060061"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 21:27:34 -0800
X-CSE-ConnectionGUID: iKOIaZs0RY+tR0WTaO3NgA==
X-CSE-MsgGUID: j+K8t10+SGOSjtvgLOMvlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="195577581"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 17 Nov 2025 21:27:32 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id BE24696; Tue, 18 Nov 2025 06:27:31 +0100 (CET)
Date: Tue, 18 Nov 2025 06:27:31 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/3] pinctrl: intel: Refactor
 intel_gpio_add_pin_ranges() to make it shorter
Message-ID: <20251118052731.GC2912318@black.igk.intel.com>
References: <20251117075826.3332299-1-andriy.shevchenko@linux.intel.com>
 <20251117075826.3332299-2-andriy.shevchenko@linux.intel.com>
 <20251117112702.GZ2912318@black.igk.intel.com>
 <CAHp75VcJD5RnVgcCiB3C=BjDGvui_ESBUPXZhDO3NUVcEKF+Lw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcJD5RnVgcCiB3C=BjDGvui_ESBUPXZhDO3NUVcEKF+Lw@mail.gmail.com>

On Mon, Nov 17, 2025 at 06:06:16PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 17, 2025 at 1:27 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Mon, Nov 17, 2025 at 08:56:59AM +0100, Andy Shevchenko wrote:
> 
> ...
> 
> > >       struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
> > > +     struct device *dev = pctrl->dev;
> >
> > I prefer this keeping the reverse christmas tree.
> 
> And I prefer the logical split, if possible. putting it in between the
> intel_community and intel_paggroup lines seems worse to me than the
> proposed case.
> 
> > Also it can be const.
> 
> True, and it makes things closer to what you want if I leave it on the
> same line. Do you agree with my reasoning?

As long as it keeps the reverse chrismas tree after you add const.

> 
> > >       const struct intel_community *community;
> > >       const struct intel_padgroup *grp;
> > >       int ret;
> 
> -- 
> With Best Regards,
> Andy Shevchenko

