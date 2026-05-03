Return-Path: <linux-gpio+bounces-35997-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDzgEI679mkNYAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35997-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 03 May 2026 05:05:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D54624B4394
	for <lists+linux-gpio@lfdr.de>; Sun, 03 May 2026 05:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B82E33009CC1
	for <lists+linux-gpio@lfdr.de>; Sun,  3 May 2026 03:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F51635C183;
	Sun,  3 May 2026 03:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="WOqFdeGN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED2C1E5B9A;
	Sun,  3 May 2026 03:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777777542; cv=none; b=gJ/PWduH0LzqcTUXybThrI+RXTJ/HQDdFi7v5XTsKOffsFdURhqp+UYuxmLdgV1W7mpa+4eJ6VxRN6YAPJBtIJX9iPqvoCwey8LUzepon+RPMg5ffMN0E49aIbAJ8Xgbw6kS5SWhj6jeFKcY5yyFyAkFRKijqRU6BQtHyu+L6Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777777542; c=relaxed/simple;
	bh=Bc7uubLHk/7Zvz+FjYl0CF0BcrblwRhjO8Bk4lzFuR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQYAeARtPW6ogWF6+hdY4GR8i/3mcDpuQKis9n0J3calRZ3kR6NVAtDDuMtpfIPzNIBsadzNJ16RTEFiidiwbRP4NvLlVDbD8PUthJmdp2ICb5y8Ld6N9lbhjSaN1PD2cBJScMiptSiy2J6+0+7FTkJ2uaAHOHbMc+N/u5KJW1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=WOqFdeGN; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vTkWlde2JHlNLRGm1ttbizoIX10aHI1/8IxqhQI+Whc=; b=WOqFdeGNyDYHYFP7rc3MuSp8dU
	+Nq7spbXhTu22v9VhEL/bpGGO7Ny+KaFWZxNAfsJ0HQvqdYex7LnMbsUU5CcnClNP8nNEc2vlJqj1
	z9ZnXFUs5K0tXBKfOy6LB27Y7HO6yRUvlHLIJRj8EWGVWE1xUyY3lEZWpWfi41LUNU0k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wJN8j-0015D5-2u; Sun, 03 May 2026 05:05:05 +0200
Date: Sun, 3 May 2026 05:05:05 +0200
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
Message-ID: <3666e3e6-e6f3-4cbf-b9fe-caa394fbab7c@lunn.ch>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-10-elder@riscstar.com>
 <736fb3b7-c88a-4ec4-96ad-d1b79cc48d30@lunn.ch>
 <30cec7dd-ac3c-47ab-896a-c29992bd5ba5@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30cec7dd-ac3c-47ab-896a-c29992bd5ba5@riscstar.com>
X-Rspamd-Queue-Id: D54624B4394
X-Rspamd-Action: no action
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
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-35997-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:dkim,lunn.ch:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Sat, May 02, 2026 at 08:45:48PM -0500, Alex Elder wrote:
> On 5/1/26 1:36 PM, Andrew Lunn wrote:
> > > + * There is a TC956X PCI power controller driver that accesses the
> > > + * direction and output value registers for GPIOs 2 and 3.  These
> > > + * GPIOs control the reset signal for the two downstream PCIe ports.
> > > + * Their values will never change during operation of this driver, and
> > > + * this driver reserves these two GPIOS.
> > 
> > Why doesn't this power controller driver actually use this driver to
> > control the GPIOs? Chicken/egg?
> 
> I am not the one with authority on this, but yes, that's my
> understanding.  *Something* about this chip requires that the
> PCIe ports need to have some configuration done on them *before*
> PCIe is powered up.  So that driver uses the I2C interface to
> apply these settings.  Meanwhile this driver uses the PCIe-mapped
> memory to manage the GPIO registers.

The diagram you have is:


              ----------------------------------
              |              Host              |
              ------+...+----------+........+---
                    |i2c|          |  PCIe  |
    ----------------+...+----------+........+------
    | TC956x        |I2C|          |upstream|     |
    |               -----        --+--------+---  |
    |  -----  ------  -------    | PCIe switch |  |
    |  |SPI|  |GPIO|  |reset|    |             |  |
    |  -----  ------  |clock|    | DS3 DS2 DS1 |  |
    |                 -------    ---++--++--++--  |
    |  -----  ------     downstream//    \\  \\   |  downstream
    |  |MCU|  |SRAM|    /==========/      \\  \===== PCIe port 1
    |  -----  ------   //PCIe port 3       \\     |
    |                  ||                   \======= downstream
    |  ----+-----------++-----------+----         |  PCIe port 2
    |  | M | internal PCIe endpoint | M |         |
    |  | S |------------------------| S |  ------ |
    |  | I |   PCIe   |  |   PCIe   | I |  |UART| |
    |  | G |function 0|  |function 1| G |  ------ |
    |  | E |----++----|  |----++----| E |         |
    |  | N |  eMAC 0  |  |  eMAC 1  | N |         |
    --------+.......+------+.....+-----------------
            |USXGMII|      |SGMII|
          --+.......+--  --+.....+--
          |  ARQ113C  |  | QEP8121 |
          |    PHY    |  |   PHY   |
          -------------  -----------

The two Ethernet controllers are hanging off port 3 of the
switch. However, the GPIO block is just floating in space. What
address space is it in?

I'm wondering if the GPIO controller should be a device/driver of its
own? It probes first. The PCI power controller driver then probes, and
has phandles to the GPIO controller so it can activate ports 1 and
2. Parallel to that the Ethernet driver(s) can probe, also using
phandles to the GPIO they need.

Looking at this diagram, putting the GPIO controller within one of the
port 3 functions is wrong. But maybe the diagram is not accurate.

     Andrew

