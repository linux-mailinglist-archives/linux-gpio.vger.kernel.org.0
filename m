Return-Path: <linux-gpio+bounces-36377-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6C3gGBOg/Gm1SAAAu9opvQ
	(envelope-from <linux-gpio+bounces-36377-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 16:22:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8C84EA0E4
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 16:22:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A7093050444
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 14:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42BF3FCB10;
	Thu,  7 May 2026 14:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="oUE8EmsR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F79E3F1655;
	Thu,  7 May 2026 14:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163334; cv=none; b=ZPRIXC3v+dORADT6m6+KmmSciUeEGzsowWH4W43sq3EH6VPWpmdab5k+dsaqBayQLDSIsOH/IHNm48qENrfVLN8HhBCrIyciAuKWPJnWl/Z90yr1WYoEFq+5ZIOgYA4hCQcDW3gcaNIEWRuresOFYPWSuLxlcZhs/3Y9Zk3LID4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163334; c=relaxed/simple;
	bh=70KuMfzku9PDiHjjD3qQPJ/Ug0jo/by7mUF2gnZbFd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjTrlhpP3TDesRbHqyRsRgSODvB6Xdr5DSg/kPeZBWoGb434raHAadAt8Nttg7CQqhDvEodOmCJFSGmWm3g6WDi4YQlkwsriwKyhDVVMebUKuDMakxSYgfE7lXjV7GvFCQSYCzXU71NMC9WvdJuunvhS+ZlHas0f1CNaucSi+yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=oUE8EmsR; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Jd92XsB5WE/g/etZHxA6nzPWEIbD+MK9uEeWSt6AGi4=; b=oUE8EmsRYnljUPNuD/yv/W2iSf
	ILVAFslXORF0Xh0CDF17xDATwzEFAIR5bBKd5RsG3TIfePMBbH3P5BwJP1jwprPfhpstyU8Byr5e/
	fw8Xeh94ss0mEpQtJUlhJmGqmRYdPO3xQTBFk0ctWwU6uCuKIXfm6us/azi5sDIAGxh8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wKzUx-001p6o-HA; Thu, 07 May 2026 16:14:43 +0200
Date: Thu, 7 May 2026 16:14:43 +0200
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
Message-ID: <fd839de4-0312-45aa-8e6a-4c7c199d9264@lunn.ch>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <DD71CDEABC7C16D5+02d052ff-13bb-4712-a847-91416f76c578@radxa.com>
 <7f3a0f16-5159-4bbc-8b15-9b5841603bf6@riscstar.com>
 <3A5C0389E7C0D241+21a4f16b-1af8-46ac-8831-0c1b49694df0@radxa.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3A5C0389E7C0D241+21a4f16b-1af8-46ac-8831-0c1b49694df0@radxa.com>
X-Rspamd-Queue-Id: CC8C84EA0E4
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
	TAGGED_FROM(0.00)[bounces-36377-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lunn.ch:mid,lunn.ch:dkim]
X-Rspamd-Action: no action

> Hi Alex,
> 
> Do you think if a shutdown callback like this is required? It looks like the
> driver sometimes does a MDIO MMIO read when the PCIe link is down, causing
> the board to reset due to SoC side PCIe NoC timeout.
> 
> After this change, the board can always shutdown gracefully.
> 
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
> index 4e8b4a185583..34b8e3fe1b51 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
> @@ -767,6 +767,17 @@ static void tc956x_dwmac_remove(struct auxiliary_device
> *adev)
>         tc956x_mac_disable(td);
>  }
> 
> +static void tc956x_dwmac_shutdown(struct auxiliary_device *adev)
> +{
> +       struct device *dev = &adev->dev;
> +       int ret;
> +
> +       ret = stmmac_suspend(dev);

It seems odd to do a suspend in shutdown.

But lets backtrack. Why is the PCIe link down?

	Andrew


