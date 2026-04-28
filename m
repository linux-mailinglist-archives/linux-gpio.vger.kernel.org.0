Return-Path: <linux-gpio+bounces-35721-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGdIIF/o8Gn2awEAu9opvQ
	(envelope-from <linux-gpio+bounces-35721-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 19:03:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 496204898A6
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 19:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0DA003135626
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 16:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2053932D0D8;
	Tue, 28 Apr 2026 16:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="jAXDlAmA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="b3PlFL7W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DABC32936C;
	Tue, 28 Apr 2026 16:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777393075; cv=none; b=fiEMrcJgjtIQyZWsbbHEOPYPoXuXMRdMiF887zvp7mirOB1RTrHJJ2seJCQQ+LSkL34bxHpRtZmpcNSsuNDrG/bB4lSLLd1MN5Rj+p3Lw7HOuUjL9nM7zxnB4WXnDoDDlMXnebVrj+b6Cd1TjPEaRq56EaVUavb+l8+Wpppo+ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777393075; c=relaxed/simple;
	bh=ilZ3ic4NHx2Z51nghgD7/27zpBjZpxCwNAbERIJ9038=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ZCrqsqoFHs8W9niplsGe5BKJ47qyzanCJg2ENA2aJ00eDkg1bkM/KzpOZth7ax0Sf2GxCpKBtt9IHPWbZLafph4dC/j/Ym0CZ+cvbK7YboM/CqGp8XSSOHem7/D9j27N4wc+aYv275S8gItkdS2n21qEomRTyB36ivhFL2ZuqJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=jAXDlAmA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=b3PlFL7W; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 3A946EC00C8;
	Tue, 28 Apr 2026 12:17:53 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 28 Apr 2026 12:17:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777393073;
	 x=1777479473; bh=NOtq5+rfTdtcUV80Tb+r5KplcBOzRSAAUcR5coq1YGo=; b=
	jAXDlAmARmS4ZiywfRUCVIoUU59sm8EKh/PsH1DWXThE+Ix9YYPBhz1YQebw9h5n
	+0qfhzbU8GbcZaJIZWxcBoR42osdClRLFH6bjd3Q602DUDdM3g3DNqaMdchaO/F5
	1B/LqTs4uz+7y/antJKGPxfHFspH1L01Yb5GK+Zdn/h75TWoYqLfEv6dNXvS88Wi
	CmoHanlGvWt/OyZxX1e8mar6CihCUdpTUciKDXM2LWqYhU54hPQ+q/ntObLrfqpO
	U3saJSKdZSOenA2jods3nIH7HVLUMHuxd2RT0g0xiCKa8Q0yKRY82If/2E7wKV9G
	mkYB5sWtbyxezi9S7CiJVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777393073; x=
	1777479473; bh=NOtq5+rfTdtcUV80Tb+r5KplcBOzRSAAUcR5coq1YGo=; b=b
	3PlFL7W3uwkCp2pMbXtmFgsSdV0RAsBm+kZjWmxHfBWCXdoxq4UWBn9SEB2VFXsV
	nUc4/enZV0MGoH+GHmcgEdQQcabQgJl7oQaQ6AFzcHqXO2gg3hT/ApTaX273Ysnl
	ng2SIDmYWLGCzb/R3xWk66j/+XJXDckohHkMkGExDwpoh7IpRTmi7n1ySQjjrx7p
	UFrTkH8MbKZ/7vEHpm9HBjiR6wtSPo1Deb+k6PpEiN9KEWKP2tLHNiqFSFtLBHpe
	k59T81d3pva4Q+NNxmVwWvh14aJP9kqBxNfpdyljhu/0o7DNZuDHGF6Of0tsPEwb
	Qpi11IK3fIr22j5FlywVA==
X-ME-Sender: <xms:sd3waaBsNC7_sIahudsWB-QA_st5tCYQnUWvWTPQ-RQYDNWADUMgsQ>
    <xme:sd3wafXT-ITxQpPbEIB0zHwAM_tQiFMlhR3_DPiUxatEIIqFCz9FDBm8oI__gzMfC
    a8Y9viwc79ifaka2jnqS5YK-SbaFBFcPCjyVdmHVTKim7rJqhfQRhoi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekvddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopegrlhgvgigrnhguvghrrdhsvhgvrhgulhhinhesghhmrghilhdrtghomh
    dprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghrghhl
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhhsfieskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhn
    thgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:sd3wacG6IeebUcBwuJ_yJH7qlqW8s0AtJKWIiAsBcCgyveJuKbh6GQ>
    <xmx:sd3waUbles3mGsmKXk-WOujVQqdKIYTxypjv1m7nos2GfBHRgJgpTA>
    <xmx:sd3wacVAZYuUafN4ys1KAuGEHU-oRq0d69ainiaLrpB61uJ_heSq8A>
    <xmx:sd3waamv0lJgFy-S0SNTwvGstrLUmF51dFYN5l8fEMmqphCdKf391w>
    <xmx:sd3waW1Yzsz3beVHm0vLs6oi6Rg1sVtG6zJ8hjxIpLrW-qxt8g1tKOMM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F08AE70006A; Tue, 28 Apr 2026 12:17:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AWBZ1R5XxVsg
Date: Tue, 28 Apr 2026 18:17:32 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>,
 "Alexander Sverdlin" <alexander.sverdlin@gmail.com>,
 linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Message-Id: <16e058af-dfa9-43b1-be6e-47150d6c7cb0@app.fastmail.com>
In-Reply-To: <afDX7WabVPVce4kc@ashevche-desk.local>
References: <20260428154522.2861492-1-arnd@kernel.org>
 <afDX7WabVPVce4kc@ashevche-desk.local>
Subject: Re: [PATCH] gpiolib: move legacy interface into linux/gpio/legacy.h
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 496204898A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35721-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[app.fastmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,messagingengine.com:dkim,arndb.de:dkim]

On Tue, Apr 28, 2026, at 17:53, Andy Shevchenko wrote:
> On Tue, Apr 28, 2026 at 05:45:07PM +0200, Arnd Bergmann wrote:
>
>> Split the old contents from gpio.h for clarity. Ideally any driver
>> that still includes linux/gpio.h can now be ported over to use
>> either linux/gpio/legacy.h or linux/gpio/consumer.h, with the
>> original file getting removed once that is complete.
>> 
>> No functional changes intended for now.
>
> But I'm not sure why. The idea to kill gpio.h completely, no need to keep it
> longer than legacy stuff exists. I don't take 'clarity' as a good justification
> here, since the old header are still there (however just a shallow wrapper).

I currently count 59 files that use the legacy header,
and I have a patch to change those over to include it
directly. I could post it now, but the exact list seems to
be changing by the day at the moment. It may be better
to split it up by subsystem once the first patch is merged,
or it could go through the gpio tree.

There are another 94 uses of linux/gpio.h that should
be linux/gpio/consumer.h instead. That patch is of course
trivial as well, but I have not prepared it yet.

I don't think the legacy stuff is going away any time soon,
so removing it from linux/gpio.h with the follow-up patch
should help avoid new instances getting merged unnoticed.

    Arnd

