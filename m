Return-Path: <linux-gpio+bounces-36216-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDaID+v8+WkqFwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36216-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 16:21:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9C34CF4B7
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 16:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 38962301AEC2
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 14:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFCA47F2F3;
	Tue,  5 May 2026 14:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="sDI00jQ1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Rc0SZmpq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A8E4611C9;
	Tue,  5 May 2026 14:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990881; cv=none; b=U/H6JdPglnDQou5JCYR1IDrr6mbqfOrreUYppx4cRC9qJup6pFqXY+sXLvMT23iAESgSsPf+uHBgqSV7AfbwuzGjfWjym5MnjzEzylY65w0uOadwKBCgMGTp7h+QL2uWSWLvNvh8agW7T/HcTZjEhBxuh1r1kXHDTXvsBHpqHT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990881; c=relaxed/simple;
	bh=UHABoaJaVAWd4iASQin7/N6ZwFW6w62RIrEygv6fM24=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Djw5psbjH9JKuxDMq10cfIEzjELE6dGe3u8vvsGGRvLdpXUsHAQRDuCtX/t5Dngf3yxVkpwv3FIEOYmBwoHe3bfl7yatA78OJ8tjvlxH6H5qP/UK+4UTbAjQKplK0KyDg8ZJpfLG7MjFpYPP0ma4VxoZgE6zCj9L71YWP8cbBLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=sDI00jQ1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Rc0SZmpq; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 115D47A00AF;
	Tue,  5 May 2026 10:21:17 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 05 May 2026 10:21:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777990877;
	 x=1778077277; bh=spFn28IaAcyoH75JuQR6dT/DLGGLgNP5S3NEjUd/CRQ=; b=
	sDI00jQ1mC4Pg6tf3qeKQAxXsJ3xtCjh6xetpPiOP1xKXXK0FAH4NJ9/5XZYkrfJ
	3PLo7byYiRJKfoBfw9B6hhgfzyWnCQL5ghwKTr9bMrEFLDqMpGs2CuPjRdTZLDWK
	yCi8GOsjbtCxlDbaoSxNXEVWUQDkaIWya7Pyf4aMFdONDxg9Gg/iRq/Qv1RI30AR
	ufE254QXO4ICKodpzg2ZaRg/nBLYJfRZOtFvyJaVZZVFcWAAw7+9eslBYhVAp5AJ
	C2fmu+K/P+2GxUuaV/n1MIz5PTT6VCzztbDa1Ayyfw6otORsPLB1JGrGlDkcSp5i
	5R6YuiBTiq6Ap5eZBjvzBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777990877; x=
	1778077277; bh=spFn28IaAcyoH75JuQR6dT/DLGGLgNP5S3NEjUd/CRQ=; b=R
	c0SZmpqeFb4SraOePaaYXwRhDyeFDmKj51TEsazDbnMXeamuhBm9fIqXr7HRhSeQ
	oIZIqfGFawiEGrW+TPwZNKze7byhvAm9dCcBL5II80mCt//mefSQ97ho3ZRC1cDu
	+OCzbgdyIXtZSl+0NJRQvelSBmB76furUoj/16IRKY1OpD5l+bwi4PX/jq3UgArd
	cblnzKUjw78oGAj35ltb/Gv09oR+UcWyY7I63RfYUJJxeQCYqzA0ml1zMf34viC5
	wSXeHFar+y2vEpUGoE9o3sa3DodD1xzXHBT1zzswyOtdB3i4BBi8mK8MQHLf4Hmw
	SVJaL5tQxxGU4ZgNtMADA==
