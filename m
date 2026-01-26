Return-Path: <linux-gpio+bounces-31073-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PiRMXlyd2n7ggEAu9opvQ
	(envelope-from <linux-gpio+bounces-31073-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 14:56:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 449CE892B2
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 14:56:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2093305C2B3
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 13:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41ABD334C03;
	Mon, 26 Jan 2026 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sNF8Nqh7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048C32FF662
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 13:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769435441; cv=none; b=J/Rpn5tJMm2fDHYnqkc6h7SujxtfgMwaw2H4tP2Z4kYFFD/za23vtlW6IAhbIxqiU+klr3okf1i0s7OEGijaPF4fY/OkqXHffGz9sbg5tNL+3LMTGnatgPZuZI9QrON/ciF1tpJwLKUoZhnJRNvuu+Lvh4DUQjgrWjyN87jvbvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769435441; c=relaxed/simple;
	bh=8NlD3BqagVW/3PgWdPtVN5aIftHTTrA+3bII9R0etHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UozrTh0XrvYLrpT+YpN4ZXYogDyiDH6EV4EMSrxvidObppkvB3eI9STr1kBCL+ELjzbhhTH5ghhQmZR3cxRNSLBHWvbY3WqgUqa5IV1YulmQhCpYSj/7ZiunBnsdQYKkHdxuxGUlzpxiEaWTNvGqEQpQ993maZ/eq3I6QWtm7d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sNF8Nqh7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BE9C4AF0B
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 13:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769435440;
	bh=8NlD3BqagVW/3PgWdPtVN5aIftHTTrA+3bII9R0etHk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sNF8Nqh7AhGiRGhrrJTxwRpiGRg6g+Ioz4ZFoQ/k4gm0qFtvUde5bWa9SAkwd4ugP
	 z3KtsJ6zm1DqFUy8u5jYze1PbouGbdyug82TB7A4Z8N3dY7IzqSDL0+e4U3gFFar6z
	 bWvJVNp27hossHcO0UjBlXBx9QIwn/yJPTg7/9UHLbtMvgHNZ4sCWGr83k789iJzaA
	 /80RxUSb6DeArHXO3m18c7zrhiePE7Z77mXY53q8hWA1NXiBycgbh+4yo87AqtS261
	 rwBMLQtRUBOhhSUKZZPXx5mdERw9Xp6ftmfbl6KO9sp3H4U3GMJp2I7vR+gaS0reCX
	 e6WjRGAQ4i8oA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59deec3d8dcso2206111e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 05:50:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXhpG9ybAradpQ/VyM/NMpyWKcPNj+TyUxrrhLf7KZW/CBA3jFgpKM73CJkPEKnwssDU3Xnqgw28dU/@vger.kernel.org
X-Gm-Message-State: AOJu0YxziMWt85V6NQydDRpFxnw8ArpPri/AHpHx9/Chn2jfcp8IfqMU
	w8hbTWZXKtB5zdUiVQnZGpyYPblIves3GzrswuJp4RCqmUtdjf+fNKACmHn9XUhJrD2ybnD6hjC
	NJ5W8SZWIsaBuQwRm8olJpo9thqTkKH4Kuva2JpNscg==
X-Received: by 2002:a05:6512:3c97:b0:59d:e030:1b8a with SMTP id
 2adb3069b0e04-59df35f8081mr1566012e87.7.1769435439208; Mon, 26 Jan 2026
 05:50:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123-gpio-devm_fwnode_gpiod_get_optional-v1-0-fb49905452a6@pengutronix.de>
In-Reply-To: <20260123-gpio-devm_fwnode_gpiod_get_optional-v1-0-fb49905452a6@pengutronix.de>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 26 Jan 2026 14:50:27 +0100
X-Gmail-Original-Message-ID: <CAMRc=MebQF3P=Tp+65A6o4TDz2txYH0c832mbTV+250-6JRi=g@mail.gmail.com>
X-Gm-Features: AZwV_QgwFe9sVVBbwi767CUOKgxAccdMsXUsQEjHOXdZfEXF2VuHLfS6iU6l2eI
Message-ID: <CAMRc=MebQF3P=Tp+65A6o4TDz2txYH0c832mbTV+250-6JRi=g@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpiolib: introduce devm_fwnode_gpiod_get_optional
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: Linus Walleij <linusw@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	kernel@pengutronix.de, Stefan Kerkmann <s.kerkmann@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31073-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:email]
X-Rspamd-Queue-Id: 449CE892B2
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 10:51=E2=80=AFAM Michael Tretter
<m.tretter@pengutronix.de> wrote:
>
> There are various helpers to simplify the handling of optional gpios.
> The devm_fwnode_gpiod_get() lacks the _optional variant, and drivers
> have to explicitly handle the error for optional gpios.
>
> Introduce a devm_fwnode_gpiod_get_optional helper and simplify the
> BD71815 voltage regulator driver by using this helper.
>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> Michael Tretter (1):
>       regulator: bd71815: switch to devm_fwnode_gpiod_get_optional
>
> Stefan Kerkmann (1):
>       gpiolib: introduce devm_fwnode_gpiod_get_optional() wrapper
>
>  drivers/regulator/bd71815-regulator.c | 15 ++++++---------
>  include/linux/gpio/consumer.h         | 17 +++++++++++++++++
>  2 files changed, 23 insertions(+), 9 deletions(-)
> ---
> base-commit: c072629f05d7bca1148ab17690d7922a31423984
> change-id: 20260123-gpio-devm_fwnode_gpiod_get_optional-e96227cd393b
>
> Best regards,
> --
> Michael Tretter <m.tretter@pengutronix.de>
>

If you can send a v2 with added kerneldoc, I can queue this up for
v7.0 and Mark can then queue patch 2 in the next cycle. Unless it's
urgent, let me know if it is.

Bart

