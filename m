Return-Path: <linux-gpio+bounces-36304-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDq7CCRi+2kuaQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36304-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 17:45:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C084DD855
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 17:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3A0630BE94C
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 15:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3282649251F;
	Wed,  6 May 2026 15:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="rJFOKZw/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329494657DC
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 15:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081961; cv=none; b=ho4JnB5Mfg8KMQ/P5jJHfO9rxemwreRh4cuQ5mbbkkyvIk2k4KTggBh2f9WdwzI54+kxwyw72adYnvmMcVvLlyfCDjOlz59IciaHgzwMGn5O+YsCgaWKyUcZS4jdW4y/01lxPKt5Csph2u4qoQP2/5NIu3Hmb7PUMhIyX+p3UmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081961; c=relaxed/simple;
	bh=xv+hOIA+jYDagu8VhuQJ1WD+q0s4/2y05KQyVhdDIbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+xajohwIkU3ZEptcD28HOlt7dkc+hhz1e5G7uFj+iahx77YYYXkV4DtWkfcNBn73U1HA0eYJQ7Ui8+zNctkN1NORqI0Jf4LT+XsiGrWg+HEDu/E6Cb3zVpsvlQzodo/Qcj0VvRrhcM+HLgqMqwzXUQeZrNCUJ+i+RRPY7BuAkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=rJFOKZw/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso77916515e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 08:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778081958; x=1778686758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+RE97dD5fWvLcGBYDBhe9zTaH8AQpDWyp4x6oWJE49c=;
        b=rJFOKZw/70mTgSsbLc54CxHCxw73Br0bANCa2N3+BYqCc91sJvLd7jlmpCRppSuHHU
         UTTSz16Pe3NF7661pFc/DPfuuAHzjBxm9mdIItXuKcyNjocJbvgHxMRdrP7KzDXVjnV5
         jhzbx1Flts8IMgTqUpB7NU16AcD09JdRAOMtb6Mju6/MG3zSa3vHLR+qKGfIHMDVPbpG
         3AhhnuUvLAR0kmwzL1PEL02NXreHkhOoI9buMvzRL3xAtdDfx2g0dH74JnZkM0mCTNYO
         YRO/CUypc4p9+aBxqwoH5Onbje2METCqDFVnCeApiBq+lsk8c5EgYYwmxniFH91gIwZm
         tTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778081958; x=1778686758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+RE97dD5fWvLcGBYDBhe9zTaH8AQpDWyp4x6oWJE49c=;
        b=SzFELNJTIzSk+7ki/GhW34XBxOKNsFt96JJ5n6cpM3tm40QmP3E4EvWsWCmDSkLJrG
         9V6Nxa0Uig9crLs54JpDYEnYqTE4DE9BDqu9JOTZB6Vs7Ay65oOaxPWrgbiaxWr2OiDe
         3zGUfs4ChuWz6FJh7XbNc3Fzom7b8CSyGo/WvU/daQ5Vvl9WU1Fw/7VfyqBvg9tsHX/C
         5wS49xHwcxzBfYfRBxzIasTzR0afyST2cQZjVrJPIwyURGkczR2KjMr//sPUwBBkeyex
         A+7y0XYXd9N6wt23g8IJcsKroHqVosTqTliY14tSLBXmbz5adRH7vE3hOOk8APEN6d0g
         gVGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cSoac3brwun6eCmuEp/v+m6IPueyXrti/I3nvvDfn9ze84wXQo/avde5n82LUYpWLr9uKekpkCVro@vger.kernel.org
X-Gm-Message-State: AOJu0YycN0usjnsSXJOG0XA2F2Ccz2H+8QBzOwVq8DNdVIJKzw52kEod
	OEAT7OtjaKjNVHjXc/w76r8Gzoy4d90PoSGb09vFcGO77HgdHUTMJsv95IRCHcE4RMQ=
