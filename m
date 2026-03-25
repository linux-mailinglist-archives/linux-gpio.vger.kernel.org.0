Return-Path: <linux-gpio+bounces-34123-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFBfFQm+w2mptwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34123-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 11:50:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E00753234E0
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 11:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2BF8330F9F92
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 10:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DAAD3BBA07;
	Wed, 25 Mar 2026 10:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="hIoYTVwG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="k9JBfeyU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18383B9DBB;
	Wed, 25 Mar 2026 10:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774435288; cv=none; b=DVXOUIqS3sY5T5ZxxXtMxV/VBexP7JnrPJQHpUFGsnRentOrT5N30ENilnaffWsNyOUXZSh00ieuxzxsbN7K2atIy1CtEkXyJJJL0RvES+65JbWc6gbw2vZ4fvRW7R4RSZXIoCMAm0RYP1l6JxhfcF9tUbshyoTRXI1CgC+6Y9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774435288; c=relaxed/simple;
	bh=5JVNnXfAOSxbrwJgERtWwdI7qhgGCWCYs7yCi+xqRqk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=an5LZgBD9H13vuUjiGTPbEJ5qUOnJ675Gxoidq7zjONbHTqfvYhTl/c1qK2YTJwa/wgR1/zday+RR4PBJy462X/SdNoU0qeZ4tSxTH/fGV61/0lVgJ/Cjrlj6b/G2mm1gRfKfJyhT1e+tRuWcD44dS37EW+aQYl8rSM7Oa4AoFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=hIoYTVwG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=k9JBfeyU; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 1C8E3EC008B;
	Wed, 25 Mar 2026 06:41:26 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 25 Mar 2026 06:41:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774435286;
	 x=1774521686; bh=AcUhwk3rqiMKPq50OnIJ7QU2UyvK/5IjslJpVaZ0nD0=; b=
	hIoYTVwGI4bcbO/0Hx0OtkRaT8drsHoKSzEN8QOGDKPfFe8F2vVTCbe5xuRjFgP/
	JMVbH3ojmaK//XjifU5t8mCLi9VjCbqASladM+m8eTUtHUjlKlf2gSeYUNE0ru6y
	Jdk1UBGPN1/SZQepX9KIUnxkt52gpAwRmsyB6t+uVfOn7BIilQ4rYIBnhZltzMud
	NDrKql+R9pTAY8ZrWgzKl3HVN1fwl3sqrsX8881k52GoESgrzsSp7nGWl9R5nBTc
	6EeuOrkPQtBPtZ1zik6NRVUS3hiUVZYrykLIlSoGZ1VsEpnoUgrNBuImRPgrmU6W
	68rCn917tNpr+q1GMNsvZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774435286; x=
	1774521686; bh=AcUhwk3rqiMKPq50OnIJ7QU2UyvK/5IjslJpVaZ0nD0=; b=k
	9JBfeyUy8ot9s/AZfT7qTXN5rh9CO/6AjTyssorp2ri8SNdME0RCx/qoy71B3Aly
	6a7A8egyk3uuNS9O84iDGZdbcGLK8BUeou16lkOyrDdJ9rd5t/mWCduol51WgDkW
	b2VfzPLKnw875J4AbhTbQPpgAUYVHb0TQxnpHcIK+dZPuORvUeKojHE/bsJsg0ap
	7M0PsVcFWDmBp22G09z7ZdNmVvG9bSBuVZR5V21jMTrdxLzkA7g9LEoqyBW0ZuZc
	Gn88KmTbE+tOwlGY8qbHBcOtoNFEwQGaF+ruP/y7Tx93Rjgk4yg8m0QZMd2l8/Ug
	SuSzAOQDHuY97MdzHvL7Q==
X-ME-Sender: <xms:1bvDaQYe3JeM4UhvQ0OEwfI2WcDl8Cb9je97ZH7zCZ9vo-lurQsdpg>
    <xme:1bvDaWMAySiHuSbfamQuNRq-GDG4nnBo4NdedVngBgswu_7aMHJTjU_wAtW3SuZcC
    IovSnk9E_kYrjC6uVcJHroTxRH2belNxltTHtOaz7c71Pn9DbyySVE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdegvdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhose
    gtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepmhgrthhthhhirghsrdgsghhgsehg
    mhgrihhlrdgtohhmpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegsrhhglheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughlrghnsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhhsfieskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggv
    rggurdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrd
    hinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhi
    shhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:1bvDaSIidv0VH9EqpFf7lWU1nrpoHrkHXYrXOzJdVXpZFb5gLuDrnQ>
    <xmx:1bvDad0HFZ81O1XtnWeWv6r8TXTtnnJOzlDE4Z__qYZagt-_I-HKeg>
    <xmx:1bvDabU0OE4KgWfODjpt6QQ1J95WS496bcfA2IdkFOtSBvhmn963qw>
    <xmx:1bvDaYxWpYq_wG9aRdGmys5MZZo3ErIccxXv68CwfEcbRYrTfWWkNg>
    <xmx:1rvDaZgl7b-ZsH3SppgAoMe344kDy9kVd7DXZZcbGKYahqqXS0YhL3Z1>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CD83E700065; Wed, 25 Mar 2026 06:41:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AK0r1PqEPgIR
Date: Wed, 25 Mar 2026 11:41:04 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bartosz Golaszewski" <brgl@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Yixun Lan" <dlan@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, "Linus Walleij" <linusw@kernel.org>
Message-Id: <1789ce66-5a18-4b54-bbad-3b2049f2c26d@app.fastmail.com>
In-Reply-To: 
 <CAMRc=Mdwu85gghDjQEu4eP2HZxHjBFpph07q9SOfAifSDMtpVw@mail.gmail.com>
References: <20260325100144.1696731-1-arnd@kernel.org>
 <CAMRc=Mdwu85gghDjQEu4eP2HZxHjBFpph07q9SOfAifSDMtpVw@mail.gmail.com>
Subject: Re: [PATCH] gpio: fix up CONFIG_OF dependencies
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-34123-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:dkim,app.fastmail.com:mid,messagingengine.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E00753234E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026, at 11:32, Bartosz Golaszewski wrote:
> On Wed, 25 Mar 2026 11:01:14 +0100, Arnd Bergmann <arnd@kernel.org> said:
>>
>> WARNING: unmet direct dependencies detected for GPIO_SYSCON
>>   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
>>   Selected by [y]:
>>   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
>>
>
> Thanks and sorry for the breakage. However, I'm wondering if it wouldn't make
> sense to do the following:
>
>
> -#if defined(CONFIG_OF_GPIO)
>  	/*
>  	 * If CONFIG_OF_GPIO is enabled, then all GPIO controllers described in
>  	 * the device tree automatically may have an OF translation
...
> Symbols from linux/of.h are stubbed out and these drivers can build just fine
> with !CONFIG_OF. This would naturally increase the build coverage.

I don't think we need to worry about the build coverage here, CONFIG_OF
is still included in x86 allmodconfig and half the randconfig builds,
so the drivers get enough exposure either way.

On the other hand, dropping the build time check may help avoid
future Kconfig dependency issues, so that still sounds like a
reasonable suggestion. At least CONFIG_GPIO_SAMA5D2_PIOBU
is going to need the 'depends on OF' regardless though to work
around the other build error I cited above.

     Arnd

