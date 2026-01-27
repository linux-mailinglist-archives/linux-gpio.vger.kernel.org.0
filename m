Return-Path: <linux-gpio+bounces-31137-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDVbOhyKeGmqqwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31137-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:49:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 614AA920B0
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:49:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBF33304346A
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD05B33374F;
	Tue, 27 Jan 2026 09:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GYpEjJGL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6CF2E0923
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507173; cv=none; b=kasA+w6uFFzr/+jVU3AHMhz/CIIAJVMDAtEEIHC0Tku2r1OUzTO8oWnsR4GiCr5srFQskgTm98dF8xS5KoEPIAKCQwC0B28PGc0ujmiVgskM5L8MMWsLZalW9TGxjb5y1//DoiVStH97tpvCKjLZwWh8mnr/q/nQ0/UiXPKq/mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507173; c=relaxed/simple;
	bh=SpwD5941uhefrbZg3fBPLX/14WZZ+dwxh4A2/dRc4hs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uslxY6tLL3vxXnyDu4rnbImgT4TUcwja5qF0F6YTEsEUc22D+tJMocrap6fnNHRDTtOgQSsrbGTuyffQRAhC2Fve9ZS8oFZsfB/nybeFVT0BlePPEGuoDhI0L/p2m+38j1PAIniO8s1yKA92T6DAwSC6AiNjIMGUqzKpPl66OtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GYpEjJGL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2C7C4AF0B
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769507173;
	bh=SpwD5941uhefrbZg3fBPLX/14WZZ+dwxh4A2/dRc4hs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GYpEjJGLnMI+1qmqsDYvrrE7EWnT0j4iYAUQmMj5vNdXpnU3Pz1IqYC1xXif1Gy2C
	 +FDeeoxxr3SKS0zseHK7iVsf6/VIhFZ8yXu2eJFzTrz37pUlslKnC2EUktO3x8fDfz
	 39pnTgakZO/O3/b1lFwkfHKBVWCU5hl6AMKdM+fb+tPKuqJfUHJwlsnQ4fZhYG2c5s
	 hMUkKCMB9ekpMEf2C24Z92BOAlmxTnKB8kcB2mSjC6U6sAKZGFzBu/0zoGXm5GFAV8
	 Vdz0wslgAQX9dpIcnhwZsbbGd1KMfJfVEEb6WrtoSriZy3TvZ5eO+V97kY1BmrOSMo
	 KPeG0SVAy6vLA==
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-649605d3664so3815092d50.3
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:46:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW152QciM1hCTrQ4mQjbSVfx+xsq6/rElmIHNeN1GyCzxH7CX9vI8bK8juDAvASnrrTdb8+gsoTSIjE@vger.kernel.org
X-Gm-Message-State: AOJu0YxYO5/r4qRfd/gNA3ZYnPkInXqFnJylQi9vW4+BwgX4NOukklfg
	rlYZIgDXuO54xaD7jQZTiwonDn3HuDQjmaJuLTJf5/dH6fj9kcXpdVAMEMwpRpEjjeNCORhsK6O
	/MnX5KTfhwIGffuru65/uXRXRF74VkjY=
X-Received: by 2002:a05:690e:1384:b0:649:44ac:cc01 with SMTP id
 956f58d0204a3-6498fc461f6mr630414d50.55.1769507172501; Tue, 27 Jan 2026
 01:46:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD++jLmGMWjCD0gUcaJPuK0UzJa7nX1bdoVu-BA7aHAgcLTSpg@mail.gmail.com>
 <20260125195123.248798-1-jie.i.li@nokia.com> <20260125195123.248798-2-jie.i.li@nokia.com>
In-Reply-To: <20260125195123.248798-2-jie.i.li@nokia.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:46:01 +0100
X-Gmail-Original-Message-ID: <CAD++jLmFAKhhjtQQ1GHrV+RBa8MBtw9q=OdbVx2Vnoji6-ESqA@mail.gmail.com>
X-Gm-Features: AZwV_Qg-YM7xFzk5kIoWtva2VIeoFubXD2ozCIwkKSCML81e_RaP4cAgkH1WuiY
Message-ID: <CAD++jLmFAKhhjtQQ1GHrV+RBa8MBtw9q=OdbVx2Vnoji6-ESqA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpiolib: add gpiod_is_single_ended() helper
To: Jie Li <lj29312931@gmail.com>
Cc: wsa@kernel.org, linus.walleij@linaro.org, linux-i2c@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jie Li <jie.i.li@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31137-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nokia.com:email]
X-Rspamd-Queue-Id: 614AA920B0
X-Rspamd-Action: no action

On Sun, Jan 25, 2026 at 8:51=E2=80=AFPM Jie Li <lj29312931@gmail.com> wrote=
:

> The direction of a single-ended (open-drain or open-source) GPIO line
> cannot always be reliably determined by reading hardware registers.
> In true open-drain implementations, the "high" state is achieved by
> entering a high-impedance mode, which many hardware controllers report
> as "input" even if the software intends to use it as an output.
>
> This creates issues for consumer drivers (like I2C) that rely on
> gpiod_get_direction() to decide if a line can be driven.
>
> Introduce gpiod_is_single_ended() to allow consumers to check the
> software configuration (GPIO_FLAG_OPEN_DRAIN/GPIO_FLAG_OPEN_SOURCE) of
> a descriptor. This provides a robust way to identify lines that are
> capable of being driven, regardless of their instantaneous hardware state=
.
>
> Signed-off-by: Jie Li <jie.i.li@nokia.com>

This makes sense!

> +/**
> + * gpiod_is_single_ended - check if the GPIO is configured as single-end=
ed
> + * @desc: the GPIO descriptor to check
> + *
> + * Returns true if the GPIO is configured as either Open Drain or Open S=
ource.
> + * In these modes, the direction of the line cannot always be reliably
> + * determined by reading hardware registers, as the "off" state (High-Z)
> + * is physically indistinguishable from an input state.
> + */
> +int gpiod_is_single_ended(struct gpio_desc *desc)

Switch to bool
bool gpiod_is_single_ended(struct gpio_desc *desc)

> +{
> +       if (!desc)
> +               return 0;

return false;

> +
> +       if (test_bit(GPIOD_FLAG_OPEN_DRAIN, &desc->flags) ||
> +               test_bit(GPIOD_FLAG_OPEN_SOURCE, &desc->flags))
> +               return 1;

return true;

> +
> +       return 0;

return false;


> +static inline int gpiod_is_single_ended(struct gpio_desc *desc)
> +{
> +       return 0;
> +}

bool

return false;

Yours,
Linus Walleij

