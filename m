Return-Path: <linux-gpio+bounces-15966-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD592A3503C
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 22:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0E3B3AC57D
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 21:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2878A2698B0;
	Thu, 13 Feb 2025 21:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QzZvmcPQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66992698A7;
	Thu, 13 Feb 2025 21:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739480808; cv=none; b=bVCOqFaHnKMyxYRCfmh2CC5blyxRL3dG++Kvw0EvfLbbSGqyo5RfFy2kPsbaTV1+E6BhENNHRNuz1d/+3+QskdcyhOYQ1kPnoVGLnt5MmasxDCAGeuAMEqHw1X6ZSPnF688fcAlMa7GVkajm55x27XLNonipOk9+GNPqPKpdtKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739480808; c=relaxed/simple;
	bh=MqX8yGdjZfKsnWm26teUdp1QQyFQ8CTu3YhcUTzLJ90=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mxp6Qbxz1/+jhzCtFMy/gavN2mDSSU9zyrf/w5gPXG45tZYuUxTkEb+RtVPrLAelC4ME74dfb+1Ho0W++61YBkqvaPd9G8V6KJYMnU9KjesLEkCgEpj0BIYvSd/Oz3Kdjr8JXR0CAao7mPvRPRQ8LVChwxsC50scCpnss+Plo0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QzZvmcPQ; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3A13440EA;
	Thu, 13 Feb 2025 21:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739480803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/RrLWIXf4/dLUY89jPfVENxi4hWrbWl7h6YxyRzQyMU=;
	b=QzZvmcPQo9X5fDpSORzylrRO/Q/OdB0KdxtS5BPna0CDfRfeO4Wsm9Em6qEc9Lqxbas9/L
	zeYiz+NCs899b+tGYydjQWKSCLTPXgE7lRZxrWU4oFUNMAMU2yISKhhpZJLxraJuminz1T
	V80xesALUQr4mrf3Dr7DP7AuOs3JqWZZ2Jyl7Oa8QVn8gN+v+rgYk/Lbxf25pVa6cZSDxf
	NriJJQkazv/OFlIY6jtqAXL0Giz8CVrTdr8Sv4AMd9Ly4+b1aqvZqo3gbVxt9uRjFbOPms
	SMhtt+LbP6q6Hmjy9rWzmMmN4UhujAfimZnjqrjJtmtU2OyoaSY0zy1u/kQ53A==
Date: Thu, 13 Feb 2025 22:06:39 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Phil Elwell <phil@raspberrypi.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrea della Porta
 <andrea.porta@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, bhelgaas@google.com,
 brgl@bgdev.pl, Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, derek.kiernan@amd.com, devicetree@vger.kernel.org,
 dragan.cvetic@amd.com, Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, krzk+dt@kernel.org,
 kw@linux.com, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "open
 list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS"
 <linux-pci@vger.kernel.org>, "moderated list:BROADCOM BCM2711/BCM2835 ARM
 ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
 lpieralisi@kernel.org, luca.ceresoli@bootlin.com,
 manivannan.sadhasivam@linaro.org, masahiroy@kernel.org, Michael Turquette
 <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 saravanak@google.com, Stephen Boyd <sboyd@kernel.org>,
 thomas.petazzoni@bootlin.com, Stefan Wahren <wahrenst@gmx.net>, Will Deacon
 <will@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v6 00/10] Add support for RaspberryPi RP1 PCI device
 using a DT overlay
Message-ID: <20250213220639.373da07b@bootlin.com>
In-Reply-To: <CAMEGJJ0kGCj=tjM6KswbG_+ZFkzMwPY+06BXCU0qSnbBKz0=ug@mail.gmail.com>
References: <CAMEGJJ3=W8_R0xBvm8r+Q7iExZx8xPBHEWWGAT9ngpGWDSKCaQ@mail.gmail.com>
	<20250213171435.1c2ce376@bootlin.com>
	<a3c5103c-829a-4301-ba53-6ef9bd1e74e7@lunn.ch>
	<CAMEGJJ3-JXhin_Ht76EqUNAwLiNisa9PrCrdUzCgj=msGZfb5A@mail.gmail.com>
	<821d4c74-09b0-4c1b-b8ef-f8c08d0f6b5b@lunn.ch>
	<CAMEGJJ0QbzCScfTRA_pw_8A=iMYMAAFs69zFNLwcOxF5Syugpw@mail.gmail.com>
	<20250213195304.3a2df02c@bootlin.com>
	<CAMEGJJ0kGCj=tjM6KswbG_+ZFkzMwPY+06BXCU0qSnbBKz0=ug@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegjeekudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeehpdhrtghpthhtohepphhhihhlsehrrghsphgsvghrrhihphhirdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtoheprghnughrvggrrdhpohhrthgrsehsuhhsvgdrtghomhdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtoheps
 ggtmhdqkhgvrhhnvghlqdhfvggvuggsrggtkhdqlhhishhtsegsrhhorggutghomhdrtghomhdprhgtphhtthhopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhmpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

