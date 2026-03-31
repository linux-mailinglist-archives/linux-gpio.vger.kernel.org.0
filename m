Return-Path: <linux-gpio+bounces-34470-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIHXMV2fy2loJgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34470-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 12:18:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AB2367C63
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 12:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 454C8305C729
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 10:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075723B52E0;
	Tue, 31 Mar 2026 10:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="SH5HD3eD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JheDDw++"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25EF3CCA16;
	Tue, 31 Mar 2026 10:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951943; cv=none; b=LREEWHDEm42nFGu4CLD0y1Xbvt9CUxwSGVUSxOpfA9TTzFNMZs5FqPbNi9ZvjrBtEh3e36A+gSZjQi8T2a3blCWEzgo7HRolkLYyFyQbrUHYIHz4U/AFKYH1edRjbRbqgEs60vcJcADOjHkv4BY3oBuU88GM0Yr3EO7Id646LBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951943; c=relaxed/simple;
	bh=ED7tg0lfon/aB5lbP4hi2wJ6i3VH5bCIJ3/mOjYixwo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=uTPIpzb22rhnvQ7Mj1HnLj5gyG69WCGJA3BD4bM3ZRz60X7sxoUlkEen3R8f/mZE2knA6TONSJMKd5qdGNYDIMBExHparYhnsbWomthFsq5a/UUlqbKm99yOdlrq4gTElJL9CDasJ1twfNn3Aegqq8d3hQIv7OhqiLfVwumdqUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=SH5HD3eD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JheDDw++; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id F12ABEC010C;
	Tue, 31 Mar 2026 06:12:20 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 31 Mar 2026 06:12:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774951940;
	 x=1775038340; bh=Ppm8Ahxu3yD+PaCS+Jim/Aqx0Ce8DbNQlo2I+oBEARU=; b=
	SH5HD3eDFjqigcr/67yohxqmEFPcoDYm+X66SGibt8qEGfUvVYOF8Fb2pErlBdJk
	gS3Fk6APUCJC/Ydbo8NykY5BH7rKOfxiQPAvYxpk2MF6J2dUNoAKxTLnGoYPxFmU
	DQkhNlRqRr7Ql/QCON1ryH0nim/eKY/AWEBnKuinvp1XmblZDTdgoGUgDwrOZ4/c
	PrX0ZhZIBl2SDv3cSHI13UhpclcUE99/klk6NBGiOPLwJHqLLnwcuDT6M+lGFxmi
	31mOciEGB32HB1X3EhK7cZRlOCkP4WApBnG7p67mL2S23snBa4j4FZolC3JYCCju
	l/kPh+S6hoFiUjigRyZ/bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774951940; x=
	1775038340; bh=Ppm8Ahxu3yD+PaCS+Jim/Aqx0Ce8DbNQlo2I+oBEARU=; b=J
	heDDw++4zOPnwVEt4nKnSX739unAB96P1xTMIZdCDH59ovLtEUqU6WTkp/KAx/s/
	g2a9M9SJRSu5eXpToDVGv8ufqm9yRYH4fxX2JoAPLcs6gSDXd11ZuibCA3rH9Z5X
	snxpvBtPvz2otie2z1+/bmkHMV3HkH5LGydrDouPm1rov3J74auD1ikEQOb0eZXU
	3Z3VO/BrEiZcso9tl9HAize72+MxRmq9bwNff/cJNcI6J8Pb+MtpwGpq7Heo4kbD
	qnuxlxQEoF623TGCBAC3LKmYtQhrKgtY2kX4CzUg5bxCmCt0ZEsrZYOg2k3ebwpo
	nNSGpta9lQvDABDyHgvXg==
X-ME-Sender: <xms:BJ7LacTMVsVR2n3PY_TFnbd3-JVesOhKJHqrEfgZBliveklaH6ZTaQ>
    <xme:BJ7LaUkbLJqcOkbDAT0uuax9_BhkPUyeEdcXB-S01Z9G69BSehW__hR0yrVpe1mfX
    ZglUg91dBZx_bPoofZ_vNKZsRhoVyApPO4Z-mh39os0B8-UwbH8rXc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefgeduieduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfedvpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheptghhvghsth
    gvrheivdehudehsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhgvshhtvghvrghmsehg
    mhgrihhlrdgtohhmpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehk
    rhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehr
    ohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:BJ7LaddLmIq35YemD71eYqqc6mzG5eLijk23RuFEQ3BTb8wC75g4_w>
    <xmx:BJ7LaYsk_2JHQ6SFNpX-EkzZ6nmJyF2phArkF-dCiaVchnnRWU1eEQ>
    <xmx:BJ7LaSmHEKbIz7QwDnLsC5Q6h0EKLqK7cOfq3XMumq6xK0XOoWjCCQ>
    <xmx:BJ7LaUNKtVS1PZvg4n9AvAMg1JNydzOj-lm-Bm8Ynj5veo9TpfFhQw>
    <xmx:BJ7LadQ-ubt37WZVfMH62Qp9RhbIYCL0YTWmv2MWnCrvo8iyrsXaBQZK>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5ACF3700065; Tue, 31 Mar 2026 06:12:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ABMmOHXEXk43
