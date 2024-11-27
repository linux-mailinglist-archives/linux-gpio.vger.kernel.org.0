Return-Path: <linux-gpio+bounces-13312-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 826209DA4AC
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 10:19:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B294A1647D4
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 09:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE729192D9C;
	Wed, 27 Nov 2024 09:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="VYYICIuh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="5IgfRStx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867F7192D98;
	Wed, 27 Nov 2024 09:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732699126; cv=none; b=eYt0C3OhG8H1N3QB4Q9EnSYTO11PxGyG6Xdyy8X7O9PVSAUnjBA71awzlU5qa/2NdzvBLgXpYVWuuc+WjHzkrWkckZdoKk8JpzjQTpwN6U3k99cfXbcDKORLEP1FC0CGUQOu/rkNCMDrgHukPl0ROYagLyDZxNSF73nLJJfEDUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732699126; c=relaxed/simple;
	bh=64cKr03/CKpF0KDq6ot0uYaKlxM+MwVPMD3sqQRITC0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=KzTc1/oKWX8tsU1+aU2l3aCbpUfuQSYsA9MIYw85JOrm+C0wWG2+YsQ1pRvUj8BlHY5dOsEz4wAq/WRr1M31pUtbFZ9+0VYLE50J/hvxBHp4Qs7u09u8e1Jw2zMK2b6bSgr8sKKkaIZGjXwYmP4RO7AmjdP/26Hw46+mowjpbYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=VYYICIuh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=5IgfRStx; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7E6561140109;
	Wed, 27 Nov 2024 04:18:43 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 27 Nov 2024 04:18:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1732699123;
	 x=1732785523; bh=NmC2c7plcJ/Mcl0oI9qLJf0fBVn5qTuymhUmLJnrAcM=; b=
	VYYICIuhcr1RrCllVZyR2YbQ0PgOx+geAUXce8CI0J3fbZezFJ93/XLQt3FGunzy
	v1PJblTLjQVb/h552gYJMNAH7TI3cbJT7Dl4o1th9kF0Z4gCbL++Jjhqpn6RsuvT
	o7IYVDHkej5QI0xazXxb4FJQQvm4KHvaLgaNwU++9Hld4r58nbbP7Zh3B62P8+xm
	UGqZHmr3fdg76gbK4f3xyrhakNOwnyHDE5cPrXFLS4aNfli2X3gjQNeXiE9xJ+Gl
	yx2yWaVJ2EJ7Q7FuuMd7RY/WFnasVgGuck5JgwdZDH+CQ/xnMENL9RcDUv1Gjbxn
	l0YpS9yuYbCs7e26/Emm9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1732699123; x=
	1732785523; bh=NmC2c7plcJ/Mcl0oI9qLJf0fBVn5qTuymhUmLJnrAcM=; b=5
	IgfRStxFNKyuB7MoNhqkXbiufLh+IR1dk3i/74JBBBcsVJAOS/nmiBwBEWCowuye
	DgunWuc/GeDzWnwaDIloBrvweejeoDVzlIndP6YLOHRLtayoErRsMb7h715cKoIo
	16sQQZM4Kn7ZJNFsMm+t5n4nfW967x2tqaj0WLQWuYuH1sEpy6ICS72viIl5R+xr
	SRTEtn54CuLOXLWGWew61p0LFLQKCk8MCXjM+O4toZ1jhSYs34s4mv2AuG7matjW
	Tyy11MH5V0fQOSh45SDaA4KpbwRnagOtb/lECqdr+XRBj3+ktwx69h+J5MJtFVCE
	ufxZzJ8VZCV0o6Cg4Tqog==
