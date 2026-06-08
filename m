Return-Path: <linux-gpio+bounces-38126-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WlSCBko9J2p1twIAu9opvQ
	(envelope-from <linux-gpio+bounces-38126-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 00:08:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7374065AE27
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 00:08:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CA15y1NJ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38126-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38126-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48E53302C5F0
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 22:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 847543B14DB;
	Mon,  8 Jun 2026 22:03:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0AA3B14A5
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 22:03:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780956237; cv=none; b=AnkKxk1tiTevOsOEfENCSmFBxJrzBfIXWqr3OIdIsV+XO2e4Nxgft3ICvHDMzUfMZlnVHQ3FuLx4srAncv4AGbkU/Z/33gLyIKIOkvLl1TXhBS6sRcs9hpd6Zto9hZr4oDHu9AjmzDYe5e3ms/aRdsu0M5PGwX9NJcVy8Bwg4Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780956237; c=relaxed/simple;
	bh=cEEsVG560z/n8AQ7XRIDrWf46jHSXN7lQT2SF1BMXG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JZJCIULd/Af/HJvahYtllR93f9if53yLg4LhZ2NIa5rI6t74FcanHtshQtaGKE+aB+IFY/I7mw85axPSgEh6SDAv0OMiibwXeTZbwX+M7kQyY3uHtOZ3CcYfAUQYyRKK/LzepVOKROsmpYEVXk0mFfs4aGsbuYCck3q0BfuCw8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CA15y1NJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254441F00899
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 22:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780956236;
	bh=Aij36kGKLQgOKTKFOm0ZH4SZ9YXAanS6oRbQ1zStX6Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CA15y1NJElmg80HYv5sLM/kfa2jCdjk+qTyxpdOme8OofQZk+zipxPEdBIIInb/ke
	 DVur/hT3xjxpA9aK2+/jI2emXiTgUU0esjLW0xkEhufnGnLEhkgDD5MmVDa2tYACuD
	 lPfjr796FmKbOgwArLNtt/L/o3fhBWHA7A/teDhKLQ4n0RlPbbm/aySxJuA6cLmBsO
	 rQlM9HqoSQ3R+6ZlRZVXXL4Cq8w+a1TflL09poUsMsi8/xecxlvq1t1jA8hOsaG5QA
	 4KT4WynYGyBn4o+8rPXJ4NFJFjZdA5K6REgY0ahGLL9vbCFu39Pbd0XGTDK0xyYVfh
	 Wcag2S1XXVYxg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39664fe2dd8so40395321fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 15:03:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Gi47S5tJsxHiMQ2Rkz3oLboLGSBBZuhKoPDBjDA2Rm24UPfHBnnRuh4HxH8JRZs71yajJWAErXCWY@vger.kernel.org
X-Gm-Message-State: AOJu0YwN1ryk61+R7bDzz1f2TaPLczHqbrRR2ArIiStfM9gy9IbIrw6P
	wwxrOYN3bkPJHyYstvvG5azwmnv6PzuIVmdVnYlsru227DT6AmnEO7fQTwEXERX3f+aJbnQ2/9W
	hFEV8lCytBDO+hppKmIUUv5gMA8/wjqQ=
X-Received: by 2002:a05:6512:1153:b0:5aa:61ef:2bd8 with SMTP id
 2adb3069b0e04-5aa87b406e4mr6283189e87.4.1780956234723; Mon, 08 Jun 2026
 15:03:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525144629.498630-1-jerrysteve1101@gmail.com> <20260525144629.498630-3-jerrysteve1101@gmail.com>
In-Reply-To: <20260525144629.498630-3-jerrysteve1101@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 9 Jun 2026 00:03:42 +0200
X-Gmail-Original-Message-ID: <CAD++jLkyvwnrmBQ+YFo+UDvuMpMM+Z4fXyVOFXUvSNrnrCEsQw@mail.gmail.com>
X-Gm-Features: AVVi8CfrtViog8K60lVsdBejVduUSaoCk-bta_dOARz0lgQKhvxczOmqxd4dt3E
Message-ID: <CAD++jLkyvwnrmBQ+YFo+UDvuMpMM+Z4fXyVOFXUvSNrnrCEsQw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] leds: is31fl319x: Fix shutdown GPIO initial state
 and remove redundant startup pulse
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Vincent Knecht <vincent.knecht@mailoo.org>, Grant Feng <von81@163.com>, 
	Andre Przywara <andre.przywara@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	Robert Marko <robert.marko@sartura.hr>, Pavel Machek <pavel@ucw.cz>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Heiko Stuebner <heiko@sntech.de>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38126-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jerrysteve1101@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:andrew@lunn.ch,m:gregory.clement@bootlin.com,m:sebastian.hesselbarth@gmail.com,m:brgl@kernel.org,m:vincent.knecht@mailoo.org,m:von81@163.com,m:andre.przywara@arm.com,m:geert+renesas@glider.be,m:viresh.kumar@linaro.org,m:f.fainelli@gmail.com,m:robert.marko@sartura.hr,m:pavel@ucw.cz,m:krzk@kernel.org,m:shawnguo@kernel.org,m:michal.simek@amd.com,m:heiko@sntech.de,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:conor@kernel.org,m:sebastianhesselbarth@gmail.com,m:geert@glider.be,m:ffainelli@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,lunn.ch,bootlin.com,gmail.com,mailoo.org,163.com,arm.com,glider.be,linaro.org,sartura.hr,ucw.cz,amd.com,sntech.de,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7374065AE27

Hi Jun,

thanks for your patch!

On Mon, May 25, 2026 at 4:47=E2=80=AFPM Jun Yan <jerrysteve1101@gmail.com> =
wrote:

> -       is31->shutdown_gpio =3D devm_gpiod_get_optional(dev, "shutdown", =
GPIOD_OUT_HIGH);
> +       /* Driving this GPIO line low (in fact high) takes the chip out o=
f shutdown,
> +        * as it is flagged as GPIO_ACTIVE_LOW in provider (such as the d=
evice tree).
> +        */
> +       is31->shutdown_gpio =3D devm_gpiod_get_optional(dev, "shutdown", =
GPIOD_OUT_LOW);

This is fine but only if you also add a quirk to
drivers/gpio/gpiolib-of.c in of_gpio_try_fixup_polarity()
that will enforce the GPIOD_OUT_LOW property on the line.
Follow the examples.

This solves the API breakage.

It should probably be part of the same patch for bisectability.

Yours,
Linus Walleij

