Return-Path: <linux-gpio+bounces-23881-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF4AB14F17
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 16:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5DDF7AEF7A
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 14:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B0F1D5141;
	Tue, 29 Jul 2025 14:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="cqbSe+AP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CvsYWtmi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356B84C6D;
	Tue, 29 Jul 2025 14:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753798346; cv=none; b=pXuM6jq904e0/1HPIG2UZude9ZBVM8jdJ9N8XOdeq/Yf8Ep3O6n5OP1dU2H81KSrj37up8AeibghRlxTwly4hgkWd4MTBqpN+LCdB+TDd9YUHxX0GgNWsfl/KXFt8tWmN+ddp8wO4hfsx3yLKRuqwWFyFglD8r2+VGwvd/0xOiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753798346; c=relaxed/simple;
	bh=lIYDMtNMk2OTrfFA3d4aR7UcZNph1MLXV/AoeIDs2Ts=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=A8MlkuOAw8NaGBR23Qtnk+KYzFvFZFYMEnNuWNfw810shrl+3k/LCYj7bYPYZ8WyJLMPYMSlS8Y+6T7l5STnzl5tnK7lWCOKQns1eUnPg877tKJ8rPqVXkN22XtmhXTT6SXU/CMfz2Wi0Nyc4+5A5js121vebaLR8lZlBiS6Kpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=cqbSe+AP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CvsYWtmi; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 44A631400429;
	Tue, 29 Jul 2025 10:12:23 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Tue, 29 Jul 2025 10:12:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753798343;
	 x=1753884743; bh=lvTM6U3OpuAsCCBQIku+DT9FmGxTEa/60sJXAhmj4Hk=; b=
	cqbSe+API5g2rlgsERAfDu2mY8ph4aIxDTxIHAPgTo2SbCKfJ4ph1gJWNAUjV5Qm
	xUy6rg389Y/DTWs08OvdpMBp1DJGR8ZgiifZVixtQXWCJNn9Kht1SsUaFykWRJV+
	tkPLPfiJvJ4pGZI+K5dlnwCKFkZ+zrxE3wThogcKn0gBiFk6G8UKG8QFzG7pJPVm
	5t1qa69C6IgJspq2GwsGaz2rn7qJ4oM64yCmBs+a5GTALP/DPWmG5NNxj6jO2oN2
	RjD/BJxbpGHfWjcKuJq8kZbLgX7YNbdUCqVqiFHiRHWuarfK7iK8HZNoVbj6Ow1r
	+y4Rf/ODIoASbzCFypRLEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1753798343; x=
	1753884743; bh=lvTM6U3OpuAsCCBQIku+DT9FmGxTEa/60sJXAhmj4Hk=; b=C
	vsYWtmi3B3g3+mzLPNaQwOlUQei7WcWveA/9We8Z3ImiB0eGgwN5TLAtmPQLxkHl
	Tn4D1oA7zcX13/d7OHsgEwgkLKphv87Y8n9+vHaJSuXdz7bXZxGSIie4eTGRV3rX
	h7MbeO3QnX4D6D40M+WNOQ89icrRKFauCw4RqZx9w5UqnNf/26ed69RoYMLRTyV+
	qps+n2wK6Lykcc6wp7397Fvr3Z52gTcyWN+ywpMsfAuhLvoruZgW+gWFqFPt/sa8
	6lj5fw0A58HHSQDm9bupRvEN0yxolTM7Bm7nVpYwphIWbqilMZiKZa0KtWZoFgNY
	xFhmkBTJQRciP523OuLDA==
