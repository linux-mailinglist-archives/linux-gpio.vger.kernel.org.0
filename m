Return-Path: <linux-gpio+bounces-35975-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPcHKSsW9Wl8IQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35975-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 23:07:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2954AFB2C
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 23:07:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74E52301B166
	for <lists+linux-gpio@lfdr.de>; Fri,  1 May 2026 21:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE30425CE2;
	Fri,  1 May 2026 21:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="gXstL101"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D0D33B970;
	Fri,  1 May 2026 21:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777669665; cv=none; b=FHEtQ67tqB3mqNYzUCQthCoOPY1yvM8ok4Tc8PY0Yg2hGbMLG/QQe4ZzfBb9SulxECvoE085BuXU3Lptkfdvmo3srtF7fSafTq0ZOrwOfL1l/HDgq7mysABPdsRV1yqgotRwXQU1ZLdg5/PHPNg1ASpTgUyPlcmjrZkPCljCrBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777669665; c=relaxed/simple;
	bh=u87LzqlH4jRqVyZEH6dO8+Zeo9R8H6Mo5eyptjOYFsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AmS0Huocapt65fm4EsiOSmncCRkITJw17WhORaOViS/tDLWOiw1uDMmGV61jKG/VU3+uVpAmBwmr7A1ar3Ucwngfp7OU8dVjnotEKApW2z4++HNawP9CGT2yyoHhnZgM+pivBUANJTscvPev8xr8KuHcnp+vvEjAK7fwwyOp5ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=gXstL101; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MlvvIWkz8YMmdMlfmtJ0yWa0qZs1kSt9IYxCuFbScAk=; b=gXstL101nagcCiccTw5+p86AFI
	LCVmkJk5MzBQrdomImehrJrPQ5TcMdXkBKDpTrJH8Nzremn/xMQUc42PTv2HqdmW3k9TDYfeSQu6/
	NedeeZiflcknh8Jh9+gDnBe6QiG4b58NO6jTt4zCgB6LQI1eGJ8L39MQiugt3vvps6xo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wIv4n-000soC-0l; Fri, 01 May 2026 23:07:09 +0200
Date: Fri, 1 May 2026 23:07:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
	arnd@arndb.de, gregkh@linuxfoundation.org, daniel@riscstar.com,
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
Subject: Re: [PATCH net-next 11/12] misc: tc956x_pci: add TC956x/QPS615
 support
Message-ID: <f9336d01-e2d1-4894-848a-17ab20976872@lunn.ch>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-12-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501155421.3329862-12-elder@riscstar.com>
X-Rspamd-Queue-Id: 3D2954AFB2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-35975-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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

> diff --git a/drivers/misc/tc956x_pci.c b/drivers/misc/tc956x_pci.c

> +static inline void chip_reset_assert(const struct tc956x_chip *chip,
> +				     enum reset_id id)
> +{
> +	tc956x_reset_clock_set(chip, true, true, true, (u8)id);
> +}

This is in drivers/misc, where the rules might be different. But in
netdev, we don't like inline functions in .c files. It is better to
let the compiler decide.

> +static void chip_init_state(struct tc956x_chip *chip)
> +{
> +	/* The only IP block we currently use is MSIGEN */
> +	chip_reset_assert(chip, RESET_MCU);
> +	chip_reset_assert(chip, RESET_MCU1);
> +	chip_reset_assert(chip, RESET_INTC);
> +	chip_reset_assert(chip, RESET_UART0);
> +	chip_clock_disable(chip, CLOCK_MCU);
> +	chip_clock_disable(chip, CLOCK_SRAM);
> +	chip_clock_disable(chip, CLOCK_PLL);
> +	chip_clock_disable(chip, CLOCK_SGMII);

With my networking hat on, this one standard out.

> +	chip_clock_disable(chip, CLOCK_REFCLK);

The name REFCLK is sometimes used as for the clock signals for RGMII?

> +static int
> +tc956x_function_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct tc956x_chip *chip;
> +	unsigned int msigen_irq;
> +	int ret;
> +
> +	/* Despite being a PCI device, we require devicetree */
> +	if (!dev->of_node)
> +		return -EINVAL;

Might be worth a dev_err(), since it is unusual.

	Andrew

