Return-Path: <linux-gpio+bounces-23923-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D44B17464
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 17:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B7E61889D3D
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 15:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1371A21CFF6;
	Thu, 31 Jul 2025 15:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="LIDPdUCT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2282576;
	Thu, 31 Jul 2025 15:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753977483; cv=none; b=rOZMCrEMiywE9238REuVsak/GxOi8ESeD8Qyd1IjGqclQe8LsbiXFwr6CsWIs4TnMMOCuYZblMpKJivQF/OmUc/+bSF7+S2swmfiUzE76NVx0WJGZFomaR+fBEvZvKbhrGPULXQ5gxp4xiZo2ZZLlk1/EANgaQtwFiD/hXgBWmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753977483; c=relaxed/simple;
	bh=NnOFvtAhasoDMaNzs29uzhKFQ/AOM0pOvWOPrPDQqTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X05Xc5dL5ee7Ikm06CvNzehjSyDAbvKBsG2cPbVasmCpY06e63hx+8uH94szKo9XVdz8Uli8kqgkrJ+xOZQlVVsdj+NlXTYv3p6BDYb8WwYRoTv848iUZ9AerPgD2pjofoVpJDc2jqAmtqEagQBgcG9FW7PvRA9Zs0C/gdZAgDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=LIDPdUCT; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7Ohqtk4ILA9GIa5jOmf23ccmCkNfdCR1xKx8go53Xfc=; b=LIDPdUCTkzfHNnYA85IoqJ5CgT
	gz2ebMInBlyGdQdfE3arPrhbS8bq7z92iR6D7LLG12btRnApeCgvOVqSREklf8EscGN7IET2sWlKK
	9BF/7y+NEFaCvDGyID8fzE8WT+bWSxBNXuQBagJfYQ/VVIQehQ0IkErhdWpZAHU3lqi3s78AOsWCY
	2CyXXihiMHIkosSaBHBkOwncH1WBcsbkg+FTcxL5Ven8D0v2Q1qpKYNWK0FOJ/ThyIIB6R4/wllPD
	kJ8Z9Jk14xeTz/XWBl5kmFzlkZuOs9WZb3SxrPL22C1YWG8KdVDtU9ZpQNCgQgV5XX4UMsKQvYO6/
	GOkN/zjQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39258)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uhVf8-0005E5-0E;
	Thu, 31 Jul 2025 16:57:46 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uhVf4-00019T-2O;
	Thu, 31 Jul 2025 16:57:42 +0100
Date: Thu, 31 Jul 2025 16:57:42 +0100
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
Message-ID: <aIuSdnV8sWnUqLOq@shell.armlinux.org.uk>
References: <aIpdVejR3Jkh9Z_I@shell.armlinux.org.uk>
 <97f0e27f-3128-4821-bc09-2acde1ebf81a@kernel.org>
 <aItfC4AjjH-IdBfy@shell.armlinux.org.uk>
 <68c210a2-49b2-4fd2-97ad-27af85369d9f@sirena.org.uk>
 <aItk4vWPnFk6lYjn@shell.armlinux.org.uk>
 <4f80be02-0bbe-4c10-a3d2-324916ea2ca4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f80be02-0bbe-4c10-a3d2-324916ea2ca4@sirena.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Jul 31, 2025 at 02:18:24PM +0100, Mark Brown wrote:
> On Thu, Jul 31, 2025 at 01:43:14PM +0100, Russell King (Oracle) wrote:
> > On Thu, Jul 31, 2025 at 01:31:32PM +0100, Mark Brown wrote:
> 
> > > Yes, your analysis is right here - it's not come up before because it's
> > > very rare to chain regmap-irq chips.
> 
> > Yep, I just changed all the "d" variables in regmap-irq to "ricd"
> > (first letter of the each word of the struct name), and lockdep
> > confirms that it's the mutex.
> 
> > I'm not familiar enough with lockdep to know how to fix this, so what's
> > the solution here?
> 
> I *think* mutex_lock_nested() is what we're looking for here, with the
> depth information from the irq_desc but I'm also not super familiar with
> this stuff.

I'm not sure about that, because the irq_desc locks don't nest:

        raw_spin_lock_init(&desc->lock);
        lockdep_set_class(&desc->lock, &irq_desc_lock_class);

What saves irq_desc lock nesting in this case is that
__irq_put_desc_unlock() unlocks desc->lock calling the
irq_bus_sync_unlock() method. So, I don't think we have anything at
the irq_desc level which deals with lock-nesting.

I guess I'll just ignore the lockdep warning or turn lockdep off,
one or other is probably like everyone else does.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

