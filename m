Return-Path: <linux-gpio+bounces-36321-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OH/LFOa+2k2eQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36321-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 21:45:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0D94DFF0D
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 21:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA9AF301F5C0
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 19:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D7933B6DB;
	Wed,  6 May 2026 19:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="r8sFM1pw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E062E1722;
	Wed,  6 May 2026 19:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778096674; cv=none; b=OsFFWEEj+n3pgBYEAclii23YHpU+N7TTK7Plm8P+d4Fx8sHj4WtvUvwJWge05/erMLRW8UzFks8EZGJmoJNQ0uqXeHiRYx1p//3b+FQYYvuEcXvAeNe3Bgadd/q1i7mHcueegshi3cBZIYFoCAvKJhyh1t/1KcV1UafoPH1NQhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778096674; c=relaxed/simple;
	bh=0YUUrxVxCjt2QmOLirTyM0FZ+bSf6y2AZqT+AxHoPjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8X2g1FNr2N682i62uKiZdyYIkuCaKGRUbWKzrrWd9H0EWaBCIyJrI1zTgzTAsEdTbRMCC6StGKB3UCI79HQjGtzOsm7vlj46lOZl7ayl2yvZWEf4RVDAyt2B+ROfxIcD2sPFDY/8M2Fl/zfYgoFt7XYo01uZuYt+i1vDuHKqVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=r8sFM1pw; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=K1q3NI3BsSpOEHU3gmV8o6cjnh4W3gSw9Ujwg8EaS+A=; b=r8sFM1pwHJMVxud91KWvxLzmcJ
	gwRnbQDJaMv62Iq9lhwBZzABSwYGSEE82UrEms+6AWU5jNfdJfR411CccFSrQH9zjssZ/YoBWl7O2
	DCTNp/nXrptBPLlYXwwXR0+qOG0wDZuVdAryAuBRIjI81zj4gUpXxwjsm7t7bhyEmcG0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wKi9o-001hEj-Dc; Wed, 06 May 2026 21:43:44 +0200
Date: Wed, 6 May 2026 21:43:44 +0200
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
Subject: Re: [PATCH net-next 09/12] gpio: tc956x: add TC956x/QPS615 support
Message-ID: <7d7b6b89-3ef4-4891-a794-c8b11f39db34@lunn.ch>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-10-elder@riscstar.com>
 <736fb3b7-c88a-4ec4-96ad-d1b79cc48d30@lunn.ch>
 <30cec7dd-ac3c-47ab-896a-c29992bd5ba5@riscstar.com>
 <3666e3e6-e6f3-4cbf-b9fe-caa394fbab7c@lunn.ch>
 <0751a051-9894-45be-92d6-0d46f2c39293@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0751a051-9894-45be-92d6-0d46f2c39293@riscstar.com>
X-Rspamd-Queue-Id: 5F0D94DFF0D
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
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[lunn.ch:server fail,sea.lore.kernel.org:server fail];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36321-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:dkim,lunn.ch:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

> >                ----------------------------------
> >                |              Host              |
> >                ------+...+----------+........+---
> >                      |i2c|          |  PCIe  |
> >      ----------------+...+----------+........+------
> >      | TC956x        |I2C|          |upstream|     |
> >      |               -----        --+--------+---  |
> >      |  -----  ------  -------    | PCIe switch |  |
> >      |  |SPI|  |GPIO|  |reset|    |             |  |
> >      |  -----  ------  |clock|    | DS3 DS2 DS1 |  |
> >      |                 -------    ---++--++--++--  |
> >      |  -----  ------     downstream//    \\  \\   |  downstream
> >      |  |MCU|  |SRAM|    /==========/      \\  \===== PCIe port 1
> >      |  -----  ------   //PCIe port 3       \\     |
> >      |                  ||                   \======= downstream
> >      |  ----+-----------++-----------+----         |  PCIe port 2
> >      |  | M | internal PCIe endpoint | M |         |
> >      |  | S |------------------------| S |  ------ |
> >      |  | I |   PCIe   |  |   PCIe   | I |  |UART| |
> >      |  | G |function 0|  |function 1| G |  ------ |
> >      |  | E |----++----|  |----++----| E |         |
> >      |  | N |  eMAC 0  |  |  eMAC 1  | N |         |
> >      --------+.......+------+.....+-----------------
> >              |USXGMII|      |SGMII|
> >            --+.......+--  --+.....+--
> >            |  ARQ113C  |  | QEP8121 |
> >            |    PHY    |  |   PHY   |
> >            -------------  -----------
> > 


> Because the internal endpoint won't operate until the PCIe
> power controller has enabled power, this GPIO driver and
> the PCIe power control driver won't interfere with each
> other's access to the shared registers.

What i find interesting is that there are two GPIOs, and two external
downstream PCIe ports. A naive way of looking at this is that each
external PCIe port has one GPIO. And the internal PCIe port does not
have one. Hence the internal port might well work without any
additional setup?  That was my thinking.

But you are saying it is not as simple as this, and two GPIOs affect
three ports? Do you have any idea what they actually do?

      Andrew

