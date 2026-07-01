Return-Path: <linux-gpio+bounces-39287-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z0KWDZPTRGr/1QoAu9opvQ
	(envelope-from <linux-gpio+bounces-39287-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 10:45:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D78A6EB3A9
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 10:45:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=K4q9bOBG;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39287-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39287-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 76A9230154A6
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 08:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9263EB0ED;
	Wed,  1 Jul 2026 08:44:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F053E0251;
	Wed,  1 Jul 2026 08:44:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895496; cv=none; b=oCrx/CVF+lGsQMx+mm5iKajwavmFHLeHVbPR3Jx0b5jfGFmlc4hYQwkCov0p3gAM6ZVSLOn4cC+jCLyrrLX4xGNsXqUgyI7W0/P5bTm5KF/3aZtT5v45SJb2hiyxuIuc9cEPstJ9GslMPnlq9mo4Q7l6RFngc8MSaf1XOkjHw+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895496; c=relaxed/simple;
	bh=SM1GnM3FZH6KNcTrP19RmJuHes6Nt+u+2Rizwvv6xXU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=tFB85aA/2Joa5bJQyLUgUPJ8p33b1dRZDlTaV3xjpscgfimL3m7xP0o8DthjQwieMMoCLO5kJTG/+G6Xnkzerem2FPsdP3b359U+XFu02kMXcW2xoJsRysUkUIFOsT1NbQyAz3y8bJ3QWCHAfv/R9D/ETLxeMtQQ33F/ovbhnFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K4q9bOBG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id EA7DA1F00A3A;
	Wed,  1 Jul 2026 08:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782895495;
	bh=SM1GnM3FZH6KNcTrP19RmJuHes6Nt+u+2Rizwvv6xXU=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=K4q9bOBG9Kb6RxXPQiTbJLl/vCMKDv8pUVjbrb2R6/Uly5XcmTYkqDGA9tKMFow6E
	 1h3L3P5YCThmlnVOcIFDDzlnxYVhUtw5kWg/peIEAkhnhymPhC95xcCse7uZH0p0Td
	 OpwfVJm+/ktVneJcYCCVolHLFsQ68qqW2kl9tHlhAEGLe3P0ll4EUIolWK+hYfjXfy
	 P4MjOUk5ZY/MdLwDu0cW9SMIo9nLiDNc4Ja97Zsq5we6+VsvBspOVD7UR/cwv81Y15
	 ArYUAKhgEDNAJPztX6EHCwNpkfQMLgAiL6UYgNhgg1bb2o8g3Ca9/fyPY8nRIEmRWO
	 dRhQRQk2E6fAw==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=9135228af664d572f1986b21b4fb54103924b9231b5a0e744b356b75f7b8;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 01 Jul 2026 10:44:51 +0200
Message-Id: <DJN3PDTPJ3L6.24P71OQFB6C98@kernel.org>
Subject: Re: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip()
 accessor
Cc: "Bartosz Golaszewski" <brgl@kernel.org>, "Andy Shevchenko"
 <andriy.shevchenko@intel.com>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "afaerber@suse.com" <afaerber@suse.com>,
 "wbg@kernel.org" <wbg@kernel.org>, "mathieu.dubois-briand@bootlin.com"
 <mathieu.dubois-briand@bootlin.com>, "lars@metafoo.de" <lars@metafoo.de>,
 "Michael.Hennerich@analog.com" <Michael.Hennerich@analog.com>,
 "jic23@kernel.org" <jic23@kernel.org>, "nuno.sa@analog.com"
 <nuno.sa@analog.com>, "andy@kernel.org" <andy@kernel.org>,
 "dlechner@baylibre.com" <dlechner@baylibre.com>,
 =?utf-8?b?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>, "linux-iio@vger.kernel.org"
 <linux-iio@vger.kernel.org>, =?utf-8?b?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?=
 <cy.huang@realtek.com>, =?utf-8?b?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?=
 <stanley_chang@realtek.com>, =?utf-8?b?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?=
 <james.tai@realtek.com>, =?utf-8?b?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?=
 <eleanor.lin@realtek.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Linus Walleij" <linusw@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-3-eleanor.lin@realtek.com>
 <agMM9soiqpG-TRSb@ashevche-desk.local>
 <adff3a2d21a64d3ea3b408d62157ee1e@realtek.com>
 <ah92oEavMu4QRn8y@ashevche-desk.local>
 <CAMRc=MdA24z-tB_D8CTw68Di8e4OVQJ1QH4+rDskFzq=xjJ5BQ@mail.gmail.com>
 <DJ3QVMZ6XLW9.1M9W541O92QWJ@kernel.org>
 <CAD++jLncD2ZjH3aedOkGNYP3FyZ=i7Pb0OcKKZKuMOPGNjM_nQ@mail.gmail.com>
In-Reply-To: <CAD++jLncD2ZjH3aedOkGNYP3FyZ=i7Pb0OcKKZKuMOPGNjM_nQ@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39287-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mwalle@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:andriy.shevchenko@intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:afaerber@suse.com,m:wbg@kernel.org,m:mathieu.dubois-briand@bootlin.com,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:nuno.sa@analog.com,m:andy@kernel.org,m:dlechner@baylibre.com,m:tychang@realtek.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-realtek-soc@lists.infradead.org,m:linux-iio@vger.kernel.org,m:cy.huang@realtek.com,m:stanley_chang@realtek.com,m:james.tai@realtek.com,m:eleanor.lin@realtek.com,m:linusw@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwalle@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D78A6EB3A9

--9135228af664d572f1986b21b4fb54103924b9231b5a0e744b356b75f7b8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Jun 19, 2026 at 11:08 PM CEST, Linus Walleij wrote:
> On Mon, Jun 8, 2026 at 4:41=E2=80=AFPM Michael Walle <mwalle@kernel.org> =
wrote:
>
>> >>> Without an accessor like gpio_regmap_get_gpiochip(), we cannot retri=
eve the
>> >>> gpio_chip instantiated inside gpio-regmap.c to fulfill these require=
ments in our
>> >>> map() function.
>>
>> Why is gpiochip_irq_reqres() called in the first place? Isn't that
>> only called if the irq handling is set up via gc->irq.chip and not
>> via gpiochip_irqchip_add_domain() like in gpio-regmap?
>
> Not really, the gpiochip_irq_reqres() is called to mark that a
> GPIO line is used for IRQ, so the gpiolib cannot turn this
> GPIO into an output line, gpiod_direction_out() will fail
> on lines used for IRQ. So it's a failsafe.
>
> You can live without it of course, but then you don't get
> this failsafe.

Thanks for the explanation! So did I make a mistake years ago by
adding the gpiochip_irqchip_add_domain(), see commit 6a45b0e2589f
("gpiolib: Introduce gpiochip_irqchip_add_domain()")

As Yu-Chun found, gpiochip_irq_reqres() expect the irq chip data
to be a gpio_chip, which isn't the case (in general) for an
externally allocated domain, is it?

-michael

--9135228af664d572f1986b21b4fb54103924b9231b5a0e744b356b75f7b8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCakTThBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hRPAGAqo6DNepJTnnCNzb/3GwKnJXqVuz6ob9v
5QmRvDiF57B2o/TvziZGaN2H5NzwI+VXAX9U4o48VR1vxZAo8Rz2J/Lz3hBMf9Jn
hz6tFnYqWzJmQPwvHzOfkIbQr8fbtkj9Tlc=
=Vyla
-----END PGP SIGNATURE-----

--9135228af664d572f1986b21b4fb54103924b9231b5a0e744b356b75f7b8--

