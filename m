Return-Path: <linux-gpio+bounces-36939-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELDGMoUxB2qQswIAu9opvQ
	(envelope-from <linux-gpio+bounces-36939-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 16:45:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 658E6551A3E
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 16:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E318E3013A50
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 14:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781383B775E;
	Fri, 15 May 2026 14:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="nVpYhzq2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BD03B5837
	for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 14:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778856138; cv=none; b=ktnZxQmJwwvyuuw2ukHoRjANI+I6NhBBJsV6k8XQOSatac8UX6N7lSsem8vXh6bv+Bar9WoJziksgxOIvZQOtgLRsmwHlakbyCMvp7O/BMSELHf2TBMViwrCasZL8RJAO3WLKTSi5mW+jc4dVNyp0Th3Xqd+Emk6f6gzag10CE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778856138; c=relaxed/simple;
	bh=LZeBCl2ciYkr6Byb2/1HqNidFlfZdsC9qLxWJVky7I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9jPY5bepaDoyQb9/Js/6Zi2hZCD1cQ0UB9VFL7EGVrcv3XJmD3DtKBUlVc9s8SigS6gVtH2+6XDOk5pwY7yTOOPzDReqZRn/3qgWOIWnqKaQhSDUItBs9nIWmsmVp+HBtdW0yQMF6CWVjMpGPlLReyqIA+gygeprCyiidRa74o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=nVpYhzq2; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso80854365e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 07:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778856134; x=1779460934; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7DLL66al4CZld43bSNXSjcwgynvaL5lE06OXkqyj12I=;
        b=nVpYhzq2Y2VDrknqwRdsHreTN3pc9Q21dPAs5zgaKlsJhIbx6dDjBWDAu9liE/hmyV
         UBOV3Bk5DJFuHNzHa2evz9U5SXinI0IraYPq6xRsX2vmFGW6Ooj1/L9i1oVl3xjhwvtP
         4qgvo7GCD47Ou42SFo6GtnrGcTkm9D0GD0Zo6gJ17oCOx9mYIKCaMZxWSKq/7Jwfjt3K
         n8MerfkqD3aoriMktgDcuJR+JgKK9+JxXaHmX6KRRo1BmQuCf4XcnUDk/913xeHSAqHh
         0ulcfV/JXxTl4kObyF9HdAGGKQjRceXdavAV4Dwmv42+EpzW22nPLT4/wk3dwmPWqZAl
         u/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778856134; x=1779460934;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7DLL66al4CZld43bSNXSjcwgynvaL5lE06OXkqyj12I=;
        b=VsH18AlDaO8tO9eDyS7WhsHN2EC8iFwgRHe1AkW3+D07mEEz3W5ct08vf98l7GlZ5G
         KB3M7A8baIsp9X1mxu3WqnsUHz+BhsY3+liMlnvcOWVRTkBG3aKohrhWDMgykAeWYmkv
         TR0qXyLCF78O/aioQlqqXx6r8f5rW0D3Vtaoa/k0oeEHpPAEBI5B3H1Q31evE40w+vOe
         ibU9VciteS8Rx0rzC3XG1P3HtBfeEQVnFLT3F1vffXQunMBQgRCbYmssjhNoMlEUyqBZ
         p5mvJapK29uXMfQ0coY4mlAd8BcU8kOJeR1UwR+VSsE8SVYxg72GL9bmAUCAkmC6rYmx
         htHw==
X-Forwarded-Encrypted: i=1; AFNElJ+Jv3bUyaCRHjHtmSMHRTDuN6X8G0w5aDi8haZv+vkbFSgmbd8Z0HnXaqKYlXQK8agohLHMuLgbVz0R@vger.kernel.org
X-Gm-Message-State: AOJu0YwsG2IW4mB54VPb0MSe+kj58MUxWvVDiCdrbjo1j1NZIpyVT32z
	1MoJxCU03HNjcFP3r4Ce2flRUsk+JizYYcvBdyOtPrS28TbU8GsOUlm7BUgUjBdlSe4=
X-Gm-Gg: Acq92OHi7Ivvp/NF3xyQE5FSI3njd1C/s7WSixcFCdIJUfIKdd/lr7Wrds11q9tNhpN
	NJJ+ifrldfaixaoMHy29ZpIGxA5o2UJxzTeZwbDH6xOmyWVuAWBCBWsY2Q47xx1DacTgY6HXgUs
	9vnJ4DdaY90swDHayv9G4TrE6nBGhaewobtCoShPsemsbS3AkHk0pfhVqubzWpxmb8AZArr+R/U
	MRLq6HwnMFkP7bFkV7/8wWkAKSb/2Rl5OsfddakCYIbz6/WHz3gBnN/4qhvNdhdj/fUNgNU9ZD3
	S1xjVygFE7f1Wp3IkRc4FhfPZ7TXfaf0Wu/ns1VctTvI1StVmyEWCj56hAwCR3lcIgNODPIBfCZ
	FNygAuUqHt9/0u8rVJ0+Ku/V/ytZO7sdmxKK/Xc9P7LbhSX4sPcbrRlz6gBD9RujTwVZLqo904z
	lB9CM0sPZ9mQYDQ9Gr89A4Z9QG/XtjGHPf/opqAlKPrpPWOow31LhpHpGxLJhUObqXHxHnCnxw2
	mNFZvmp3+RLtqymmWsDroFUQGB0T+cpI8xMKLABHabJw2I6PZf2BQsVykUJp88Kl2NQuwwUOKv+
	P+3p6qV+gfWtKzFf0uY=
X-Received: by 2002:a05:600c:8485:b0:486:fa35:aef2 with SMTP id 5b1f17b1804b1-48fe5fcdec2mr67166485e9.4.1778856133590;
        Fri, 15 May 2026 07:42:13 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febf80d04sm14872875e9.36.2026.05.15.07.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 07:42:12 -0700 (PDT)
Date: Fri, 15 May 2026 15:42:09 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
	arnd@arndb.de, gregkh@linuxfoundation.org,
	mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
	alexandre.torgue@foss.st.com, ast@kernel.org,
	boon.khai.ng@altera.com, chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	hkallweit1@gmail.com, inochiama@gmail.com, john.fastabend@gmail.com,
	julianbraha@gmail.com, livelycarpet87@gmail.com,
	matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
	rohan.g.thomas@altera.com, sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com,
	wens@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 12/12] arm64: dts: qcom: qcs6490-rb3gen2: enable
 TC9564 with a single QCS8081 phy
