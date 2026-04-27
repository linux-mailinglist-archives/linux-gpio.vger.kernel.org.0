Return-Path: <linux-gpio+bounces-35604-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIwwGUyG72lPCAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35604-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 17:52:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 120DA475973
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 17:52:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4B9F3191DAE
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 15:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B3235F5F7;
	Mon, 27 Apr 2026 15:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="LuObU3N4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YJL793Mr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB4F346A01;
	Mon, 27 Apr 2026 15:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777304076; cv=none; b=nJFo/eZjNhkaGg2ImJH3F0gFnh8H+V/GrfuOrQ4l6DiMcp8vFOjpJVXKPV0Vzjly1KimuiI2itsT5wgacy3ms3d0FsuqQG/OrVL5tFJGnQALxF8NbyNZ6D6ClCSgYRnyWEW567cUgSWYQv/C9bhWmBlC6IV6abBVTqnL/XJVWeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777304076; c=relaxed/simple;
	bh=ZXiczgbbqGEeoZM3UZYt71WA0J5a5jItYEpk/h9T3cU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=WlWlugJD29w9tPqqgrsVgsMBnpNEPPLllMul1ONMKeitH1N096NczyVABGrrt1+gNYqkBlJoEqheyAIL2piP8eGcqEBo9joWet5F4VlK57FVAwVf90LPlL9mWhxbDi3JgjECRtZVWgX+DtNwC9BXO4FtaZz4ft8vp/GOe7P/P50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=LuObU3N4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YJL793Mr; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 6CFADEC0519;
	Mon, 27 Apr 2026 11:34:34 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 27 Apr 2026 11:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777304074;
	 x=1777390474; bh=PqPbveDdKnORrDTeZTOmOclyiNhJO7Ho/zIMLf0qojw=; b=
	LuObU3N4OpZ3x/jezT0VYJbCtJQ9vzSOJRLY6ctXi7VV3/VqE+nWty0OJlOAnMvQ
	Kw2SOhzBXOtJmBaObEESLiZF5ehDawNQB9avyuCqOiGxV3Cyo0FvZnPbHymMclyB
	myj6Rrbci+z/hu6BP0hl5ZbNKWRRwbdTzdcUrX+KqFQohHfSs0MFrjROY754t/u0
	536gIBYq0qxp9vEuaeBqGoQ5VMY7G2XbSY1SNWwkU7h9Y2TsTBE+b0LFXp86/SZ1
	3SUucl/V+BrI9Hl36s33vk2Da/vmA9dHqBUd1VX40hT81gaPSMhfHGu490yQz3kk
	vmSB1qPGujaZ5xCdDYZplg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777304074; x=
	1777390474; bh=PqPbveDdKnORrDTeZTOmOclyiNhJO7Ho/zIMLf0qojw=; b=Y
	JL793Mr5i6pnQGWC1/G5Dkak0mTKxtZVgTZVkSP7XKBVvfkuJph/NSKwD6+wx87l
	++U0PXKNYyqJjjoRRwJOe3PfYBb2JP3BLlwSzCVGkucWuWMcNb5zCK7EJQiDmDgN
	8cK3h3S1A8risKhegPIR3K0GsEiw80ScO/SnoHMWGzh91Jst8IYihehebm9lqAnh
	t8syunfyPBtDGBT+OsPEKbiUdF4vVXLxfxE7waTcS9V9VKxrTRsIoPzIsTgZVg8C
	rJIBJpTiPjDoD+e7N3zHpfEg0q/PThti9RAmoTWbOHC3uxSaqTNsxzpi17RkhyEd
	eMf3AnryZhAo7I0eNHA8Q==
X-ME-Sender: <xms:CoLvaUMDRi7oL5u9wYwRJUTmNXfSueZN9_3HJ4jvbEUkWQOTBXmsiQ>
    <xme:CoLvaVxpEJIy3Nkb4jzuH_DJX4zRafxg7BvLixMV574rOoJavJldywZImNKx5xO85
    P3l10HXBtSZkp_QW37O9g8jBzR3ofoxtbEPFMpKYasJa9Jx6tj0HiA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejledtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedtteegheevlefglefhhfejkeevvdfhveeffeetveeitefgfeffgefgvedvgeethfen
    ucffohhmrghinhepfihiiihnvghtrdhiohenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphht
    thhopedujedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggrvhgvmhesuggrvh
    gvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgt
    ohhmpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrh
    hglheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhushifsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:CoLvacZvx1gaNT7vg0_JAOOO5c0zCG16SAzrGHIPhCpKAlIlx2bcRw>
    <xmx:CoLvaTU6IwPmlGrGICHGbQvUTv6bdFXHFkYB54yhj44PJ5gEMy1bbg>
    <xmx:CoLvadECCV4mlFFHEA9miu39yEsKyjkoqFkr671bppYplve2MNExgA>
    <xmx:CoLvadDRrxvnpg0aDRT37W4Zf4Fz6uOv6Iai6cXKohkxpFFZbrEOgQ>
    <xmx:CoLvadSZoE9pZbo6or3-NqccniyANW3tGzL9FG3S9RcqMBEPc0-PkYmQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 107E4700065; Mon, 27 Apr 2026 11:34:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A5-Su42ZZeGF
Date: Mon, 27 Apr 2026 17:34:12 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrew Lunn" <andrew@lunn.ch>
Cc: "Rob Herring" <robh@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>,
 "Marco Crivellari" <marco.crivellari@suse.com>,
 Netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Message-Id: <1f5c8677-88c7-4d48-bd30-4bff3fe3eee1@app.fastmail.com>
In-Reply-To: <992f111e-febc-436d-b7ca-fa167a858e93@lunn.ch>
References: <20260427142924.2702598-1-arnd@kernel.org>
 <20260427145010.GA2502144-robh@kernel.org>
 <57297b41-0f08-43eb-a73c-21a5461a4eb4@app.fastmail.com>
 <992f111e-febc-436d-b7ca-fa167a858e93@lunn.ch>
Subject: Re: [PATCH] [v4] wiznet: convert to GPIO descriptors
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 120DA475973
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-35604-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:dkim,wiznet.io:url,messagingengine.com:dkim,app.fastmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, Apr 27, 2026, at 17:25, Andrew Lunn wrote:
> On Mon, Apr 27, 2026 at 05:17:24PM +0200, Arnd Bergmann wrote:
>> On Mon, Apr 27, 2026, at 16:50, Rob Herring wrote:
> I would suggest giving Nicolas Saenz Julienne time to speak up. If
> Nicolas does not require it any more, i suggest removing it. That fits
> with what we are trying to do at the moment in netdev, remove old
> drivers.

Sounds good. Even if Nicolas thinks there may be users of the
SPI interface with the existing DT binding, we can still decide
to remove the MMIO interface entirely, as I first suggested.

Apparently the chips are still in production and are commonly
used with microcontrollers, but the only reference I found
about using Linux with it is in a blog post that mentions
an "official" driver from the manufacturer, with an
(incompatible) compatible="w5000-wiz0" DT binding:

https://maker.wiznet.io/gavinchang/projects/linux-w5500-driver-and-use-1/

       Arnd

