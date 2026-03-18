Return-Path: <linux-gpio+bounces-33768-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gB9fM4LvumkBdQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33768-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 19:31:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 791992C14B4
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 19:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BB12319F54A
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 18:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657E33C9ED4;
	Wed, 18 Mar 2026 18:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="bWaVeHqz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25345363C60;
	Wed, 18 Mar 2026 18:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773857879; cv=none; b=t39bjDFA2At4ujy/RrcRm35U+6N5wmUUD4JKwZCQvc3VhmmFycDQswk+lKb+eEDqHp+TAR/SeY/7ZywMbB76R+w4kCtmO99vaN14GTrPh+mF+D7rx02xxDzdEO/WeJB8BPmNZ2cH4FPzcTA1DWe0JNDboZ+n3bUQShVZcQCOOKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773857879; c=relaxed/simple;
	bh=e4yzMa5HuMJRcUTMrTesXNJjFSWRTNlzN6y/Dr36S/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4NSh0AOYviLgFFu/CiMVnAyp2GgcSIDkrZYOTObqVz3WWG6WLnenwQAB8i/b7M252RY/N5YvYgZrwyUpEzKiWf8VDAwKYtbX4UNtmRVdM8P+TP9H25W9a9Sodvsd5ZX0S3nM+MenA5cRmflZSxEAryb6Fl7NXC0WQs15BC7Qwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=bWaVeHqz; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+XHQ0aGtLx1tevhTAjCKKEhJVloZXEKH4qJpmcE8IDo=; b=bWaVeHqz0dK554wfgHG1/zTvhy
	epaEK6fkX7fKC8DnBvMGQXXo8PSOlBCy1VoqE9cDkiJpHHjpy4EXcfao2+OKn9pt0mJAO5C+KWPbp
	BkICYE9+Ms/wapBskvoY0wwzFlZqcoXWihPCvNqG2DLw+cv2z9SsdUM/x7cxnYmR+UO9Aqm+8zcAC
	48e4sbQXNqCKNGSyMSoHbWXDChxEsvWRlGxuhiMColJw+Sl5G/PQu74wNxTNKwCCV4mKIFna4/8G3
	g3q16XH29uJnxfHawgrulhAZp2JRFlNtHgn+wiEnDfiVM5eE2lwgRes3VDygiCOE+um3J2kaoftlS
	/h5KCb/w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58880)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w2vSn-000000003np-1Vie;
	Wed, 18 Mar 2026 18:17:49 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w2vSl-000000007II-2zvC;
	Wed, 18 Mar 2026 18:17:47 +0000
Date: Wed, 18 Mar 2026 18:17:47 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jon Hunter <jonathanh@nvidia.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mikko Perttunen <mperttunen@nvidia.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH net-next] i2c: tegra: runtime PM is not IRQ-safe
Message-ID: <abrsS1UW-q6J1rEU@shell.armlinux.org.uk>
References: <E1vsNBv-00000009nfA-27ZK@rmk-PC.armlinux.org.uk>
 <aZSZ54oZS9C1Qf1h@shell.armlinux.org.uk>
 <046c9bca-f6a5-47ce-8147-6e864b364dc3@nvidia.com>
 <15817166.RDIVbhacDa@senjougahara>
 <b7ede8c7-acc6-485a-b433-35d780d6ad1c@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7ede8c7-acc6-485a-b433-35d780d6ad1c@nvidia.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [-0.36 / 15.00];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nvidia.com,gmail.com,kernel.org,vger.kernel.org];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33768-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.397];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 791992C14B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Feb 18, 2026 at 08:30:49AM +0000, Jon Hunter wrote:
> 
> On 18/02/2026 01:35, Mikko Perttunen wrote:
> 
> ...
> 
> > > > > Yes we should always follow that rule. However, in this case, I believe
> > > > > that the build time dependency on the PINCTRL subsystem was only exposed
> > > > > by adding the 'i2c_dev->dev->pins'. Unless I am misunderstanding ...
> > > > 
> > > > Yes, it looks like it.
> > > > 
> > > > However, I wonder why the dependency has to be complicated.
> > > > 
> > > > ARCH_TEGRA in both arm64 and arm selects PINCTRL, so we can assume that
> > > > 
> > > > PINCTRL will be set for ARCH_TEGRA. So:
> > > >    config I2C_TEGRA
> > > >    	tristate "NVIDIA Tegra internal I2C controller"
> > > >    	depends on ARCH_TEGRA || (COMPILE_TEST && (ARC || ARM || ARM64 ||
> > M68K
> > > >    	|| RISCV || SUPERH || SPARC))>
> > > > +	depends on PINCTRL
> > > > 
> > > > is a shorter way of writing this, and it makes sense - pinctrl isn't
> > > > required because we're doing a compile test, it's required because
> > > > the driver itself fundamentally requires it with this change whether
> > > > or not we're doing a compile test.
> > > 
> > > Yes that's true indeed.
> > > 
> > > Mikko, do you want to take care of this?
> > 
> > My thought was it would be better to keep the PINCTRL dependency grouped with
> > COMPILE_TEST. That makes it clear it's only needed because of it -- clearer to
> > the reader that ARCH_TEGRA implies it. Kind of like not checking for NULL
> > pointers in C code when the contract is that the pointer is not NULL.
> 
> Russell's point is that regardless of the compile test, the driver has a
> dependency on pinctrl and so should always be dependent on it. The I2C
> instances for the DPAUX device on certain devices require this and will not
> work without it (before your change was added). I guess I should have added
> this dependency back with commit 718917b9875f ("i2c: tegra: Add pinctrl
> support").
> 
> > I can change it though if you'd like.
> 
> I think we should.
> 
> Thanks!

When is this bug going to be fixed? This is a regression that's
affecting Xavier systems. It's been over a month since I proposed
a patch to fix this:

BUG: sleeping function called from invalid context at kernel/locking/mutex.c:591
in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 59, name: kworker/u24:6

Please see:

https://lore.kernel.org/r/E1vsNBv-00000009nfA-27ZK@rmk-PC.armlinux.org.uk

for my original proposed fix, complete kernel messages and analysis.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

