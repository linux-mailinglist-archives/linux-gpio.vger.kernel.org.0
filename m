Return-Path: <linux-gpio+bounces-37207-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EItyBiDJDWo33QUAu9opvQ
	(envelope-from <linux-gpio+bounces-37207-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 16:45:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5E458FF59
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 16:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92AF5330AD08
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 14:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09C53E9C31;
	Wed, 20 May 2026 14:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Vi+HO41X";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bC5dHP2s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D64D233933;
	Wed, 20 May 2026 14:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287436; cv=none; b=cRFriJyEeoAsqfNn2lWGlfUvCC4V9t2zzp3jtvQO7SM8k/jqJbQE98zWUpiEQ0WOwVX47s9MQ5LXB2SdXXGA7t7CdM2VB2UCPZ0OibHMcqyoy4IfFpYF8K92bPg+ZIGNw476Lmcq+YObG7AlDRPEmE31gNUayHko/CJhiN+9dhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287436; c=relaxed/simple;
	bh=qbOKHEQRKcpzx5fuRnrKNvwDAaFb8PFe1gEOiK5n/Bk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=XZs1KJyWT9QyauPKdnxYRex6a3xzolH5Ro3EI0rMPHThlsOB/Pru3wMdVVocSuAZ/YVAu1aG82cBnBjWFQWe0DRxcCWq0qO1zCh7aaGOoshKXnMH4GBAiNUK1CqsnMQpRUflL4NHc1Vr/zZ72To/6a5R84MOjRjHGwle35P+sss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Vi+HO41X; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bC5dHP2s; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 07B307A0146;
	Wed, 20 May 2026 10:30:34 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 20 May 2026 10:30:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1779287433;
	 x=1779373833; bh=HUpTTS+IBVo+B1ePxvSTFbYeFRlawG5ECYuL0/W6/dc=; b=
	Vi+HO41Xd+Tz420hm+NbD8KLpwvlmRHFxKb8dx0fibcUj4m7RhqZltciKQCIkTcH
	X9Rps48Wg4SdPGjy0dRC0afJ8LlnKaSFS19zhZF6I0/ng23YU+bXjSDW6pKJs+iU
	tK33baTQIrofNp4nsQw4ZC5M7jOgte7kLfJtgLsbS866r53zrf5ScWcqHHHTJr24
	wZj+6ui217V3Ps+f37b23jOCDB03mo8CwsduIHOwfrY1dWgSJ89rsLZYOdySUhHP
	iWZIRvgPeMeYcBFPcENJreSVIjxZTUyT+/2rljjUxfs1eE8Fjdj9+6JVuCocSXOV
	4OuG5zr2LAhYBHxs6pryJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779287433; x=
	1779373833; bh=HUpTTS+IBVo+B1ePxvSTFbYeFRlawG5ECYuL0/W6/dc=; b=b
	C5dHP2sfd42Y+s0XeTOiZaJgIdmShS6zP9YzY8a6AxTAb8A664QQxZwzyXlBMN5I
	wq2ByMtUoOjNjrl7zG84W6goXPdJf+ENNMEPZS1GJw6YYpJ+g1GZPWdEoqV7KM61
	HTJ16gCwruApBm1/wo0pO3cJ6DnaxlmAk3X9EUQ/8T13lDZY3UK7yCQEZabYfWWO
	/uGppvrDXGDzygbx+s+pQRA2je7uIHEeEK26KwrUbaG7uJT0HaXX0JJOeo+Or6LP
	TFsTZKvndmYGw9r6jhXVKuEeIHL9XGljms1uu2ZSUnKRUGkda8VZBSNiMimJPsgB
	SE1sUjc9Sx9Sl6f1EUD2g==
X-ME-Sender: <xms:icUNaq9O5pvZhC3BBC0jQNtHL0uSgW--bMV9HxBxi1xcaX4UP98Jmw>
    <xme:icUNaliOo3L7Dg0C25c9rH61Bm4zkx-yuNJrAFaHmQQf2bM-kNrjAmZonbJgdTjRt
    _AHlouSY53cYRFoDfqrxcrFq7sHuQSfTNe-tOqDwuSYRX8Bovdrg98>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeegkeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegvrhhrohhrvdejsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprg
    hnughrihihrdhshhgvvhgthhgvnhhkohesihhnthgvlhdrtghomhdprhgtphhtthhopegr
    rhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhushifsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehtrghkrghhihhrohdrrghkrghshhhisehlihhnrghrohdrohhrghdprhgtphhtthhope
    gtohhnohhrrdguohholhgvhiesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehf
    rhgrnhhkrdhlihesnhigphdrtghomhdprhgtphhtthhopehlihhnuhigqdhgphhiohesvh
    hgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:icUNaiLy-nynrrizBqu2-n27c59300S8ta1C54T8Rs2vyjLG4htAjw>
    <xmx:icUNagIcvjilrVU-xqaTPhdbu5C70r-0u5z1POPLQfQabf-RLtfHsg>
    <xmx:icUNatghtBdSA-QctHpv2FyPUsTzrfqIposEXRjAa-FbQPP623zH7A>
    <xmx:icUNaqOJrDO4OOh4FcwVvkucPXA2BGoywtm-SzDF2rObIcN8kIyFhg>
    <xmx:icUNahfpTLy9tdIb11P2_FYbe5Jv_ejBbq1ybvtxwu1EW52ZcvqfKbox>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 85F29182007E; Wed, 20 May 2026 10:30:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AdWUhd_ug9FV
Date: Wed, 20 May 2026 16:30:12 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor Dooley" <conor@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Linus Walleij" <linusw@kernel.org>, "Frank Li" <Frank.Li@nxp.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "Andy Shevchenko" <andriy.shevchenko@intel.com>,
 "Dan Carpenter" <error27@gmail.com>,
 "AKASHI Takahiro" <takahiro.akashi@linaro.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <a4a3bdde-5316-4e62-8411-dd2dce841296@app.fastmail.com>
In-Reply-To: <20260520-princess-garden-a6d5ad4f164a@spud>
References: <20260520075125.1514312-1-arnd@kernel.org>
 <20260520-princess-garden-a6d5ad4f164a@spud>
Subject: Re: [PATCH] pinctrl: avoid duplicate function definitions
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,microchip.com,intel.com,gmail.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37207-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,microchip.com:email,app.fastmail.com:mid,arndb.de:dkim,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 7D5E458FF59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026, at 16:13, Conor Dooley wrote:
> On Wed, May 20, 2026 at 09:51:14AM +0200, Arnd Bergmann wrote:

> And all of the of functions it uses have NOP variants don't they, so
> this is the correct fix from a build coverage point of view.

Yes, I verified that the code builds fine in random configurations
including those without CONFIG_OF.

> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,

      Arnd

