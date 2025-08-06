Return-Path: <linux-gpio+bounces-24042-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AC8B1C921
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 17:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A17923AC60F
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 15:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D78329ACC0;
	Wed,  6 Aug 2025 15:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Shsce62z";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SlR+myEi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C5B292912;
	Wed,  6 Aug 2025 15:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754494979; cv=none; b=Q7e+h40NeZe05/yfiFD1ddBWWvHZS+b2zIvuGP4bG2nWuGbfCFuk+s+PqSdmzuNtrvqRB9Sw+5mWQ1jGaUdI5xCMYv4Lh2yz2P+MgtRSbp0MTq1FgIRQttHzU/ImDfvWRBezaA0aK+YBgCdOyNLW7PCFuGBa/Sx4uf6cW3RFTsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754494979; c=relaxed/simple;
	bh=jyRgJSWPbO3PnUVVeAzfDnOq8adELheV/kLaL+kk5ew=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=UBRxx/nYhXmwtRBK2XbSrMonpyVG/yEFoP5BHtS2bOpJ1vqG1SQluWArNkogTGt5MyUJ6OX4/yV8CRwzYupyiLRhL7+A2Elgl1kQd2XL+xrFyMqZ5Uw18F/cQJjzTRGm2fJYcQdlpnjQ6/S/MxLU8C5bjeuODH6iZKOxY6bgcZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Shsce62z; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SlR+myEi; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 25E1A1D0008D;
	Wed,  6 Aug 2025 11:42:56 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 06 Aug 2025 11:42:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1754494976;
	 x=1754581376; bh=tOn4t6RQtKYJOiy4GjdNdZL8fCaJIQVkOeOeYM78T9w=; b=
	Shsce62z7ccdFezFEX0ljLJTYYZo8Sj/bFUVQu1aAmq//x3Dr9sVOfgEmY7qXnll
	d7/0igJlw2TsRXbULIquZAJJGp1Klw+RH+HKgC+hdQJ2dxxSB779j/XDbTtO4waP
	HBtlaJMW4NLFRdhm0Bmec57qu5kz9IhfvLcnQu3VW7drQpeQp2kQNQn0ymJ3mhyp
	Tno3XVRsyqNRxu7QRW1JDzJHdLIDU1fhCkYl5jY3hvKMrGIYM4TUdRcGTXBFkxW3
	fGXw71ZPwx0guOUbGPCmebkdUqUWAc45kzL6GF4uLEkXGBe7bIwCs6osx4TNKe1w
	k62wtFPvsuBSj4o8QCyipg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1754494976; x=
	1754581376; bh=tOn4t6RQtKYJOiy4GjdNdZL8fCaJIQVkOeOeYM78T9w=; b=S
	lR+myEibV8ZuD3LZrxezPsVhRSJDJ3iQYJ22AQTZCMgp0OQAG/TMpLX8ynHngT9e
	OxMi5eLac0YYJpiq9pPfy/HwkJVr9V/FUmLgc35jADR3OUTAm/ki+SCniptT61fQ
	J4PGivd/N7Rlwjjwv+dSmCWC+aHzl6NrX9bjOh1KtAt++WtFDfPoM9hfn2wRJXmH
	fieBtpKNEeqZAFI2qcYNU1I3zYAjVou4DeOWrAzzKDX+sJj/O8ixsCI1Qo4CpD9F
	VuXN4NRx9fjbX07caRXMZc/udaaIs6eoi/W0yQ/cUNrMnEMpUldGRMYBYeUnw7Bn
	EuJiXAuR6vIhIz9BZ9iuQ==
X-ME-Sender: <xms:_neTaAIPbMToyVFjVCzhY_3AHIxEeueKJk4PgLrsAYmzXQRWnt7dLg>
    <xme:_neTaAJMTJEZ8ui8qTj2uwGWmUn3QBkTQD_2KCDNmqOsbv9l44sCDua3P3SDlit6I
    WDfl38Xx_sSvS7pyJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudekgeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfeejpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtg
    hpthhtohepjhgvshhpvghrrdhnihhlshhsohhnsegrgihishdrtghomhdprhgtphhtthho
    pehlihhnuhigqdgrrhhmqdhkvghrnhgvlhesrgigihhsrdgtohhmpdhrtghpthhtohepmh
    htuhhrqhhuvghtthgvsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehgfihkuddt
    udefsegtohgrshhirgdrtghomhdprhgtphhtthhopehhghhkihhmtdehsegtohgrshhirg
    drtghomhdprhgtphhtthhopehkvghnkhhimhestghorghsihgrrdgtohhmpdhrtghpthht
    ohepkhhskhegjedvheestghorghsihgrrdgtohhmpdhrtghpthhtohepmhhinhhghihouh
    hnghgsohestghorghsihgrrdgtohhm
