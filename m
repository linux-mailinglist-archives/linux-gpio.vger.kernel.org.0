Return-Path: <linux-gpio+bounces-28803-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 224DBC7032B
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 17:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4A04D507842
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B18235B13D;
	Wed, 19 Nov 2025 16:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWnxETeB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4F3359F9D;
	Wed, 19 Nov 2025 16:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569666; cv=none; b=MZXfQIaKikx1WnPAkXJycQz+/wsnBfeKufoIK8/VgCSANLqGZC/cpYV4ExhFqQARm2YuMyxo+D6+p7el383rk8d3peyf6ihoUNgVebMsQKJzO7S/AYzJT461w/D6K41L1mouqArlnfmW3/1Vxj2sI3jmYgKrAcKgt2D7CKyrva0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569666; c=relaxed/simple;
	bh=RbuaFqbU9D6cniO/gNnWcfYENkpByHD3Voe1dJhlElY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGZdNPjKwrdZFduXj/Yvttb+Cy0M+t2oF9pikQVXDq3+zllAv2JchhQXy3ZgjS2/8JR7Pz1h/VvN2yYo9qo5IkAQoxJFVg214vTe0w9dBrXcCzHgqVoUVSBw4lAgdarrjob5UvnswNCWVsRDNaADpbZzo2/JCsX6kl624gmq/7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWnxETeB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763569664; x=1795105664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RbuaFqbU9D6cniO/gNnWcfYENkpByHD3Voe1dJhlElY=;
  b=fWnxETeBaGlp5DHDqsX9MhFHVCSTrJHmkx3zIr9UdiGNSdCGpxFfd/1l
   NO5LsB6gNnZdHT2fsriT6J6oM/kStMHs5p2/sIxK+9Idg67iCZVYeflCp
   jbpGfH6ygJsnDnFfKutOfVgPbqUK56U8mzVGrzcZj+lEPuC9L0UqddzWN
   j0lC1eRipNRoWpFailsmrdmAC8ITTUFIpAi0TQnPNPPdB9J8bnBXirclO
   mdMFeSUli6O0Jy8qrcNyn2zDMniDI1H3fKqeo2+bHneZwljpYr9CnFZ8i
   C6jjzz+2g3BA0rjY7sfTo3iyehz+1gmgufHSyjPMhYhN6qV5vhcGesFfw
   Q==;
X-CSE-ConnectionGUID: +3stmdUxTq2jwwpLDl3j/A==
X-CSE-MsgGUID: nPpTi1ERR7WUIMRPF0313Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76974666"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="76974666"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 08:27:43 -0800
X-CSE-ConnectionGUID: 9KXZKRZeRCukiU/VqRnRnA==
X-CSE-MsgGUID: wozMmkBUQuuTUolHAPVh0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="190356219"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 08:27:38 -0800
Date: Wed, 19 Nov 2025 18:27:35 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v3 01/15] gpio: dwapb: Use modern PM macros
Message-ID: <aR3v9yv2tXPiDIwn@smile.fi.intel.com>
References: <20251119144327.13345-1-jszhang@kernel.org>
 <20251119144327.13345-2-jszhang@kernel.org>
 <aR3lg0aNaoT-_7SM@smile.fi.intel.com>
 <aR3niy7_jwzQSJ33@xhacker>
 <CAHp75VcLjknMLZ60b7mUPqL2miT_x8EexQPhCFueua5vDg6uxg@mail.gmail.com>
 <aR3qqkgdqFS6dlf6@xhacker>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aR3qqkgdqFS6dlf6@xhacker>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 20, 2025 at 12:04:58AM +0800, Jisheng Zhang wrote:
> On Wed, Nov 19, 2025 at 06:11:53PM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 19, 2025 at 6:09 PM Jisheng Zhang <jszhang@kernel.org> wrote:
> > > On Wed, Nov 19, 2025 at 05:42:59PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Nov 19, 2025 at 10:43:13PM +0800, Jisheng Zhang wrote:

...

> > > > > -#ifdef CONFIG_PM_SLEEP
> > > > >     struct dwapb_context    *ctx;
> > > > > -#endif
> > > >
> > > > But why this? For the PM_SLEEP=n cases it will give an unrequested overhead.
> > >
> > > the pm_ptr() and pm_sleep_ptr() can optimize out the PM related
> > > functions, but those functions are still compiled, so if we keep the
> > > #ifdef, there will be build errors.
> > 
> > Is this an expectation or you can share the error, please?
> 
> drivers/gpio/gpio-dwapb.c: In function ‘dwapb_irq_set_wake’:
> drivers/gpio/gpio-dwapb.c:368:51: error: ‘struct dwapb_gpio_port’ h
> as no member named ‘ctx’
>   368 |         struct dwapb_context *ctx = gpio->ports[0].ctx;

Thank you!

I just answered in the other email that I will tag v4 after fixing typos
and dropping unrelated changes.


-- 
With Best Regards,
Andy Shevchenko