Hi Phil,

On Thu, 13 Feb 2025 20:15:06 +0000
Phil Elwell <phil@raspberrypi.com> wrote:

> Once more, with plain text, which I'd hoped the Android GMail client
> would work out for itself.
> 
> On Thu, 13 Feb 2025, 18:53 Herve Codina, <herve.codina@bootlin.com> wrote:
> >
> > Hi Phil,
> >
> > On Thu, 13 Feb 2025 17:57:37 +0000
> > Phil Elwell <phil@raspberrypi.com> wrote:
> >  
> > > On Thu, 13 Feb 2025 at 17:45, Andrew Lunn <andrew@lunn.ch> wrote:  
> > > >  
> > > > > > Or do you mean a custom board, which has a CPU, RP1 and the button and
> > > > > > fan are directly on this custom board? You then want a board DTS which
> > > > > > includes all these pieces?  
> > > > >
> > > > > That depends on whether you count the Raspberry Pi 5 as a custom board.  
> > > >
> > > > So you mean the Pi 5 board would itself make use of the resources the
> > > > RP1 device has? They are not simply connected to headers for plugin
> > > > boards, but used by the main board? Hence you want to describe them in
> > > > the board .DTS file.  
> > >
> > > That's correct. But even for plug-in devices, those which are on
> > > non-discoverable buses need overlays to declare them, which causes a
> > > problem when the overlay application happens before the kernel is
> > > started.
> > >  
> >
> > Hum, I see.
> >
> > We worked on overlay usage on non-discoverable buses wired to a connector
> > and we did a talk about issues we are facing on at Plumber [0].
> >
> > You can also find our big picture in [1] and a last contribution introducing
> > export-symbols feature in [2]. export-symbols is also under discussion on
> > some other threads.
> >
> > Also, we proposed the i2c bus extensions feature [3] whose goal is to allow
> > an addon board to add devices on an i2c bus provided by a base board and
> > wired to an connector the addon board is connected to.
> >
> > Maybe in your case, you can decouple resources (gpio, pwm) provided by the
> > addon board and used by the base board using also nexus node.
> >
> > We use a nexus node [4] (not presented at the Plumbers talk because the idea
> > came during 'out of talk' discussions in Plumbers) in order to allow our
> > addon board to use resources provided by the base board.
> >
> > In your case, if I understood, you are in the other direction but why not
> > using also a nexus node to decouple and translate resources in this other
> > direction ?
> >
> > Don't know if this idea can help but feel free to ask for some more
> > information if needed.  
> 
> Nexus nodes look interesting - I see them as adding a layer of
> abstraction such that, for example, boards can declare which of their
> specific resources performs a common function so that clients can
> treat them all the same. We do the same thing in a limited way by
> using common labels on nodes, but this goes much further.
> 
> In the case of Pi 5 and RP1, I imagine you are proposing that the Pi 5
> dtb declares the connector node and the overlay fills in the content
> with references to its GPIO controller, PWM controller etc. However, I
> think the overlay would also have to be board specific because it's
> not possible to patch part of a property from an overlay, so you'd end
> up overwriting the GPIO number as well as the controller reference.
> 
> What is needed to make this work is the ability to cope with
> unresolved references in the base dtb, to be resolved as each overlay
> is applied, with runtime checking that each reference is resolved
> before it is used, all of which sounds like a nightmare. Plus, we
> really don't want to have to change the way all our camera and display
> overlays work on all Raspberry Pis just to accommodate somebody's idea
> of how RP1 should be handled.

Just to be clear, my comments were not there to tell you how RP1 should
work. I just proposed ideas without trying to force anything and I can
fully understand that ideas proposed don't feed your needs.

Sorry if my approach was misunderstood.

Best regards,
Hervé

