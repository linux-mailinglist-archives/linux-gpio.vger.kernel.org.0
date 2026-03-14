Return-Path: <linux-gpio+bounces-33413-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gI9+COcOtWmZvwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33413-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 08:31:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EA628BF12
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 08:31:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E74030432DB
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 07:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571F422258C;
	Sat, 14 Mar 2026 07:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="vIUGI6PU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="5th2kdid"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F4C2E401;
	Sat, 14 Mar 2026 07:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773473505; cv=none; b=EA4z/eIesyqxXMRQFJoRVxnOh9orcr2dxd28JyZxgeatG5OMv18dEZg3vod+BvnwYTG+SFlufss0CZoQzu+HCoW6QT2st6/b8QRNc6KO3CE7/pVHMJTd/hOIsG/plChwlC0WfhWPN0+BpprCson7TNvGJ7HvVqUx69myruXSrrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773473505; c=relaxed/simple;
	bh=jkjgiRgO5CR/7AlJE6LIfCfOcumeVzGdYAHPWElQBVQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=F+R7UNbWSzDUOH6GsWFIMtxkszmnGX1a3oSgxEt6GaRyWkkIGHN/HSxPsVKFgyNe1Nmm9k6cg22Pf8rTp8CZGTmpvvXuIHHG/93biDhpNmfpc5hPgOXVMFfKzvgcEv7QGFdxdnr6k3TMN2jMnyd+Wnh80bfZ06thNcdbnMc/61U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=vIUGI6PU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=5th2kdid; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3129E14001B4;
	Sat, 14 Mar 2026 03:31:42 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Sat, 14 Mar 2026 03:31:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773473502;
	 x=1773559902; bh=tr3JbOnsJoUpDM+B2gJBFvxjmzg4yKH8O1IiAlVJkN8=; b=
	vIUGI6PUtGuLD9MmA7He5MaSxNXymLe5VmuYEFztVyE2ey+TWlMs9wpbxm5m0SHW
	/2MY8ZrghTSl0nxKsljeSTgPW+7p2aNF0g4qV2yoO6XpYUj/LVu30Hj8CfWufek0
	A1ntnxABTtEhR3xW+MmMkQfJsoh3KUtT1ghtLu1M5QbHvVh+GWUUHo8TgXT+f/X/
	Kj4DEr+3ffZQQJXQpu8gspe5isusRZ6zNkuOU8WlCbigR6WWowRvClVOVkMGZTaL
	PByD+pWip5jGOEaxIWOemgmWOR5EG5wYkProLjqgXoc3Y/ePf3F06VU/rN8mVjdo
	+i9Y4A8uLsATQ5NmWUtUMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773473502; x=
	1773559902; bh=tr3JbOnsJoUpDM+B2gJBFvxjmzg4yKH8O1IiAlVJkN8=; b=5
	th2kdid27NE2Q6Zf9HnTICg3grZm+GQN8HsdEBThJAfyx7j20KSsUU1MYkh+L3Cd
	CqJltfa1L4xTSkgSbx+l0/ZTbNDjjMKLeEncvOBuhU2TYlOZzzd6D5Imus9dxltE
	VqVX19DARJc5XHPxZVXM48Z+c4E2pBoYtf/iFLuaJPcd4IHeey22JaIbC0x6xGIb
	ikkVsNzGteydWH2PtuZ0C/YslE7OPGkPhMQADG5wSXECX8PYBUu4BALVhFkKfKzE
	QiWe3OcNb0B2Nj/iJB2T32XvubR3VQHwUA8jrRGMImZN2CJiDMjNSdBB4h/LgUtI
	DEOymQpmWEWhgkE3k4cqg==
X-ME-Sender: <xms:3Q61ae0qyzq46sW3iFr4nwLH-QablCM5EpxY18ktNc9I9ruTP7yZEg>
    <xme:3Q61ab4IHYWF-tJxe2XeLHOdgsjAAth3Fk_lV_Qk70vSY_Fap-Uc2C7cQE3cdkeVZ
    nKgVbw8tMpu_zRj8GS5FqDhxc4RXmd6wEi5fmdqsJM6wvSpxK3_9PU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvleduleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfedvpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheptghhvghsth
    gvrheivdehudehsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhgvshhtvghvrghmsehg
    mhgrihhlrdgtohhmpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehk
    rhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehr
    ohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:3Q61aUC5SLAg6F46AVIdW-J6XHLcwTogwGCVkA98DKm3dcj7q-gmNg>
    <xmx:3Q61aUAQNtztZSaLvN0Ifx0l1VuiwS33s2iYj60XNAqazeuEZ51_1g>
    <xmx:3Q61aTqBE9u_uyIR9Q5J02qjuzP-epogqXeYePga7yjWs8xHlmbrOw>
    <xmx:3Q61aYAJUdlRMadUyUsf5YTcfIgInbuyUbMq4qleODkVz2y49zLAPA>
    <xmx:3g61aW2PxF8orihiR3Uh8UCLvDymWO1grtBE7zb-D4zegmREAp-v4m3k>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 44D63700065; Sat, 14 Mar 2026 03:31:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ABMmOHXEXk43
Date: Sat, 14 Mar 2026 08:31:20 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Ghennadi Procopciuc" <ghennadi.procopciuc@oss.nxp.com>,
 "Khristine Andreea Barbulescu" <khristineandreea.barbulescu@oss.nxp.com>
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
Message-Id: <3c454da1-d949-4258-87ce-8b545000bf01@app.fastmail.com>
In-Reply-To: <c7a59716-3d53-4787-b4ef-9674c2a4a9b5@kernel.org>
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
Subject: Re: [PATCH v8 01/10] dt-bindings: mfd: add support for the NXP SIUL2 module
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-33413-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim]
X-Rspamd-Queue-Id: C0EA628BF12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026, at 18:10, Krzysztof Kozlowski wrote:
> On 25/02/2026 10:40, Ghennadi Procopciuc wrote:
>> On 2/23/2026 3:14 PM, Krzysztof Kozlowski wrote:
>>>> there are no resources allocated specifically for nodes like
>>>> "nxp,s32g-siul2-syscfg". Their consumers are the pinctrl/gpio
>>>> driver and other drivers that read SoC=E2=80=91specific information=
 from
>>>> those shared registers.
>>>> =20
>>>> My alternative is to keep two separate syscon providers for the
>>>
>>> You got review already.
>>>
>> I still believe that nvmem is a suitable and accurate mechanism for
>> describing SoC=E2=80=91specific identification information, as origin=
ally
>> proposed in [0], assuming the necessary adjustments are made.
>>=20
>> More specifically, instead of modeling software-defined cells, the nv=
mem
>> layout would describe the actual hardware registers backing this
>> information. One advantage of this approach is that consumer nodes (f=
or
>> example PCIe, Ethernet, or other IPs that need SoC identification dat=
a)
>> can reference these registers using the standard nvmem-cells /
>> nvmem-cell-names mechanism, without introducing custom, per-subsystem
>> bindings.
>
> nvmem is applicable only if this is NVMEM. Information about the soc is
> not NVMEM, unless this are blow out fuses / efuse. Does not look like,
> because SoC information is set probably during design phase, not board
> assembly.

Agreed, nvmem clearly makes no sense here, the patch description
appears to accurately describe the MMIO area as hardware registers
with a fixed meaning rather than a convention for how the
memory is being used.

That said, there is probably room for improvement, since some of
the register contents are read-only and could just be accessed
by the boot firmware in order to move the information into more
regular DT properties instead of defining bindings for drivers
to access the information in raw form.

    Arnd

