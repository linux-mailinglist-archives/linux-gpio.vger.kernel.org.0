Return-Path: <linux-gpio+bounces-23877-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E24A4B14D44
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 13:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1499C18A2577
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 11:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED8828F515;
	Tue, 29 Jul 2025 11:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Zf+Yv6qF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DuE8cMZ5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24322253A1;
	Tue, 29 Jul 2025 11:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753790310; cv=none; b=mN5IB2l6GXHEFxUU1yQKMQvVjoQUxougrbfPwr3qgDLM2uETBaKGYAMuotb6C2cv+WcWWHVhB0QMVEr2ZW2bIzH9qgLFGNumHhfRkM6ZcobD43wJar4iJ9aF7fCil04uThSdjP79TUAamVFUqfKr2z7UPm8U/4urHtlc4VljztQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753790310; c=relaxed/simple;
	bh=1LLXAopHlbtTbYwuuPUrAkvvpDZt+jOr3KZkQ0otJvg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=oBjJUg19ucp80UqSQvJ3cX6QLzkzCapfwYK7wlpVOu+gDPhkssel/p0APQ7XH9B+U/xqsb9jGrnhQB/JOLPHTRY1pkJff9+rdxpU6vQ8L7Td3JgCbKorcTCfCynq//lMZD4LfIS8WezpkNBS5asy4Jbiu2l+KpASYFe5BOXmsn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Zf+Yv6qF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DuE8cMZ5; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 067527A039E;
	Tue, 29 Jul 2025 07:58:26 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Tue, 29 Jul 2025 07:58:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753790305;
	 x=1753876705; bh=2KH4uc3Pr8DAkZm2PfC5ZUYmwfirAa2LmjMJQ4gsLLU=; b=
	Zf+Yv6qFLXzX4wfQUZiV7FcSiaa7N3JDWp2c6WQKvG8zbQAGX3pPS54CTz0Rdi0G
	SVJM0n4zyUHBVLokbL0XsIiWmyOEJjkeI7pjLlJHwP5QUpFA0VqoGkwVmd1TQ+TM
	xMVKBdq+Aoel2koSBylcPPRFeEHdDbeG9drqwbjXJ8X+fohtdFts6yDVz2WArzgl
	JN9VJZXpEHJK99x5e3fYbFms7H8LI4uovmFB+8hwdES5oW2sml8wyfzfZJLV4mu5
	DO6Z/5ydqV9JKsCqNfqcy7Dics+YjGfspRDgDu5YqxGf+BAnouR1hlivgKifpLZP
	c4HnV2yYnYAo2Nsez33TgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1753790305; x=
	1753876705; bh=2KH4uc3Pr8DAkZm2PfC5ZUYmwfirAa2LmjMJQ4gsLLU=; b=D
	uE8cMZ5hXVH0TZDx26Bl+APy7/v1aFyDZSOnLtJD1r2RUHQb9neFNGvOFkh4WQfG
	E2ezgoZgfLlc4eORKR6Pwc3pRXHiZ6YKWpMmz10wODfoGpTlyFPwrmXOgzbyp62A
	gh7s1WdKqUIXDhY/5EoG0fIyeucYVxp8b07eKV5DXiVg47jUIc7GmEPsVdY5wllj
	YmEz+0RT4vDI7/uLMSnq9DyjkFAvx+Q00PgDJbEjL8MY+NjZl/PKRbmhaxr2pIc4
	upkQEMF95AHIpX1AoFV25ZejbK5qsdhrZCPD2XoiuFQRu+snZRhzSQlAz+HRdde/
	0KFN/ZJlnirajQ3FTa3Ew==