X-ME-Sender: <xms:xdaIaLTPcHNLB3QXpFFd-z9ZeqATv-9BHA7AobcAzMkGwQtGwnnoCg>
    <xme:xdaIaMxDiltG0UgVCVAKgfe0M39NKL9Q0cA2uA0Vyd7N9nPK3BxwbRc6IlK1VOSti
    U7u9mwIbQKBhawPIXU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelhedviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeefhfehteffuddvgfeigefhjeetvdekteekjeefkeekleffjeetvedvgefhhfeihfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepudekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsrhhglhessghgug
    gvvhdrphhlpdhrtghpthhtohepnhhikhholhgrohhsrdhprghsrghlohhukhhoshessghl
    rghiiigvrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhrihgthhgrrhgusegsohhoth
    hlihhnrdgtohhmpdhrtghpthhtohepkhhoihgthhhirhhordguvghnsegtrghnohhnihgt
    rghlrdgtohhmpdhrtghpthhtohepughlrghnsehgvghnthhoohdrohhrghdprhgtphhtth
    hopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheprghl
    vgigrghnuggvrhdrshhvvghrughlihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplh
    hkphesihhnthgvlhdrtghomhdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:xdaIaLiwD5Z-T_JjbUMhKMFhNUzADagw3kV4oUcTEFyOLxTP7ok_5w>
    <xmx:xdaIaNitssFW8BiPoaGsNmQ9fZnFiK9q4kYs9DxguRjg7DTYFoRE7Q>
    <xmx:xdaIaDasfvaG0hshiKJpbbYR24B7HiixMZth93V-eUD1tcMV_ZdaNQ>
    <xmx:xdaIaGWWJvRoJsRiYVjEByxDJAmh3RedNq33vrUBYTtCyx1SEq4A3g>
    <xmx:x9aIaNTr7MrDyvM0nA3TLVY29MRwVIe2F-S0vMzg9fpJdLqbSTCppvhP>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A5F0E700065; Tue, 29 Jul 2025 10:12:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T15b001141a5b4202
Date: Tue, 29 Jul 2025 16:11:22 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
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
Message-Id: <476d821e-1f8a-44e3-a976-def1f435440e@app.fastmail.com>
In-Reply-To: 
 <CAMuHMdUSsKeY-Uj1xA4SatDk+Mb0e4LJyOU=aS52YbA3DSMLrA@mail.gmail.com>
References: <20250726211053.2226857-1-arnd@kernel.org>
 <CAMuHMdU6Akz0GC2hooAxn=C2F0WjagPkzRKcH1SJiW0CBeUOaw@mail.gmail.com>
 <f0a2a000-381e-40d8-a9ac-4d75dba332e9@app.fastmail.com>
 <CAMuHMdUSsKeY-Uj1xA4SatDk+Mb0e4LJyOU=aS52YbA3DSMLrA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: enable CONFIG_GPIOLIB_LEGACY even for !GPIOLIB
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Jul 29, 2025, at 14:12, Geert Uytterhoeven wrote:
> On Tue, 29 Jul 2025 at 13:58, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Tue, Jul 29, 2025, at 12:47, Geert Uytterhoeven wrote:
>> Do you have an example config that shows this problem?
>> I've tried a couple of configurations on m68k now but are unable
>> to reproduce this, using 'defconfig' (without GPIOLIB) and
>> 'm5475evb_defconfig' (with GPIOLIB).
>>
>> The intention of this patch (in combination with the previous one)
>> was that the legacy interfaces would still behave exactly like
>> before, falling back to the stubs when GPIOLIB is disabled.
>
> I haven't seen any actual failures.  When discovering
> CONFIG_GPIOLIB_LEGACY=y in all m68k defconfigs, my initial worry
> was that it would increase kernel size by needlessly including
> gpiolib-legacy.o. When that didn't turn out to be true, I started
> wondering how your commit would fix anything without including
> gpiolib-legacy.o.  Looks like any users just uses the simple static
> inlines...
> Sorry for confusing you.

No worries, thanks for paying attention to incoming changes!

If you want to see what the actual plan is, have a look at

https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=config-gpio-legacy

which ends with making GPIOLIB_LEGACY actually optional.

Any driver that actually uses the legacy gpiolib interfaces
at that point is already specific to one of the few platforms
that still have legacy gpiochips (sh, sa1100, pxa, s3c64xx,
orion5x, mv78xx0, coldfire, alchemy, txx9, bcm47xx, bcm63xx,
rb532, olpc, and a few x86 atom boards), or it has an explicit
dependency on GPIOLIB_LEGACY.

The arm boards are already on their way out, but the others
could probably use some help converting to gpio descriptors.

     Arnd

