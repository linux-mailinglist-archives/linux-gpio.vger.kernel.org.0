Return-Path: <linux-gpio+bounces-32254-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFpIJjbRoGmTmwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32254-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 00:03:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3961B0B68
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 00:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01FC5302AC13
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 23:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B0832862C;
	Thu, 26 Feb 2026 23:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="okzGFR0x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671E33EDAC5
	for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 23:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772146985; cv=none; b=oEyq52eOS65FkqDrN7uN2v7kzIspW4ClDoYn1nsPPGBrIFy8zoAEtI8vrsxac+7nv5dTP3b91VmxO81nbIgj/GY7LfRR3sJtmbFhGvC+NscVW1sgoNGxTGXW45UZqZhbbvR+L7NLesCIqV0qgfs32hz/kQgb0q8OcKnlPZDbZYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772146985; c=relaxed/simple;
	bh=juifvj4TPoDeapwISPtY4UqLPTbzAjLKpVQX30ShM4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zen3lX9ZRoge2Fjb9pDaD+HvxvZkC1+zDPNxBw/7mKBEPtkCj6rG/iDbmF1MDTnWbj2m8VCM2UQEtwHbHkSNtuseccLmnW22ZGJswDlVNnEhpEy7cJYPBciCmGSXo+nkZNfJuNABxrdTvHtn28Xb7V2OmAhrJsHHBt0kEvTMzyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=okzGFR0x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04491C2BCB1
	for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 23:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772146985;
	bh=juifvj4TPoDeapwISPtY4UqLPTbzAjLKpVQX30ShM4k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=okzGFR0xcitNDIaK+Sfd2x5eMMKsPj0bLBWXUPkFB2xlN38R5d7aLHGyFmVITrjgn
	 hwM51aJ41Sz0mKs8jWyp3U8LfrRY/QLA6DLJRLgj4GtMQPbyhwVLg/Fm9tp79ggMjL
	 eTi0dzVX/vKIpEutaGtnTwFgMKvMtUq3ce3Mj0CczJGTNSQHdLQ1mbt0vkoa9qv++d
	 0uKSRsfNT6Pkc/OR0MvLwPMk4oS2RA6epeu6FJSQJGNTKQ54zV87vsPyRxUkwFLJK3
	 LCqN/jbn+UEZeq9ub02j+gSV7Xdmo+r93rfd/PDfRCAAD8+FAm183QaJ92pZ//pkRY
	 wKz6PhCAbuWWA==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78fc4425b6bso13935637b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 15:03:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXXlkEBdbdVK8gOMy66BSB3FadT6jAoTs+2WZ7vgCLEJGgLH270NjQOyxauQJSBc+tarOJHmJdGLkBT@vger.kernel.org
X-Gm-Message-State: AOJu0Yxljp7+B2G7c1siq6ffSFqosURr7nVs3hxLKuDQetsC7yWcmKIi
	jC5asGMlKcjvCBtmkM4geywxXNV1IGeGcNQdGpNIZ00+9l+t7X0KYdlDX0WB589qj3pxodYcJRQ
	qhXYCWaLzlmvJM1ujG6kFn2WvQcmiXMA=
X-Received: by 2002:a05:690c:338c:b0:797:a75e:3676 with SMTP id
 00721157ae682-798850e67damr11323337b3.0.1772146984322; Thu, 26 Feb 2026
 15:03:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225171545.1980385-1-o.rempel@pengutronix.de>
 <20260225171545.1980385-4-o.rempel@pengutronix.de> <CAD++jLnkfcgme27DbAUOKn60HJbJuBghetEqpC8dhGnuMPk=Kw@mail.gmail.com>
In-Reply-To: <CAD++jLnkfcgme27DbAUOKn60HJbJuBghetEqpC8dhGnuMPk=Kw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Feb 2026 00:02:53 +0100
X-Gmail-Original-Message-ID: <CAD++jL=PKnAa6CrzGOwPoS_kJJjiHEvztgAFdEoYpHDPj6WT9Q@mail.gmail.com>
X-Gm-Features: AaiRm527bB0wtLGWuo0Xk8LO1jx9HQPkG4r12CRWYS1uUw0P8KGWnA1y3Zvx38o
Message-ID: <CAD++jL=PKnAa6CrzGOwPoS_kJJjiHEvztgAFdEoYpHDPj6WT9Q@mail.gmail.com>
Subject: Re: [PATCH v1 3/8] dt-bindings: pinctrl: add NXP MC33978/MC34978 pinctrl
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32254-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:email]
X-Rspamd-Queue-Id: 3C3961B0B68
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 12:00=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
> On Wed, Feb 25, 2026 at 6:16=E2=80=AFPM Oleksij Rempel <o.rempel@pengutro=
nix.de> wrote:

> > +  - Pins 14-21: SP0-SP7 (Programmable inputs, can be SG or SB)
>
> What is SB now? Please explain :)

Oh I see in the driver that this is Switch-to-battery. So document that her=
e
in the bindings too.

Also it seems that something configured as switch-to-batter must be
flagged GPIO_ACTIVE_HIGH.

Yours,
Linus Walleij

