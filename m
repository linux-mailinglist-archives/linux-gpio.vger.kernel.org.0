Return-Path: <linux-gpio+bounces-38702-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /GJtA1LzNGrmkwYAu9opvQ
	(envelope-from <linux-gpio+bounces-38702-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 09:44:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A026C6A46A0
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 09:44:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=D4KlcMZW;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38702-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38702-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 184D3302158A
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 07:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA07D35A93C;
	Fri, 19 Jun 2026 07:44:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4723E323417
	for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2026 07:44:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781855053; cv=none; b=bSyPrSbY2bu0Uic5vp8xdmwqBTlfYWyj07QQBe3G+ewILcL96oEmpGpm49wFwXBmfOzKb6DQ6NfBM+EmISptcnaVQkkfvdUQHtlGsFO9KjtbBDvVGB53cdx8Q+tLZlshRP2FMiNUBjiDERo4DteDbybF1fPe+pkjfM+SMUpYyO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781855053; c=relaxed/simple;
	bh=LVUjyiZgA0ioOsTkCjLp4qkgyz2l8SR9tYVVwpMeBPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KmuNx3evru+kzmHUnT0CtrCbcjqZi8ziABDSX3JlKwSmBt3uMICTn+KqHCVIU91qtPZBspes/H0VKXXtGa4VIDXwNnZpcdD+6Yotti96y3EQ9PssqMZdKxoHRbzLrpeekniwvkE9uwATMeFD9eJF0PWXZMHtcP3u89COkbEc73A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4KlcMZW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2808A1F00A3A
	for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2026 07:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781855052;
	bh=b07NeBKHmWEsMBrslV3njAnQXC0YyuL7comfc7gkAqs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=D4KlcMZWcEbII5o06cTlozauqpbocsERRnGTgzKHEJV6aSKOMbSzUrQD8DbLTwfxG
	 Otfrd9/730NY49a3WLOuASWRZ3BY72X28GrB/Oj7Uoat7XK4ZjxL14U2O6I5MQcu5m
	 o0rXWYiK5SmKwhdEhPpkNoTjIIWH4LnIYCnZylfr4jI3mtcM3VWTWbtfoG3h6sMiuy
	 mJC4x3k/YfXEayDyEdHsX4QIOM6DXAvU/Q8wABxoOq+GJpSM4pIKRrMIe7opmczwbL
	 XKmvnbTspGK/ohhzgFixJVPkRqP2K3U63L7ZnBQp4QR0Kkze+NzPA+wMJ+pSo4vsrd
	 8RtZm9mSbQqpw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5ad522bddceso1345595e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2026 00:44:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/qaVObd/o31kOR7w1dsn1iQduP6m+01tUDr90jhToC9yNh+UGFs6mdaKHwjd+gbRTEeOUmEZM5NMCS@vger.kernel.org
X-Gm-Message-State: AOJu0YwNNYY5rGoEB9+K84dEsWVBy4o7Hwfq7wPYZU4ercoQjdg6bTpK
	zi+alTO51bazWtkA8qWs7hL45XGar6O9ofODb1JBVbNMGD2u/cOHUF4J1o1Xyh6Y7kbGM6XpQDY
	YlnLwu/JZsIV52FmjBTAlHHTfmhdq2Hc=
X-Received: by 2002:ac2:51ce:0:b0:5aa:5f11:ddb9 with SMTP id
 2adb3069b0e04-5ad562dbb2bmr842962e87.40.1781855050988; Fri, 19 Jun 2026
 00:44:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD++jLmW3vgTFryRAL24x2TbgbR1tbhjw-nFFH3askoZfSibaQ@mail.gmail.com>
 <20260618151052.3984665-1-runyu.xiao@seu.edu.cn>
In-Reply-To: <20260618151052.3984665-1-runyu.xiao@seu.edu.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 19 Jun 2026 09:43:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLk4eByc6A4ovjvvOEE83RPA7AUcL5Cyvs6KXezVWSj1Hg@mail.gmail.com>
X-Gm-Features: AVVi8CfR2bmTpQpCbDzuwjR-h7T2akz1CHyf0xAarqe_ynmYniODNtWUzZ11GCQ
Message-ID: <CAD++jLk4eByc6A4ovjvvOEE83RPA7AUcL5Cyvs6KXezVWSj1Hg@mail.gmail.com>
Subject: Re: Question: pinctrl-backed GPIO set_config and gpio_chip::can_sleep
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Antonio Borneo <antonio.borneo@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38702-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:runyu.xiao@seu.edu.cn,m:linus.walleij@linaro.org,m:brgl@kernel.org,m:ludovic.desroches@microchip.com,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:antonio.borneo@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wens@csie.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,microchip.com,bootlin.com,tuxon.dev,foss.st.com,gmail.com,csie.org,sholland.org,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,lists.linux.dev,seu.edu.cn];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[seu.edu.cn:email,vger.kernel.org:from_smtp,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A026C6A46A0

Hi Runyu,

On Thu, Jun 18, 2026 at 5:11=E2=80=AFPM Runyu Xiao <runyu.xiao@seu.edu.cn> =
wrote:

> I agree that marking these memory-mapped controllers as can_sleep is too
> broad if the only sleepable part is the pinctrl range lookup.  That would
> make consumers treat otherwise MMIO-backed get/set paths as sleepable,
> which is not the contract I want to change.
>
> I will hold back the at91-pio4/stm32/sunxi can_sleep series and look at
> the pinctrl core direction instead, specifically whether
> pinctrldev_list_mutex can be replaced by a non-sleeping lock for
> pinctrl_get_device_gpio_range().  That should also line up with the GPIO
> direction callback case discussed in the other thread.

Your replies look like those one would get from an AI agent,
because they are repeating information (context) that I have just
provided, just with other words.

If this is the case you need to instruct your agent to be terse in
mailing list replies: it needs to quote what I just said with >
markers in the margin and just add the word "Agreed" after
it.

Yours,
Linus Walleij

