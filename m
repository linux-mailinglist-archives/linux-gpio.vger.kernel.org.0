Return-Path: <linux-gpio+bounces-24614-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A70B2DBEF
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 14:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81AB97235EB
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 12:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D773221D96;
	Wed, 20 Aug 2025 12:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="dOLdqIGP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="j1Nb4xRx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2864936124;
	Wed, 20 Aug 2025 12:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755691306; cv=none; b=RZauxJIWP1BRa+vZBPSM6KbyrWOffDjmZLRzTsnGtYbS0bl3l8I+YTAfWzRBl/d5sZFzPRr9QvolXr+CFPsKO1JWJYCUD224TghdFZ9EX/olr8HRfPyyvZOzfWdGZWNbX2LqTaF4JxRq4quL3oFWZvmvPcxBlxF2TOw89XJRJIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755691306; c=relaxed/simple;
	bh=quoUxmTd+wIYaTcdTYZiwMlD2ipn1Yd11rXs4F9lVK0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=fdWXr5MEGH4rJOTepgVlm+WQxbagOzKLaeJ5RjGTJCz0OXWjMydO+JWnpIwIolu+gbu+hF0mKTsan+rSz67Ng9ZUluXcAlAC5Y4LgcqDa+f4AjJ4fkHMlSazRaEUGwasCaSpoYHawUMfDoVxthHKL0q0Z68IzatILe5EORyiBnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=dOLdqIGP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=j1Nb4xRx; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 28461EC0C3B;
	Wed, 20 Aug 2025 08:01:42 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 20 Aug 2025 08:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1755691302;
	 x=1755777702; bh=J9FfUkmbFexfH55SqDcJNlLFwG8EstJIvFxlzLcoWrw=; b=
	dOLdqIGPK0mi7AX99S/CO6YGJDkhlZn3q2iadfSB1AObzfYkjVAkBl1+h54NiBIU
	Ee0ygF5EFT+VmDFUl6ZIPvu0431d6oer7S1HVFdRB6Clw2NJMxC/ZPmUX+ZFHEI+
	WqW+UN7kuBkzLJ45fDtJBTeGVdZ6i16+y7QO5jM55XNbBhZVYfALaOd+riazhlTA
	TCItk1m7CED0ChkCoI6dcqsYxGXWWV6lSAU1o62MzdNqZ5+uDQfL2WeAiSKTD2LE
	iHyBUcfMLntlxJdNcnIE2n7NY4UMXhj5bS6WNbwr603ZDkVyp0HMkXaiFmc5EPS4
	h4t7MVGGjgUo6KByMIS+EA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755691302; x=
	1755777702; bh=J9FfUkmbFexfH55SqDcJNlLFwG8EstJIvFxlzLcoWrw=; b=j
	1Nb4xRx6qCD65RDDOW0hPnMvnPnRlMAQH+P5uP1y2lXssDzVMTQE+/jVEWyd67zT
	A3OPsQvDJFr2EubXkf7HQjU2xeYxUsYS4CjOzahnd6aIXqtelW39gcKGWW8sAJjM
	P237FSDs2+PD9YzHKk1pNPhKJO9DMkh2RXHq6FZILuJs940MxCqxfhx7lMOCoBiC
	Bc+tBBgRRLXEuQDgErTwwfEjncR3OXv/09664T3sAVqcHk0TfRZ6Ya96ntwtPqSM
	703dhilexwEA53cLgcuc6oIs1SV9iYIRW6BvrnglY1h/2Glt8yVd6+pX+juC2HOm
	ZQuIz9GEpT7Z0Q4oZD9vQ==
X-ME-Sender: <xms:JbmlaL_pDTvxuVK3xsr1cQt3dqvlaO-cnBVRuV9GPfnktLbNM5haTQ>
    <xme:JbmlaHs8-AoY5JknIQ_luvu3T2Z8NxFTKPgTfviFM3xxMUnC8egVaNhI5OlAC9ox8
    6dINsFqGf90rUfesiM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduheekfeduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:JbmlaH39ejBCf9iJnRYHO9SVv_ueA3UYcSUiydhMnwQKUQCYmqgrmA>
    <xmx:JbmlaBR6VwnVjDT4VKhJN8eKKlGztnLJ1yCP45acSJsBnLrjb8U7QA>
    <xmx:JbmlaLtwlbAZWI-XEwP5nRAjkI2QJ5np7LAyvRIgUEwGiWnrDZ8zgA>
    <xmx:JbmlaHIH-mcGBRjCOK126WLcDSBIgdFCYGfDsJpBOK9mP0nl0xwrBg>
    <xmx:JrmlaJgk2rEsoDGWuHjswhP8I5Q9bHlGf9Yw-d2Y6SwFsn2IJvNlCJie>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 50C6B700065; Wed, 20 Aug 2025 08:01:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AXipOkXRca9w
Date: Wed, 20 Aug 2025 14:00:56 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lee Jones" <lee@kernel.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Bartosz Golaszewski" <brgl@bgdev.pl>,
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
Message-Id: <9fb37e55-0c86-4ac6-acd3-b8c1bc722b3f@app.fastmail.com>
In-Reply-To: <20250820071656.GJ7508@google.com>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-11-arnd@kernel.org> <20250819121907.GA7508@google.com>
 <e9252384-a55c-4a91-9c61-06e05a0b2ce4@app.fastmail.com>
 <20250820071656.GJ7508@google.com>
Subject: Re: [PATCH 10/21] leds: gpio: make legacy gpiolib interface optional
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Aug 20, 2025, at 09:16, Lee Jones wrote:
> On Tue, 19 Aug 2025, Arnd Bergmann wrote:
>
> Sounds like we're between a rock and a hard place with this.

I don't think either variant is that bad to be honest, as it
gets us a long way towards removing the legacy interface from
default builds without having to update or remove the holdouts
immediately. It's mainly led-gpio and gpio-keys that need
a change like this.

Splitting out the entire gpio_led_platform_data handling
into a single #ifdef function block would be a little cleaner,
but that would in turn require changing over a couple of
files that got converted from legacy gpio numbers to passing
gpio descriptors or lookup tables (ppc44x/warp, x86/sel3350,
arm/omap1), making them use device properties instead.

> Will the legacy parts be removed at some point or do you foresee us
> supporting this forever?

It's hard to predict an timeline here, there is certainly a lot of
interest in minimizing the legacy users as much as possible and
patches are getting written for x86 and arm, but I don't see much
movement on the mips and sh platforms. These are also the ones
that have been holdouts for CONFIG_LEGACY_CLK for years, and I
hope we can eventually drop support for those boards.

That said, I first need to get my own act together and refresh
my patches to drop the old arm board files so we can merge that.

      Arnd

