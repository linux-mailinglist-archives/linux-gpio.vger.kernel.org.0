Return-Path: <linux-gpio+bounces-39889-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KauFC8tnUmqiPQMAu9opvQ
	(envelope-from <linux-gpio+bounces-39889-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 17:56:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9557420E4
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 17:56:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PT7ZXANL;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39889-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39889-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13C803012D15
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 15:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC123C0601;
	Sat, 11 Jul 2026 15:56:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1862030A
	for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 15:56:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783785416; cv=none; b=fO9DSFBhTa3/URkobBs38ZPLzmjoSs6sbkmsEyPicv6ewY1A1gjY0CCgzqSLccDHX9bEOFcsU0bVY4Xxi3c6UK9D/4+von60YM0SyZ9cB5Jtnqv+VFxJ+7cDpiibpp+zRidCpYsqeRsLob+N7KR/OtE8R0LBQH0GcjcilZpaqQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783785416; c=relaxed/simple;
	bh=SFRI5BFcprMUa3JpdsIZ3TCZEdjqCBcEU7UivobKvZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OsbEH24tdIyVkPLjZ4AOJRRShcMihGlKoG0Q+1NrX5cLaUi+QEvBbPQ4Lm1BTradmN2I0HlB32Jm95nPT7SmyNqbHaCnIrUL8IpB3Dd6d9qIjLq1Y5qeBiXteabqqXCxgMHZB/3mZYLsJ9+PcTbEwFsSRGGYNVsLTqv6HU2C5Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PT7ZXANL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8121F00A3D
	for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 15:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783785415;
	bh=SFRI5BFcprMUa3JpdsIZ3TCZEdjqCBcEU7UivobKvZw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PT7ZXANLZgjpKXKIg+w6s4U3biKinVXPnA65xlugCzroQ2zl+gfQYZcwLCF/RJEr0
	 86v6i5vLCPgVwxHaRK0/UuNkt5p5Y65PJYBIDk9rdbt+McM5FKnbYfbRV3vrUka/kt
	 3RB9dhgeviXzC6jE6vfIYvrgUM3muozuVlzV2AyJZvr0iQVXUcluIflM8RkExzjNiz
	 WHiTz66PjYEADHf4nNSmKM8HNBgke0Wr3aVe/IrWzaq8nMsKtq6Aqe8kFePHXmCVya
	 i6gQBINklRllNkFOiJXCih45/B//ZWKcW7eiJwr3f6KBVqSqoJLlT2pUYREMdCnQ5Y
	 W3VCzVMFlhNTQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b01cb18515so1640829e87.2
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 08:56:54 -0700 (PDT)
X-Gm-Message-State: AOJu0YwBqQYBpfGVnGYvgul1wOOKNP0kMzkBsWCKmDZfae88x4R+J34S
	+2bsvEraatnPmWpm2cRR0RcKMQiw5MHGD+CL84L+F+S6YP4rY+rwX1kwVP/mX/9jTO8noxgjvdB
	pL4YEU51ECEohwXkB/JPsspg/4a7uYq4=
X-Received: by 2002:a05:6512:118d:b0:5ae:b36c:81c7 with SMTP id
 2adb3069b0e04-5b02369b29bmr708700e87.35.1783785413596; Sat, 11 Jul 2026
 08:56:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710211954.1373336-1-arnd@kernel.org>
In-Reply-To: <20260710211954.1373336-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 11 Jul 2026 17:56:40 +0200
X-Gmail-Original-Message-ID: <CAD++jLk7MWRccwuzXBLtdUk+k=Ykt_fJp-C6Sj0_2EMMEr3xxA@mail.gmail.com>
X-Gm-Features: AUfX_mwg6yb6TVVJdXhaZOS6qdtgZlShwnqqpOMB7tnZklRdo8JRbXGnpCKCf4s
Message-ID: <CAD++jLk7MWRccwuzXBLtdUk+k=Ykt_fJp-C6Sj0_2EMMEr3xxA@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] treewide: replace linux/gpio.h
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Greg Ungerer <gerg@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-phy@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39889-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:linux-gpio@vger.kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:andrew@lunn.ch,m:sebastian.hesselbarth@gmail.com,m:gregory.clement@bootlin.com,m:Frank.Li@nxp.com,m:robert.jarzmik@free.fr,m:krzk@kernel.org,m:gerg@linux-m68k.org,m:tsbogend@alpha.franken.de,m:hauke@hauke-m.de,m:zajec5@gmail.com,m:ysato@users.sourceforge.jp,m:glaubitz@physik.fu-berlin.de,m:dmitry.torokhov@gmail.com,m:linux@dominikbrodowski.net,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-phy@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-sound@vger.kernel.org,m:sebastianhesselbarth@gmail.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,arndb.de,lunn.ch,gmail.com,bootlin.com,nxp.com,free.fr,linux-m68k.org,alpha.franken.de,hauke-m.de,users.sourceforge.jp,physik.fu-berlin.de,dominikbrodowski.net,lists.infradead.org,opensource.cirrus.com,lists.linux-m68k.org,lists.linux.dev];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E9557420E4

On Fri, Jul 10, 2026 at 11:20=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wr=
ote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The linux/gpio.h header used to be the global definition for the gpio
> interfaces, with 1100 users back in linux-3.17. In linux-7.2, only about
> 130 of those remain, so this series cleans out the rest.

The series:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

