Return-Path: <linux-gpio+bounces-18492-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 006E6A808FA
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 14:50:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA1951BA28F7
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 12:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1575B26656B;
	Tue,  8 Apr 2025 12:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o9ze+47o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D3926F462;
	Tue,  8 Apr 2025 12:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744115960; cv=none; b=ZpBXSfo/tLKwgVb8UQdvliK5L6D5J3QnwCaIyZIlWJy1FAY7EF3/fpbXjoBG8b/321VYLWuNq0ej+PTQoQ1YZ/Jl7FTbouMQhUROOHCgSc28fdygg6ZvkCJcfwroas8wjE60cWTrcwtdJsiEE1k+w3ewh5DizYHNYkvoRMIvA3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744115960; c=relaxed/simple;
	bh=zdCrsvBkwkAlbHAMoR8vjGyP4JtXAOHDR8/3GQ5F2NU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=lX/8CUcAZv9ZUarK8MfiGZBwUjC718AlqGlPneiVbnexbBiwldm1RgZ4sYVQkakq5tRouecvry/7d8KJGecFWvp5UrYzeuiiIgy81ENbu7sgZKE+sYT0tjMZ/09yz1VyuGg6YhBspACppeKgDETni/8KkMc/9B2PoA8tU1d+s/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o9ze+47o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED53C4CEEA;
	Tue,  8 Apr 2025 12:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744115960;
	bh=zdCrsvBkwkAlbHAMoR8vjGyP4JtXAOHDR8/3GQ5F2NU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=o9ze+47oXEJjDau0UliiX+wd69R3bkdCG1e4NviVmgYys7L4RgCEcF3SXFhRv1lB1
	 L17/jBFcA7cJZKvTK8hc06sfpFd+n6AL8zfCvyM7p/Ig+jN7CSjaNDDdI5BMRvTLHf
	 6urA/yky9MYeVx0SbNlxTrbstytaP++FFIPLuG1t7ygO1pTMosRWB6u4Sjlr9vFgYm
	 BKK+lA/KPvcigw617O4YIdWwDUNitupXLhE3vRiy/Gz78ZmSpG99MTkElOoBAr4KLo
	 yaLfPxZ5cLu6Q7W/uSc2HSxa9mrngII2bqp94OiXRjwdKK5CietJ62hvugdqolEgBU
	 /TlLbWSl698ig==
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id EEF5F1200043;
	Tue,  8 Apr 2025 08:39:18 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Tue, 08 Apr 2025 08:39:18 -0400
X-ME-Sender: <xms:9hj1Z7YStGxhPJWouy77Luwn3tWvtZAxmT5YqW7-aiLmEEortt-wZw>
    <xme:9hj1Z6aXOW0fX4RdemxR-_KqIJgCk9oUU6BnMlqBb_S0UXmb5RWNy1dmMHqUBuoSj
    bi8YT73h4nVDWtH2FM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefuddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnh
    gvlhdrohhrgheqnecuggftrfgrthhtvghrnhepudefjeetteelhfegudekhfetffehtefh
    tdevkeehfefgtdehheeghfektdekvdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprghrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdduvdekhedujedtvdegqddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvg
    hlrdhorhhgsegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpd
    hrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehgrhgvghhorhih
    rdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepshgvsggrshhtih
    grnhdrhhgvshhsvghlsggrrhhthhesghhmrghilhdrtghomhdprhgtphhtthhopehkrhii
    kheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggrrhhtohhsiidrghholhgrshiivg
    ifshhkiheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghi
    jheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvg
    hlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghnughrvgif
    sehluhhnnhdrtghh
X-ME-Proxy: <xmx:9hj1Z98NLfhVvk_WwDWYro-8r2kGMF_kTBz7QrHGLdJnbd5aLv29Iw>
    <xmx:9hj1ZxquHJbn6HNz8hHt6sNVN62ln_TV4WnBJToT_N5fUAP6hm4YaQ>
    <xmx:9hj1Z2pB3fZrFsT3Hxe0aczAKDriyFZShNINA2kNSAx32G6RuzKGZw>
    <xmx:9hj1Z3SymJ-8EfUHR8xHPJcO9tiiZQwDG3xETjIF6Imw05vOCN3MEg>
    <xmx:9hj1Z-rE5bH55SCa0_P3mna9HYzHJ-fpboXX-IGUR673DMi_bANSM4oJ>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C426D2220073; Tue,  8 Apr 2025 08:39:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T1587df106ca63dd0
Date: Tue, 08 Apr 2025 14:38:48 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Andrew Lunn" <andrew@lunn.ch>
Cc: "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-samsung-soc@vger.kernel.org,
 "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>
Message-Id: <18d59ff1-a357-413c-bde2-961ae0c9b5f2@app.fastmail.com>
In-Reply-To: 
 <CAMRc=MfC7GukR5ZidkZJA8LMZaVXyqeygdUBz9v3oDmw8k+OPA@mail.gmail.com>
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
 <20250407-gpiochip-set-rv-arm-v1-1-9e4a914c7fd4@linaro.org>
 <b032eea6-96c9-4511-8085-da9f5655c252@lunn.ch>
 <CAMRc=MfC7GukR5ZidkZJA8LMZaVXyqeygdUBz9v3oDmw8k+OPA@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: orion/gpio: use new line value setter callbacks
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025, at 14:12, Bartosz Golaszewski wrote:
> On Tue, Apr 8, 2025 at 2:03=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
>>
>> On Mon, Apr 07, 2025 at 09:09:18AM +0200, Bartosz Golaszewski wrote:
>> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> >
>> > struct gpio_chip now has callbacks for setting line values that ret=
urn
>> > an integer, allowing to indicate failures. Convert the driver to us=
ing
>> > them.
>> >
>> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> What is you intended merge path for these? Have arm-soc take them as a
>> whole?
>>
>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>>
>
> That would be best, yes. I'm not sure how many of these platforms are
> actively maintained.
>
> Arnd: you were not Cc'ed on this (get_maintainer.pl didn't show your
> address) but could you take this through the arm-soc tree?

Sure, can you send them once more to soc@lists.linux.dev, either
as patches or a pull request?

      Arnd

