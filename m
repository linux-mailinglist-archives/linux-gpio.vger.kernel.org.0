Return-Path: <linux-gpio+bounces-21567-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AD3AD9681
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 22:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C7D91BC0989
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 20:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F9A248F59;
	Fri, 13 Jun 2025 20:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="1k+WjMuK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TQKKtzvk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454E41EEA47;
	Fri, 13 Jun 2025 20:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749847058; cv=none; b=HDkEe0Lt54QG1xpIe5SLqXNDv+u+0AtlqCK/cDv7CoCTyQYAbhW8fNLUlLa4ow9SSq06OPiPQm30pvA6Qxy2oe/87NXsjNEath0RcNQH6udD/JWkXthjMBqHN4xsdfsIvRLjF9XsQs34cq8VAnSwrSfg/UqgaOh5IlgBRH6kjKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749847058; c=relaxed/simple;
	bh=CsX8xpMqWyr/rItlW7gwCYmjEsPqTfqg9p4t2K0l59s=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=IIrK8Ne09CzKaV0unDahOk6iskKZnCB/Sd/ApiMmXa4zT4fhwOIlz6ZKRTNm+FscvvJINpYydlGRC5PpVVqVP0P/N0GJ2aoesmtfQJ0gOQySOKyDUBYv0dL4hLXag1HBN4OXeYs4aXeijlvFybj6jrY/3NRvoKh0w59IIbJm4Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=1k+WjMuK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TQKKtzvk; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E1AE225400AA;
	Fri, 13 Jun 2025 16:37:33 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 13 Jun 2025 16:37:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749847053;
	 x=1749933453; bh=38fc6baiLFupD6hkdl0qPcWi2dveS7upeTlkKkc7Bvo=; b=
	1k+WjMuKesWaiMgSIbdi448G+8Ovf+aYM5AwQnmqi8/IJPcgS3SjihcwRDyaxs1g
	6e9ZcfPsjEmkZW009oU34uQ3jrIA1b8SN0AEHIgR8O74WMzX0uUD7cbjo7j+24ck
	x4BDRcF/36Kf5wZOpX77MYGrlM6I/yMm4ougpfJzGzoF+Btcjv+sFrXlPd6ckTK4
	+avG1M9KIrvTpI4G70QjUeFj1AAYh6wBXge43FVbreZJpTQdvBn6THTdDtFLia/9
	u99sYubN6vZdhIgwiy0MqayL7PDtVIX45cvXcCxSSkvie23NTwqdpSg5qg9p8Gfb
	AdVuecc6NIpZu6F3Gd75WA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749847053; x=
	1749933453; bh=38fc6baiLFupD6hkdl0qPcWi2dveS7upeTlkKkc7Bvo=; b=T
	QKKtzvkDUoDxI8fsrKTXDxXaPYzpiQDlB9p9ck0rZT3S+vW204lmFBY6N15MCCGW
	1+4TcsaOLf4gxmQQ/w0CViHaelvD8ZpJlQF/mBPwe96kSex7Rgurx0WIcJJmt7fA
	+h/TzsfQEd0Mn+6NrA8OBCelz5MOAgePxRtlYYorgdw3U78eswB9EO36om0sU6Wi
	JG8Vfg54B79x2gA6hV/PBslRKzGenWrern8yEEBB/muvNBn2lnl4xBi6pjLo/xzL
	vJ7cABQZQ5inCLKndOLig5JFtmLjCRNhI9vKRjFT6xd7cK4p+6LIUo7xc2dzoCB9
	Sz5k3mABLZKuRkryp7oFA==
X-ME-Sender: <xms:DIxMaDVl8SkMWwLS5eFCILZ5tju7LoF5262rWxQLWS4kJgAbVU8h2Q>
    <xme:DIxMaLnRh0e-qIdyoZgZ8PCUNsMEadsJgTgDf5K53g1SIn7FUSZmPgGW-Mxq_q489
    SmOEfgAVBBqH4Uq6Rs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeelvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegulhgvtghhnhgvrhessggrhihlih
    gsrhgvrdgtohhmpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthho
    pegrnhguhidrshhhvghvtghhvghnkhhosehgmhgrihhlrdgtohhmpdhrtghpthhtoheplh
    hinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhu
    gidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtg
    hpthhtohepshgvsggrshhtihgvnhdrsghouhhruggvlhhinhesshgrvhhoihhrfhgrihhr
    vghlihhnuhigrdgtohhmpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdr
    khgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:DIxMaPbZLDcLwtPKub_5gHdfUoeMa7YCnTlJhjDeyapj3n49qpQQQw>
    <xmx:DIxMaOU9l1HDb2GiSjZBopVK1VwfEaUOFGzedbuaNiCsWv3YjQoPcw>
    <xmx:DIxMaNncYIDE_LUEMtYJouRPNewJ-XhDX2V2MBJqArhNxnuUdaHhAg>
    <xmx:DIxMaLeam_ZVzR3f5HZJgUFAHF2tesxxvgpBncraBPYrClwGVZrc3Q>
    <xmx:DYxMaDKJKkEK6AlbZgzDf6j2kLVUTjMCOLTZqpUo03BPKRKOMOYczYTP>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D72DF700062; Fri, 13 Jun 2025 16:37:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T096d278615d9b919
Date: Fri, 13 Jun 2025 22:37:02 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "David Lechner" <dlechner@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Cc: "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org, "Andy Shevchenko" <andy.shevchenko@gmail.com>,
 "Sebastien Bourdelin" <sebastien.bourdelin@savoirfairelinux.com>
Message-Id: <b0859b25-0e95-4966-a433-5757d8bd9e6a@app.fastmail.com>
In-Reply-To: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
References: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
Subject: Re: [PATCH v5 0/3] bus: ts-nbus: use gpiod_multi_set_value_cansleep
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Jun 13, 2025, at 20:55, David Lechner wrote:
> This is what remains from "gpiolib: add gpiod_multi_set_value_cansleep"
> that didn't get applied yet for the bus subsystem. So I have changed
> the subject line accordingly.
>
> Arnd,
>
> There was no maintainer listed in MAINTAINERS for the ts-nbus driver
> and it looks like you have picked up patches for it in the past. Could
> you please pick up these as well?

Sure, no problem, just a few things:

- These are all cleanups that can wait until 6.17, right?
- I see the driver has no in-tree users, and apparently never
  were. There is a imx28-ts4600.dts file that should reference
  it but doesn't. Do we have any indication that the driver works?
  Added Sebastien to Cc as well for clarification.
- it would help me if you can send the patches to soc@kernel.org
  for me to pick up, as that ensures I don't forget them.

     Arnd

