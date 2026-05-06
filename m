Return-Path: <linux-gpio+bounces-36260-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDMkBwH2+mk1UwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36260-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 10:04:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB66C4D7960
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 10:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5D34030055B9
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 08:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29AC53932F7;
	Wed,  6 May 2026 08:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTKigQub"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51E514B08A
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 08:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778054647; cv=none; b=MPKxkUgLi97uIjmBRPKTWGINMCfnVk0pUQr/Z96VsVYl0tC9+Na1aez3+ZEhBAxku1BfGPNxv+btuBk7F8GEH51solbzwKBSpAEz1AABjlqjr+uHB8Mo91Lcay8LsGGN44srzbKB3P2dZVpz94Q8LH6VpuYn2SyXLWcw62cKFxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778054647; c=relaxed/simple;
	bh=NpJOOpeVFkEgK3eA01BI5ebBngichRrgCHcuSLhtEsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rW2L3KnJnwMwejchMzpD+fP8rJyfVs8Kdv2Cd6CXZdwm0asu2XRkEQNOXEFuPP3mo2HlQ0ZexVZKY2YB67WSDpnuHCg9wmM/8yPZn81+NCgX6RZSzZABD9w0RJaunQGPnkvpO4oX0kdD+A2a3AMQC81940yJFhOLG78cvhR1mlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTKigQub; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99334C2BCF4
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 08:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778054647;
	bh=NpJOOpeVFkEgK3eA01BI5ebBngichRrgCHcuSLhtEsA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lTKigQube33LSi26IU97jkGi8cNBlR9+niRdBVQmf+uLqnDc+ZQYoG3D42K++5kkC
	 VwYC5VltaTag9tMrGuvSIXbxYGhN75jff8ZzW0UOpz2e6Up3OTUmYWvcv7D6ako17H
	 6yG8Si7seoSeLk95W1jOVE6frudzLky7d80rs1LpcOs2d6oQ1RjFcUcgIV42F9PNju
	 UiYqyM/Ygrot0wT48dzam9Jvm8Ru4J4+Xcb7JacbF5IbB0XZdDjPURwnrvdi6ZquZT
	 YLGdE2EE8X3CruDxGhymusmVhiM3wcboY5HNPplOkxrMGdL29cHoqJfl81/VASlLHT
	 5GgGChguVB2uA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a8891f0c88so182880e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 01:04:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+CZMNV0S0aoLLxi53CPB7Cv3qr1r6eIOQqqfxMXYCRa9nDe5Q+dSCfaKHEwrIDAmmet6LAG5F/eZJD@vger.kernel.org
X-Gm-Message-State: AOJu0YzyakDcz3nwDx58M4D7r8pDbAUXm3BE4svs8oLsb+WST5gnIM/9
	9MKkZMCAl6XWgg9Kv7SW1YTOGhm6Kjs68KRDZ8jVqzvqRH79S66Y9mG2g3i30Zd75DLHlLS2kNY
	Z0P9C+NteGw/s91A9HeRSLqSJ0Pq8yoM=
X-Received: by 2002:a05:6512:a85:b0:5a3:ed0a:efb4 with SMTP id
 2adb3069b0e04-5a887ceb518mr906494e87.38.1778054646193; Wed, 06 May 2026
 01:04:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430091202.2724109-1-arnd@kernel.org> <afhLS6xwHGm9_mLy@ashevche-desk.local>
 <bfecac99-3ec1-473a-bd5f-e49ae48aebf3@app.fastmail.com> <afnuY6IPvC7dgUC9@ashevche-desk.local>
 <afnvtid9rSoZ2dkQ@ashevche-desk.local> <ffc24364-6732-47a1-8b56-e5d8b1488c57@app.fastmail.com>
In-Reply-To: <ffc24364-6732-47a1-8b56-e5d8b1488c57@app.fastmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 6 May 2026 10:03:54 +0200
X-Gmail-Original-Message-ID: <CAD++jL=tdCgwJxOxH2qVRZxaBxSvOQeP_iPEaeQFSS45s0qHZQ@mail.gmail.com>
X-Gm-Features: AVHnY4JlI6gvfoQmgxCXxk9Z-ROhZdhYdqt6xTKOo6YfRidFBKOWvI14Cp1Qwxs
Message-ID: <CAD++jL=tdCgwJxOxH2qVRZxaBxSvOQeP_iPEaeQFSS45s0qHZQ@mail.gmail.com>
Subject: Re: [PATCH] [v2] leds: gpio: make legacy gpiolib interface optional
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@kernel.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: EB66C4D7960
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,gmail.com,vger.kernel.org];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[arndb.de:query timed out];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36260-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[arndb.de:query timed out];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RBL_SEM_IPV6_FAIL(0.00)[2600:3c09:e001:a7::12fc:5321:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,arndb.de:email]

On Tue, May 5, 2026 at 4:21=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote:

> >> >   gpiod =3D devm_gpiod_get_index_optional(dev, template->name, i, GP=
IOD_OUT_LOW);
> >> >
> >> > Did I get that right? If so, I'll fold that in as another
> >
> > Nope, the con_id !=3D consumer name. Can't be done this way.
>
> I see. I had tried to find an existing interface that sets
> the consumer name and saw that gpiod_get_index() internally
> uses con_id as the label if set, but I missed that this would
> break the actual lookup in gpio_desc_table_match() because the
> 13 lookup tables are of course all defined by index rather than
> by name.

Oh there is
gpiod_set_consumer_name(gpiod, "name");
that you can call unconditionally to set the consumer name.
It's NULL-tolerant.

Yours,
Linus Walleij