X-ME-Sender: <xms:8uNGZ9Mtgrqb2LkM244MsGDBs9Rl_V-TBnWIL1Oqt2Gx4VCQCld5gQ>
    <xme:8uNGZ_8wE99PlwDfeeVEBaSWYgPOMbQPIUzRrxqk2GxyG0B3ZJ9eGLBLmGtFhpKfR
    SkXgAuFCIeRlLX-rYo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrgeelgddtvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpedtiefhffdthfeileevheehveevieeggfegieeggfel
    feduudevgeegieetfeevgfenucffohhmrghinhepfihikhhiphgvughirgdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnuges
    rghrnhgusgdruggvpdhnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthho
    pehfvghsthgvvhgrmhesuggvnhigrdguvgdprhgtphhtthhopegvshgsvghnsehgvggrnh
    higidrtghomhdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgt
    phhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidq
    rghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpth
    htohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopegrihhshhgv
    nhhgrdguohhnghesnhigphdrtghomh
X-ME-Proxy: <xmx:8uNGZ8ROpX2q3OtfE72XbxFI0aL82nkiXoTd5HzDtwOzkdoAF0xj_g>
    <xmx:8uNGZ5sNut3DB1CZzCOK7Ih2lufowaCSjOxFBOK5s_kUOaM8sc7LHQ>
    <xmx:8uNGZ1fRmMFjJjVZ-W4IeKD-tkDxTpHAyaF0yio5FD55la85LtLbAA>
    <xmx:8uNGZ13oP6kVKpMw69eUHbOnKf6WTrhnIMF3y16nXc1BgQG2CIxscw>
    <xmx:8-NGZ18J36QH__qlyXQkxwUal2SoIWWWQhF9-r1HKjk55N3gCvIY2xat>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B51022220071; Wed, 27 Nov 2024 04:18:42 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 27 Nov 2024 10:18:22 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rasmus Villemoes" <ravi@prevas.dk>, "Fabio Estevam" <festevam@gmail.com>
Cc: "Guenter Roeck" <linux@roeck-us.net>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Esben Haabendal" <esben@geanix.com>, "Russell King" <linux@armlinux.org.uk>,
 "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Dong Aisheng" <aisheng.dong@nxp.com>, "Jacky Bai" <ping.bai@nxp.com>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Fabio Estevam" <festevam@denx.de>
Message-Id: <5881df5a-9495-49b9-9956-0538055bba60@app.fastmail.com>
In-Reply-To: <87ttbthwdu.fsf@prevas.dk>
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
 <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
 <49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net>
 <CACRpkdaBR5mmj43y_80b9jd3TAqRWMdCyD9EP6AY-Y0-asz4TA@mail.gmail.com>
 <1ff005f8-384d-465e-9597-b6d5fd903862@roeck-us.net>
 <CAOMZO5DW3t-sof_uaFa_qJPE3WFq_155mFTxGMWh0m++csgopg@mail.gmail.com>
 <87ttbthwdu.fsf@prevas.dk>
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 27, 2024, at 10:13, Rasmus Villemoes wrote:
> On Tue, Nov 26 2024, Fabio Estevam <festevam@gmail.com> wrote:
>>> Fabio submitted a patch enabling PINCTRL for imx_v4_v5_defconfig and
>>> imx_v6_v7_defconfig explicitly [1]. I don't know if that fixes the
>>> problem for good - I see CONFIG_ARCH_MXC in other configurations as
>>> well.
>>
>> Good point. I can send a v2 adding CONFIG_PINCTRL=y to the other defconfigs.
>>
>
> Instead of doing that, isn't this exactly what the 'imply' keyword is
> for?
>
> - weak reverse dependencies: "imply" <symbol> ["if" <expr>]
>
>   This is similar to "select" as it enforces a lower limit on another
>   symbol except that the "implied" symbol's value may still be set to n
>   from a direct dependency or with a visible prompt.
>
>
> So how about adding 'imply PINCTRL' in lieu of the previous 'select
> PINCTRL'? And that would also better match the intention of the patch in
> question (namely that the user needs to take explicit action to disable
> PINCTRL).

Please never use imply. Even if you think it's the right
thing in a particular case, it will come back to bite you
later.

See also https://en.wikipedia.org/wiki/COMEFROM ;-)

I would prefer we completely kill off that keyword from the Kconfig
language and replace it with the reverse 'default'. In this
particular case, having 'default ARCH_IMX' in 'PINCTRL'
would of course not be a great idea, but for the exact same
reason, the 'imply' is wrong here.

       Arnd