X-ME-Proxy: <xmx:_neTaMyQha4lWXE4lnfH10oTn7U5V7ZNVO7HRNP5Sh8rhCkGz197OA>
    <xmx:_neTaCHarrhUi7SS3lsNUWCcs7zA21ELnaKANtAhm3udo3oPuqo9Gg>
    <xmx:_neTaAGwPQ13TlH-W68kdH_hvmRV15_tjZDRb3_AMdF7uUncH9yDpA>
    <xmx:_neTaLugcvZe_3BQ1_GvdspWP5DyXXIhogioBm8zi9LhHsUMRS7UZQ>
    <xmx:_3eTaP4CvdJzy5tREUVbfv-NACFAbM6q6Gp5RicN6WQAd1u5qmZS1Gh->
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9D0F7700065; Wed,  6 Aug 2025 11:42:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T8d5032a2d74658ad
Date: Wed, 06 Aug 2025 17:42:24 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Pankaj Dubey" <pankaj.dubey@samsung.com>, ksk4725 <ksk4725@coasia.com>,
 "Jesper Nilsson" <jesper.nilsson@axis.com>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "'Krzysztof Kozlowski'" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
 "Chanwoo Choi" <cw00.choi@samsung.com>,
 "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Tomasz Figa" <tomasz.figa@gmail.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Cc: kenkim <kenkim@coasia.com>, "Jongshin Park" <pjsin865@coasia.com>,
 "GunWoo Kim" <gwk1013@coasia.com>, "HaGyeong Kim" <hgkim05@coasia.com>,
 "GyoungBo Min" <mingyoungbo@coasia.com>, "SungMin Park" <smn1196@coasia.com>,
 "Shradha Todi" <shradha.t@samsung.com>,
 "'Ravi Patel'" <ravi.patel@samsung.com>, "Inbaraj E" <inbaraj.e@samsung.com>,
 "Swathi K S" <swathi.ks@samsung.com>, Hrishikesh <hrishikesh.d@samsung.com>,
 "Dongjin Yang" <dj76.yang@samsung.com>,
 "Sang Min Kim" <hypmean.kim@samsung.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@axis.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, soc@lists.linux.dev
Message-Id: <5584937d-0941-487a-859b-b3c55aceaf37@app.fastmail.com>
In-Reply-To: <ef3b8e12-0677-4e49-bf2c-b8136c9a6908@kernel.org>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
 <847e908b-1073-46ea-93f3-1f36cc93d8b8@kernel.org>
 <bfdc2eddde554e1d1808dd8399bc6a693f681c9b.camel@coasia.com>
 <CGME20250721064006epcas5p4617b0450e69f72c94d2b3ae7b1d200e7@epcas5p4.samsung.com>
 <99977f38-f055-46ed-8eb0-4b757da2bcdd@kernel.org>
 <000501dc06ab$37f09440$a7d1bcc0$@samsung.com>
 <e334f106-d9f3-4a21-8cdd-e9d23dd2755d@kernel.org>
 <002001dc06b1$540dc980$fc295c80$@samsung.com>
 <ef3b8e12-0677-4e49-bf2c-b8136c9a6908@kernel.org>
Subject: Re: [PATCH 00/16] Add support for the Axis ARTPEC-8 SoC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Aug 6, 2025, at 11:23, Krzysztof Kozlowski wrote:
> On 06/08/2025 11:05, Pankaj Dubey wrote:
>> 
>> or ARTPEC is manufactured (ODM) by another vendor in that case, won't it
>> create problems? 
>
>
> No problems here. Non-Samsung Artpec/Axis soc will not go there. It will
> go the top-level axis directory, just like artpec-6

Agreed. We did have a case where something gradually changed
instead of changing ODMs entirely:

Apple A4 was mostly an Exynos-family chip but A18 is not.
If Axis turns into the next Apple and ARTPEC-23 is far enough
removed from ARTPEC-9 to no longer fit into the same family
as Exynos/Tensor/FSD, we can still reconsider the decision
in a decade.

     Arnd

