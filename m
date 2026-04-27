Return-Path: <linux-gpio+bounces-35553-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLeEBgNA72le/AAAu9opvQ
	(envelope-from <linux-gpio+bounces-35553-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 12:52:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9369E471470
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 12:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DA46303982B
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 10:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021A73B5311;
	Mon, 27 Apr 2026 10:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EP4K5fvS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B9B3B4E94;
	Mon, 27 Apr 2026 10:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777287007; cv=none; b=QFWfrl6zyawbtsoWCyXhnckmRSUh7LFzR7IMow+EDiYPFKRwALjyUqEFQRAkEfBG8TdeD2I49Zae07N3i1ugP0gW8YT/D/Gqx/vc5mv7bXXuRH2Ns8x5i7kUeqOXk+aQebwKCBgiYIQxtf3406PXNP9UHS4edu/CSlN7raMLAj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777287007; c=relaxed/simple;
	bh=1hX/b439XJu3neaOGCNItjYEWihyYPz8zGNcqekTqhk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=TfI4wU+wVZ2OSraLb23ze/hcITaqJsadb+udefjNSulsKnPKgCMZ8DsLKBW/GKh3bTs9ahfRGgGTbq1KyMt5UXnQGcgtvwgJscxmuqS1OCD9+T8Jyvg1B4i54SpuO/Lkj9OBiZNJOUANnnMtmck8fan//3/7GyWKAE9SS5A6Rsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EP4K5fvS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF30BC19425;
	Mon, 27 Apr 2026 10:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777287007;
	bh=1hX/b439XJu3neaOGCNItjYEWihyYPz8zGNcqekTqhk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=EP4K5fvSOfvcO1vit+mQwmlq5vl5Sn1aJflpn1Qs1aDyq2vKdwDwlJLiwJbiYJZ5q
	 RYWqATmFvmvcrDJ6OwdDJs6v3hQL5FtHl2Fti3pW3SqkHur4CuTBSCIx9fF154rzfd
	 Z84Lh7QJ/nmLxWMR/uZPP/2d1wSuih57LxagMWiScvw7PBvv8QEPe6vciBGvuvfkJy
	 4YTqrkF1baS9KTtdSa9qEwwNTvEV9nYKdC5L5Y9PwP+wa/s0vWzebgrS6OXxXBGpgv
	 Av596uIFSDnAcVnkOsp0eiBqpd2GsYhgt7n3GTfLdBvtpoRMlq7JysVRb5vRG7TbkV
	 a7YOfGtu/Ehkw==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id D0C5EF4007B;
	Mon, 27 Apr 2026 06:50:05 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 27 Apr 2026 06:50:05 -0400
X-ME-Sender: <xms:XT_vaRH82v5EUmQqfEPn5-fnFbNO3tkKLbIuYmd7LohHF7qPFxOoog>
    <xme:XT_vaRJt7zrDtRfd8dsMu-8JoNxSxE_XGgwxh9bFXbH--leZJ9rIeyH5IRCfm47oP
    o8X9A__TucnBGtJe6p7mr1cuwPig1z18mY8IE1gsKiU-0wXksgPR1yZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejkeeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeejjeffteetfeetkeeijedugeeuvdfgfeefiedtudeikeeggeefkefhudfhlefh
    veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudejtddvgedq
    vdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusgdruggvpd
    hnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhi
    nhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehrohgsvghrthdrjh
    grrhiimhhikhesfhhrvggvrdhfrhdprhgtphhtthhopegumhhithhrhidrthhorhhokhhh
    ohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgrohhjihgrnhdriihhuhgrnhhgse
    hgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrghhlsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhhsfieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghp
    thhtohepsggrrhhtohhsiidrghholhgrshiivgifshhkihesohhsshdrqhhurghltghomh
    hmrdgtohhmpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:XT_vaYfArF4kiNhUKlqtDAdHcC4BhWh8fnoUm8wOX20GVNtjNkEBsQ>
    <xmx:XT_vaSUV-j2tAXQseNRPp3odmGLfR2jCZfvQDTdwWTcHTFM2GSrRvA>
    <xmx:XT_vaZBML3CpnY5pUR4VZ9akGXfAzpU7Ton_jjqr_dHuFHyCXyrQRw>
    <xmx:XT_vad53FwogDmhvsqFgA02nGUwXyzPkrDEZGfIxSoC7cGZES2MpyQ>
    <xmx:XT_vaQ2fR-Mfg00TOQwuFvJ3Pq5pIWFTULuqvgN2drYFrpMysZFoby8t>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C5E04700065; Mon, 27 Apr 2026 06:50:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A0jK6RsUegvB
Date: Mon, 27 Apr 2026 12:49:23 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Russell King" <linux@armlinux.org.uk>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Linus Walleij" <linusw@kernel.org>
Cc: "Bartosz Golaszewski" <brgl@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <da7ea88f-845f-49e3-852b-3ca352c1790d@app.fastmail.com>
In-Reply-To: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
References: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/4] ARM: pxa: attach software nodes to the GPIO controllers
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9369E471470
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35553-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,app.fastmail.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,zonque.org,gmail.com,free.fr,armlinux.org.uk,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, Apr 27, 2026, at 12:14, Bartosz Golaszewski wrote:
> Convert GPIO controllers and their consumers on the PXA platform to using
> "attached" software nodes. Since everything happens in a bord-file, it's
> quite straightforward. We technically now have a way of passing an
> unregistered software node to platform_device_register_full() but that
> requires using struct platform_device_info and since the existing
> platform devices are either referenced from other places or defined in a
> different compilation unit, I wanted to reduce the impact of the changes
> I can't test and went with the older method.
>
> Signed-off-by: Bartosz Golaszewski 
> <bartosz.golaszewski@oss.qualcomm.com>
> ---

Hi Bartosz,

These patches are individually all fine, but I was hoping to
finally get around to removing the pxa board files completely,
sorry it's been taking me so long to rebase my series for
that.

The only remaining board files I expect to have soon are for
the omap1 and s3c machines, so if you are going through the
board files to convert them to over, I would suggest focusing
on those.

      Arnd

