Return-Path: <linux-gpio+bounces-32309-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFpHJKqnoWm1vQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32309-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 15:18:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 287CB1B8ACD
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 15:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92E5330D0F78
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 14:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62700421EEA;
	Fri, 27 Feb 2026 14:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p85azzwW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C9A41B35B
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 14:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772201327; cv=none; b=O3o/wnjzvW/ep2Bko1I2BIS/UFGC9YYj7RFVgASI4bBiIXKwrsq9JSqhfuE7RueTp2A/ZnOx1yB+3XAPvOslgWMDyLS+MWY92pQikRC0gI3ot8Z58jmY0cX8nbYHJRJhkMQBV5rtHPWvizRk7hXiuRPuqrwBWBnOQJwpdaEFoLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772201327; c=relaxed/simple;
	bh=y+3rbUMsFH6STnRgyWIB91wX0pLNRrq2pIp4p+Xt2Gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pUdAOqUzH5mWJJhxBKLb4HJPc3Xad91xiwf5VIGZlYpVBkW6JPt13vDI2iMvSy/IcynG6ytkwwZ49Z/a7kDKljPjbwezZxu+3jrDk4Mu553niA1uvp/XbUHSP7OaPN+8F+adFsmlHsC5KdXekcZ0Ul3EPZ1Dkk5xXh+KG5zosJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p85azzwW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED827C2BCB1
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 14:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772201327;
	bh=y+3rbUMsFH6STnRgyWIB91wX0pLNRrq2pIp4p+Xt2Gs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p85azzwWdexIq9tKr/odPngkfn/jQdqGuq4YwOqe8ibJoVQ0j35HbnxlaHGE3YqK2
	 3sB4kzDcuqUUyl2egnPsjPqx4eKoTGwKG6azwsEgMGPveEUxK+wdE1H0AToF/hu7WP
	 d0Tu6qsyneKw3N9ORovCiZ9GUIoNJsgnJqxlfU0/xFw2Ydt2jM1ujbakyxJh/p9M3z
	 qIz+NRDRGUqAXJ62QkwZL2RpmX/XOg9XQIolHrCpjyimT7A2YF7c4UDAoET2buPRUy
	 8tlh6z5RSHpak65A9QkqBV5KQ2M9Pvlck4TNU/Vo2UjSYyME0zoMyeC7RrEB6jsVR+
	 Zi2GC18yTYtOQ==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79800183233so28940697b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 06:08:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWwzriB1ODCEVp1nl8Xi/yo2Ijx752QfcAToJa8BhG0bI/ZE8U26QvE9PIRfnjEb2GxQ5SkCKIZ9tiU@vger.kernel.org
X-Gm-Message-State: AOJu0YyAU95lopnmpL2wrt1hGy2akw2efc5WdlGvAGOHFOE7xjREVmLR
	f/tLXzkLqtaJKTEH+9H/i9mcYKoX3+vRsTK0ch9SDkVYgbHlg2mIAxPy2MnAK+PPb52mTvCl9u1
	X+aRzKXZkPsoFB/8y8BqmlTVJGhC04j0=
X-Received: by 2002:a05:690c:4802:b0:798:534e:4a0b with SMTP id
 00721157ae682-79874bf3391mr56667937b3.15.1772201326242; Fri, 27 Feb 2026
 06:08:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225171545.1980385-1-o.rempel@pengutronix.de>
 <20260225171545.1980385-5-o.rempel@pengutronix.de> <CAD++jLnrXHi3dEGWDK1ymnKUvbtSr+BjFzxMXzH+gAS8RToj-A@mail.gmail.com>
 <aaF4zKMK1XOT7L40@pengutronix.de>
In-Reply-To: <aaF4zKMK1XOT7L40@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Feb 2026 15:08:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLnX+vSh8+Sxu4YtwbmCf1a+m8yGT0aB9yNzC=CSx54YPA@mail.gmail.com>
X-Gm-Features: AaiRm52zSRwDnOFexQxpGMC2RtMNpIQU19Z0k6kTABARIgBcABSrhEmUVLwGRYU
Message-ID: <CAD++jLnX+vSh8+Sxu4YtwbmCf1a+m8yGT0aB9yNzC=CSx54YPA@mail.gmail.com>
Subject: Re: [PATCH v1 4/8] pinctrl: add NXP MC33978/MC34978 pinctrl driver
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Peter Rosin <peda@axentia.se>, David Jander <david@protonic.nl>, kernel@pengutronix.de, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32309-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 287CB1B8ACD
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 11:58=E2=80=AFAM Oleksij Rempel <o.rempel@pengutron=
ix.de> wrote:

> > The driver needs to report the *physical* level on the line. Then the
> > lines need to be flagged with GPIO_ACTIVE_LOW or GPIO_ACTIVE_HIGH
> > on the consumers in the device tree.
>
> Returning the physical level is actually exactly what this code is
> trying to do. I need to rewrite the comment :)

Aha OK I'm not very smart at times...

> The issue is that the MC33978 hardware does not report the physical
> voltage level on the pin. As per section 9.10.27 (Read switch status) of
> the datasheet: "A Logic [1] means the switch is closed while a Logic [0]
> is an open switch."
>
> Because it only reports this abstract "contact status", I have to
> translate it back to the actual physical voltage level (1 =3D High, 0 =3D
> Low) based on the pin's current configuration:
>
> In Switch-to-Ground (SG) mode: the status bit stays 0 when the physical
> voltage on the line is High (open), and reports 1 when the physical
> voltage is Low (shorted to ground).
> In Switch-to-Battery (SB) mode: the exact opposite happens.

Fair enough, as long as we have a (possibly verbose...) explanation
about what is going on in the binding document I think the
proper driver behaviour will come out as obvious in the end.

Yours,
Linus Walleij

