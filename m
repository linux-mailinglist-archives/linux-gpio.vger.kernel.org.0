Return-Path: <linux-gpio+bounces-31894-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJWnIsVVl2lPxAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31894-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 19:26:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E56161A74
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 19:26:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8220C301F9AB
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 18:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220E12D8DC4;
	Thu, 19 Feb 2026 18:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZfMeXEoj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D971D26D4F9
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 18:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771525534; cv=none; b=ZjwxDxMnhgDdRv9JHS6XjHDRqy+viPApVqB/neyNdlAL7sdFrXA505DReWqfxgXvUiwqedZhOMpVhL4RPgGTCMMRK9xalBJzDPUgwCdgF4pqU5+NJXsqoP9Wbq/VecJH2XKCttxUu/NcZSFfh+tq+QQGi7SDNqUxyABn/V7lFOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771525534; c=relaxed/simple;
	bh=TsjuKfaQRPaSwSOD7XSNnbjmMMLNKdF4ppbtMrwwvvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G5wYw8oxK1TUiYIPdxOm9NzNIWV64i08kdpm3SGNGHqCXkTaZP9Cgxlo7jHZ+3XgSZMj/V5/2Aa3B/9hTuhbYIrUQ8mOaZKRY3ERI1+15841TymuF248a+j93mIMCe3LcGcAAHd26jRN9oRfwmdgW3IH8Qcm9PM8zmgE2yLK8Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZfMeXEoj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89BDC2BCB0
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 18:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771525534;
	bh=TsjuKfaQRPaSwSOD7XSNnbjmMMLNKdF4ppbtMrwwvvw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZfMeXEoj8qvTNvMV0CjZUClr7Hb04jXpimaviWOmwMIn0xTI2319GGS2BJIlcAWph
	 7S6O1L0NwYrFjymnDZjGRDQE52AW6oeLhTSg0ueP1bSuxCxW8+KQdtvoDmsshX0K1P
	 wPmWLKAdD4Q3PJNngqSKiMGMnhsqJZM2dEKsgQsQNNVhqa7V65Ji490kSRCSl9PVdM
	 0WDnjdftKlRsjuWb4oWWC3eNsUJt/rktDnp5Y5L97Xk0OVxJEC9FGagpY8UsNWUa2D
	 Wp4ertGrCB6fnyuxOD/oELm10+CpF+0ZRhGkDDxlamTFdlHzJ2EGmKKnym485F7Wjh
	 wlwYDTOtVMMfw==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-797d509a2f5so14649967b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 10:25:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXtQtOWc2NMoZangiGVU4W+1fqroyv6ll4eogXzvwDXHY1eWJc7wAe1uIbEK4JeBOJQLzhYiFDPqExH@vger.kernel.org
X-Gm-Message-State: AOJu0Yzegq6RQD2dX/04yHehB3lZOOg5yfHZG4850v+jhUfNK45/lZNW
	fHgnpWDi/TFlXV7EPEk+K2xuhizdolP32lhTQdyU1xmFIw06a0ngL3Msf5gYxhbU7Fm9IlZ8mvh
	5cCc/yT33tsIGAsAgsTXip29yj1cikXU=
X-Received: by 2002:a05:690c:c4c2:b0:796:3f2f:a33b with SMTP id
 00721157ae682-797f71d21c1mr56003667b3.18.1771525533891; Thu, 19 Feb 2026
 10:25:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219022929.3558081-1-dmitry.torokhov@gmail.com> <20260219022929.3558081-2-dmitry.torokhov@gmail.com>
In-Reply-To: <20260219022929.3558081-2-dmitry.torokhov@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 19:25:23 +0100
X-Gmail-Original-Message-ID: <CAD++jLmDnTPcPs4pAYgZ97Q-MWQJqLaRAxZpSqN0+GpGumudCA@mail.gmail.com>
X-Gm-Features: AaiRm52CJHUgUjK6uYiryIzkuKLd6Te7G3LP5cqRsOT1HFhEjf1wPoYa412LqTM
Message-ID: <CAD++jLmDnTPcPs4pAYgZ97Q-MWQJqLaRAxZpSqN0+GpGumudCA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] iio: adc: ti-ads7950: normalize return value of gpio_get
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31894-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 10E56161A74
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 3:29=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> The GPIO get callback is expected to return 0 or 1 (or a negative error
> code). Ensure that the value returned by ti_ads7950_get() for output
> pins is normalized to the [0, 1] range.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

