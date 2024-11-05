Return-Path: <linux-gpio+bounces-12573-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6919BD589
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 20:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F7821C22B7F
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 19:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4471EB9E7;
	Tue,  5 Nov 2024 19:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fnk2HaZq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932041714B3;
	Tue,  5 Nov 2024 19:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730833240; cv=none; b=Xd+DErcZG06NSVcC70qdcp3K+ltkT3N7zw2KmOcexIv3HvbIRxVzJHvY/A5/1DFiGLuK0AJuc+Q2BvjqbIXgo7t04w1oOwdFJepkID1Q8wB/ZsDCIYqkbnno353NXoJPIXtloJVM8IBPrKd7Flxi4E3eomAIUknCxmBRe6Fk62I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730833240; c=relaxed/simple;
	bh=lRcjhnYU4YtEFKEyalImfyomLqsDnHLCiCMCDVcQex4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g93S+U9DpUsifsUqCFTQ8VzP8cI7ph55XpK8/XFe4RHvUC3SAbDLC3Tt9Hq/k0/qpaJMSnM4Pr7Eaj6rNqour4E0VuGXM2q/FbsaSI3CGEOMsHypDy4NJa205V5B0Nc5sSajXv3tb3vIZGRLqAMZtBeqfFhfrpcnRpZyAU6IHgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fnk2HaZq; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A5J06Cq076197;
	Tue, 5 Nov 2024 13:00:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730833206;
	bh=VugAso+wRQMnLwx/ZTUVnwYUxWEmtG4O0Ip8hks9/tw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fnk2HaZqvoUIwqXCNLmCWVx0vs6mdcx8EP9xqkeSy3K6KUQA3GQ9ZCRMDEOssvkrx
	 lsUHqGMKUyS3QvUoNEFkTIT7Z4JcjGlvlU0xXCvN1TI7+mwwKVn8GcMbYGSfbkBFAm
	 QZrQnXuwsjwDCg7OjW6qYxRswuGml9m0j/bRqZVs=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A5J06v1062945
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Nov 2024 13:00:06 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Nov 2024 13:00:06 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Nov 2024 13:00:06 -0600
Received: from localhost (ula0271908.dhcp.ti.com [128.247.77.198])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A5J05Ib023244;
	Tue, 5 Nov 2024 13:00:05 -0600
Date: Tue, 5 Nov 2024 13:00:05 -0600
From: Bin Liu <b-liu@ti.com>
To: Judith Mendez <jm@ti.com>
CC: Kevin Hilman <khilman@kernel.org>,
        Santosh Shilimkar
	<ssantosh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz
 Golaszewski <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND v2] gpio: omap: Add omap_gpio_disable/enable_irq
 calls
Message-ID: <20241105190005.cg6dpeedbirgflqm@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>, Judith Mendez <jm@ti.com>,
	Kevin Hilman <khilman@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241031145652.342696-1-jm@ti.com>
 <7h5xp7owmy.fsf@baylibre.com>
 <520c7e6b-f9c0-441f-8810-8e5ede668f6a@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <520c7e6b-f9c0-441f-8810-8e5ede668f6a@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Tue, Nov 05, 2024 at 12:47:58PM -0600, Judith Mendez wrote:
> Hi Kevin,
> 
> On 11/1/24 9:29 AM, Kevin Hilman wrote:
> > Hi Judith,
> > 
> > Judith Mendez <jm@ti.com> writes:
> > 
> > > From: Bin Liu <b-liu@ti.com>
> > > 
> > > Add omap_gpio_disable_irq and omap_gpio_enable_irq
> > > calls in gpio-omap.
> > > 
> > > Currently, kernel cannot disable gpio interrupts in
> > > case of a irq storm, so add omap_gpio_disable/enable_irq
> > > so that interrupts can be disabled/enabled.
> > > 
> > > Signed-off-by: Bin Liu <b-liu@ti.com>
> > > [Judith: Add commit message]
> > > Signed-off-by: Judith Mendez <jm@ti.com>
> > 
> > Thanks for this patch.  Can you give a bit more context on the
> > problem(s) this solves and on which SoCs/platforms it was
> > developed/validated?
> 
> Sorry for the late response. Patch was tested/developed on am335x
> device BBB, If you feed a PWM signal at 200KHz frequency to
> GPIO, and execute gpiomon 0 12 &, Linux will be unresponsive
> even after CTRL+C without these 2 functions in this patch. Once
> this patch is applied, you can get console back after hitting
> CTRL+C and then proceed to kill gpiomon.

In addtion to Judith's explanation, when the PWM is applied to a GPIO
pin, kernel detects the interrupt storm and disables the irq, however,
without these callbacks, this gpio platform driver doesn't really
disable the interrupt in the gpio controller, so the interrupt storm is
still happening and handled by this gpio controller driver then causes
Linux unresponsive.

-Bin.

