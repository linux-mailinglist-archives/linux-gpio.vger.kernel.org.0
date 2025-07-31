Return-Path: <linux-gpio+bounces-23921-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C2FB17173
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 14:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9A6C3AE5A7
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 12:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42342BDC38;
	Thu, 31 Jul 2025 12:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="u6YnpDcL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB26236A9C;
	Thu, 31 Jul 2025 12:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753965808; cv=none; b=D209gEThHJfIoKgMNS0kOI/ewe3tjHoINDsJe3PBiG9ZnWZCYFHG2qXjqode4m5PRBsNzOWSktvAfRbCYdJGdjIhZQK3sPJFv07X3J2+0cvDTqUhgnp/VtqYfWz2ycNeob0RHAQdBmHapgqTnh/kapLCB5tW5jFyyFKd/1WFnCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753965808; c=relaxed/simple;
	bh=32qRH4te/t8qUMycTIlVo9xCEh42zXSf/LVsmXf9vYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUNfrIl4t02LyrPsA/nxqxrhmU2Y4WvKFn8FdTOJIiwWnFiGOkubODhdOj2c7RkGjroghqn6oQpyY4ajbeK7Ht0CDCUXS2T33h9M2AoteAGC6Zmsh64LYteNLEeAZICACis3jLAS8U53X+n01At/TAP/lTn6TyEhS1cEbmmRhPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=u6YnpDcL; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fy4zpX2L0fsqzuWPeTvMoz0UcAax7TC11ZXxd+qlLMA=; b=u6YnpDcLuCPnDo4Nz9kR7g9t2m
	U30Ol7eGnjiTFKGJ5qS/hBH5CkulvMSmNabe5anrBf5Adp9AVB6x6PRYvGF+iaiGiLeP9v8uQueM+
	vLIZkeAtSh88dV2Ptfmj/OEsJroo1qPlKcdkxvtk1gzVm30tbLTuwpNT9MrsAgXvaoZyMQbGzKO6r
	a3utwbe3rsu4i7GDY5KqCrf/1XywGvaaDkaXJ3qMzX1WQDWZsfJtlkhJL6J1mMDGrjn0vObGMYrNY
	s5bDWyqot9d08IvIsCITNrs5UtdjGKKE3TobXMXFLb0FBwm6DB+2rwHKR1jKjAOkHtyqp8eUDBLAy
	HAdLzf3w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42934)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uhScw-0004yT-25;
	Thu, 31 Jul 2025 13:43:18 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uhScs-00012j-1b;
	Thu, 31 Jul 2025 13:43:14 +0100
Date: Thu, 31 Jul 2025 13:43:14 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [BUG] 6.16-rc7: lockdep failure with max77620-gpio/max77686-rtc
Message-ID: <aItk4vWPnFk6lYjn@shell.armlinux.org.uk>
References: <aIpdVejR3Jkh9Z_I@shell.armlinux.org.uk>
 <97f0e27f-3128-4821-bc09-2acde1ebf81a@kernel.org>
 <aItfC4AjjH-IdBfy@shell.armlinux.org.uk>
 <68c210a2-49b2-4fd2-97ad-27af85369d9f@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68c210a2-49b2-4fd2-97ad-27af85369d9f@sirena.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Jul 31, 2025 at 01:31:32PM +0100, Mark Brown wrote:
> On Thu, Jul 31, 2025 at 01:18:19PM +0100, Russell King (Oracle) wrote:
> 
> > I can't see that anything has changed in the code with regards to the
> > locking, so I think this is a bug that's been present ever since these
> > drivers were introduced, and regmap-irq is deficient in that it causes
> > the same lockdep lock class to be taken recursively when the IRQ wake
> > state changes.
> 
> > From what I can see, irq wake support for regmap-irq was added in
> > commit a43fd50dc99a5 ("regmap: Implement support for wake IRQs") and
> > this is the only operation that is propagated to the parent
> > interupt(s). Thus, the above splat is unlikely to occur unless one
> > makes use of wake support on a regmap-irq based interrupt whose
> > parent is also regmap-irq based.
> 
> Yes, your analysis is right here - it's not come up before because it's
> very rare to chain regmap-irq chips.

Yep, I just changed all the "d" variables in regmap-irq to "ricd"
(first letter of the each word of the struct name), and lockdep
confirms that it's the mutex.

I'm not familiar enough with lockdep to know how to fix this, so what's
the solution here?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

