Return-Path: <linux-gpio+bounces-36296-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHFPLexW+2mvZgMAu9opvQ
	(envelope-from <linux-gpio+bounces-36296-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 16:57:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0A54DCBD2
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 16:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B111930CD4FB
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 14:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 993A0481AA3;
	Wed,  6 May 2026 14:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="lPzQdyIN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0313C277F;
	Wed,  6 May 2026 14:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078791; cv=none; b=qUYZg9ruY2HmkB7VFluyjmDe+PglNhosGPo5/dqlx3OJMyAQvvd8GCQ9m27lYVeU9DPKwJZRsFB3fujjX0MFac5ULYYnsuidL0eZTXw3zpb6qZBtt3mVtHl9dSI0jrjDLLvaF/GEZ+F+vSDzFwqhA8fGqhcrqChVTEDUAd+I57Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078791; c=relaxed/simple;
	bh=BBsfz60aUEgeqtpoRh3PBAM8J8mQ6w/W2WKceCw3UYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t2vYoS3eSkvWOCDVk2K3713BzZnizT4Jtg428ynU30q9UjVXmGnJi0KAaoPOQEda7SOfaZ1FnC3PX499srfyP2o6dD87sV1bGWLyjHrKBbltHQkriMUdA9rTaB3IhlK74gybf7w+RAtOxlKthOS0R+KUPX92CXO2ISgfTVRR8ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=lPzQdyIN; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vyEPyUZJeX9dO6F6nRE5z42G4sCReKS00+GvfPpcSWM=; b=lPzQdyINhroAWnkNF/Qgri1OvX
	sBk/9p971b+YnthhhMi3GnMwiaebMUyvGTxPL7iRNx1Ise2+lutlySwHs0KIdToFgYAOHZz4tuy7L
	5BfnGqTk2MJAvy8DQoCx1v8ddewIDTqCDUWHNmERhbltK2nyc6BC1A4tHat7+Vc/TYqk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wKdVO-001ekY-Pc; Wed, 06 May 2026 16:45:42 +0200
Date: Wed, 6 May 2026 16:45:42 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Xilin Wu <sophon@radxa.com>
Cc: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, maxime.chevallier@bootlin.com,
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
Message-ID: <2af0fee3-d3d6-4434-847f-3fd2fbb841d3@lunn.ch>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <224E233C593EF171+8c8a43dd-5061-40f8-9eb7-f360eabf2ecc@radxa.com>
 <4015f47a-af62-441d-b1b8-a8598f963970@lunn.ch>
 <4C0D95BC59F1A4ED+53f3be85-2cdd-4058-8950-57970027d481@radxa.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4C0D95BC59F1A4ED+53f3be85-2cdd-4058-8950-57970027d481@radxa.com>
X-Rspamd-Queue-Id: 0E0A54DCBD2
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
	FREEMAIL_CC(0.00)[riscstar.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-36296-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,armlinux.org.uk:email]

> Hi Andrew,
> 
> Yes, the PHY is doing the WoL. And I guess this makes sense as it allows the
> MAC to power down during suspend to save power.
> 
> The INTN pin of QCA8081 is connected to the ETH_0_INT_N of QPS615. And the
> INTN_WOL pin is connected to a SoC GPIO.
> 
> Without this change, I can't get WoL to work. I have a working branch for
> our board here:
> https://github.com/strongtz/linux-radxa-qcom/commits/v7.0.2-8280-wip/

Please take a look at commit

commit 6911308d7d111a9c367293b52f2dc265819f2b60
Author: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Date:   Thu Oct 23 10:16:50 2025 +0100

    net: stmmac: convert to phylink-managed Wake-on-Lan

In particular:

    When STMMAC_FLAG_USE_PHY_WOL is not set, we provide the MAC's WoL
    capabilities to phylink, which then allows phylink to choose between
    the PHY and MAC for WoL depending on their individual capabilities
    as described in the phylink commit. This only augments the WoL
    functionality with PHYs that declare to the driver model that they are
    wake-up capable. Currently, very few PHY drivers support this.
    
Could you actually patch the PHY driver to make it list its
capabilities. That is the direction we want to go in the long term,
and not use STMMAC_FLAG_USE_PHY_WOL.

    Andrew

