Return-Path: <linux-gpio+bounces-38727-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ykw7O+6vNWoU3QYAu9opvQ
	(envelope-from <linux-gpio+bounces-38727-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 23:09:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 484186A7C54
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 23:09:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cMmbUbYf;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38727-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38727-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3FB530580BE
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 21:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0CBC3CF673;
	Fri, 19 Jun 2026 21:08:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17153CF692
	for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2026 21:08:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781903327; cv=none; b=Xaf2ACabZQEsMGObyksI4xieQzD0psIVHvZF9U5x4VVa+FUbQhEm0PAM2UJDpzC+0qwf7Ecr7yRpub+GoYMoYK6LDU3A0+SJq4iAO49/e0iuMxL/bVJq8EZ0cV9GPuZoqHpYSHBCtRx7sAJ3jyvO22LulZLTOfdWDKPFAmTA93k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781903327; c=relaxed/simple;
	bh=FMSWI+gloufB0h0HTiPPqBp7P4ZIS2lTWu/Igajet9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KK8Sc3TQLNEAMwLwULIPgdshr9u4S+JmJ6rbX4hCp0UF/LNf7ejM3EjJr9/N78CoH8WQuuOujJIIETrFsxLgupm6QxdrU/DVS8+6r7bK3SyCA2qvJL+B18C9d1ePN0s9fLjmzKpe68BqeWQkxljeHfwHc8YGTBM2tKYL+hNeLwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMmbUbYf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 612C61F0155D
	for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2026 21:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781903324;
	bh=FMSWI+gloufB0h0HTiPPqBp7P4ZIS2lTWu/Igajet9s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cMmbUbYfwQO5CI8iSeh+6t2SUNKHya5glLSJCb8DV6CntMMsxIktcwYeUmvlKQvmO
	 ybB8ISM0w+kC9HyTbwLa3hR8N8oPyCXMMxYGJGAiV7pG7cRvGlNmk/oM+gZQ0C7IqG
	 VFgAGvVR0MMXgLVZKqm2tfLtf7KYNqnzBOd6lNvphwkuSLkrZuKbfwzhVKfDWh8Jin
	 +qFWl5S01GulWeCaSveSolV7YyO8Mm4k8Zqag5H1SPHluISqIep7t8/+5DRRKL5u8R
	 HD0uaF/HZibyqylXS6ZVwDwDuUOnQSO+bUVjQvD+rNyE50XfyOX95o1K9oWDnB4LpI
	 ZAwBSrYj+sajw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa68d9d56fso3070441e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2026 14:08:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9vtzBRz+Fx+4QNFhH1K66k3rk7pwU11xFA92tfuk+Nhht1Z7Ru7iAayzegJeXO9/2u3GIP6htTa4IJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yws4A0Zk3XcTMN/TCBa06NqvNNEHxLkOokvlQvyOXns1JKQ3Fs9
	M7PFjanPcmV/2ZkdX0Ax8D/CX4WQ8XbOW73CrSR4VAI4MLV3QzGKYCDLaiejwLv4I1FgiubAXyu
	PHVeFv9IzgJgRk18CCfTnXxWmZtyGMjI=
X-Received: by 2002:a05:6512:239d:b0:5ad:4eac:f6d2 with SMTP id
 2adb3069b0e04-5ad58f3506amr1312078e87.23.1781903323139; Fri, 19 Jun 2026
 14:08:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-3-eleanor.lin@realtek.com> <agMM9soiqpG-TRSb@ashevche-desk.local>
 <adff3a2d21a64d3ea3b408d62157ee1e@realtek.com> <ah92oEavMu4QRn8y@ashevche-desk.local>
 <CAMRc=MdA24z-tB_D8CTw68Di8e4OVQJ1QH4+rDskFzq=xjJ5BQ@mail.gmail.com> <DJ3QVMZ6XLW9.1M9W541O92QWJ@kernel.org>
In-Reply-To: <DJ3QVMZ6XLW9.1M9W541O92QWJ@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 19 Jun 2026 23:08:30 +0200
X-Gmail-Original-Message-ID: <CAD++jLncD2ZjH3aedOkGNYP3FyZ=i7Pb0OcKKZKuMOPGNjM_nQ@mail.gmail.com>
X-Gm-Features: AVVi8CciIShnYrkvWiar3ZeR88iI32EVeKlpP07bMr3Ga2S3qThBGTGjlcJfumA
Message-ID: <CAD++jLncD2ZjH3aedOkGNYP3FyZ=i7Pb0OcKKZKuMOPGNjM_nQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip() accessor
To: Michael Walle <mwalle@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38727-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:mwalle@kernel.org,m:brgl@kernel.org,m:andriy.shevchenko@intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:afaerber@suse.com,m:wbg@kernel.org,m:mathieu.dubois-briand@bootlin.com,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:nuno.sa@analog.com,m:andy@kernel.org,m:dlechner@baylibre.com,m:tychang@realtek.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-realtek-soc@lists.infradead.org,m:linux-iio@vger.kernel.org,m:cy.huang@realtek.com,m:stanley_chang@realtek.com,m:james.tai@realtek.com,m:eleanor.lin@realtek.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 484186A7C54

On Mon, Jun 8, 2026 at 4:41=E2=80=AFPM Michael Walle <mwalle@kernel.org> wr=
ote:

> >>> Without an accessor like gpio_regmap_get_gpiochip(), we cannot retrie=
ve the
> >>> gpio_chip instantiated inside gpio-regmap.c to fulfill these requirem=
ents in our
> >>> map() function.
>
> Why is gpiochip_irq_reqres() called in the first place? Isn't that
> only called if the irq handling is set up via gc->irq.chip and not
> via gpiochip_irqchip_add_domain() like in gpio-regmap?

Not really, the gpiochip_irq_reqres() is called to mark that a
GPIO line is used for IRQ, so the gpiolib cannot turn this
GPIO into an output line, gpiod_direction_out() will fail
on lines used for IRQ. So it's a failsafe.

You can live without it of course, but then you don't get
this failsafe.

Yours,
Linus Walleij

