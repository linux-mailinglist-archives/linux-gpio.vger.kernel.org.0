Return-Path: <linux-gpio+bounces-36456-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFC9HJXK/WkpigAAu9opvQ
	(envelope-from <linux-gpio+bounces-36456-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 13:35:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E408D4F5D3A
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 13:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F076C3014BE9
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 11:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9333D646C;
	Fri,  8 May 2026 11:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="MW59a+50"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1594C3D47DE
	for <linux-gpio@vger.kernel.org>; Fri,  8 May 2026 11:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240007; cv=none; b=kOIDQ8YLv3T8KJ7Gu+GThY+bPVherZU8mT0IIUBNRuz4KR8C1HjrT/XnKXT9R7h04sc97zyl3Z3p+5kVQA3o5TmxpBHUdE7eTINXGkMo9wYPaTgl/5x3/cxkFxY4F3NAQplRj3RxLm6/kjacpioXZ8ITE5i07b/uAqIHNi8UP3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240007; c=relaxed/simple;
	bh=0hrQlW5FpcXozs6wxkIBzDktzohYeRr936w21ThvyGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=StGrEwL2HbPtwPEvkGsimAAg+gWBqyWb5GcJie6sgDiXHMApHoPfJQ+vrMjJIvrQqYIVzjOQmue5KuAGWOtYIWcJaVE1FELXs0AIxk6dtoUDDbE3mSjitX0LHK9wvUl4Lew6eVJVGm1gdosj5tL0Bhu0RSzqlHlyOKKruNI+Q/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=MW59a+50; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a87782588cso2435315e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 08 May 2026 04:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778240002; x=1778844802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i3oCf6JjY2k4f2DdZmgb+d8lKs1DeUt4qK3/lGPB5dQ=;
        b=MW59a+50NCnmHlAoDmRQzX72oj5QOBzO3bHXjHFGFievJrkNy8PKDNBY0e4TsAgcF9
         xAULs4lEXSJtkfl+htthLSsM1OTtj1QPQoDhKwVr/Yur1D5BUnEOW/mlEkKGcPwg2fq4
         EV35MWuv5b9z5Js1ljrKL5CQ7nk/xy+3A21ZDS7wgzXixEamWNTWsEO15jqqF+xsoZWd
         NhIuq6pFFbmaGiJ7HMXkjgkZBnDvBZvLIGljVT86WZ2G3s6PT1fQ8MCaPpdjVRTYqumF
         I2WfdSWOd/tiR8Z2PfPdj6jX0jqaB1v3uozintfbEBcBfJXb2rh3XYtaOpWcb5/VemFw
         wdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240002; x=1778844802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3oCf6JjY2k4f2DdZmgb+d8lKs1DeUt4qK3/lGPB5dQ=;
        b=ZdWynNJqGe+JDFQNNLEBXvSWaXoGc4tyBIqefVYrx7iGY5BaeZZWpbWxvozexyoPP/
         es1Bc/+ofOw9Kt1E2KXbpJBTophQQsTl6XeAR2Vbe8RJ/JPBeYrhSceKfrn45zEKzeGn
         uHSmAuW18se29mcblCxLbB8Cwa0MIdnytguK20/tyM8c1iLOiAqB/x3kwTSSbz2mUnEv
         PNwxdSeVLx0rx1UdpMFCuH32br0fZr94yJuTR8iDxSbpVsKnFFz7kYkdXlKacXyI8fii
         vCH01oMVDaCV5yNgOl5Y6/4n4pQIauFdtcLn2e5TrxWRMIsm9O2wsuzI/5kNRQVshQUQ
         ePkQ==
X-Forwarded-Encrypted: i=1; AFNElJ86EV6VLIedulie8FA129ca+BvvrdZcSnDyRGyqHcbVBXQgX4LoOxF3aVERlzF5ewGgJLFbsg0wizAf@vger.kernel.org
X-Gm-Message-State: AOJu0YzAgtGP8zLKw2q828nS1W7NnEMzxziOcXGAOr6KP+ETt76+UMu+
	AmJNmRiUUFnvKVyzt5pbLqxS/HldR4v2yZcG2rFFU1vXbsbkJZ+jalPNQ3JRLbyBGJVgxw1rONX
	259eimq0=
X-Gm-Gg: Acq92OF0Wy+VBy34J0k3L8ubA6vlgVF6WpbSY6iuyecUipBR//h5X893ZkzT5QGESvC
	iQJEzoP48DoftJ176kK5ANF4A7YlPlGmmBgcC5s0TyMAr2wrgMgGFY5ZM5JPQi3NCZWYpLV1L36
	WJgvvGx2hrzb7vhLpOZ/xi1gG6qqdD55wUFovJ116y4LCclLM+GrO6j5+Jmlfujcb1XLpInAqLM
	CX2bjKIOFOyWoAu7GbjeZI6D8yHT4Bbph+6Fad7HGs27f5cwEy5jtet6qwor+05kLMhlXzTjLnv
	JFIzZxOCgYlrAgGCBkms05V7FOc0w92MtrJ/3LklJR4ctnc4ThP1yYcKL9GNpv/t/ekgvi5Y/7X
	qlcmYW0OKReh+iyk2mngYSQdTV9sJRvAfBRTQDb0rzurMJjC5gJbsRX7K3fCrRHjxOZbWh41iCw
	K11O9QLrt1hbsHoJRm1pd5RtP+po3mUQDH17woLCpmF/HTdcdkK/pTB4Ip/5/LEQP6QFg2krKWI
	fKy6HrB4ha4typT6PSNgNU6aye19p4Wit6pbFY60HCMyjYMF41lrqsdNe8hO1f777YEaEw+6Wm0
	zp3ORbD7
X-Received: by 2002:a05:6000:26c9:b0:43b:3b80:6776 with SMTP id ffacd0b85a97d-4515d3dc30emr18803689f8f.30.1778239532551;
        Fri, 08 May 2026 04:25:32 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454917d57aesm3814079f8f.26.2026.05.08.04.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:25:31 -0700 (PDT)
Date: Fri, 8 May 2026 12:25:28 +0100
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
Subject: Re: [PATCH net-next 10/12] net: stmmac: tc956x: add TC956x/QPS615
 support
Message-ID: <af3IKKkjl0jK8GGB@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <2ce5897d-5bbb-486a-b0f0-0e30e54b451a@lunn.ch>
 <afy34kj2hPxIlArO@aspen.lan>
 <ef6df85f-11ac-404d-958a-8cf69b3b6bb6@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef6df85f-11ac-404d-958a-8cf69b3b6bb6@lunn.ch>
X-Rspamd-Queue-Id: E408D4F5D3A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[riscstar.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-36456-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,riscstar-com.20251104.gappssmtp.com:dkim,aspen.lan:mid]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 06:29:15PM +0200, Andrew Lunn wrote:
> On Thu, May 07, 2026 at 05:03:46PM +0100, Daniel Thompson wrote:
> > On Fri, May 01, 2026 at 09:04:58PM +0200, Andrew Lunn wrote:
> > > > +static struct tc956x_mac_speed mac_speed[] = {
> > > > +	{ PHY_INTERFACE_MODE_2500BASEX,	SPEED_2500,  SP_SEL_SGMII_2500M, },
> > > > +	{ PHY_INTERFACE_MODE_SGMII,	SPEED_2500,  SP_SEL_SGMII_2500M, },
> > > > +	{ PHY_INTERFACE_MODE_SGMII,	SPEED_1000,  SP_SEL_SGMII_1000M, },
> > >
> > > That looks odd. Some vendors implemented 2500BaseX using SGMII
> > > overclocked. But that is not strictly 2500BaseX. Having the 2500BASEX
> > > entry suggests you have real 2500BASEX, so why have an SGMII entry
> > > with SPEED_2500?
> >
> > This is a consequence of the code that uses this lookup table being
> > called both during initialization and from the fix_mac_speed() callback.
> >
> > During initialization we only have the value in plat->phy_interface to
> > go on so we run the lookup table using plat->phy_interface (which is
> > typically PHY_INTERFACE_MODE_SGMII) and with the maximum permitted
> > speed.
>
> Something sounds wrong here. SGMII only supports 10/100/1G. You should
> never be asked to do SGMII at 2500. It should ask for 2500BaseX.

We weren't being asked. It was just an internal driver trick to common
up some code paths.

However I did a few tests and the internal driver trick doesn't
actually do much we can't achieve a different way. With that changed I
can (and will) remove the PHY_INTERFACE_MODE_SGMII/SPEED_2500 entry
from the table.


> > I haven't got detailed enough notes to allow me to double check but I
> > think there were problems completing the initial MAC reset if we didn't
> > write something sensible to the hardware during initialization.
>
> > During fix_max_speed() we get told to adopt 2500base-x. Reviewing the
> > code I can see we don't propagate that and just use
> > plat->phy_interface for fix_mac_speed(). I will fix the code to that
> > the requested interface propagates properly to the lookup table but I
> > think we would still rely on the SGMII entry to get sane initial values
> > to write to the hardware.
>
> Getting sane values into the hardware is good, but 2500 SGMII is not
> sane :-(

BTW if you are bothered by SP_SEL_SGMII_2500M, that name comes directly
from the TRM and I'd prefer to keep it if I can. The enumerated value
we have to write into the SP_SEL for 2500base-X is "SGMII 2500M".


Daniel.

