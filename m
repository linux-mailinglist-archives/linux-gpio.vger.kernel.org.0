Return-Path: <linux-gpio+bounces-24118-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72430B1F610
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Aug 2025 21:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EA5C17F4F6
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Aug 2025 19:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449F526D4CE;
	Sat,  9 Aug 2025 19:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="FPjqUn1h";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eKkPziaj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6437E12E1CD;
	Sat,  9 Aug 2025 19:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754768885; cv=none; b=Ox5AjPJ+grBNS1s0/WsVhwzIpHlsauyx3FDVIrvvB7Dq3CVQgSHNbstL9GkeE+VIY78yyPgcEa7hcO5RwSy0k4QAYrXUy059q92hG4WikvAz0SCg5R+rAbHDQNsP+c/MOyVWywH7xZhK0mWwE6xnWsarj93aL2uB2wQO+dBX1JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754768885; c=relaxed/simple;
	bh=ATqPh2dSeetHEr4AMA79KW/e8xMzs6w7YrGH9/c34XQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=q456FcmdtzddFc4G6/e+F7JBYDc7WP6yB46ROCLH+vaQX5pp2pZJ1w7wLpfyOegZbfi9sSraaKG8cM4FgF1HcSOhi6yCcaR9HFg9sXqnbyjUEnI0SDZ5F5RDtqzfNmwsZDhtwKfNFsYM/tdIAJiJKoqSN36wJmRR0GU66bNHnvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=FPjqUn1h; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eKkPziaj; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 75CDA14000A9;
	Sat,  9 Aug 2025 15:48:02 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 09 Aug 2025 15:48:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1754768882;
	 x=1754855282; bh=WKr2MJBq8olqh9D8tHXchCabQhGaSNKZjhY9rwmDxhc=; b=
	FPjqUn1hz3rUmrl2IJT39E+kqwKhDmrb2QtRsdWP1j7ZbpmIIyrMHht5M0u+n0s5
	Xy18rjbDoZWSnv5Jd/Rm177so+M8oBknOyVl7T0jKP/nvM11DWe+Ze4M2M/A7TCa
	X9Z+uN+DUjxqdpfEaQ3kWwIBmUW0SewI7+BKTpFWcb/IWvZ+S8upZ5v4qAi5d5vM
	G8sYXHzUchepyfxCwGtApPzNenPtbyiw7BGgupuKjPx38NgiQTeLlizPDTW3Vt9u
	BIcbJC/2AwLNW+jiDOlYl9BIb2s7PP9JiFJHWLCWFzXsHzHPgorOabsSH4fTLzSu
	Jl0JjZGE3Ohm8opAoxvXCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1754768882; x=
	1754855282; bh=WKr2MJBq8olqh9D8tHXchCabQhGaSNKZjhY9rwmDxhc=; b=e
	KkPziaj1n0PWrNDHC5DNKD4vXmcyb7EdvDCHwvDY/tVbk9AwgC9J9Zf1ScKiBn7E
	UIdsu45xdTxkm6oEkeYnBeDJMchRVAfPgES2+ObMQngifp16f2fzqDzrriLfPjbq
	hhmEF6NfR10yksTCgUr4u8GJRCB9BstMPk5F0CNLQ1uvg1KbTCaCXLr65TUfUIST
	qCCnAUtRuHtL0uK/51F1bElcRFid6LCRmJ1hTAZo2sG1j9KIig5nyy0wXTE6RJHj
	iOTckmlyWcwlITNJJR+87yyAY5OGKc5LyE5Z03je2+65r/KBwfu3khlWhIIEqov0
	XPIR1Jsh4cwrvnKbK/XKA==
X-ME-Sender: <xms:8qWXaGS-3l9L3rfK-M7Dgego2FkO8q0XwBX7uy6bbq15BZqBn2Y9dA>
    <xme:8qWXaLwEC3WZYzZi-JCW5t7VsJV2MOtSBdNZbjv_y1QAVZKLhH3HFCpqu0ByYPiBM
    IIdrNTNebulc6IC51A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdejheejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepkhhoihgthh
    hirhhordguvghnsegtrghnohhnihgtrghlrdgtohhmpdhrtghpthhtohepghgvvghrthdo
    rhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopegrrhhnugeskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheprghnughrvgdrughrrghsiihikheslhhinhgrrhhordho
    rhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpd
    hrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgv
    lhdrtghomhdprhgtphhtthhopehpvghnghdrfhgrnhesnhigphdrtghomhdprhgtphhtth
    hopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:8qWXaG_aftMSWvaYoFE2Zng8N4wSSnNFoVa3y44hQrsXjuHvE0aehQ>
    <xmx:8qWXaGZ9ES8pwKkdWOmNZEkf10UcLNdw_sCWiAZZ3QNWW1_2YiRu-w>
    <xmx:8qWXaHqOnDH4EJhur9slXpUjAtR5yx7qL3tMPcTeMXaMsi2Y0GL-zw>
    <xmx:8qWXaKSJcONRJGK4owYejkl3fD_RseR2KGdD84-2_jVcaWZNUP8MVQ>
    <xmx:8qWXaDQSK-048mrRE-j2bkH0zppFuf1NcL9Sht-RrULvzUpLfNSBaHBj>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1C1A8700065; Sat,  9 Aug 2025 15:48:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T61f8b4fdd2b1374b
Date: Sat, 09 Aug 2025 21:47:31 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Peng Fan" <peng.fan@nxp.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Koichiro Den" <koichiro.den@canonical.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-kernel@vger.kernel.org
Message-Id: <c7d66744-29c9-4f70-905f-7ef133a22422@app.fastmail.com>
In-Reply-To: <aJcgZLWgMy01re08@smile.fi.intel.com>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-22-arnd@kernel.org>
 <aJcgZLWgMy01re08@smile.fi.intel.com>
Subject: Re: [PATCH 21/21] gpiolib: turn off legacy interface by default
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Aug 9, 2025, at 12:18, Andy Shevchenko wrote:
> On Fri, Aug 08, 2025 at 05:18:06PM +0200, Arnd Bergmann wrote:
>
>> All users of the legacy interface now select CONFIG_GPIOLIB_LEGACY,
>> so it can be turned off by default.
>> 
>> Allow turning it on manually for compile testing, in order to keep
>> the build coverage of the legacy drivers.
>
>>  config GPIOLIB_LEGACY
>> -	def_bool y
>> +	bool "Legacy GPIO interfaces" if COMPILE_TEST
>
> Maybe I'm missing something, but how does it supposed to be compiled for old
> platforms? (No, COMPILE_TEST is not a correct option for that)
> Perhaps you meant EXPERT ?

The COMPILE_TEST is really just meant for enabling some drivers
that would otherwise be skipped in allmodconfig builds.

All the old platforms that use one of the GPIOLIB_LEGACY drivers
select that symbol once the first six patches are merged.

    Arnd

