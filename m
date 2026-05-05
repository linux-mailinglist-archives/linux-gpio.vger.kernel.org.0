Return-Path: <linux-gpio+bounces-36232-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAqGELUa+mkJJgMAu9opvQ
	(envelope-from <linux-gpio+bounces-36232-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 18:28:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D915C4D1467
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 18:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B821305430B
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 16:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861BA48C3F4;
	Tue,  5 May 2026 16:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="BOLA12n2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E428038BF81
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 16:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777998335; cv=none; b=hMqj7qm2chL/oiDzAm8sk9tMlOO7Ee0djNx3YAVgOugvgko0FjxSB5GZcz+zTEDUL7bVq1aa/p5UOqgiSJ6qkhMI+tva9gh5/9Z9uRNC3S5RnKv8L1LLw78mj0uyzE1obd5g9s183ELRQ9zm2NX5Udz7UaNck/XEso7d5N583Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777998335; c=relaxed/simple;
	bh=10ad65O0ps7iM6dei8qNX30QY3FkTiMh2oPpwbtxSn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTkDfk+QC0HOTMC34pEU3M59I14iiQOfa/dLB5HUO9L5jRV94hm5msYqC+hQ6t70vPPi/V3bWLZX4ATCVEbsfU7sAqE1tFA5o85EP8gsGx3qMSZTHq6lwP2zD+YAnEQkW4FmrxsMmnKo+PJ7GqLO2mj2p7FvquFlDRaylJZpm54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=BOLA12n2; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso44609545e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 09:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777998332; x=1778603132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dvgEgjFlnhgVavTSLAwA8kue6OnY1fSQmcbYOk/Oxj8=;
        b=BOLA12n2zlvmTn6BetXu2cIMwXhJbX+fAz/gLq6do6zp3kF4K8bysb/R3kx6QmU/sL
         sy3LWQoP4bi8cfnuP560JUjb7CQJze1XckvA6zXP0cQCyFX4ek6Ex+BhPLyNPHbkcKvi
         mi3Mf1XGJcV9KZdHYB4NPiQe4Be5mJyy0DlMvUJcGYrNtvX/tmmSESSG8uRanKtf6QrH
         +jXCiqbm1qvvfa3oR65MrApVGLhfnE5RhpdCkSitxFVUhnKXbOyeOYf85Na4ivlYhRxp
         29xl5m38ckNZuCyrfLY9/TP0RzuQ/yCbLpPNfD20ghiwdgtgdjyIoXBIwXneCGn1k6w7
         F+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777998332; x=1778603132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dvgEgjFlnhgVavTSLAwA8kue6OnY1fSQmcbYOk/Oxj8=;
        b=ifx5ELDfMR4t3hUS3uR5ypOXgqphzi0qBh5TuAr30PRLNmRUCBbmM5W4Z3Qk2C2fOA
         l0G2ptJhEGCC3XNVZFttQLOeQV8IEh+kTC5ckKjsXbM8PAw7g6YScMOf9W4pnnXBPLT+
         F7ffUh05AflpFUi9ZRQJp9iYktNVkMiGl5QH1ru3IUW+0H2R3IwBAscC5cq51GK87QlG
         6nn8W01JyXi8cV30NKRrCc9kvyZTasAWhRAewxj+hTd/X+2LzGiUyZHSU4Bvi8vbaDNu
         y2zVfIAYHgqX3o5X6Z6gOXIfBZ9V6dFf+F5rJIHfkfop2455FfyerG3wLyprQKbiuJ6c
         72Hw==
X-Forwarded-Encrypted: i=1; AFNElJ/hSKiR8ETd3gqcsyDRmPS0iDnQgFrWfat0waMjJCcTHTKwcxVt+vTwSYq8kNcUzW+aMMJUmhN2r7wB@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2rqKUvGG433jAWoCG8/fNYNcl6B4fniJkFu3LEWB3XYpn3qx/
	Kdu86rw+yi5aobkZ88306r8OzyttwF36izbCEvtbxfZwi496tLlMn0fqsUc1j3yCu7I=
X-Gm-Gg: AeBDietFpZZgoAQl4QqWHkZ78RInkKpH9JKIY3dKDfvUJFcSJcn2ZjR7M/JHn71wkdQ
	zV2H4ALGhSdFcYLUEKmIEMAfRLNspmma+115ltTotsW5j3/3w/rbBeV5/z1bIabyDl59BjUzThi
	u7aAM07cfPEmMKtlFodaMLHepKc6ZnECFvP6gbJb77ANwAbdImdnQYSRWD7Xe73OKqIGnKUiNFV
	HjHzMrhLEf/XylbSltj35pqa+p1xefzG2q0fPDwbMArNd0K7fgR74U5aYoqADZy4fC5v/mPZLAi
	5p6a+d9H0FoPM+IYe7U6Gjoy51obgEqnDX+ZLDgUNFHMCEyq5q/CPNjBFTUkUDLSa/7mB/iWLOf
	7MBx0MN1fdNfctuVRaAylEJOeXJBUY8YNf+bhifsTyGAAiA2nNlNzlecEMR5dsmtyjKoBdixv3p
	WZlSzKDyIyEQQqOVNcIvZWyYhW0gNOl2UfYhskIMiymf9XHwn1FmjTt9JSRTyeIoMraUzcO4lUl
	hR1xw9jyHiii/78c6HFPLSCgkL7+U2BZkjFAno83amhhEj5cZk0xebSdCO/8h6iPtE8FA+hWyhR
	JImizQtJ0LN9L2hQM0g=
X-Received: by 2002:a05:600c:3e05:b0:489:1ff1:74df with SMTP id 5b1f17b1804b1-48a9852fbcfmr256956845e9.1.1777998332149;
        Tue, 05 May 2026 09:25:32 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6bafsm737620655e9.2.2026.05.05.09.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:25:31 -0700 (PDT)
Date: Tue, 5 May 2026 17:25:28 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Andrew Lunn <andrew@lunn.ch>
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
Subject: Re: [PATCH net-next 12/12] arm64: dts: qcom: qcs6490-rb3gen2: enable
 TC9564 with a single QCS8081 phy
Message-ID: <afoZ-LuVRaX6ixs4@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-13-elder@riscstar.com>
 <d29621c3-07fc-4720-abff-d8901a0d791c@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d29621c3-07fc-4720-abff-d8901a0d791c@lunn.ch>
X-Rspamd-Queue-Id: D915C4D1467
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[riscstar.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-36232-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,riscstar-com.20251104.gappssmtp.com:dkim,1c:email,aspen.lan:mid]

On Fri, May 01, 2026 at 11:09:42PM +0200, Andrew Lunn wrote:
> > +					tc956x_emac1_phy: ethernet-phy@1c {
> > +						compatible = "ethernet-phy-id004d.d101";
> > +						reg = <0x1c>;
> > +						reset-gpios = <&tc956x_emac0 1 GPIO_ACTIVE_LOW>;
> > +						reset-assert-us = <20>;
> > +						reset-deassert-us = <20>;
> > +
> > +						pinctrl-names = "default";
> > +						pinctrl-0 = <&qep_irq_pin>;
> > +						interrupts-extended = <&tlmm 101 IRQ_TYPE_EDGE_FALLING>;
>
> What is probably wrong. PHY interrupts are level, not edge.

Thanks (and agree). Will fix.


Daniel.