X-ME-Sender: <xms:YLeIaGCrqJpXzqYqRdV8BddYZ4l-hLxYtQkJXOvY-cS3hCeRCLaNwg>
    <xme:YLeIaAhUP-iQtzlp0rE1yA-wdaL2-YymsL7RGpB7iqqJ302dJEO1eXfJIoHmyALDu
    b8qec0esBiQt-I8ugg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeellecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedukedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehnihhkohhlrg
    hoshdrphgrshgrlhhouhhkohhssegslhgrihiivgdrtghomhdprhgtphhtthhopehthhho
    mhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkohhitg
    hhihhrohdruggvnhestggrnhhonhhitggrlhdrtghomhdprhgtphhtthhopegulhgrnhes
    ghgvnhhtohhordhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlih
    guvghrrdgsvgdprhgtphhtthhopegrlhgvgigrnhguvghrrdhsvhgvrhgulhhinhesghhm
    rghilhdrtghomhdprhgtphhtthhopehlkhhpsehinhhtvghlrdgtohhmpdhrtghpthhtoh
    eprghrnhgusehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:YLeIaCQAADq_4c3rdQT7087fBfT8HimvYj9sOpmSXYt0gNUR6Z_cRA>
    <xmx:YLeIaNSG71UOtU5Gx1LURAZLcYLhQN7mZDQ8kB6EWdAIzLvlfaxJkQ>
    <xmx:YLeIaIJ3qU8PanhcMVoHsTjd7V9NIxBPJyjJdCf49slEck1RHZ8R6Q>
    <xmx:YLeIaMFtFbB_pu0RjRLqiJdgBPceDqXGATYj2kqYw5wjPSAlwmnUcw>
    <xmx:YbeIaNv-UJzD_6UA2o8luvSAf2yLFU2X0zdDCHOLeUqihK870l9PitgR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 74657700069; Tue, 29 Jul 2025 07:58:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T15b001141a5b4202
Date: Tue, 29 Jul 2025 13:57:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Alexander Sverdlin" <alexander.sverdlin@gmail.com>,
 "kernel test robot" <lkp@intel.com>, "Peng Fan" <peng.fan@nxp.com>,
 "Koichiro Den" <koichiro.den@canonical.com>, "Lee Jones" <lee@kernel.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 "Niko Pasaloukos" <nikolaos.pasaloukos@blaize.com>,
 "Thomas Richard" <thomas.richard@bootlin.com>, "Yixun Lan" <dlan@gentoo.org>,
 "Lars-Peter Clausen" <lars@metafoo.de>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <f0a2a000-381e-40d8-a9ac-4d75dba332e9@app.fastmail.com>
In-Reply-To: 
 <CAMuHMdU6Akz0GC2hooAxn=C2F0WjagPkzRKcH1SJiW0CBeUOaw@mail.gmail.com>
References: <20250726211053.2226857-1-arnd@kernel.org>
 <CAMuHMdU6Akz0GC2hooAxn=C2F0WjagPkzRKcH1SJiW0CBeUOaw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: enable CONFIG_GPIOLIB_LEGACY even for !GPIOLIB
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Jul 29, 2025, at 12:47, Geert Uytterhoeven wrote:
>>
>> -if GPIOLIB
>> -
>>  config GPIOLIB_LEGACY
>>         def_bool y
>>
>> +if GPIOLIB
>> +
>>  config GPIOLIB_FASTPATH_LIMIT
>>         int "Maximum number of GPIOs for fast path"
>>         range 32 512
>
> This won't work for everything.
> While I now get CONFIG_GPIOLIB_LEGACY=y in all m68k defconfigs, and
> simple inline functions like gpio_is_valid() are now available, more
> complex functions will still fail, as drivers/gpio/gpiolib-legacy.c
> is not built.
>
> drivers/Makefile:
>
>     obj-$(CONFIG_GPIOLIB)           += gpio/
>

Hi Geert,

Do you have an example config that shows this problem? 
I've tried a couple of configurations on m68k now but are unable
to reproduce this, using 'defconfig' (without GPIOLIB) and
'm5475evb_defconfig' (with GPIOLIB).

The intention of this patch (in combination with the previous one)
was that the legacy interfaces would still behave exactly like
before, falling back to the stubs when GPIOLIB is disabled.

    Arnd