Date: Tue, 31 Mar 2026 12:11:40 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Khristine Andreea Barbulescu" <khristineandreea.barbulescu@oss.nxp.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Ghennadi Procopciuc" <ghennadi.procopciuc@oss.nxp.com>
Cc: "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Chester Lin" <chester62515@gmail.com>,
 "Matthias Brugger" <mbrugger@suse.com>,
 "Ghennadi Procopciuc" <ghennadi.procopciuc@nxp.com>,
 "Larisa Grigore" <larisa.grigore@nxp.com>, "Lee Jones" <lee@kernel.org>,
 "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>,
 "Aisheng Dong" <aisheng.dong@nxp.com>, "Jacky Bai" <ping.bai@nxp.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Alberto Ruiz" <aruizrui@redhat.com>,
 "Christophe Lizzi" <clizzi@redhat.com>, devicetree@vger.kernel.org,
 "Enric Balletbo" <eballetb@redhat.com>,
 "Eric Chanudet" <echanude@redhat.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org, "NXP S32 Linux Team" <s32@nxp.com>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Vincent Guittot" <vincent.guittot@linaro.org>,
 "Rob Herring" <robh@kernel.org>
Message-Id: <e1c341d6-e60d-4200-a094-48667e8ccd5c@app.fastmail.com>
In-Reply-To: <4c46909d-641b-4389-bc4a-29394cb1d46d@oss.nxp.com>
References: 
 <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260120115923.3463866-2-khristineandreea.barbulescu@oss.nxp.com>
 <20260121021913.GA1704619-robh@kernel.org>
 <e956750b-0333-4465-b37e-5f460b5e092f@oss.nxp.com>
 <edc3a63a-8117-476f-9582-97ae31fefa96@kernel.org>
 <7d200097-51bc-4404-be8b-f536d0ecfc25@oss.nxp.com>
 <21531cdd-5ab9-493e-a722-61b98117e2c4@kernel.org>
 <22a5a072-847e-4cfd-8abd-e37163f73265@oss.nxp.com>
 <fe755e85-1558-4272-bdd4-af7a2038ab1f@kernel.org>
 <ba6140bf-237e-4099-af0c-ee404c1719cd@oss.nxp.com>
 <c7a59716-3d53-4787-b4ef-9674c2a4a9b5@kernel.org>
 <3c454da1-d949-4258-87ce-8b545000bf01@app.fastmail.com>
 <5f1b651b-1064-4280-a7e0-b7d66c396cde@oss.nxp.com>
 <f3ff461b-edd7-423a-ac99-e70145aaaaea@kernel.org>
 <4c46909d-641b-4389-bc4a-29394cb1d46d@oss.nxp.com>
Subject: Re: [PATCH v8 01/10] dt-bindings: mfd: add support for the NXP SIUL2 module
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-34470-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.924];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,app.fastmail.com:mid]
X-Rspamd-Queue-Id: B2AB2367C63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026, at 09:48, Khristine Andreea Barbulescu wrote:
> 
> With the current layout, the SIUL2 node itself now contains the two
> MMIO ranges directly, while the remaining child node is only the
> pinctrl/GPIO function.

The thread started by saying this is an MFD "It can export information
about the SoC, configure the pinmux&pinconf for pins and it is also
a GPIO controller with interrupt capability." Having a combined
pinctrl/gpio/irqchip driver is normal, but can you clarify what
you plan to do with the "information about the SoC" part?

Was this a "soc_device" driver, or something else? Have you
concluded now that this is not going to be needed at all?
In that case, I guess having a monolithic driver is
indeed simpler than an MFD.

What I wonder about then is whether the binding needs to be changed
at all. With the current nxp,s32g2-siul2-pinctrl.yaml binding
and pinctrl-s32g2.c implementation, you seem to have a monolithic
device already, though missing the gpio functionality. Rather
than completely replacing this, I assume the easiest way then
would be to add the PGPD registers into this device node, right?

It is still a bit weird to list the individual register areas
inside of the larger device here, but that still seems better
than an incompatible binding change.

    Arnd

