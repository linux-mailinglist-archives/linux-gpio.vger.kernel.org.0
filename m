Return-Path: <linux-gpio+bounces-23927-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48834B1768C
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 21:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 364BEA83DF8
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 19:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5782459E5;
	Thu, 31 Jul 2025 19:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="HVBZEKp5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F59227B88;
	Thu, 31 Jul 2025 19:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753989666; cv=none; b=GUYlTndlbuz5JC7VFI9l+hF7uJWs4PV5ApLnIyXKPnX8b/di2rNetZ92EaIA6G+R7LdR32rf51Xfje0c341XFj+q6fUT57EFx/yCOopQIY8Q/F0WQXu3x9luWx5v00AGhhFyGJmHtmTVW7eo51q4aDu8uWz4bDV780ZRvcU8sJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753989666; c=relaxed/simple;
	bh=hlW84O5IXieFS3BAA6oJjGjVOZOndCaF2/MOBTy7hRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyHzvoBypYEOhZVjQo0fIdt+q+ZMVPU5y1smqjhgGiTlArZ8Q9Vz5biXKA/vPkN13bTy90yzlLfV0R99wBZxNq/IOIbnRB55Ac37RJZaWY09vQYwab8WVMyWxOLGPjjlKrH31Boa97BkirhVECGA8kNpGiZpZ6Av51Xp0g2yrAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=HVBZEKp5; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LDKoQUIZJ5jfnmQIpnLfj7b5yKy8PpiGA3COb32mcFQ=; b=HVBZEKp5s/9aVsNeTvkiNnPFbE
	OVg8M8PYEL+tXmOUZJix5a5ksf9W1BGhV9/UQxjonNBp9tykDR7NW6F1+8TMvFkSJH3Bp6ukV/5Nl
	MkiFXv1xNv2RElxmun2ggM79S2wAmeOCCHCzkfIE3tY1YecSMPyt3OFYeK9Y8CXbq5PYv4/Mi8vVU
	S6qvRNUUMdQfT2eOBA0+RTc1dFJe27H0dWjtlp042ytEtqYCdHG8sazufDpjE1WtqpqL64kuNcHrU
	xbUoK4GSWYQ4/Hjheia09/0/sMoY2h/+KlqfAM83WuJqkxNEu3f+eV4vjTlnWOVP6dwyLDpIYW8Zn
	RgiaYvCA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43254)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uhYpj-0005QI-1u;
	Thu, 31 Jul 2025 20:20:55 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uhYpg-0001HB-03;
	Thu, 31 Jul 2025 20:20:52 +0100
Date: Thu, 31 Jul 2025 20:20:51 +0100
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
Message-ID: <aIvCE4x24RigKBKF@shell.armlinux.org.uk>
References: <aIpdVejR3Jkh9Z_I@shell.armlinux.org.uk>
 <97f0e27f-3128-4821-bc09-2acde1ebf81a@kernel.org>
 <aItfC4AjjH-IdBfy@shell.armlinux.org.uk>
 <68c210a2-49b2-4fd2-97ad-27af85369d9f@sirena.org.uk>
 <aItk4vWPnFk6lYjn@shell.armlinux.org.uk>
 <4f80be02-0bbe-4c10-a3d2-324916ea2ca4@sirena.org.uk>
 <aIuSdnV8sWnUqLOq@shell.armlinux.org.uk>
 <14c68c29-68d8-4119-8f70-616c07397dc4@sirena.org.uk>
 <aIuZt3asLeiYncH1@shell.armlinux.org.uk>
 <b91dd3c5-c24e-43d1-8d06-8ec4d01f2762@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b91dd3c5-c24e-43d1-8d06-8ec4d01f2762@sirena.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Jul 31, 2025 at 06:03:43PM +0100, Mark Brown wrote:
> On Thu, Jul 31, 2025 at 05:28:39PM +0100, Russell King (Oracle) wrote:
> > On Thu, Jul 31, 2025 at 05:16:13PM +0100, Mark Brown wrote:
> 
> > > Yeah, and that's all internals which we're not super encouraged to peer
> > > at.  There should be something that'll give us a nesting level
> > > somewhere...  
> 
> > > Lockdep's handling of nesting is generally fun.
> 
> > As I said, I'm just going to disable lockdep to shut up the warning and
> > not pursue any further time on this. If someone else cares about it
> > (which I doubt) they can try to come up with a solution. I suspect
> > nested regmap-irq is extremely rare.
> 
> I'm pretty sure it's extremely rare, and I'll have to construct a
> virtual setup to actually test.  After poking at it some more I think
> we're actually going to need an explicit lock_class_key for each
> regmap-irq rather than relying on the default lockdep one.  I'll try to
> send out a patch for that today or tomorrow but likely not really tested
> - if you could find time to give it a spin on the affected system that'd
> be good, but if not no worries.  Thanks for the report and analysis.

I hope we don't have too many regmap-irq's in a system - see the
section on "Troubleshooting" in the lockdep documentation. There's
a limit on the numbe of classes over the entire kernel.

For reference, on the platform which provokes this lockdep splat,
we already have 1518 lock classes:

# grep "lock-classes" /proc/lockdep_stats
 lock-classes:                         1518 [max: 8192]

As I understand from the documentation, lock classes are create-only,
there's no way of "freeing" them later, so we better not get into a
situation where the number of classes steadily increase while the
system is running!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

