Return-Path: <linux-gpio+bounces-35969-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CWaZMHnm9GmxFgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35969-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 19:44:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8DE4AE9CB
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 19:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD3C0301410C
	for <lists+linux-gpio@lfdr.de>; Fri,  1 May 2026 17:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2704A31690E;
	Fri,  1 May 2026 17:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="1RUdOWDp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3F93148B5;
	Fri,  1 May 2026 17:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777657138; cv=none; b=V6rK4Fh9tSA9lAq8lwOb5pg4qPA3jcCKUU2S1CSh9UmDFgQsVuwOBVKcRvJk81U6hGQ2ov0u4GeGHm6LL6lS1S17C6cJMvLWT6/aW/2Nbu/3o0NIff4EHKgkGj7abCnTckeuvuxFudq+YK+SbEDl1UGYgwz2tqmEfO/ysV2lMcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777657138; c=relaxed/simple;
	bh=FkLvuBwHLW9KIU/MWqsTCq6sClXi+dyujMF+dGFavFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEyfZ97z01lv+9o7s1tsyZnStvEVYu1SkYo+L5c/CDfm7co33GWk5EolOTHBQ7Q+Hhsvb4Uwgha6RqKLYoJV7qGsl/36nallS7fa9vUzZ8wrKePrKxKaFbwbho48VfuqBWexaIlvT0ZKN3JQ+Omoy5iFKz0NC4r2Al8NWcugXR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=1RUdOWDp; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=v1G+n5y3YaiJOCPRo9ZSXyCutKw19S+mOiIPygXvWbA=; b=1RUdOWDpRr1oCft025cSv8R4JM
	7JEFjRj+B2aOR33WNSyqJ0LUTLOPlRXuB27RxpQuiHsoK2UxvcHt/feQeARPBKKRd75vpeMJBL+VA
	QutEOfQtlovqoFmxTw5pLgvxcNj79Ys9Gxw2YAyJbf0T6TYLP527f884yruR48HgiUwQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wIrok-000qnU-W4; Fri, 01 May 2026 19:38:22 +0200
Date: Fri, 1 May 2026 19:38:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
	arnd@arndb.de, gregkh@linuxfoundation.org,
	Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
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
Subject: Re: [PATCH net-next 08/12] dt-bindings: net: toshiba,tc965x-dwmac:
 add TC956x Ethernet bridge
Message-ID: <1f34cbce-e2dd-4e80-b136-55d0efa50002@lunn.ch>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-9-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501155421.3329862-9-elder@riscstar.com>
X-Rspamd-Queue-Id: 2B8DE4AE9CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-35969-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_POLICY_ALLOW(0.00)[lunn.ch,none];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_ALLOW(0.00)[lunn.ch:s=20171124];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	DKIM_TRACE(0.00)[lunn.ch:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	NEURAL_HAM(-0.00)[-0.743];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email,lunn.ch:dkim,lunn.ch:mid,1c:email]

Your ASCII art of the chip might be useful here as documentation.

> +  # We can't allOf reference Ethernet-controller.yaml because we end up with
> +  # contradictory $nodename rules (`ethernet@` versus `pci@`). Happily only a
> +  # small number of the properties are useful on TC956x so we can just reference
> +  # what we need.

Why not add an subnodes for the ethernet interfaces?

> +examples:
> +  - |
> +    pcie {
> +      #address-cells = <3>;
> +      #size-cells = <2>;
> +
> +      tc956x_emac0: pci@0,0 {
> +        compatible = "pci1179,0220";
> +        reg = <0x50000 0x0 0x0 0x0 0x0>;
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        device_type = "pci";
> +        ranges;
> +
> +        gpio-controller;
> +        #gpio-cells = <2>;

I've not got to the GPIO driver patch yet...

Is the GPIO part of the ethernet device, or part of the chip? The
hierarchy here should match the hierarchy of the hardware.

> +        phy-mode = "10gbase-r";
> +        phy-handle = <&tc956x_emac0_phy>;
> +
> +        mdio {
> +          compatible = "snps,dwmac-mdio";
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          tc956x_emac0_phy: ethernet-phy@1c {
> +            compatible = "ethernet-phy-id311c.1c12";
> +            reg = <0x1c>;
> +          };
> +        };
> +      };
> +      pci@0,1 {
> +        compatible = "pci1179,0220";
> +        reg = <0x50100 0x0 0x0 0x0 0x0>;
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        device_type = "pci";
> +        ranges;
> +

You second ethernet does not have a gpio controller?

	Andrew

