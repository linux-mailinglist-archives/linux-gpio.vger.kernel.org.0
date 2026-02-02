Return-Path: <linux-gpio+bounces-31356-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJG7MZgBgWlyDgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31356-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Feb 2026 20:57:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB48FD0E1A
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Feb 2026 20:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7C27B30028D6
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Feb 2026 19:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03FF1309F0E;
	Mon,  2 Feb 2026 19:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="aQl8NKT2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W2IQGRGP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99843EBF3D;
	Mon,  2 Feb 2026 19:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770062200; cv=none; b=LVlIXF7ALiGkHct+Cdye94CKODGD1RkodoztlpMCporOcV6XUFGO3CyW3Jlu2lDo4xq+4lmHuPMzNhi8TApcMRqwocsJiKjTFOj5NCDn+BQAXVIGyYEmYBlav0sILdveazcteDFGZjT5tqB376Far9O2/jc0+Y4gmu1wrCHfFu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770062200; c=relaxed/simple;
	bh=roeYpm4MhQfFQJp+e/xLatfKGDkuGQC+YASdP3M9qEQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=HPj+Z62ERWZix3icPwCIu4jdDD0t4Jbmnez2e/4vhLTPV3mnnf9O8ITX4Yyvtp3u5f6cnKHNtleFrXNtOu4jI1xBId2CPeJRjHqmreDv4SLU+FV5s3IIuNFDS9r3RXlE7ZJynfFz8dPc32NWrUR+XZSLv5hFJrKbaqbDGHnTwSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=aQl8NKT2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=W2IQGRGP; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id CD3D2EC00A6;
	Mon,  2 Feb 2026 14:56:37 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 02 Feb 2026 14:56:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770062197;
	 x=1770148597; bh=mWprXrBIGCplok+JlG5EU/oWJBgLlVTYLtKa7Z9iRbg=; b=
	aQl8NKT20YFsT8gHkeSp3WJwkfvdWeQgN8XnwRFCC5px4W3B/Swd/YvHyvaohXk+
	/n0ObWOo7+PhsN6+HD+bdQ225+yfwDVh8bmf+x75P95APfg5ACSnZCwsrAhH+QGI
	IUuJSee0hDqnGtGZ/XzGFqQAnVJ/YMvmFCUa2223MzIj9l3wRFrpRFnde7eWAc9m
	594q3ECJhqWdqEb+3J1tt8ujwV6y7ItEdg25BH2tZRRgsICNy0lraUMDuy8uCqyv
	FpQlCVrpiOEuvcMmQfxWbOrKljpDoxXrCYo1hEz7kMhsBWrWZpdvlrqnBMaSf7AJ
	U2MbNqkG5L2LxBgKsiSJGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770062197; x=
	1770148597; bh=mWprXrBIGCplok+JlG5EU/oWJBgLlVTYLtKa7Z9iRbg=; b=W
	2IQGRGPEWLiA86cY15B1JiAtHtJX5kCZ2LvLiQn05V+5z6ftsrJHzZqlsLJ4Fr1n
	D1wC6KH8B9q7FUwF5Mc5ExddfJ0tHXeRlkWI1XwgBDotnrq6X3ICs8XHSV2kwPGF
	Tc+Pfg+9lq4YtXMfiz0Ci+AIE1KIzErgUcOOQ63UF8vj6cUo52XIiJ7FrZHQr6RQ
	+Tf1w9DXwLXwRTXn5ZjyNt1rYRaje4Odtr6B1Jbr6apfyHIEh6letNb4nerfDAA6
	sd6ImZ+fgk6J3I+UIrnX30JZE5Kvi1u8LCBL3iADiXfZ0VUtfqT5y2pOprl3xR8u
	nLc+3JiFeGbIp3lEP1Rew==
X-ME-Sender: <xms:dQGBafyotjZA-Zi-UaMWmGyKcRy8eiF_4j6SUBQy6MAdIoTSX5u6Pw>
    <xme:dQGBaSEvd5Pa9J0j2pcLFhvkBx3LhgVkDxj7La1eXuMJmf7BgObJLoEaPvpT14WIm
    LdjXUBoseUT0dDL_YrWxTEzzWWVz1VDnWibdCjGHAjnFP9CC9MK330>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeekheegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefh
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrrhhnugeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheptghonhhorheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheplhhinhhushifsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrrd
    guohholhgvhiesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehlihhnuhigqdhg
    phhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvg
    hrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:dQGBaTzkjOPRRWfZbVI85ww_QWC_30CsTXPphQxYg_MEGOqXsJ2acg>
    <xmx:dQGBaWM0i3YwK-7Wj2P-PdpFAkMPSOScJsDEJJ10QvMUmm8dF9cxVA>
    <xmx:dQGBacW2or2AtMY2p7Wy7kP1tsHOEVvz3Kt3GbgAwhwIfYNcYoX1SQ>
    <xmx:dQGBaS3U5kCHMa_ma2Wb7PbA4-CAd8TsWsZ3pEaRc4uB9hjoebHbbA>
    <xmx:dQGBaf3vaaF37IaqlnJPopa86Jh0J8VuLwkR4USh8ou1xAuBs0gFtCQt>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 94C29700065; Mon,  2 Feb 2026 14:56:37 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AD9OnMuJ5n9w
Date: Mon, 02 Feb 2026 20:56:12 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor Dooley" <conor@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Linus Walleij" <linusw@kernel.org>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <8ab38205-8d96-4735-b44a-5f22e89206ee@app.fastmail.com>
In-Reply-To: <20260202-lushness-drier-ae0e40b56eee@spud>
References: <20260202095809.1318785-1-arnd@kernel.org>
 <20260202-lushness-drier-ae0e40b56eee@spud>
Subject: Re: [PATCH] pinctrl: polarfire: restore GENERIC_PINCONF dependency
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31356-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,messagingengine.com:dkim,arndb.de:email,arndb.de:dkim,app.fastmail.com:mid]
X-Rspamd-Queue-Id: BB48FD0E1A
X-Rspamd-Action: no action

On Mon, Feb 2, 2026, at 20:53, Conor Dooley wrote:
> On Mon, Feb 02, 2026 at 10:58:03AM +0100, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> Fixes: 488d704ed7b7 ("pinctrl: add polarfire soc mssio pinctrl driver")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Does this show up with
> https://lore.kernel.org/all/20260130-stoop-gleeful-29f2c525bd48@spud/
> applied?

I'm sure that's fine as well.

> I considered what you have here, went with what I linked cos it matches
> the other pinctrl core options.

Same here, I also thought about both options, but picked the other one ;-)

Looking at both again, I agree that your version is better, so
feel free to add

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

to that one.

       Arnd

