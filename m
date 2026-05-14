Return-Path: <linux-gpio+bounces-36859-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPnrITT1BWpVdwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36859-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 18:15:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E906544876
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 18:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A924C300ADAD
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 16:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A8533556D;
	Thu, 14 May 2026 16:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="MHb8489x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C703F4132;
	Thu, 14 May 2026 16:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778775313; cv=none; b=Lt6ep+PUnTp/gcDmLn2KKCW6s0SPvbXVw377QNbhqFj8BuVtif3uHVQOHKVzfW2qThlZjWwSzJDzGfiHTKIGjCVZjbykr4e9xu5uAWnDRUTTMxXZIgJJWDDfcBFRHX19jsLOnBTTMma2gpw/IXkh/8yuZAiqq3WjOhKYnVtQCnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778775313; c=relaxed/simple;
	bh=QaLPJbfJQww7S7O77K7IbSknP+7RC/p4rdgdP9IQW+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJAldRmjrycVvEo2Le90JlonF6bXVElj4mqUyIpUDf/U9sP2VHqIFxQ5vm6Fng20emk6z/ZUc5ZTOsdKhPf1LN4et/Qnu1xrZnsh2LDt+FsWhbYAsjTmubnwDnPRjoDRNFmJIiCklcexaIdXEX6cjIjEJjdGp/IYQEf+T3qZAgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=MHb8489x; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=/0vlkD0eChacF5ETVs9gmQqQ0rk59QxBVpBmKOtfWuM=; b=MH
	b8489xnA2ZxWUKc2vcNPg4J9fYfFtGzkdsdG0R2HUXd3IdFjthQWSwF9nbq0QRP0ufXfJArwfA0nB
	B3GM5alMzhJoYuJLsJqMjxhoA+Fl1XFy0QStBr/zLnR/6LqkhTy5nd/UWuARxD6XpBBnKlm05OKqh
	mMq21XRqy3xEaP8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wNYhL-002vrb-Oy; Thu, 14 May 2026 18:14:07 +0200
Date: Thu, 14 May 2026 18:14:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Thompson <daniel@riscstar.com>
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
Message-ID: <f113752b-b351-4a14-af6d-1e2751f0913d@lunn.ch>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-13-elder@riscstar.com>
 <01d6ea18-e022-41c7-a642-ac0321957923@oss.qualcomm.com>
 <agRzai1UoHEIotZe@aspen.lan>
 <3c6e7ec5-f600-44ee-a97a-211a99102744@lunn.ch>
 <agXo_evi1oFLBJoo@aspen.lan>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agXo_evi1oFLBJoo@aspen.lan>
X-Rspamd-Queue-Id: 8E906544876
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,riscstar.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-36859-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,1c:email,lunn.ch:mid,lunn.ch:dkim]
X-Rspamd-Action: no action

M> I’m afraid this must be necessarily long but to help navigate the
> general structure is:

Thanks for the long email.

> Let’s turn our attention to MDIO.
> 
> Following the pattern above where all the links related to power come
> from the main device node, then the phy node for the qca8081 in an
> rb3gen2 would look like something like this:
> 
>     tc956x_emac1_phy: ethernet-phy@1c {
>         compatible = "ethernet-phy-id004d.d101";
>         reg = <0x1c>;
> 
>         reset-gpios = <&tc956x_emac0 1 GPIO_ACTIVE_LOW>;
>         # On RB3gen2 all supplies are controlled by a single GPIO
>         # so we link all supplies to that single regulator
>         avdd-supply = <&qep_1p8>;
>         avdd18-supply = <&qep_1p8>;
>         vdd-supply = <&qep_1p8>;
>         vddldo-supply = <&qep_1p8>;
>         vdd18-supply = <&qep_1p8>;
>         vdd125-supply = <&qep_1p8>;
> 
>         pinctrl-names = "default";
>         pinctrl-0 = <&qep_irq_pin>;
>         interrupts-extended = <&tlmm 101 IRQ_TYPE_LEVEL_LOW>;
>     };
> 
> Once we have established what the DT looks like then the question
> becomes where to put "something, written in C [or Rust], that contains
> burned in knowledge of how to turn on a wcn6855^H^H^H^H^H^H^Hqca8081"?
> 
> The qca8081 on rb3gen2 just gets a bunch of individual regulators and a
> reset. As in the pci-pwrctrl-tc9563 example above, this means there is
> nothing in the DT for a pwrseq driver to bind to.

I don't understand that. We have a node in device tree for the PHY. We
can put the needed properties there somehow. Maybe similar to how
pinctrl works. Before probing the device, the driver core looks for
the pinctrl- properties, and activates them. We could have similar
properties for power sequencing, before enumerating an address, do
whatever the pwrseq-names requests? It might need help for the driver
actually enumerating the bus, to point to core at the node.

> Even if we could find
> a way to do that, it is not obviously useful to decouple how to turn on
> an MDIO device from how to drive it. Thus I think the right answer to
> that is to put the code to fire up the regulators into the qca808x.c
> driver and it looks to me like the existing probe/remove methods would
> already work perfectly well as the place to put it.

But you have a chicken/egg. Same as with PCI, with Ethernet PHYs, you
ask the device what it is, and then find a driver to drive it, and
then call the probe function. However, if its clock is off, its GPIO
reset is held in reset, its power regulators are switch off, it never
answers when you ask it, what are you? If you have no idea what it is,
you cannot probe it. And if you cannot probe it, the probe function
cannot turn all these things on.

The standard reply we have is, ignore the fact the device can be
enumerated, hard code in DT what its ID is. And that is what you have
above in your DT fragment. But you also need to live with the
consequences of it being wrong, since that driver is going to be
loaded, no questions asked. And don't think about having a rev A board
and a rev B board which have different pin compatible PHYs, and want
to use the enumeration to get the correct driver loaded.

DT developers continually want to make use of the enumeration feature,
since it is there, part of 802.3, it is how it was done for the first
20 years of networking, etc. And they keep trying to extend the
current code to get the PHY running to allow it to be enumerated.  And
i keep rejecting it.

Ideally, i would like some generic core code which can be given a list
of resources, probably phandles, and timing information. And it will
walk the list and turn them on, inserting the requested delays. And
then we can enumerate the device.

Until such code exists, i agree, forget the device is enumerable, hard
code the ID, and get the probe function to enable the regulators, take
the device out of reset, enable the clocks, etc. And repeat that in
every PHY driver.

       Andrew


