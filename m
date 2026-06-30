Return-Path: <linux-gpio+bounces-39221-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /ecOKKnDQ2plhAoAu9opvQ
	(envelope-from <linux-gpio+bounces-39221-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:24:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC716E4D11
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 15:24:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=iOyhgDJM;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39221-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39221-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B08EF30ACE42
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 13:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E9E413D69;
	Tue, 30 Jun 2026 13:21:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E712535E1CD
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 13:21:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782825677; cv=none; b=snnPyX0LDglzNtDqDwsDtIAChJKRarUoC1VR8U8lS1UxmTBZb2/A8xGckQ4UZub3rC2nokb43npMSUlHRiVJgULud9vLV+eKu6Q1hZvJMuiSuXqLgA3jaboqZi8PQjoymeCE752ysMa94ZgVe3+qU4l2g1533lMq+pVeHEinq0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782825677; c=relaxed/simple;
	bh=MVY7OPuBtDDWoGVmZzYJMH+zngqc4Ts/svjtm9TV7xA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3WsnJHO3Q0f8DkDNFPdDGU9pJ2qDf7NttDqNZjzyunQ5cyAn5j9ryGabCBpdNwLoV1iuK08esBehprWmwgyORnYdlIUFWbU9tJKz4vlt0v3fzpYVpsoAWbHz+bYNqXIP4H0mQUmlN+NPurDKUli5xiuKSFquLtlrCKzIJUQb1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOyhgDJM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F9B1F0155D
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 13:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782825675;
	bh=MVY7OPuBtDDWoGVmZzYJMH+zngqc4Ts/svjtm9TV7xA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iOyhgDJMUazn9ljrXYNdCvg1zL422zS4FttNWGhdvnMmlXUssySEPNAITYjTS8B2c
	 e0x/xa7PwM3CmCldqJHaNdeKzhqlDPDsYRrj5nlcG+wqJtaKqS7e7SwP+s7aM8GJa6
	 K+1zmqgPQWyqCDX8mH+vtAtFUP+x4m2BoYG7zXxtS24IhPJXzDTuGDnmuJEW0ZdBGu
	 BUwj/Xkb7nNS7nMzu7mgTJC1/JUdev7TQmFd2s67DOl7khiQLBgYpHuLEquTNtX3yN
	 RGpHp7fSnBxYRmv8dvcFmRogh4EqEuZr4t0K5ZI9FTV7LxSYAm0pvyIFQSu9LIzp70
	 ZkhNVU4yfc6DQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aeba1a36dfso1670495e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 06:21:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoOBeadcglwVvnJ64h8zurnoHXMy42wTKxMapaqMP4LU5guVk9cpgQTCg7GrfMQ8OPsyUCDYTgBAOFj@vger.kernel.org
X-Gm-Message-State: AOJu0YxI4EJ0WBMzN+0FiDIHmi2Z/1w5AtwzUUirOuTpJt5Pvxt+SZMf
	xrzQQ11zZqtFvTOKHPfcJPvqZzhUA82eNi2WlCoIC26cRBa5cx6vX17DEJD1st8wxCN7Idpn8I5
	zQ7C0Y7ekRvmzQjBUELgHzKggU7No3gg=
X-Received: by 2002:a05:6512:4019:b0:5ae:b728:df28 with SMTP id
 2adb3069b0e04-5aebdbd6442mr872848e87.49.1782825674488; Tue, 30 Jun 2026
 06:21:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-3-eleanor.lin@realtek.com> <agMM9soiqpG-TRSb@ashevche-desk.local>
 <adff3a2d21a64d3ea3b408d62157ee1e@realtek.com> <ah92oEavMu4QRn8y@ashevche-desk.local>
 <CAMRc=MdA24z-tB_D8CTw68Di8e4OVQJ1QH4+rDskFzq=xjJ5BQ@mail.gmail.com>
 <DJ3QVMZ6XLW9.1M9W541O92QWJ@kernel.org> <CAD++jLncD2ZjH3aedOkGNYP3FyZ=i7Pb0OcKKZKuMOPGNjM_nQ@mail.gmail.com>
 <ajkP4DHN4JPjr6yb@ashevche-desk.local>
In-Reply-To: <ajkP4DHN4JPjr6yb@ashevche-desk.local>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 14:21:01 +0100
X-Gmail-Original-Message-ID: <CAD++jLmHk=efdbz9LgXJiuNzTjM7-K2d3v5TPck_-NJpBp+QkQ@mail.gmail.com>
X-Gm-Features: AVVi8CeSmNt49CsRH7ooO8TtoFwH2cGZrVPIEEBlGKP4NblkyzQpSIYZPriLS8c
Message-ID: <CAD++jLmHk=efdbz9LgXJiuNzTjM7-K2d3v5TPck_-NJpBp+QkQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip() accessor
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Michael Walle <mwalle@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "afaerber@suse.com" <afaerber@suse.com>, 
	"wbg@kernel.org" <wbg@kernel.org>, 
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>, "lars@metafoo.de" <lars@metafoo.de>, 
	"Michael.Hennerich@analog.com" <Michael.Hennerich@analog.com>, "jic23@kernel.org" <jic23@kernel.org>, 
	"nuno.sa@analog.com" <nuno.sa@analog.com>, "andy@kernel.org" <andy@kernel.org>, 
	"dlechner@baylibre.com" <dlechner@baylibre.com>, =?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, =?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>, 
	=?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>, 
	=?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>, 
	=?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39221-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:mwalle@kernel.org,m:brgl@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:afaerber@suse.com,m:wbg@kernel.org,m:mathieu.dubois-briand@bootlin.com,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:nuno.sa@analog.com,m:andy@kernel.org,m:dlechner@baylibre.com,m:tychang@realtek.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-realtek-soc@lists.infradead.org,m:linux-iio@vger.kernel.org,m:cy.huang@realtek.com,m:stanley_chang@realtek.com,m:james.tai@realtek.com,m:eleanor.lin@realtek.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3BC716E4D11

On Mon, Jun 22, 2026 at 11:35=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:

> So, when we instantiate our own domain in regmap GPIO, we should have tho=
se
> callbacks be defined somewhere?

Domains are just translators, but if you create an irq chip it should
ideally have these callbacks.

Yours,
Linus Walleij

