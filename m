Return-Path: <linux-gpio+bounces-23605-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9CCB0CC2A
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 22:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39771189B639
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 20:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9693E1EA6F;
	Mon, 21 Jul 2025 20:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="izbECgjG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AT1QkYdF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831291F91D6;
	Mon, 21 Jul 2025 20:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753131307; cv=none; b=JAjdF5vC1cgQ9fVmOokQhBXy7+vu9rcZnUC+UU1zEXNReCNQeygZbM78k0YGTmPVzAIyUphz+hVoLxV2+iBj7b6tcMgrXxx5+T0yKgSyHrUM0wcDl0VMUyMpwUsjQ6fihIqTRcc+86jdjwkb1Pfy1tOmhBNdcS/a6dpOUL+59uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753131307; c=relaxed/simple;
	bh=cHgQJLF+LtDlcq/DHLOFxIkpctjA+iF9QpdQDVfQlYs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Ojg5A2KouGyDg8/Lch6wyaIFQ9ALoP8x53X29ZVQnmg/2TB+69mFM2mJo0wQkJRpfYXvwGZoHbqVA/579dasbYfjOI9tu8WMzvUUAldDPgYGvkMh+nyGC24iwCb0HJjQdv7LN951a1V4vzfBeZCbHVGlNSb2+nXdDtj/KT7+Y4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=izbECgjG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AT1QkYdF; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2AD397A00E7;
	Mon, 21 Jul 2025 16:55:04 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 21 Jul 2025 16:55:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753131304;
	 x=1753217704; bh=kaRzPQ9lieFHHIwLmqX8kR4F+qmEQbM085Lcp8h5IR4=; b=
	izbECgjGjOYONT+DfawXELRem5RC+p3g4m+yzxdMx7JF9hXiB84/nI4OhvDSZdtO
	K67SCetqIwc+CxI5tqEJJ/QAul1/NEEs528IHHlR9Am4KpHqD+vpV2ROhMJ1HYUs
	7Fb24cQPTKgXM6uBWOJ7cGrGLOAYjWiKZjJb8TBJeNGdkRTB7s3xL2WrstkyxEkP
	tbPyBFfRnmEDsv6N6/Gt5C6l3QSVxzTVLLhylCo8uoFIB/3I1Cy4KdDvOYoXDgO7
	IZtX4pZm4Ly+TB5vWjpilVsIpheYBYV1K23SHBKahc7/vxvOq8Uv9zLK514rKrCL
	/Oj5UmHHY4f565mRrCaGYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1753131304; x=
	1753217704; bh=kaRzPQ9lieFHHIwLmqX8kR4F+qmEQbM085Lcp8h5IR4=; b=A
	T1QkYdF9LiaqvJ7LUIOCxS9W7GEZPohbXx5M/fW4jhr5ix8fgMOkvzDIetJZtUtF
	LNcBI08Q76u8MFjOmWAo4xxqNjlPsaHox+jXcPfPSH7hrBBGtcNlymLwTswlNmyi
	pviJ3n3wLmdZVFCBXOhzW4uF0Fq1i2Md1+GXEe0RLdIsRbhh7Ag30CKumjYGPsB1
	w7aZkJe1LraPfD/ORDWShXRqhcdYGFQGGoIRnYdzzlT3gOGDiimRiDWCFvV4DYZ+
	c2x45eZz10CYQVHe982mdsCYNG95v/6RqatRxLFyRh/0SByOI2+LwvGIO+HzoF9G
	6n2gU6BqVK8CI/o0ffL0Q==
X-ME-Sender: <xms:Jql-aHKIyCfYIeW_M0SLqZiHsNRmNHKBTmY-xKM0_t5aubMKMojcUg>
    <xme:Jql-aLKgBggWEAo4mo2J7mdipGiuxgRlqWiMir_hyfYUpwwPZtwF5aP_RZ9wpOac3
    6zmC1e4BV4aMFCoy4E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejfedtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvgedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepmhhitghhrghlrdhsihhmvghksegrmhgurdgtohhmpdhrtghpthhtoh
    eptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehhshhh
    rghhsegrgihirgguohdrtghomhdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpd
    hrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtgho
    mhdprhgtphhtthhopehjrghnkhestggruggvnhgtvgdrtghomhdprhgtphhtthhopehpgh
    grjhestggruggvnhgtvgdrtghomhdprhgtphhtthhopegssghrvgiiihhllhhonheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Jql-aBwrL-0xdaQrQZL0o8Nc0gKjsBhI6oTcjY0nqIkfe_N_rFWf8w>
    <xmx:Jql-aNUzn2DsRN_ZlTBxhGA23zxpzi0cZpDqKbAyyTJ4ngxO7yDhMA>
    <xmx:Jql-aGplJQRgvoCqx6iRXYicup451d8DFiIRFe5eOcMrv0rhvdW7Bw>
    <xmx:Jql-aCfHLct0SZGIj7Z2ssqzGVDeGh8eWwmRUUodRAbNXsjiKFFL0A>
    <xmx:KKl-aObLttYHXdq2zf0U_OcYRqZ3LuK3U9MK8z0RCYqteycLTz1CoJg_>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7A042700065; Mon, 21 Jul 2025 16:55:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T10195641ff6473d7
Date: Mon, 21 Jul 2025 22:54:41 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Harshit Shah" <hshah@axiado.com>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Jan Kotas" <jank@cadence.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>, "Michal Simek" <michal.simek@amd.com>,
 =?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Frank Li" <Frank.Li@nxp.com>,
 "'bbrezillon@kernel.org'" <bbrezillon@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "soc@lists.linux.dev" <soc@lists.linux.dev>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Message-Id: <8783e997-8dd3-4321-8f7a-f160b0f8ad17@app.fastmail.com>
In-Reply-To: <912dd9f9-34d9-4631-82d3-02eed03a52c9@axiado.com>
References: 
 <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
 <b7322d03-2ff9-48a3-bdc6-0e95382ed83f@axiado.com>
 <e461e5ed-f512-4d3b-9903-8092dab7f81d@linaro.org>
 <06f00d05-b8ca-41fa-9e5e-9cee3cfcfae1@axiado.com>
 <7ddb77bf-173a-4117-80ac-d0f32bf067ee@linaro.org>
 <4f836d88-80a7-402b-9af0-f0d002e2145d@app.fastmail.com>
 <912dd9f9-34d9-4631-82d3-02eed03a52c9@axiado.com>
Subject: Re: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Jul 21, 2025, at 22:43, Harshit Shah wrote:
> On 7/21/2025 7:31 AM, Arnd Bergmann wrote:
>>> Separate patches (1) tend to work better for the first contribution
>>> from a new maintainer, since there is less to know in advance.
>>>
> Thank you very much Krzysztof and Arnd.
>
> I will submit the patches to soc@kernel.org.

Please use soc@lists.linux.dev, we are trying to phase
out the old alias (both work the same right now).

    Arnd

