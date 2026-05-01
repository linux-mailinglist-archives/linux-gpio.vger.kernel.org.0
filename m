Return-Path: <linux-gpio+bounces-35973-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMzHDqv59GnmGgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35973-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 21:06:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E224AF094
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 21:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80162301779B
	for <lists+linux-gpio@lfdr.de>; Fri,  1 May 2026 19:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7210439B482;
	Fri,  1 May 2026 19:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="2aopWn4Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87CE209F43;
	Fri,  1 May 2026 19:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777662336; cv=none; b=p331A2Td8R33SZ+P7EwDZHvP246rK40a/OkW4fwMDKmPKZdSQ1IryjBGPhiH2+jOV2yqvG1uAAM87C+KFo+uY965fvLzAQ2N7emZ4jWwz4DtgimvLRbSDQYl/NANg+Vo4S7OPAbCsXnyu2Nmn87Dvq5A+VxXVEajTsIXJN22HPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777662336; c=relaxed/simple;
	bh=ufnSYvn8Uzt3nTQsV1VJKLbQYH3r3L0bOIJ7Sm6Df/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwxbdJc9OWwBsb+juNLpfdL1sqzxyCtjkmQJWOXR8/lTu57gohHvy0SGCjf+STRzEsixhebddSSh7c2MSMADRbeDVhAC2KwtUmO8Cw1pkGoSUDU77pI37s0tgovhFj9nkdZnQvFE29xfizLZLjgTzOK05Ljm/f6HdDOL+W0xYNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=2aopWn4Z; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=zr1miL8fEoh0znlRNbkoD7ZZWFwQTcpiCWJezhzfkWE=; b=2aopWn4ZWWUJPQxJ+ht/UIkJ+v
	vkgJl4IX6j5VZk1n6LbGHadysUccJ0QjcoSvhvw+ZCdXCpfCcEu1ihL2mKiw6RYni+9knLTq2t0vX
	+q4DH2uZbxMRfss3zSE9cotXt7E9cBZC5jZ+/6EerFlTpjUtJZiVrk8Ug/y2Bv4FjvC8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wItAY-000rhF-A4; Fri, 01 May 2026 21:04:58 +0200
Date: Fri, 1 May 2026 21:04:58 +0200
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
Subject: Re: [PATCH net-next 10/12] net: stmmac: tc956x: add TC956x/QPS615
 support
Message-ID: <2ce5897d-5bbb-486a-b0f0-0e30e54b451a@lunn.ch>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501155421.3329862-11-elder@riscstar.com>
X-Rspamd-Queue-Id: C6E224AF094
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-35973-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:dkim,lunn.ch:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

> +static struct tc956x_mac_speed mac_speed[] = {
> +	{ PHY_INTERFACE_MODE_2500BASEX,	SPEED_2500,  SP_SEL_SGMII_2500M, },
> +	{ PHY_INTERFACE_MODE_SGMII,	SPEED_2500,  SP_SEL_SGMII_2500M, },
> +	{ PHY_INTERFACE_MODE_SGMII,	SPEED_1000,  SP_SEL_SGMII_1000M, },

That looks odd. Some vendors implemented 2500BaseX using SGMII
overclocked. But that is not strictly 2500BaseX. Having the 2500BASEX
entry suggests you have real 2500BASEX, so why have an SGMII entry
with SPEED_2500?

> +/* We have one IRQ chip instance with 25 IRQs in its domain */

One per MAC, or one overall?

> +static struct irq_domain *
> +tc956x_msigen_irq_domain_instantiate(struct tc956x_data *td)
> +{
> +	struct irq_domain_chip_generic_info dgc_info;
> +	struct irq_domain_info info;
> +
> +	dgc_info.name = "tc956x-msigen";

If it is one per MAC, maybe this name should indicate which instance
of the MAC this is.

> +static int tc956x_mac_setup(void *apriv, struct mac_device_info *mac)
> +{
> +	struct stmmac_priv *priv = apriv;
> +	struct stmmac_desc_ops *desc;
> +	struct stmmac_dma_ops *dma;
> +	struct tc956x_data *td;
> +
> +	td = priv->plat->bsp_priv;
> +
> +	/* dwxgmac301_dma_ops needs extending to provide DMA address translation */
> +	dma = &td->dma;
> +	*dma = dwxgmac301_dma_ops;
> +	dma->init_rx_chan = tc956x_dma_init_rx_chan;
> +	dma->init_tx_chan = tc956x_dma_init_tx_chan;
> +	mac->dma = dma;

I could be reading this wrong....

dma points to the global dwxgmac301_dma_ops, which you added a few
patches back.

You then modify it, changing two values in it.

Doesn't that break any other dwxgmac301 in the system? Shouldn't you
be making a copy of the global structure, and then making
modifications to your copy? mac->dma then points to your copy?

> +	/* dwxgmac210_desc_ops also needs extending for the same reason */
> +	desc = &td->desc;
> +	*desc = dwxgmac210_desc_ops;
> +	desc->set_addr = tc956x_desc_set_addr;
> +	desc->set_sec_addr = tc956x_desc_set_sec_addr;
> +	mac->desc = desc;

And the same problem here?

> +/* Called by tc956x_dwmac_probe(); return errors with dev_err_probe() */
> +static int tc956x_dwmac_parse_dt(struct tc956x_data *td)
> +{
> +	struct device_node *mdio_node;
> +	struct device *dev = td->dev;
> +	struct device_node *np;
> +
> +	np = dev_of_node(dev);
> +	if (!np)
> +		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
> +
> +	/* Find the MDIO bus */
> +	for_each_child_of_node(np, mdio_node) {
> +		if (of_device_is_compatible(mdio_node,
> +					    "snps,dwmac-mdio"))
> +			break;
> +	}

It looks like if you put the ethernet properties into an ethernet node
in DT, this might go away? Or at least allow you to use
stmmac_of_get_mdio(). 

	Andrew

