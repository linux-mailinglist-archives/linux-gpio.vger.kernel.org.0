Return-Path: <linux-gpio+bounces-39562-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5gZcB3qwTGrBoAEAu9opvQ
	(envelope-from <linux-gpio+bounces-39562-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 09:53:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED67718B86
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 09:53:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sntech.de header.s=gloria202408 header.b=K8wqov0F;
	dmarc=pass (policy=quarantine) header.from=sntech.de;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39562-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39562-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F89230205DD
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 07:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0053339EF0B;
	Tue,  7 Jul 2026 07:42:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF1013D53C;
	Tue,  7 Jul 2026 07:42:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783410160; cv=none; b=H/eJQ6pLJRfjaez5MB/ClvpHu2cRlhiiV1SklVIrE88xEk1DjD6DbfZHe0HUVElH5lAQe8mPEPhXpKeu6HEPQeHPRFy+cIH5hdVZjLwNlGRUORPGphBDa4JmZVSj1bLc6FtHtc2Yrv5UfhMsoTeS8ezQAttH1VQynz1ka8gfUuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783410160; c=relaxed/simple;
	bh=pQwyXCyV2PJT4RikPbiEx3IVEGUY43jh3uk9m+jiWDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FHxl+SLQs2zDkFaijpXVz5MtmVj8IsImW8XMDO1D0amswFkI9fjRU7NkYRBjGjTEsIugWPRHKn9KOET8fNlc8QPO6mZKclm48Tj+kcu1hKc0xGCZovL145jhChjd43tqS3o0vbQY5hqfQOcJkvrdhQtxKI0DyylGs0Ce0UQvZtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=K8wqov0F; arc=none smtp.client-ip=185.11.138.130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=pQwyXCyV2PJT4RikPbiEx3IVEGUY43jh3uk9m+jiWDM=; b=K8wqov0FLWnvSZCw8PWY3vST+K
	Yq8cHvYbn58/ct2vcJKmp1y9CkWhzw6rgoCqmDTWc+cqkFSGrX47X+ezJMe4xtZTUruJyIGS9W0q5
	i05RRBKHlKCWz+9vus3Fl2HdapYqLWXDC5kOJG0f9r2xoB1aHXcs4397brhlqMIPptd3Z59qLFkWB
	Vi4hVN7QnfA5xuhijDTGLLGScZNcuLDatSPa2GxITaJAEclHqxOVsr5Xg5xcH2n/aubDsRvfRErsd
	xWKkAKAvGs/IOSaPIuyXbqjVpuIOd43VNJOGZZnAcq7thzN7sNTtZ02SIv/ARQ/31karQroi7Wf5y
	AN3nsCfQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Simon Glass <sjg@chromium.org>, Fabio Estevam <festevam@nabladev.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Chukun Pan <amadeus@jmu.edu.cn>,
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>,
 FUKAUMI Naoki <naoki@radxa.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Jamie Iles <jamie@jamieiles.com>,
 Jeffy Chen <jeffy.chen@rock-chips.com>, Jiri Slaby <jirislaby@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jonathan Cameron <jic23@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Yao Zi <ziyao@disroot.org>,
 huang lin <hl@rock-chips.com>, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 00/12] Add support for the Rockchip RV1106 and RV1103
Date: Tue, 07 Jul 2026 09:41:41 +0200
Message-ID: <7403763.aoefvbuG5b@diego>
In-Reply-To: <882555c4-e1a3-0a0a-6830-b824b93cf3ac@nabladev.com>
References:
 <20260706195818.3906949-1-sjg@chromium.org>
 <882555c4-e1a3-0a0a-6830-b824b93cf3ac@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[sntech.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[sntech.de:s=gloria202408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sjg@chromium.org,m:festevam@nabladev.com,m:linux-rockchip@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:albert.u.boot@aribaud.net,m:andy@kernel.org,m:brgl@kernel.org,m:bmasney@redhat.com,m:amadeus@jmu.edu.cn,m:conor+dt@kernel.org,m:dlechner@baylibre.com,m:naoki@radxa.com,m:gregkh@linuxfoundation.org,m:linux@roeck-us.net,m:jamie@jamieiles.com,m:jeffy.chen@rock-chips.com,m:jirislaby@kernel.org,m:jonas@kwiboo.se,m:jic23@kernel.org,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:michael.opdenacker@rootcommit.com,m:michael.riesch@collabora.com,m:mturquette@baylibre.com,m:nuno.sa@analog.com,m:robh@kernel.org,m:sboyd@kernel.org,m:ulfh@kernel.org,m:wim@linux-watchdog.org,m:ziyao@disroot.org,m:hl@rock-chips.com,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:conor@kern
 el.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_SENDER(0.00)[heiko@sntech.de,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39562-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[sntech.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heiko@sntech.de,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,chromium.org:email,sntech.de:from_mime,sntech.de:dkim,diego:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9ED67718B86

Am Dienstag, 7. Juli 2026, 00:54:44 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Fabio Estevam:
> Hi Simon,
>=20
> On Monday, July 06, 2026 16:57 -03, Simon Glass <sjg@chromium.org> wrote:
>=20
> > The series follows the structure of the recently merged RV1103B
> > support. The clock driver is ported from the vendor kernel and is the
>=20
> When I submitted the initial version of the RV1103B series, I received fe=
edback to split it into subsystems.=20
>=20
> You should do the same here and submit it per subsystem:
> ARM, clock, pinctrl, serial, mmc, watchdog, and iio.

correct ... ARM + clock can stay together, as that is my stuff, but for a
lot of maintainer it is just way easier to not have to pick apart series' .
(or even realize they are meant to do something)