Message-ID: <agcwwRhXqKljob0m@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-13-elder@riscstar.com>
 <01d6ea18-e022-41c7-a642-ac0321957923@oss.qualcomm.com>
 <agRzai1UoHEIotZe@aspen.lan>
 <3c6e7ec5-f600-44ee-a97a-211a99102744@lunn.ch>
 <agXo_evi1oFLBJoo@aspen.lan>
 <f113752b-b351-4a14-af6d-1e2751f0913d@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f113752b-b351-4a14-af6d-1e2751f0913d@lunn.ch>
X-Rspamd-Queue-Id: 658E6551A3E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,riscstar.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-36939-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar-com.20251104.gappssmtp.com:dkim,aspen.lan:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,1c:email]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 06:14:07PM +0200, Andrew Lunn wrote:
> > I’m afraid this must be necessarily long but to help navigate the
> > general structure is:
>
> Thanks for the long email.
>
> > Let’s turn our attention to MDIO.
> >
> > Following the pattern above where all the links related to power come
> > from the main device node, then the phy node for the qca8081 in an
> > rb3gen2 would look like something like this:
> >
> >     tc956x_emac1_phy: ethernet-phy@1c {
> >         compatible = "ethernet-phy-id004d.d101";
> >         reg = <0x1c>;
> >
> >         reset-gpios = <&tc956x_emac0 1 GPIO_ACTIVE_LOW>;
> >         # On RB3gen2 all supplies are controlled by a single GPIO
> >         # so we link all supplies to that single regulator
> >         avdd-supply = <&qep_1p8>;
> >         avdd18-supply = <&qep_1p8>;
> >         vdd-supply = <&qep_1p8>;
> >         vddldo-supply = <&qep_1p8>;
> >         vdd18-supply = <&qep_1p8>;
> >         vdd125-supply = <&qep_1p8>;
> >
> >         pinctrl-names = "default";
> >         pinctrl-0 = <&qep_irq_pin>;
> >         interrupts-extended = <&tlmm 101 IRQ_TYPE_LEVEL_LOW>;
> >     };

I nearly snipped this... but I referring to *-supplies so often below
I decided it was useful to keep it!


> > Once we have established what the DT looks like then the question
> > becomes where to put "something, written in C [or Rust], that contains
> > burned in knowledge of how to turn on a wcn6855^H^H^H^H^H^H^Hqca8081"?
> >
> > The qca8081 on rb3gen2 just gets a bunch of individual regulators and a
> > reset. As in the pci-pwrctrl-tc9563 example above, this means there is
> > nothing in the DT for a pwrseq driver to bind to.
>
> I don't understand that. We have a node in device tree for the PHY. We
> can put the needed properties there somehow.  Maybe similar to how
> pinctrl works. Before probing the device, the driver core looks for
> the pinctrl- properties, and activates them. We could have similar
> properties for power sequencing, before enumerating an address, do
> whatever the pwrseq-names requests? It might need help for the driver
> actually enumerating the bus, to point to core at the node.

