Return-Path: <linux-gpio+bounces-19921-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E19FFAB337D
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 11:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22C43189DD88
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 09:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6835D25CC7D;
	Mon, 12 May 2025 09:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9GeMh/W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716B425D1FF;
	Mon, 12 May 2025 09:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747041815; cv=none; b=CsdwJ8xB9cwLP1tKqs5Ow/vrJEpGkaYy3ZZgwOgKSWjobGwx5OXBnwJxV9n3S+mmozH1S4MKRaHexKR7fI3RMSesXd7tG98NTcFfX27fg570iHzOcx+C1vFwetZsUYoq1QKHisD/HTa3yA0yc71eI3q4ihfB9scVC4y8nxdgziE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747041815; c=relaxed/simple;
	bh=iRIh7bGLV5QX7CZNwjJOCjK00uLQGi1NX7F7ESq78Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hoVcvuSFwlhL+nNublC4oRFhGrePVh/1W7BK7TJD+ObbrUXHIQyAnb7XZCJhC/NGJI+2dAxh4G81PCkTW2mB1RFdX05nusgdEKHbpctmfTq7ythmttsv90blUXqN2BERHkdxVhwmH5ovJatGEuufESVQDAr066dKWGYJDFTLdcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k9GeMh/W; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747041814; x=1778577814;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iRIh7bGLV5QX7CZNwjJOCjK00uLQGi1NX7F7ESq78Ss=;
  b=k9GeMh/W8XJogNcpRzH+F1to9Z00gRk3C1MGbuAk8yWbNd1qikVOkmxa
   RfZ7u4oskov3lfXnsWtfchzITQKGoO3Up4cFycaFwvkgtXBPwwcnClxFk
   bUBfBAOuBviRgE9/dFnxUSVl8O0vSNIoQ+afSaxFb889fBlWHIRfAPpMM
   dDgqFbjHnJTbw/aWtuWq5iYm+oUzBD/9rh8Hg2ongG6YeKjADsQNpagJh
   R8TQBEjiRBz8xZ0ipNcSc6Y+e4HhcCcu1vSAY9sPseDegJmYLFGMWaVPc
   QS1VmKTV+/9Z2GlJooYddN6g4H014T+0NN9p6qe5fW+gCkmTKRN7F/NwP
   Q==;
X-CSE-ConnectionGUID: M2EJuw1uSKmw5sB8GObOYg==
X-CSE-MsgGUID: TxQIQ74KQditSyzah60+Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48980133"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="48980133"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 02:23:31 -0700
X-CSE-ConnectionGUID: nr9IZXarRe+txMxgDpMEtA==
X-CSE-MsgGUID: AbcdBMH4TNmX2m4faTy75Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="138281809"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 02:23:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uEPNd-00000000sHe-3ZHZ;
	Mon, 12 May 2025 12:23:25 +0300
Date: Mon, 12 May 2025 12:23:25 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Marek Vasut <marek.vasut@gmail.com>, stable@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v2] gpio: pca953x: fix IRQ storm on system wake up
Message-ID: <aCG-DZI4fexZGy2H@smile.fi.intel.com>
References: <20250509141828.57851-1-francesco@dolcini.it>
 <CAMuHMdXqRpuy8gsz+0a0xTp6VWfMD0=WWdS84jWvF31O9i4MZw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXqRpuy8gsz+0a0xTp6VWfMD0=WWdS84jWvF31O9i4MZw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 12, 2025 at 11:17:48AM +0200, Geert Uytterhoeven wrote:
> On Fri, 9 May 2025 at 16:18, Francesco Dolcini <francesco@dolcini.it> wrote:
> >
> > If an input changes state during wake-up and is used as an interrupt
> > source, the IRQ handler reads the volatile input register to clear the
> > interrupt mask and deassert the IRQ line. However, the IRQ handler is
> > triggered before access to the register is granted, causing the read
> > operation to fail.
> >
> > As a result, the IRQ handler enters a loop, repeatedly printing the
> > "failed reading register" message, until `pca953x_resume` is eventually
> > called, which restores the driver context and enables access to
> > registers.
> >
> > Fix by disabling the IRQ line before entering suspend mode, and
> > re-enabling it after the driver context is restored in `pca953x_resume`.
> >
> > An irq can be disabled with disable_irq() and still wake the system as
> > long as the irq has wake enabled, so the wake-up functionality is
> > preserved.

...

> While this does not cause the regression seen on Salvator-XS with
> the earlier approach[1], I expect this will break using a GPIO as a
> wake-up source?

Good point! Have this code been checked for that kind of scenarios?

> [1] https://lore.kernel.org/linux-gpio/CAMuHMdVnKX23yi7ir1LVxfXAMeeWMFzM+cdgSSTNjpn1OnC2xw@mail.gmail.com

-- 
With Best Regards,
Andy Shevchenko



