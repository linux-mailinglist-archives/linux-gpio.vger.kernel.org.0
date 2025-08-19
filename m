Return-Path: <linux-gpio+bounces-24560-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2DFB2C4C5
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 15:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88675A05AD3
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 13:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DDF534AB0B;
	Tue, 19 Aug 2025 13:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="SqGVrLg3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OC+9J4Kb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E643633EB1D;
	Tue, 19 Aug 2025 13:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755608417; cv=none; b=uTZQj3vTB7J2SUzWHScLfcbw0unYFRVTRC5uZnr29IJDGS19qd136d0nGLeq7PDo9yakzf/e6U5qhO8S2I/qfYJqmw+CLPVRX6fy0xVsdjboiWgkgIIlqAY7SU+cJc6/xmk5bC9Tbe/EV21zcH434ZNF6kl2WlmFTvdxAio2UsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755608417; c=relaxed/simple;
	bh=iloTLwi2gOdLOHKbexssFM/oh+m90ovPugh5A0kAwg4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=p1z4XMLypIFCKAEI9TVB4ntb3BwZF2jz8KM7lAiz0JOhlE6iJHd9KOLVwbNRf6WyGcopKD8gIzw4hqN9+zf7/6PLagwjlWHjltQorqHYL3zVyp+YLBuXMzIvWhv14P6SiWK8ytdsqLYeYwNggUbfU/QtKGOHj+E9TiyEBZmAarc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=SqGVrLg3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OC+9J4Kb; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0088E140041B;
	Tue, 19 Aug 2025 09:00:13 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Tue, 19 Aug 2025 09:00:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1755608412;
	 x=1755694812; bh=pVVR6isuBZ1Hq6IdzabXkRrNz7PvxwYVf3cjr/ZvJUI=; b=
	SqGVrLg3KjPC10vTi9aM2tv0M1DoKpcOlaPC2M7hwjSBEO5VCD6ZzVrOhbxXmvf+
	F4y9V1/MgBdAO1mjDbdRDlSq4J8GOJzYt3gHo3ZbHQ05u7DpmzXsM/dnYKUddahP
	GEfGYkk5tTbLJt6DN0YPAZiggQmtz6QmjT3F1u3oh4dend+/3DYlc39g2bwsse69
	Ku+yiGYEhWrIE3KKm9qZmePFtXw/aduaEx83mPI1RiQQHNUZDLi7lV1dywjXB3Mq
	n2/2JxuPO/CtISMzMspTiCCOWwXmemckw2phyxuiwcosJN1o0YHw+WR4E6TBoMoA
	zAL4Kub8NO7Dlh5JD5E+FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755608412; x=
	1755694812; bh=pVVR6isuBZ1Hq6IdzabXkRrNz7PvxwYVf3cjr/ZvJUI=; b=O
	C+9J4Kb21ApnEJ23XRYHxOoh+jzSV+NajisP2Up1h3GRE4QET5ZvPKETdG8MipEy
	/ARuD5xlRhR3LJWzsBKdZ7ouxLL6kYNNSX/fIOnPdBpgYm2Oipq++ISLEHIjjA1o
	WAvcRa/YdSaakjletj38k5gZW202RWv2wh3f9G4XPIw8ZrNa39+g1QCaMkmn70wS
	GufSXaTNaxoXuI7EdlXzxPG9IIUELNw5c068LrEZZUWOfSBZgR0k7vfDH/fCUC+a
	udwC3XpbFeLWHvLbdXOtR6z6BoHfTudP/967pZC+sf23NHhcodBUVGnRhRs6MZ7E
	bxa0ufGcy+XOULvbJVbnQ==
X-ME-Sender: <xms:W3WkaM3YpW1oXr-B5nUlv3Y92qvNBiyh5oOcLeLUoATZtToUztxERg>
    <xme:W3WkaHGZV5tEsuRmP436uj5Jzx7XYxeVmEHv0Crol362aHDBuS1euG-LP9kWKPmEa
    PI8kz9MyREkybg0i9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduheehheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepjhgrvhhivg
    hrrdgtrghrrhgrshgtohdrtghruhiisehgmhgrihhlrdgtohhmpdhrtghpthhtohephigv
    shgrnhhishhhhhgvrhgvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrnhgusehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehguhhsthgrvhhorghrsheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlvg
    gvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghvvghlsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrgh
