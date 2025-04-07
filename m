Return-Path: <linux-gpio+bounces-18375-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEB3A7E519
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 17:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 256ED164EF8
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 15:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184BF201270;
	Mon,  7 Apr 2025 15:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LAdjKIvb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFAB200BA9;
	Mon,  7 Apr 2025 15:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040453; cv=none; b=keLyWKf8XJMNLigOPqm/SVC6smErikj9X9nUaxpjo+U1PHIW1Oq6UTfKxhwmBpsiCTPygSzdOQC+l5FR8HcG+VuieDAWHPIpz5ysag+TvQTqZDBViOerza1nsRZGJuD6Ge9v9Z5IaKmW9tRBGOOCHPfArso9AP+bDc0WFws0aL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040453; c=relaxed/simple;
	bh=YV6q4DU/TzjXug7xwkUcpIGhmfVKBbrnpQR1f68Rq2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVTO/y3GmMYaV05U5rAS3KZeMF8PBwukiN3IOE1eIiaGy/DL3kXqmR/M9SWevX3ddxPa2Djw3tbjLxb+YxfRgBL+it7LpdDVz3QSDdcmdwkE05pvbv4BZLRTzAYsIVpcnMEVizhs+zMdBwkfP6WeqtRPkPgF/O4Br35SftPJzjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LAdjKIvb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744040452; x=1775576452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=YV6q4DU/TzjXug7xwkUcpIGhmfVKBbrnpQR1f68Rq2U=;
  b=LAdjKIvbYpmSmoiP3+PM1UcJK39/MUyz8BB3wGsJ5Upg9vxjsEHdWFbm
   evpyj4acHyZu5KqERuPLXWNgjiTY8ZSoRenQK3+2NTPOn2qhfaExvqlgp
   dC0b/md0wHFlotu8DJf3rY6Ym+Ti+IR7FI7EgnaMJ3iCrHuye2/FDbZv0
   +ADkjJyO5A5Oj71yGHu2yH49Q5smqlUCtf7l1HynqupqVIOdKvlD2Ya4m
   NeMBQfR8o+hRind8LoRdfylY4FbrWaojU83+CZtJxvc4oG1Jwg2sJQgct
   EeCYZGvWF/JwSewzt58Fnd7VWvhH2VDRmj94yPMN68zLgffXGr6pbNXKU
   g==;
X-CSE-ConnectionGUID: BxqUjtbXT/OfKu4sCvwBvQ==
X-CSE-MsgGUID: KRv/ZGQuTCSzspz3qvurlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45603380"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45603380"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:40:51 -0700
X-CSE-ConnectionGUID: lAjlpR38SVmSojvCK9H2Pw==
X-CSE-MsgGUID: Q3qlp6hHR6aZBR6VAO0MDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="132715896"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:40:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1u1oab-0000000A73r-3sQr;
	Mon, 07 Apr 2025 18:40:45 +0300
Date: Mon, 7 Apr 2025 18:40:45 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Marek Vasut <marek.vasut@gmail.com>, stable@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] gpio: pca953x: fix IRQ storm on system wake up
Message-ID: <Z_Px_ajf96J_LlcD@smile.fi.intel.com>
References: <20250326173838.4617-1-francesco@dolcini.it>
 <174368202234.27533.1000100252310062471.b4-ty@linaro.org>
 <Z-6TGnGUEd4JkANQ@black.fi.intel.com>
 <CAMRc=Me15MyNJiU9E-E2R9yHZ4XaS=zAuETvzKFh8=K0B4rKPw@mail.gmail.com>
 <02cab60d-9748-4227-a4aa-33373ea0be38@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02cab60d-9748-4227-a4aa-33373ea0be38@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 05:11:14PM +0200, Emanuele Ghidoli wrote:
> On 03/04/2025 15:56, Bartosz Golaszewski wrote:
> > On Thu, Apr 3, 2025 at 3:54 PM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> >>
> >> +Cc: Geert
> >>
> >> On Thu, Apr 03, 2025 at 02:07:05PM +0200, Bartosz Golaszewski wrote:
> >>> On Wed, 26 Mar 2025 18:38:38 +0100, Francesco Dolcini wrote:
> >>
> >>>> If an input changes state during wake-up and is used as an interrupt
> >>>> source, the IRQ handler reads the volatile input register to clear the
> >>>> interrupt mask and deassert the IRQ line. However, the IRQ handler is
> >>>> triggered before access to the register is granted, causing the read
> >>>> operation to fail.
> >>>>
> >>>> As a result, the IRQ handler enters a loop, repeatedly printing the
> >>>> "failed reading register" message, until `pca953x_resume` is eventually
> >>>> called, which restores the driver context and enables access to
> >>>> registers.

[...]

> >>> Applied, thanks!
> >>
> >> Won't this regress as it happens the last time [1]?
> >>
> >> [1]: https://lore.kernel.org/linux-gpio/CAMuHMdVnKX23yi7ir1LVxfXAMeeWMFzM+cdgSSTNjpn1OnC2xw@mail.gmail.com/
> >>
> > 
> > Ah, good catch. I'm wondering what the right fix here is but don't
> > really have any ideas at the moment. Any hints are appreciated.
> > 
> > For now, I'm dropping it.
> > 
> > Bart
> 
> I’ve found another possible solution: disable the PCA953x IRQ in
> pca953x_suspend() and re-enable it in pca953x_resume().
> This would prevent the ISR from being triggered while the regmap is in
> cache-only mode.
> The wake-up capability is preserved, since an IRQ can still wake the system
> even when disabled with disable_irq(), as long as it has wake enabled.

Can you enable IRQ debugfs and dump the state of the wake* nodes for the
respective interrupts? In this case we will be 100% sure it works as expected.

> This should avoid introducing regressions and still handle Geert’s use case
> properly.
> 
> Andy, Bart, Geert - what do you think?

Sounds okay, but please double check the above.

-- 
With Best Regards,
Andy Shevchenko



