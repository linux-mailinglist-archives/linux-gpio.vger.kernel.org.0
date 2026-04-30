Return-Path: <linux-gpio+bounces-35908-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBqnA9dD82kMzAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35908-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 13:58:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 620D24A2759
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 13:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0703301112D
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 11:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E613DA5D6;
	Thu, 30 Apr 2026 11:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mSrBfL/V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76F63AB294;
	Thu, 30 Apr 2026 11:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550291; cv=none; b=kgpAEk0fbQqm5q/GVliLBuW3oIUjMvLlxwLgTCJfdJ5cf9VE0BGFryw5BNxG5UUMYBFc5j/q4O09XzJph+5bd88hrTpnVeHN3COS1b+mZwlQQuLtsX/1qw7ZQg0lIKMbYlxOe6DLw5FyTFQTNHo+E2lwdgqjIHjGkD16GllMCyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550291; c=relaxed/simple;
	bh=zhzqGeOnKGkLchTGAvyrX7SDhoGMT1bGUR4nOm0dXqE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=CVBVv7Qp8OhOqgkNSixEUM2Peg1u2OH69A0HQxEOQANLd9GT+FxWM8hMPp0hwVV1KR/zmzMdrVo7shSzxVaYiAKt9x3ZdcdRiI6S4UFFy3rQXcOZ5Iv1KZtBm4RkO7fAmj7bNdOCIiErOqXN9Y658lCFCjsvppGWMBiVV6oIIEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mSrBfL/V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B33C4AF0B;
	Thu, 30 Apr 2026 11:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777550290;
	bh=zhzqGeOnKGkLchTGAvyrX7SDhoGMT1bGUR4nOm0dXqE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=mSrBfL/V0uv1Eh5wd53H9iwpi4qJD6g/GDdl0JJqaPCxyp5IoQQtyWSY0Z93Pa0zE
	 XhzmaQK6iec7aIIvzkSCymX6XMkNnS6LB/jKxoa8jMaadlZ3/kLL3X1IRhvF/JWv/+
	 GjVIFIGepPwu0cwi/nKjB3VR9e4Mm0ymxofLH4eN9q5zoYp3Hzq06XSkpfRzU6fVES
	 MbPx9BIBKNJptmOLp6nqthKpsgncUi4cqeLwnmsXiCq4zRKS3HUBcwTgMrh7CFWAHF
	 yLkcuwBe01M1KKWB2lijYGE9z+wYReflvaUkquoi2ScKpjXESZ3yYf2e+MS1Q++lye
	 FFm4lKrYfvm4Q==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 50BBEF40068;
	Thu, 30 Apr 2026 07:58:09 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 30 Apr 2026 07:58:09 -0400
X-ME-Sender: <xms:0UPzaZgG-7T1xRJwXmfQD12kwbHgrV_ELwRB9-YbSjovZXuObBH62Q>
    <xme:0UPzaY0yfVYVKe0PYzBNdCkIu1ksr8CP4XVH-ZtWI9yiiQiXKoGV1rkfw88LE0k3Y
    bk3A2isMwyHOiKQKdX8Vru1ZVcaMqLCl8MoZJgC35-7Zi0HSB3Xv2co>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekjedviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpedufeejteetlefhgedukefhteffheethfdtveekheefgfdtheehgefhkedtkedv
    feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
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
X-ME-Proxy: <xmx:0UPzabYwMqpiugEpAyXvU0d06ZqyDkm_nF6O6cPHCpF2sKuLB7As7g>
    <xmx:0UPzaSgT6XXOYNutd7_PiDlt-pJ_UYgHZ3G_ay4zJIDkiEUoXGUkhQ>
    <xmx:0UPzadcl7L0plzSKwLyIMHwyn65HK7tPiWxr7d40kh6TWrXMyv2zMw>
    <xmx:0UPzaRnFKa6T-EEJq5_akrKvG9Hqf04zXwfI5jP9IXSvuZrLSjcSEQ>
    <xmx:0UPzaSyD2YwQtR5imEEcSQjC4kZK_MQ4XkU7Lv1xiGD6G7JQvvc5NNFS>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 26CC9700069; Thu, 30 Apr 2026 07:58:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A0jK6RsUegvB
Date: Thu, 30 Apr 2026 13:57:48 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Bartosz Golaszewski" <brgl@kernel.org>
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Russell King" <linux@armlinux.org.uk>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Linus Walleij" <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <dd8faf98-4c1e-4e08-a41a-849c59a903e7@app.fastmail.com>
In-Reply-To: 
 <CAMRc=MeKn1_pMAyx_bQfMczqRJ1s28s3R9dAVMG5he97R_q4Dw@mail.gmail.com>
References: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
 <da7ea88f-845f-49e3-852b-3ca352c1790d@app.fastmail.com>
 <CAMRc=Mf9M_eoPzsqBdmnXLd8Eqw_cPcnXWN9xjC-+x5ZA5Qb_Q@mail.gmail.com>
 <CAMRc=MeKn1_pMAyx_bQfMczqRJ1s28s3R9dAVMG5he97R_q4Dw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] ARM: pxa: attach software nodes to the GPIO controllers
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 620D24A2759
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,zonque.org,gmail.com,free.fr,armlinux.org.uk,kernel.org,lists.infradead.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35908-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Thu, Apr 30, 2026, at 09:14, Bartosz Golaszewski wrote:
> On Mon, Apr 27, 2026 at 1:01=E2=80=AFPM Bartosz Golaszewski <brgl@kern=
el.org> wrote:
>> On Mon, Apr 27, 2026 at 12:50=E2=80=AFPM Arnd Bergmann <arnd@kernel.o=
rg> wrote:
>
> Before I address Russell's comment in v2, can you please let me know
> if pxa will be removed in v7.2?

I'll need some more time. Not sure about the schedule, but I don't
expect to remove the board files in 7.2 now, sorry.

      Arnd

