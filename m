Return-Path: <linux-gpio+bounces-34486-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mL3BM1bWy2mILwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34486-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 16:12:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E4936ABE1
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 16:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51989304C138
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 14:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C523B19CB;
	Tue, 31 Mar 2026 14:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="B1LCww5S";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CWbrwQ7W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ED737F00F;
	Tue, 31 Mar 2026 14:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774966136; cv=none; b=erjyUJ3PlZubD5ppHhKpDAgV8PEaCwSkxwD/I0qtbQ9UEdyD9w1pYTpcYO6UdK9yxfwa60Hb2lfWZ+/IPXmEIyszLxsZwgzlc+9jDJzQmY1UImUcmlj2cmv1qqRgxJQQuqGxrYmccDB27AM9MpoFRv/m59ev0oxYCArjaIssuiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774966136; c=relaxed/simple;
	bh=rnxwcNzb3fPolYDOHzrOQiXvCPNY8XDxsBQaUp9OUnU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Wje/NoxBAJYpzLT82hcixhy4ciSNdv3/3ImMKdD6bDMHASS0QsT1ZRxDQkWYrGkxCft8ET0Uy+ohJ5v22ffZKc/rTu9i7QBSIiTJlelZvUuGQPrWRtB7zZeP1D5yiYPW1OMzej9HUrztGaf8r83hCINlWI/h9zMrVZxnKWSnhGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=B1LCww5S; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CWbrwQ7W; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 120971D0018F;
	Tue, 31 Mar 2026 10:08:53 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 31 Mar 2026 10:08:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774966132;
	 x=1775052532; bh=+wB5qVtq/fKVMAqMqoSITrLfao0bHO9kdmdL6ob1esQ=; b=
	B1LCww5SHprChvjdDhQI4LHZjDChEB2tZO8cjxh8WpbQZRShsreuUnnSTnlL3Ahn
	QCrNsUp35Pbx5nswQcBH0oZhDglNNa32RyMScKs8kvUZY0NiWEIoza0NNxuNW0Ld
	d4vNO5k9+oSPNTeUj1BfIIypgD1x0Shljb/8jBYd+qUE4KBzUiUVC6UHHOk1ioBj
	25q1L9bl+kdWJa00VZeUGVC5hiQw+7lA8K/aOc7s2tR6wNweOpvcbHPQPRC0z2sl
	FTGPKJAohRBpJQu99nfNqaTWRzhKWLqz6JMiA0Sv5wo0ChMf/hVp2VvR8W6cSCUU
	8C/g2dF9xSKEkjFusZhxwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774966132; x=
	1775052532; bh=+wB5qVtq/fKVMAqMqoSITrLfao0bHO9kdmdL6ob1esQ=; b=C
	WbrwQ7WOlPJbXrTJ39oQjfRWzqdsAAO2jn+orvIp2vh9bj7yOlLP9iN29/e+QcL/
	S3Wb5lvEgQP9NasSAud8hCBJxB1lGiMfqrteZG/cGMdTXS68WEw9skfIjPrKRzR3
	MLrEVx7ZtkDjNj2rn4fQJqi6gdg9vKbBALveUnvvZWpn/gSxVNB4acU++9Zj0Gz4
	1fvlr+1Ny37Z5DwbVCp7IDRHRDWtFT5VvDjavE633c34iluwLsta379T6CHNXfQ8
	xTZvclmKmt8y9JJyDyvsSrW/wwiO4bOPY9cjloZ17BvhNJNpfI4sD6DJompSOucg
	0NVQIObVTrRP17AVwka/A==
X-ME-Sender: <xms:c9XLaYTAkZ8e2SygqkXmUPSfi887r1A6GBN06apjKB6aset5L0stzA>
    <xme:c9XLaQlkRLHRDxhMiY0yxXeFYhUFNpGziUk7G6SKBqiCt0ABXQS98Me2jnY--b--z
    c97HcH8dQEZBnEBvApgPnSts7piqn1eYAxgcScgUHBKPSWI0jxR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    foggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegv
    rhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpe
    efhfehteffuddvgfeigefhjeetvdekteekjeefkeekleffjeetvedvgefhhfeihfenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthht
    ohepfedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsrhhglhessghguggvvh
    drphhlpdhrtghpthhtoheptghhvghsthgvrheivdehudehsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghonh
    horhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:dNXLaZfv9GSbkLKfM-5iSaGk5mPu9owz27weaJ1tk0itL-smBqH24A>
    <xmx:dNXLaUtdjwwx6whu2Rp0Ewgf4qTI2G_YQ4ktIi059_0ldn0RhaVSww>
    <xmx:dNXLaekwdTzWIGJ914lp8fvdxQEV7G0ASaLHLhybPnIqaHPO5tH5SQ>
    <xmx:dNXLaQMRFMsVlZKpzoYJzx2wBHdt9Qcsy0V67Cqrp33ea-owvHI4xg>
    <xmx:dNXLaZS7XS-e_g_pxLDBPvibHaYx8a2TUHZ5C51W5UnEMrfIxYbyKT4a>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DE24A700065; Tue, 31 Mar 2026 10:08:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ABMmOHXEXk43
Date: Tue, 31 Mar 2026 16:08:31 +0200
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
Message-Id: <0666ab85-60ef-4eb9-81fb-636c604653fe@app.fastmail.com>
In-Reply-To: <fd8c90ec-927e-4395-85ba-9e45c23fd799@oss.nxp.com>
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
 <e1c341d6-e60d-4200-a094-48667e8ccd5c@app.fastmail.com>
 <fd8c90ec-927e-4395-85ba-9e45c23fd799@oss.nxp.com>
Subject: Re: [PATCH v8 01/10] dt-bindings: mfd: add support for the NXP SIUL2 module
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-34486-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.058];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[app.fastmail.com:mid,messagingengine.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:dkim]
X-Rspamd-Queue-Id: 67E4936ABE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026, at 15:43, Khristine Andreea Barbulescu wrote:
> On 3/31/2026 1:11 PM, Arnd Bergmann wrote:
>
> Our initial intention had been to expose that SoC-information as
> discussed in the earlier revisions of this series. However,
> taking the review feedback into account, the current direction is
> to stop handling those SoC information registers in the Linux driver
> altogether and instead rely on a boot firmware to pass that
> information forward, as you suggested.
> 
> With this approach, the SIUL2 driver would no longer be responsible
> for any separate SoC-information functionality. In that case,
> I understand your point that a monolithic pinctrl/GPIO/irqchip
> driver is a better fit than keeping the MFD structure.

Ok

> However, as you mentioned, this is still weird because it means
> listing individual register areas of the larger device inside.
>
> For this reason, I was wondering whether it would still be
> acceptable to move forward with the new binding introduced
> in this series, but simplify it so that it describes a single
> monolithic SIUL2 pinctrl/GPIO device instead of an MFD, 
> following the example node I included in my previous reply [1].
>
> [1] 
> https://lore.kernel.org/linux-gpio/20260120115923.3463866-4-khristineandreea.barbulescu@oss.nxp.com/T/#m778088251774a15bde7463350d6e75d5e9b9b57d

I can't think of a justification for making this an incompatible
binding change, if the new "nxp,s32g-siul2-pinctrl" binding is almost
the same as the old "nxp,s32g2-siul2-pinctrl" one, and you still
plan to support both versions in the same driver indefinitely.

It would seem much easier to me to make sure that nxp,s32g-siul2-pinctrl
remains backwards compatible with the existing driver and only
adds the properties for gpio support on top, so a single
driver can handle both old and new dts files.

      Arnd