pinctrl properties describe the relationship between the device and the
pin controller of its host. In the case above &qep_irq_pin it leads back
to something belonging to the pin controller.

Devicetree does have power domains and these are actually pretty similar
to pinctrl. power-domains properties are used to essentially used to
describe the relationship between the device and a power domain
controller.

However in this case power domains don't really fit. There is no power
domain controller to link to. Thus I'd still expect the phy power
supplies to be modelled in devicetree as I showed above.  pwrseq, PCI
and USB all adopt this approach for modelling onboard devices in DT.


> > Even if we could find
> > a way to do that, it is not obviously useful to decouple how to turn on
> > an MDIO device from how to drive it. Thus I think the right answer to
> > that is to put the code to fire up the regulators into the qca808x.c
> > driver and it looks to me like the existing probe/remove methods would
> > already work perfectly well as the place to put it.
>
> But you have a chicken/egg. Same as with PCI, with Ethernet PHYs, you
> ask the device what it is, and then find a driver to drive it, and
> then call the probe function. However, if its clock is off, its GPIO
> reset is held in reset, its power regulators are switch off, it never
> answers when you ask it, what are you? If you have no idea what it is,
> you cannot probe it. And if you cannot probe it, the probe function
> cannot turn all these things on.
>
> The standard reply we have is, ignore the fact the device can be
> enumerated, hard code in DT what its ID is. And that is what you have
> above in your DT fragment.

My comment above about it not being useful to decouple was very much
based on this "standard reply".

The *-supply properties will differ from phy to phy so we need the DT
to know what device is in order to supply the right properties. In other
words de-coupling the parsing of those supply properties (and anything
else) does not help MDIO with the chicken/egg problem.

However perhaps I was being a little shortsighted to say there are no
benefits (below).


> But you also need to live with the
> consequences of it being wrong, since that driver is going to be
> loaded, no questions asked. And don't think about having a rev A board
> and a rev B board which have different pin compatible PHYs, and want
> to use the enumeration to get the correct driver loaded.

Typically embedded platforms "solve" this by having a bootloader
retrieve the board revision (usually from whatever non-volatile storage
it keeps the mac address) and swap a status = "okay"/status =
"disabled" pair in the DT.

This is not great (hence quoting "solve") but it must also be added
that this approach does also work when the PHY isn't pin compatible and
needs to be powered up differently.


> DT developers continually want to make use of the enumeration feature,
> since it is there, part of 802.3, it is how it was done for the first
> 20 years of networking, etc. And they keep trying to extend the
> current code to get the PHY running to allow it to be enumerated.  And
> i keep rejecting it.

Has someone already tried to "sell" you on approach somewhat similar to
the onboard_usb_dev code?

onboard_usb_dev centralizes *all* knowledge of how to turn the regulators,
clocks, resets for all soldered down USB devices that need help to be
turned on. In the case of USB then it literally examines the list of
VID/PID pairs supported by onboard_usb_dev to decide whether to create
the platform device used to lubricate things.

This still relies on the "standard reply" meaning it doesn't solve the
chicken/egg and it doesn't avoid there being something written in C (or
Rust) that knows how to turn on devices. However it does do is move
the churn associated with enabling a new USB on an embedded platform
out of the USB drivers and into a single centralized place.

With the embedded churn on one place stops "embedded crap" from creeping
through the all the drivers. I suspect is also much easier to divide
review/maintenance responsibilities.

FWIW I think the relatively simple structure of the MDIO bus means we
don't actually have to mess about with platform devices. I think one
might be able to get it down to four function calls (which could easily
be stubbed out on !CONFIG_OF systems).


> Ideally, i would like some generic core code which can be given a list
> of resources, probably phandles, and timing information. And it will
> walk the list and turn them on, inserting the requested delays. And
> then we can enumerate the device.
>
> Until such code exists, i agree, forget the device is enumerable, hard
> code the ID, and get the probe function to enable the regulators, take
> the device out of reset, enable the clocks, etc. And repeat that in
> every PHY driver.

So, having spent a bit of time thinking about it I do wonder if creating
some kind of onboard_mdio.c to collect knowledge of how to turn specific
mdio devices on might be better than putting the same knowledge
directly into probe functions.

Should generic core code (or library functons) ever arrive then having
this code centralized between phys would make adopting the generic code
code easier.

I'm not overly attached to either idea but if you'd like me to sketch
out a prototype then let me know!


Daniel.

