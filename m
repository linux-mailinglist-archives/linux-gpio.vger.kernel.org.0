Return-Path: <linux-gpio+bounces-36395-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBhKM3m+/GnSTAAAu9opvQ
	(envelope-from <linux-gpio+bounces-36395-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 18:31:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E69D4EC436
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 18:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4466130179C5
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 16:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF62C4218BF;
	Thu,  7 May 2026 16:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="iWVScX3t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B87037269F;
	Thu,  7 May 2026 16:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778171414; cv=none; b=p+O275LvhTwAFrvBhr8lc/pnzcBSwm5n2zDum2EJpj4cMGNKg7BNvnQG0YWGJwzOJqVfLR22q55w9pc48aQ2T+60fMy7kI5ZjpzWn3IFcZgFZF2I02WegptOm6UFqpG18+Cx7wUB4gIpQJKQEHSw1ebdZbVQBfHEk5wmFnNVKjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778171414; c=relaxed/simple;
	bh=JF5H04WoSuU8ZS1WCukHF3QcigcJRhlCF8unmAcPvLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GjlabwShmS5O7rDipjRxg+UKSrkwcZFp6fktdFYVnZW08bsrZuD1XhHgew5csPp6xLwkzlF52qTG7stW+uAC03TFypXNv51pEupw8+/oOyTrnim2Jz+3hhTGOz1f5wLwxV6c02sXQM7cKbmyB6KLiZZFf4CIgTcYBhqR9iKVPp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=iWVScX3t; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kYKaL1jQ8LGdN9smjIQLGtIx8ZielLRVj4GVygHNyZw=; b=iWVScX3t1Vr7jT65EBijDEZtTC
	xR/IYFApXe/XCCjv6FXei/9xmMjJxEdUZzW87RUeUyhJcv+B3eVHQz9NAIK/eJD4bXgOtQg4e8bFF
	6Q7shNjm3ibz3YIv1APpxKSOp0zLPRl0qLPCWLDITqKG+x6Yq2AcgJxHUp5giJaS4zUk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wL1b9-001qT0-IB; Thu, 07 May 2026 18:29:15 +0200
Date: Thu, 7 May 2026 18:29:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Thompson <daniel@riscstar.com>
Cc: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
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
Subject: Re: [PATCH net-next 10/12] net: stmmac: tc956x: add TC956x/QPS615
 support
Message-ID: <ef6df85f-11ac-404d-958a-8cf69b3b6bb6@lunn.ch>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <2ce5897d-5bbb-486a-b0f0-0e30e54b451a@lunn.ch>
 <afy34kj2hPxIlArO@aspen.lan>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afy34kj2hPxIlArO@aspen.lan>
X-Rspamd-Queue-Id: 6E69D4EC436
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[riscstar.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-36395-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 05:03:46PM +0100, Daniel Thompson wrote:
> On Fri, May 01, 2026 at 09:04:58PM +0200, Andrew Lunn wrote:
> > > +static struct tc956x_mac_speed mac_speed[] = {
> > > +	{ PHY_INTERFACE_MODE_2500BASEX,	SPEED_2500,  SP_SEL_SGMII_2500M, },
> > > +	{ PHY_INTERFACE_MODE_SGMII,	SPEED_2500,  SP_SEL_SGMII_2500M, },
> > > +	{ PHY_INTERFACE_MODE_SGMII,	SPEED_1000,  SP_SEL_SGMII_1000M, },
> >
> > That looks odd. Some vendors implemented 2500BaseX using SGMII
> > overclocked. But that is not strictly 2500BaseX. Having the 2500BASEX
> > entry suggests you have real 2500BASEX, so why have an SGMII entry
> > with SPEED_2500?
> 
> This is a consequence of the code that uses this lookup table being
> called both during initialization and from the fix_mac_speed() callback.
> 
> During initialization we only have the value in plat->phy_interface to
> go on so we run the lookup table using plat->phy_interface (which is
> typically PHY_INTERFACE_MODE_SGMII) and with the maximum permitted
> speed.

Something sounds wrong here. SGMII only supports 10/100/1G. You should
never be asked to do SGMII at 2500. It should ask for 2500BaseX.

> I haven't got detailed enough notes to allow me to double check but I
> think there were problems completing the initial MAC reset if we didn't
> write something sensible to the hardware during initialization.

> During fix_max_speed() we get told to adopt 2500base-x. Reviewing the
> code I can see we don't propagate that and just use
> plat->phy_interface for fix_mac_speed(). I will fix the code to that
> the requested interface propagates properly to the lookup table but I
> think we would still rely on the SGMII entry to get sane initial values
> to write to the hardware.

Getting sane values into the hardware is good, but 2500 SGMII is not
sane :-(

> > Doesn't that break any other dwxgmac301 in the system? Shouldn't you
> > be making a copy of the global structure, and then making
> > modifications to your copy? mac->dma then points to your copy?
> 
> That's exactly what this code does.
> 
> `*dma = dwxgmac301_dma_ops` is a structure copy, we never take a pointer
> to dwxgmac301_dma_ops (and if we did, dwxgmac301_dma_ops is const so I
> think we'd get a kernel oops if we tried to write to rodata).
> 
> Would to code be easier to read if we dropped the local `dma` variable
> since that would make it clearer that td->dma is not a pointer? More
> like:

> +       /* dwxgmac301_dma_ops needs extending to provide DMA address translation */
> +       td->dma = dwxgmac301_dma_ops;
> +       td->dma.init_rx_chan = tc956x_dma_init_rx_chan;
> +       td->dma.init_tx_chan = tc956x_dma_init_tx_chan;
> +       mac->dma = &dma;

Yes, that is better. I also think it is partially my problem. You
don't often see structure assignments, just pointer assignments. So
i'm somewhat blind to them.

	Andrew

