Return-Path: <linux-gpio+bounces-13305-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 843179DA293
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 08:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C78611673D1
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 07:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1564148304;
	Wed, 27 Nov 2024 06:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="d/hfn2e5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ReCEv65H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631F613BAE4;
	Wed, 27 Nov 2024 06:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732690796; cv=none; b=lV2td8E+i8dK7DBfbGdnj0ju3DY9o2eBdx88WZqRGJGFeYaX/1wWJ21GLDJ5TXKHfEZVIZX0z8JJxSKLB9HLSgPM143wC2FGntQJ8jxmccdIpvD05bSMT/PFQfsERHZV1ZW0gdlINWb+ju9z0slC5XXjnKW0QdrYCgCbq2EsTf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732690796; c=relaxed/simple;
	bh=z2k2FPmeYeD7YEJLXiMJm2AVYkDzjw2DD2GJtiYcJXY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=tyRLjEOgzicS8KRpDSBYoLiQkwzTYqxBrfqbNBMsZ5wv2xdSlyIrOpxFojuZdKLBwtkcK0ETawQcbmIak4u/5yMwOEKuaoa1E0Xtx3FyAA7KdwIQ6oq/8POsgbQM599jmpnbn+bqGja/Zjyxdl4y6Zxgi+5GWoaDX5OGwDMBoOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=d/hfn2e5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ReCEv65H; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 512481380650;
	Wed, 27 Nov 2024 01:59:53 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 27 Nov 2024 01:59:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1732690793;
	 x=1732777193; bh=/dkBCpxMRicHp1J617Swu7hSxvIKAmw8XcVl1p1pm44=; b=
	d/hfn2e5ZupZSdn1UrqO2idtH2PvbQUI7UnPIMKh1lZ5j5yogQqJFwop+fUzKpQy
	wKe5pZRC4XggX3cP5FXEfn3NKz4LDX8y+cSrbhFQnn/OdM3ag99ElCsVhCj/yzj3
	790hzaOPccly0LNLbnVqKfPMYxDE3yk4FoTWTo19V3HTKI32NOVgywgTRj5qCEXf
	kiLkL9nodUGIaZf2mUEldkboWw8DSGcCSGzdy3jS/ayd7RT/pEw14EIjrPJyL+8g
	Fm0XTZSou/m8L2xh479eEHPbVY+3n9amTTz3BubZWK2ffgt63ee6cu+2NROLOpGP
	cBpVW/YKUFSd3SOUp4Ykmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1732690793; x=
	1732777193; bh=/dkBCpxMRicHp1J617Swu7hSxvIKAmw8XcVl1p1pm44=; b=R
	eCEv65HiKSbRUH2Gq+RXQk3OQ9AZmGvod33rSVf32iW5mxpOUeD0MzdfjH1k8Fwn
	B/n4UiLFKQY0TlkkEHvWwL3bVBLBSh5UBcLZ1BooOLo9WvGqtnMJk7HlVB+THrMv
	bWIxPHpSVd+TW8RZRgSPlX1jqmN0UvjMADFHbRwRwZGYP2PPxoYo9MpgPvN4jCgr
	VpDeq31fNj7facdQz59sxfoSPXQnNU7jcqdkXd2n7cOjGoiyjrVQe/Zovq+tvXJ0
	CrGi9II9JSMcBibPqVuV5uie864W7YIwqHC2UyszPlLrJEC/2kzNdka66U67YhdX
	S/rFVG1Pv1AeemQ9Bw07w==
X-ME-Sender: <xms:Z8NGZ7QWSo7NkfLg453N6RCWFUlNwr29YwmZv6msgocnON0yBAOFzA>
    <xme:Z8NGZ8x-13OC7iihOFyEL6UQfED8wD7vrTsNDKKQVSw-BXLbu9vvz0s90drbvXU-j
    MytlzKVfaKCV2RemXM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrgeekgddutddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudei
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugi
    drohhrghdruhhkpdhrtghpthhtohepfhgvshhtvghvrghmseguvghngidruggvpdhrtghp
    thhtohepvghssggvnhesghgvrghnihigrdgtohhmpdhrtghpthhtohepfhgvshhtvghvrg
    hmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhr
    rgguvggrugdrohhrghdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvg
    hvpdhrtghpthhtoheprghishhhvghnghdrughonhhgsehngihprdgtohhm
X-ME-Proxy: <xmx:Z8NGZw2dHLJAxepzVxODX8m9zY6TyhfRtQTMMbbu5HhEmW6aw1vNfw>
    <xmx:Z8NGZ7D4J9479QHFI34qDA-u0LdKouX6WB5tWv-yk4WgnYmHx5d8iw>
    <xmx:Z8NGZ0jH9p4lThNE_vOrJZBUsqNPp4-xPDamuorS4BmZ8DX20XXzaA>
    <xmx:Z8NGZ_olZA0aEAVQDFY5ycZbzBPMvVnCLgi6MLqdUnVH773p7H1XLg>
    <xmx:acNGZwzZj3z7XfDRA5Y0tSmcPd1vo3TyT8meEfRYIU2wP7ldEXvgXsbV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8E4122220071; Wed, 27 Nov 2024 01:59:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 27 Nov 2024 07:59:31 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Fabio Estevam" <festevam@gmail.com>, "Guenter Roeck" <linux@roeck-us.net>
Cc: "Linus Walleij" <linus.walleij@linaro.org>,
 "Esben Haabendal" <esben@geanix.com>, "Russell King" <linux@armlinux.org.uk>,
 "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Dong Aisheng" <aisheng.dong@nxp.com>, "Jacky Bai" <ping.bai@nxp.com>,
 "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Fabio Estevam" <festevam@denx.de>
Message-Id: <4af23996-a618-4816-8375-d00748be0700@app.fastmail.com>
In-Reply-To: 
 <CAOMZO5DW3t-sof_uaFa_qJPE3WFq_155mFTxGMWh0m++csgopg@mail.gmail.com>
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
 <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
 <49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net>
 <CACRpkdaBR5mmj43y_80b9jd3TAqRWMdCyD9EP6AY-Y0-asz4TA@mail.gmail.com>
 <1ff005f8-384d-465e-9597-b6d5fd903862@roeck-us.net>
 <CAOMZO5DW3t-sof_uaFa_qJPE3WFq_155mFTxGMWh0m++csgopg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 27, 2024, at 01:12, Fabio Estevam wrote:
> However, after thinking more about it, I wonder if the patch in
> Subject is worth it.
>
> It can help reduce the kernel size for LS1021A that does not need
> pinctrl, but on the other
> hand, it will cause pain to lots of people who have i.MX products
> running custom defconfigs.

How about moving CONFIG_SOC_LS1021A out of arch/arm/mach-imx/Kconfig
entirely? As far as I can tell, the only file that is even
compiled in there is arch/arm/mach-imx/mach-ls1021a.c, and that
one is not actually required.

I think we can just have an ARCH_LAYERSCAPE entry in
arch/arm/Kconfig.platforms instead, or maybe keep it in
mach-imx/Kconfig but drop the CONFIG_IMX dependency.

The only thing that imx and layerscape seem to share is
the platsmp.c file, which has code for both, but nothing
in there seems shared. Maybe layerscape can just use
enable-method="psci" anyway, if that is implemented by
the firmware?

       Arnd

