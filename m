Return-Path: <linux-gpio+bounces-23925-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4505BB174EC
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 18:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B702B1C24F4A
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 16:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B057423B63A;
	Thu, 31 Jul 2025 16:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="HK+zaTKR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BFE1DD88F;
	Thu, 31 Jul 2025 16:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753979333; cv=none; b=Xu4SZhtW2dibyepR+uqNGLA5Nhfvma3e6yb8VXE74COCHBI+JSXeL472yYfN1OCR9QE1hoqkkuJrj8VXGVxluh5StJFjMGXn5lcRmHEIXSCeakrbepquIRqdZLqDEYc+U6D68RD+8yHsLHKviVN8ivCKM7PIttC9Wigg+KKOIBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753979333; c=relaxed/simple;
	bh=EZq1onKeGbOCYgztz4cXy6ukiKrLEvoFTODQY8N+SQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTjMD+BSV2DrG5whdk2Cqhb5CoR7WNoCRVam1/jWphp8N4nIyeN8p1kzq3VQfpmByzO19GBE6fCDDuhFb4X3+kUHV21CP01nWxkAxhCiSGrYAxs+IjNkPI7Ygp1TNuYGxPK02eruuYq3RlvQkRMAme8tJ1AcFrNCQHwMkVnpS3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=HK+zaTKR; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YWwp4TE/YPh29hTFAA70aDsjbLV0IDUmerqb9zc6zYg=; b=HK+zaTKR3ZRMhUuu8sKrxTzaXg
	TNwjQ0hByJDkHtLX8JJKeUhFZPssrtEo+crCkgN3Usm7kVT+e/4j24f3fMVWxf3gIj9BOw1VnrBI0
	UYTASiUFQWgGTWPHSi+GiAPdpTGT3D1gl3tyG24sN2qoD1I68+m5PwlFlSTKtA7RxuYyWTNlCgjQZ
	5sEcQCgmD4+fRi5G/c3JK7lCMuevi0IcTAqGKVq1mt0ZMJfJm39VlmnD6oR4stteeRkRv3iKIdwG9
	VH8BYm0+fvuup7HzFTGzF/jD3tm8zNKiHpYQwaCpc2e00pyjwnbvNmansnI4QfRLQ7UHaHC66W/PJ
	2J2u4mzw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39196)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uhW94-0005G5-2G;
	Thu, 31 Jul 2025 17:28:42 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uhW92-0001Ar-0C;
	Thu, 31 Jul 2025 17:28:40 +0100
Date: Thu, 31 Jul 2025 17:28:39 +0100
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
Message-ID: <aIuZt3asLeiYncH1@shell.armlinux.org.uk>
References: <aIpdVejR3Jkh9Z_I@shell.armlinux.org.uk>
 <97f0e27f-3128-4821-bc09-2acde1ebf81a@kernel.org>
 <aItfC4AjjH-IdBfy@shell.armlinux.org.uk>
 <68c210a2-49b2-4fd2-97ad-27af85369d9f@sirena.org.uk>
 <aItk4vWPnFk6lYjn@shell.armlinux.org.uk>
 <4f80be02-0bbe-4c10-a3d2-324916ea2ca4@sirena.org.uk>
 <aIuSdnV8sWnUqLOq@shell.armlinux.org.uk>
 <14c68c29-68d8-4119-8f70-616c07397dc4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14c68c29-68d8-4119-8f70-616c07397dc4@sirena.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Jul 31, 2025 at 05:16:13PM +0100, Mark Brown wrote:
> On Thu, Jul 31, 2025 at 04:57:42PM +0100, Russell King (Oracle) wrote:
> > On Thu, Jul 31, 2025 at 02:18:24PM +0100, Mark Brown wrote:
> 
> > > I *think* mutex_lock_nested() is what we're looking for here, with the
> > > depth information from the irq_desc but I'm also not super familiar with
> > > this stuff.
> 
> > I'm not sure about that, because the irq_desc locks don't nest:
> 
> >         raw_spin_lock_init(&desc->lock);
> >         lockdep_set_class(&desc->lock, &irq_desc_lock_class);
> 
> > What saves irq_desc lock nesting in this case is that
> > __irq_put_desc_unlock() unlocks desc->lock calling the
> > irq_bus_sync_unlock() method. So, I don't think we have anything at
> > the irq_desc level which deals with lock-nesting.
> 
> Yeah, and that's all internals which we're not super encouraged to peer
> at.  There should be something that'll give us a nesting level
> somewhere...  
> 
> Lockdep's handling of nesting is generally fun.

As I said, I'm just going to disable lockdep to shut up the warning and
not pursue any further time on this. If someone else cares about it
(which I doubt) they can try to come up with a solution. I suspect
nested regmap-irq is extremely rare.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

