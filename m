Return-Path: <linux-gpio+bounces-35529-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJHUIY/O7WmwnwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35529-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Apr 2026 10:36:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A76469114
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Apr 2026 10:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3FE3B300A138
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Apr 2026 08:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB43343D80;
	Sun, 26 Apr 2026 08:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="udhCOe34"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F041FBC8C
	for <linux-gpio@vger.kernel.org>; Sun, 26 Apr 2026 08:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777192584; cv=none; b=GFclHCu9Maos9a0aS1S+/6nDFI/u3ukP/r0XxjlxKOKsaMo7VoTVzEPQCuzoagjqgLxbu5z5qqErJ9NzC/vnh80/uyIxoXpCnY8gpRZZ6gG3z1Mfye4nsBthFmikffGs3AqDQH8JwrgwBLsO2I5FaxtE/aIE1xCd/9EVMW99ep4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777192584; c=relaxed/simple;
	bh=1/6VvyfAL9R5vjxY+AXLp9W1S3GtT0OmLzFLKCWtrJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bOz6fDOB82Jsxh/zD1QHWu0e0ea3E9GEOZWbCr5WXHruK6JR7kaiYASn4IXEkxOhG5Bz5752ZGjaSqhU8+Pi6uOisrgdShBVBFpQaMDVQMg7JG//h7a5GoWO4v6PSZBbr5MFyCF82az2C6/UmfgEm6EzKzJnTpA14t0BHgvCkUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=udhCOe34; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675C7C2BCC7
	for <linux-gpio@vger.kernel.org>; Sun, 26 Apr 2026 08:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777192584;
	bh=1/6VvyfAL9R5vjxY+AXLp9W1S3GtT0OmLzFLKCWtrJs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=udhCOe34rIDWmvzUvt0BIz8XQXO3Ah4sQFGkkX3txna2RL/uzF1YSHOZGrEFHbp7N
	 P7xdh8tvzx8Pue6FVNHREXMJg5PtfVLFHsfgv0LKmBrERoK31FuhdXj8+AHzXUmknX
	 3EjvWzIMKNn+8h6+CNjVXg4+TmYeUwuxWjZgIuQf/nIlDsKbrFACQAPT7PhhvykvSX
	 GxfrgV+aaBmvSK1hqvswcWgiQ1vQZ5UVlpAtjML60BRgLLgTkzEUIf5jqUUTdeI8q2
	 C3Gnp8wugat1zOs1JYEHKloHiMmu6ZUfqzd/4zFqRY5mFUSmF+lpkjIM7qKJadZOYG
	 VYo8pB8jbbCTQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59dea72099eso9885132e87.0
        for <linux-gpio@vger.kernel.org>; Sun, 26 Apr 2026 01:36:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/1efQ1Bi5BwxJKr1EPV3EejlADJvmnSv9XFl7kYXwRksu1TT/rN7qXnoPvuiRwV3KG5u17Yuw19e8Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1xYD86O9zp86gEys9eXAHYrFN6pCal4qXORcDP3J9zHS6sgsx
	Fnj3t794KCKUaJa5RlHRFH/2ujqFOnJWG2xrH/DsRZ46W5xqqOEjqhX11Jopkss7mfQksrtUV/y
	sMROz684Un25Ptl7PbnfCEZw0SW5dL6w=
X-Received: by 2002:a05:6512:3ca0:b0:5a2:b979:4b06 with SMTP id
 2adb3069b0e04-5a4172b7ae4mr12820186e87.4.1777192583057; Sun, 26 Apr 2026
 01:36:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424-ds90ub953-v6-0-7a84efbab316@oss.nxp.com> <20260424-ds90ub953-v6-1-7a84efbab316@oss.nxp.com>
In-Reply-To: <20260424-ds90ub953-v6-1-7a84efbab316@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 26 Apr 2026 10:36:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLmi1Q4sGeY6vK7fxw8AdCmiiW-8kdEi4OFkV1xep=Od_A@mail.gmail.com>
X-Gm-Features: AVHnY4JPq-BE7FCv42DA9knJSs0rb0sCy7jk1s9CJjtuaDpy_xLU0YkpPQu4V6Y
Message-ID: <CAD++jLmi1Q4sGeY6vK7fxw8AdCmiiW-8kdEi4OFkV1xep=Od_A@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: media: ti,ds90ub953: Add support for
 remote GPIO data source
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Bartosz Golaszewski <brgl@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-gpio@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E9A76469114
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-35529-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email]

Hi Guoniu,

thanks for your patch!

n Fri, Apr 24, 2026 at 3:40=E2=80=AFAM Guoniu Zhou <guoniu.zhou@oss.nxp.com=
> wrote:

> The DS90UB953 supports four pins, GPIO0 through GPIO3. When enabled as an
> output, it can be programed to output local data or remote data coming
> from the remote compatible deserializer.
>
> Add GPIO flag in second cell to select remote GPIO data source.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
(...)
> ---
> Changes in v6:
> - Added GPIO_DATA_SOURCE_REMOTE flag to dt-bindings/gpio/gpio.h

(...)
> +/*
> + * Bit 24 indicates the GPIO data source is from a remote device.
> + * This is used in serializer/deserializer setups where the GPIO pin
> + * on the local device (e.g., TI DS90UB953 serializer) reflects the
> + * state of a GPIO on the remote device (e.g., TI DS90UB960 deserializer=
).
> + */
> +#define GPIO_DATA_SOURCE_REMOTE                0x01000000

So this is added to all GPIO controllers ever in existance as something
fundamental about GPIO that may need its own flag.

I doubt this.

I understand that the driver needs to deal with this in a per-gpio-line
basis though, have you considered:

1. Just hard-coding this into the driver based on the .compatible
  string, if the remote GPIOs are always the same for this TI thing?

2. If it is just for one particular system, you *could* actually have
  a table/mask inside the driver for this:
  if (of_machine_is_compatible("my-funky-system")) which will
  kick in only on that very machine,

3. If you really want to store the information in the media i2c
  device node, add some custom property like this:
  ti,remote-sources =3D <0x0000001f>;
  where a bit is set to 1 for each GPIO which is remote.

Putting flags on the GPIO lines themselves seems too complex
and system-specific.

Yours,
Linus Walleij

