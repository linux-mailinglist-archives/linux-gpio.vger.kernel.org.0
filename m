Return-Path: <linux-gpio+bounces-37499-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADP/HYddFWp7UgcAu9opvQ
	(envelope-from <linux-gpio+bounces-37499-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:44:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9965D29B6
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC03B302D5E1
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 08:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C8E3CEBAA;
	Tue, 26 May 2026 08:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DWeYAlqg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7D33B9D9E
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 08:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779784837; cv=none; b=lwMYsVIU1mT7/Cp6oN5AHSZG2Ya37YtV5e28z0sBEQXiDVt6tPoVnR7dy370vYNE6AApVGpFfCVwJDYT2lIQsK10Yr56wXgfvrBJvLClD2Qn2UhCiTII0jBxcWjrtZIXZpB1Bo+BWlHVQMnsjLw97kLFlkNFKdYNiX/kwdJUvMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779784837; c=relaxed/simple;
	bh=3+HEPoC6UyIO+L+4nX2r3N4eZ9yqqs+hKK4o/nUL4hI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sXCpatngkb1kBy0+1Wf61SVPmrScLCTpzonWUKHS775fKAQkrnFQ7tc/cisXMUhFZNPo3nAuLtdFJHvfTkivasNduIhzwzxY7ovlHEl980aSAvnlWmHfGq4EkvLwAgjUB4oma4tSVIYtEVYRvNMu7kv1auL8I/b16l2IVV/Conc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DWeYAlqg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 525D51F00A3F
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 08:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779784835;
	bh=+Ki6uWxNT/B00QDkxwb3Oci7j2KyejSG6wxzHzrChn8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=DWeYAlqgj5FLsoLgUmVUDmDgShJarvffGYWpmR91ZUTQiAeyLz2Mv9mhOcRT9b6zi
	 fycwcOlT3oge6cR04gYvbiTFzt+KDEMmTDcaA3Fs4n3lZtB1P6BDmWN9bnLBRCdfsf
	 91sM2wZYlcLkLL0MV4Q0TkjhRJF01tzmZ08Jvu09WpD2Znol67paALt3ciRB3Mut0K
	 Bst7gBCEtjiD4R96HXqLbVTbLSXGL/n/DFBtdEknjjj79Qy6HPIVYQ49JE0Vg7LKVo
	 7zDv2UnHXMmb+BhwniyQmHWidYQtATWSj0J8mpAEy298bvlsUuDdFtpHGAAsmJQlrn
	 RrDLAy/2BOWIA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aa2691db86so9770266e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 01:40:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Tm95QUh9evbOVTAch7QfvROwbHvwF/k/9iSVo0d0AIwdjDnLOhPBEIJaRlxknML0dHwjxpDkziYES@vger.kernel.org
X-Gm-Message-State: AOJu0Yx60fbw8Lk1qCo8EgI8pZ2RjPVglKvGVzGRHh3jZa/uqoF+HhIl
	x8PZKOW8FQH+KiDaN0i2fO0CxGY4cwHcRPSIGDh6ASc1dK+cxi7TkdbdE5xt0GMMTXn85F9GQSX
	lGJwYfa0DxwjMVg5dpOkjyo6xbRorvmQSDzblBY2vwg==
X-Received: by 2002:a05:6512:694:b0:5a8:63e0:cd92 with SMTP id
 2adb3069b0e04-5aa323b29f9mr5504025e87.33.1779784834004; Tue, 26 May 2026
 01:40:34 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 04:40:32 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 May 2026 04:40:32 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260525144629.498630-4-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525144629.498630-1-jerrysteve1101@gmail.com> <20260525144629.498630-4-jerrysteve1101@gmail.com>
Date: Tue, 26 May 2026 04:40:32 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mearb0F8CSNUqo-J8Zp2bbR6ti1aE4UO1A0v+pfZ9dtUg@mail.gmail.com>
X-Gm-Features: AVHnY4Kv0sUH774IV01K5ycsVeEWPf8Q4-jYLuoJnpteIVsc5mnJpzvEPaA9BR0
Message-ID: <CAMRc=Mearb0F8CSNUqo-J8Zp2bbR6ti1aE4UO1A0v+pfZ9dtUg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] gpiolib: of: add quirk for IS31FL319X shutdown line
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Krzysztof Kozlowski <krzk@kernel.org>, Wei Xu <xuwei5@hisilicon.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Peter Rosin <peda@axentia.se>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linusw@kernel.org, 
	dmitry.baryshkov@oss.qualcomm.com, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Vincent Knecht <vincent.knecht@mailoo.org>, Grant Feng <von81@163.com>, 
	Andre Przywara <andre.przywara@arm.com>, Tony Lindgren <tony@atomide.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Romain Perier <romain.perier@gmail.com>, 
	Jesper Nilsson <jesper.nilsson@axis.com>, Robert Marko <robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37499-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ucw.cz,kernel.org,hisilicon.com,glider.be,axentia.se,vger.kernel.org,lists.infradead.org,oss.qualcomm.com,lunn.ch,bootlin.com,gmail.com,mailoo.org,163.com,arm.com,atomide.com,axis.com,sartura.hr];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1A9965D29B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 25 May 2026 16:46:09 +0200, Jun Yan <jerrysteve1101@gmail.com> said=
:
> According to the IS31FL319x datasheet[1], the SDB pin is active=E2=80=91l=
ow.
> However, existing device tree incorrectly configure it as active=E2=80=91=
high.
>
> Add a fixup to force the consumer active low for legacy device trees.
>
> [1] https://lumissil.com/assets/pdf/core/IS31FL3196_DS.pdf
>
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  drivers/gpio/gpiolib-of.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index ef1ac68b94b7..8a79aaadc9ea 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -194,6 +194,16 @@ static void of_gpio_try_fixup_polarity(const struct =
device_node *np,
>  		{ "himax,hx8357",	"gpios-reset",	false },
>  		{ "himax,hx8369",	"gpios-reset",	false },
>  #endif
> +#if IS_ENABLED(CONFIG_LEDS_IS31FL319X)
> +		/*
> +		 * According to the IS31FL319x datasheet, the SDB pin is active=E2=80=
=91low.
> +		 * However, existing device tree incorrectly configure it
> +		 * as active=E2=80=91high.
> +		 */
> +		{ "issi,is31fl3199",	"shutdown-gpios",	false },
> +		{ "si-en,sn3190",	"shutdown-gpios",	false },
> +		{ "si-en,sn3193",	"shutdown-gpios",	false },
> +#endif
>  #if IS_ENABLED(CONFIG_MTD_NAND_JZ4780)
>  		/*
>  		 * The rb-gpios semantics was undocumented and qi,lb60 (along with
> --
> 2.54.0
>
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