X-ME-Proxy: <xmx:W3WkaPt0Q-0RrjRp4_NGjkISuXUahVTIAOzau3HnzDxTiLBh99m85Q>
    <xmx:W3WkaLqONfKBbm8vK0Wnz9WuyXHjcNumGD20WE0siWxrRwhujX0-XQ>
    <xmx:W3WkaGlfuVrGnwPXZKNtspxjTUxjzPVJAb03DRLPtEFveVRkaDhiPA>
    <xmx:W3WkaIj7Hg5FsBfFLD8kUoZvy7DzAYeoCtCN5PSF_V40QpZ28_yvlA>
    <xmx:XHWkaBoLjrTDrHUPizi1HKT1qIaR4oTqLOSKyK5jRz_S89m9S3Hn4E_Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 655FD700065; Tue, 19 Aug 2025 09:00:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AXipOkXRca9w
Date: Tue, 19 Aug 2025 14:59:34 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lee Jones" <lee@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Pavel Machek" <pavel@kernel.org>,
 "Javier Carrasco" <javier.carrasco.cruz@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Kees Cook" <kees@kernel.org>, "Anish Kumar" <yesanishhere@gmail.com>,
 "Mukesh Ojha" <quic_mojha@quicinc.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Dmitry Rokosov" <ddrokosov@salutedevices.com>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <e9252384-a55c-4a91-9c61-06e05a0b2ce4@app.fastmail.com>
In-Reply-To: <20250819121907.GA7508@google.com>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-11-arnd@kernel.org> <20250819121907.GA7508@google.com>
Subject: Re: [PATCH 10/21] leds: gpio: make legacy gpiolib interface optional
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Aug 19, 2025, at 14:19, Lee Jones wrote:
> On Fri, 08 Aug 2025, Arnd Bergmann wrote:
>>  {
>>  	struct gpio_desc *gpiod;
>> +#ifdef CONFIG_GPIOLIB_LEGACY
>>  	int ret;
>> +#endif
>
> Isn't there another way to do his that doesn't entail sprinkling #ifery
> around C-files?
>

An alternativew would be to duplicate the driver and have
one modern variant and an additional legacy variant that
is only used on the few remaining platforms that select CONFIG_GPIOLIB_LEGACY and define platform data. See below
for the list of files that reference struct gpio_led.

There are already patches to convert some of those to
software nodes, and a lot of the others can probably be
removed, in particular the orion5x ones.

The leds-gpio driver with just the legacy interfaces left
would be a really small driver, and removing those bits from
the normal one would make that a bit simpler as well, but
there would be some amount of duplication.

     Arnd

$ git grep -wl struct.gpio_led
arch/arm/mach-omap1/board-ams-delta.c
arch/arm/mach-omap1/board-osk.c
arch/arm/mach-orion5x/board-d2net.c
arch/arm/mach-orion5x/dns323-setup.c
arch/arm/mach-orion5x/mv2120-setup.c
arch/arm/mach-orion5x/net2big-setup.c
arch/arm/mach-orion5x/ts409-setup.c
arch/arm/mach-s3c/mach-crag6410.c
arch/arm/mach-sa1100/assabet.c
arch/mips/alchemy/board-gpr.c
arch/mips/alchemy/board-mtx1.c
arch/mips/bcm47xx/leds.c
arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h
arch/mips/loongson32/ls1b/board.c
arch/mips/txx9/generic/setup.c
arch/mips/txx9/rbtx4927/setup.c
arch/powerpc/platforms/44x/warp.c
arch/sh/boards/mach-rsk/devices-rsk7203.c
drivers/leds/leds-gpio.c
drivers/leds/simatic/simatic-ipc-leds-gpio-core.c
drivers/net/wireless/ath/ath10k/core.h
drivers/net/wireless/ath/ath10k/leds.c
drivers/platform/x86/barco-p50-gpio.c
drivers/platform/x86/intel/atomisp2/led.c
drivers/platform/x86/meraki-mx100.c
drivers/platform/x86/pcengines-apuv2.c
drivers/platform/x86/sel3350-platform.c

