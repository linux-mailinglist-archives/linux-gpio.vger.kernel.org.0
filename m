Return-Path: <linux-gpio+bounces-36394-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHYaH/y5/Gl2TAAAu9opvQ
	(envelope-from <linux-gpio+bounces-36394-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 18:12:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7B24EBF71
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 18:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0EE2D3004F2E
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 16:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174EB44BC94;
	Thu,  7 May 2026 16:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+S845O0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EF63B7B9E;
	Thu,  7 May 2026 16:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778170360; cv=none; b=iBYBwvM3S1OHh/HS3IoEz/Hmb7KOKd0YIMbtsJ+D0pvs849k6xu4i2c6vkilLX0N+MC3+yv/z7uSzQWfjfWZfGgkm3HsA63ktexTNFxgTOtvWJFMm0J0acylvnNOTBlS55tWGYkBrYyVlNEzEMvnCA0ngJP3DO8D4Z4TkBrcmaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778170360; c=relaxed/simple;
	bh=mHnpTkNqDMMgyjjmBDQelNHd6h4rfsO4RJEx1AkJBMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jk1QxZ83uGRamUAM2cQF2UtBwoKbfzy7dp/kKYGjQbMYUM+IMOl4KXN6s2OOiLv/Di1Y6D3hX3lbMfe8GLLyyq9ajAs1d9kHWXtd6iLTevzgW496zbTrJ2PhIeAuPOLAz/2TUXKVS1f/A9fYZmTMOMjGa/ZFv7/1fxb8ZxdGqjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+S845O0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A14C2BCB2;
	Thu,  7 May 2026 16:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778170360;
	bh=mHnpTkNqDMMgyjjmBDQelNHd6h4rfsO4RJEx1AkJBMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A+S845O03ps+IXB75wFjkzDN9v0tAykUbcR2VsLaQPNrIzkci3CBqgd7eWN3ioqH+
	 pA+Fb4M/LLGrjCRvWdxhj8r17s8vMLtNx9LjMrG2acOEQZVJrphMzTI+FvfR0Po6/Y
	 GB8oaJBVqomuilbtkK87vWRTAKcgElExFINXksKPV5+q8owzkU8BgRgpRSrDQJbaRu
	 v63IN44HnwWOLJ1JH68hewGdvAGnhbdWXeHnejBBNx9vJqgNJYHUfJrgeIcwNiR3OF
	 nnTQq2BDLnn3zSUBC5nTWu+8a1H/IQgqLI1pkv/Rhea2HPR1XGDGoTs6I4ZzUqnWbP
	 ReUdrzlMnvGIQ==
Date: Thu, 7 May 2026 11:12:32 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	maxime.chevallier@bootlin.com, rmk+kernel@armlinux.org.uk, konradybcio@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, 
	Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com, 
	alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, 
	chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com, 
	inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com, 
	livelycarpet87@gmail.com, matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, 
	me@ziyao.cc, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	richardcochran@gmail.com, rohan.g.thomas@altera.com, sdf@fomichev.me, 
	siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com, wens@kernel.org, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 08/12] dt-bindings: net: toshiba,tc965x-dwmac:
 add TC956x Ethernet bridge
Message-ID: <afy5vHDGKNmNlOYV@baldur>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-9-elder@riscstar.com>
 <afycOwz5TpkegkZd@baldur>
 <0de89be0-d842-46f4-8a23-d7e6cc62bcc4@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0de89be0-d842-46f4-8a23-d7e6cc62bcc4@lunn.ch>
X-Rspamd-Queue-Id: 1F7B24EBF71
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[riscstar.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-36394-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 04:19:49PM +0200, Andrew Lunn wrote:
> > Are there other consumers of these TC956x gpios which would result in a
> > board designer (and hence dts author) to ever reference this
> > gpio-controller in a different way?
> 
> This Ethernet device could driver an SFP cage. Such cages typically
> have a number of pins connect to GPIOs, so you can tell when there is
> a module in the cage, enable the transmit laser, know if light is
> entering the module from the link peer, etc.
> 

Okay, so the consumer of the gpio is actually an external component, and
not just another part of the TC956x?

Then this seems reasonable.

Thank you,
Bjorn

>     sfp2: sfp {
>       compatible = "sff,sfp";
>       i2c-bus = <&sfp_i2c>;
>       los-gpios = <&cps_gpio1 28 GPIO_ACTIVE_HIGH>;
>       mod-def0-gpios = <&cps_gpio1 27 GPIO_ACTIVE_LOW>;
>       pinctrl-names = "default";
>       pinctrl-0 = <&cps_sfpp0_pins>;
>       tx-disable-gpios = <&cps_gpio1 29 GPIO_ACTIVE_HIGH>;
>       tx-fault-gpios = <&cps_gpio1 26 GPIO_ACTIVE_HIGH>;
>     };
> 
> 	Andrew