X-Gm-Gg: AeBDiev1X/7Aiwm0Tsx767ozzYVr9aIn+apenOjvsYEmRMkxi9MnSHZMrxJEufziGFN
	CV6eBfABhnT3yV0nmQvs3XFQiqV/M/MzT10ZJHHLEaNLY8fsmuuTFf8N9Jbj00gZubFgUIo8HvE
	PozeFtJ58nstZTM7f0KJS4tHHxPpJAGBClwxlfFTxmJchS5+/C/FPn9tRK4iCAjcDUgYA0NgvBh
	Yri05h5+BdjefJn6/nV9JxOmLzrL5z4ZCrzuriasn0sdkwMy3VSR6vE4SeV1iqsepgah1hB79A9
	oSek56tbady17TdqA7AqFQIXE1EwYRVHF6HQ4K08jSQ8WEg9vgsN6q+Y1KBKvw77F1Q6tDo7myF
	bLGSdih/19kBJF/+Dj6K8cNHhzBq5fOS98qISHaKiav9Ls/jl/QE6f1jy43AYyNhjV2Cz1UtJFQ
	x1ibqlXZW8zlPZ1z0vQndBdvQeEcg7BbxHtZZ5plT3kAZD+Z8waTQZCgCGcpQ+I8OR58BcvaH1n
	HhZjnsqDKrQ2D8+AR+qF6IzqibPDwLyZOIN+B1wi/0yZKbY52ktnH4Yshm43PMEOC1BWCyNO4AN
	yq5tk6TX2RRG/dGou74=
X-Received: by 2002:a05:600c:6209:b0:48a:525b:e157 with SMTP id 5b1f17b1804b1-48e51f2e660mr64800835e9.13.1778081957492;
        Wed, 06 May 2026 08:39:17 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538fb19csm52241905e9.11.2026.05.06.08.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 08:39:16 -0700 (PDT)
Date: Wed, 6 May 2026 16:39:14 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Alex Elder <elder@riscstar.com>,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
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
Message-ID: <aftgorkah-Hjrvq2@aspen.lan>
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
X-Rspamd-Queue-Id: B8C084DD855
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,riscstar.com,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-36304-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar-com.20251104.gappssmtp.com:dkim,aspen.lan:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Wed, May 06, 2026 at 10:35:18PM +0800, Xilin Wu wrote:
> On 5/6/2026 10:19 PM, Andrew Lunn wrote:
> > On Wed, May 06, 2026 at 08:59:01PM +0800, Xilin Wu wrote:
> > > On 5/1/2026 11:54 PM, Alex Elder wrote:
> > > > +	/* AXI Configuration */
> > > > +	axi = &td->axi;
> > > > +	axi->axi_lpi_en = 1;
> > > > +	axi->axi_wr_osr_lmt = 31;
> > > > +	axi->axi_rd_osr_lmt = 31;
> > > > +	/* All sizes (2^2..2^8) are supported */
> > > > +	axi->axi_blen_regval = DMA_AXI_BLEN_MASK;
> > > > +	plat->axi = axi;
> > > > +
> > > > +	plat->mac_port_sel_speed = speed;
> > > > +	plat->flags = STMMAC_FLAG_MULTI_MSI_EN | STMMAC_FLAG_TSO_EN;
> > >
> > > I got WoL working only after adding STMMAC_FLAG_USE_PHY_WOL here. I guess
> > > it's required, since the driver clocks down the MAC/PMA/XPCS in its suspend
> > > hook?
> >
> > Nice to see somebody testing WoL.
> >
> > In your testing, is it the PHY doing the WoL, or the MAC? I assume
> > PHY.
> >
> > If i remember the DT correctly, the PHY interrupt is connected to a
> > SoC GPIO, not a GPIO of this chip. So for your board, it is the SoCs
> > GPIO controllers ability to perform the wake which is
> > important. However, where the PHY interrupt is connected is a board
> > design issue. Could the PHY interrupt be connected to the chip? Would
> > the chip be able to wake the system? Should STMMAC_FLAG_USE_PHY_WOL be
> > conditional?
>
> Yes, the PHY is doing the WoL. And I guess this makes sense as it allows the
> MAC to power down during suspend to save power.
>
> The INTN pin of QCA8081 is connected to the ETH_0_INT_N of QPS615. And the
> INTN_WOL pin is connected to a SoC GPIO.

Interesting. That is different to RB3gen2 where INTN is routed to both
(although there is a do-not-fit 0ohm resistor option that could change
that).

Does that mean you don't get phy interrupts reported in /proc/interrupts
before any suspend happens?


> Without this change, I can't get WoL to work. I have a working branch for
> our board here:
> https://github.com/strongtz/linux-radxa-qcom/commits/v7.0.2-8280-wip/

I took a quick look at the DT and I noticed you have an SGMII PHY
attached to both eMAC0 and eMAC1 on your board. This is something we
think should work but were unable to test. Are you able to use both
eMACs concurrently? Would be great to see that confirmed!


Daniel.