X-ME-Sender: <xms:3fz5aa9bT07BlI9ppMeRKRVUqVS8AH9LX57xJ6FbFdGlPD-gz9f7Ng>
    <xme:3fz5aVgXDMdG0fmJcGSb2HHk4GlIbagpvC8mmQSDYeWy5-Gs3QQ1OkCHecmNa_ukS
    qRFPQCAcC3vfsQMbfBkUB95RV9v7qG1LQqQ3XrMrMk_zVeTuATPHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdduleefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegumhhithhrhidrthhorhhokhhhohhvsehgmhgrihhlrdgtohhmpd
    hrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrhhglhes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhushifsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghvvghl
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkh
    hosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqghhpihho
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvg
    hlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:3fz5aYpzM_D91L2EudDcttTAhTNrbjM6a5rfgon85XBdkuJKw-OKyQ>
    <xmx:3fz5ac6zZhEWzL0MwImdb7EMRbKUjIaBkAJuvEQlykTBG4-bdHmEDg>
    <xmx:3fz5aWjmewvPrre4rhQOf7L7kvdFAYfYbb6T-D0rmA4kXG0a4FCcLA>
    <xmx:3fz5aS5dh8Pe6pGqUcJvBPlCmdNz0Rh2jPggWWiY95RUBbkVg9-_hA>
    <xmx:3fz5aXiYm3iey7TdUl8ArUKW_wOh1aOAYVKpcrehHyedAw1z5LGwywNz>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 47C3D70006A; Tue,  5 May 2026 10:21:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ARrtNTmGjyOc
Date: Tue, 05 May 2026 16:19:47 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Lee Jones" <lee@kernel.org>,
 "Pavel Machek" <pavel@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Message-Id: <ffc24364-6732-47a1-8b56-e5d8b1488c57@app.fastmail.com>
In-Reply-To: <afnvtid9rSoZ2dkQ@ashevche-desk.local>
References: <20260430091202.2724109-1-arnd@kernel.org>
 <afhLS6xwHGm9_mLy@ashevche-desk.local>
 <bfecac99-3ec1-473a-bd5f-e49ae48aebf3@app.fastmail.com>
 <afnuY6IPvC7dgUC9@ashevche-desk.local> <afnvtid9rSoZ2dkQ@ashevche-desk.local>
Subject: Re: [PATCH] [v2] leds: gpio: make legacy gpiolib interface optional
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9D9C34CF4B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36216-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,messagingengine.com:dkim,arndb.de:dkim,app.fastmail.com:mid]

On Tue, May 5, 2026, at 15:25, Andy Shevchenko wrote:
> On Tue, May 05, 2026 at 04:19:36PM +0300, Andy Shevchenko wrote:
>> On Tue, May 05, 2026 at 03:10:28PM +0200, Arnd Bergmann wrote:
>> > On Mon, May 4, 2026, at 09:31, Andy Shevchenko wrote:
>> >        struct gpio_desc *gpiod;
>> > 
>> >        gpiod = devm_gpiod_get_index_optional(dev, NULL, idx, GPIOD_OUT_LOW);
>> 
>> >        if (gpiod && !IS_ERR(gpiod));
>> 
>> And this is not needed. The below is NULL-aware.
>
> To be clear
>
>         struct gpio_desc *gpiod;
>
>         gpiod = devm_gpiod_get_index_optional(dev, NULL, idx, GPIOD_OUT_LOW);
>         if (!IS_ERR(gpiod))
>                 gpiod_set_consumer_name(gpiod, template->name);
>
>         return gpiod;
>
> But looking at the original code, I would leave another return, so

Right, I actually had this at first, but decided to keep the NULL
check because that was used in the driver already.

I've dropped it again now.

>> >   gpiod = devm_gpiod_get_index_optional(dev, template->name, i, GPIOD_OUT_LOW);
>> > 
>> > Did I get that right? If so, I'll fold that in as another
>
> Nope, the con_id != consumer name. Can't be done this way.

I see. I had tried to find an existing interface that sets
the consumer name and saw that gpiod_get_index() internally
uses con_id as the label if set, but I missed that this would
break the actual lookup in gpio_desc_table_match() because the
13 lookup tables are of course all defined by index rather than
by name.

      Arnd

