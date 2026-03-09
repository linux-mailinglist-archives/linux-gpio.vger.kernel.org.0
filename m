Return-Path: <linux-gpio+bounces-32789-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dtSVMwAPrmn7/AEAu9opvQ
	(envelope-from <linux-gpio+bounces-32789-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 01:06:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C18232D64
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 01:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C4BF430055E7
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 00:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8FA786329;
	Mon,  9 Mar 2026 00:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJblPt5j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9C420DE3
	for <linux-gpio@vger.kernel.org>; Mon,  9 Mar 2026 00:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773014776; cv=none; b=OvdolM7VOBE62/kmPvvOXSnZ50GpJSF0GegCl9IdFkV123iDKjsFV5u3xMV9/RnbSAdc7B2aqYUugy8XJi1eHWofIwq1/Zxh6eeVYUipTFjqYQDNuaM5IzhNpugShB9j1ph8rA80JciHl9BOWT5TXkwnonTSZ9dl4Oqr4Hsew68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773014776; c=relaxed/simple;
	bh=7VfkDWCT25IPiML+OuV1VYi27QKD7JmygfyqI7YGyJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m6QVKh3jGb6wIRCSkD0Yz7w1LVNtCUHMfhZVsnl/N6lBERBVRndWTR7GG9GDP2FrqMh2WVt8P5PlB8EWYuMGC+cakpfOXCTesn5LPlKgEei40IHVGVEEZRFCKtJXKc6sxfsBcUIQsPTTyYvwFC0f9WalhPsVKt0RcfMgYScpjrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJblPt5j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EFBFC2BC87
	for <linux-gpio@vger.kernel.org>; Mon,  9 Mar 2026 00:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773014776;
	bh=7VfkDWCT25IPiML+OuV1VYi27QKD7JmygfyqI7YGyJI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FJblPt5jpv/3qqX8qI8PbjgpkMG9LbfWYZPE3/oM05ArvhT3IO8unTa7K3/ZPwKJa
	 JUDVkyySyf9/39minIvepp61mc7TV4xkWXevvEITxaNv1WrrfqT9A0dwcqnuSCVFEx
	 AV3TPM/dO2SJyE0bGIp9BgtY8CTQeUfVKlIUf8Iy0TqLh1faCzoS0utycxfVwOGo8m
	 IPx56nFuVFlSCDpfaylVo2A+9YJzLJ+KgYJyF4D2AnDFarZvnmUINb2dAKk90nTnPh
	 aw7gusA6NIpzj01Y2EvGGd8ltrt1eguA2IzlP4VNwlgdbm8T7MlryKT7A9wYsWuNdP
	 68B9ZD/TtIYzg==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7986e0553bdso105322887b3.2
        for <linux-gpio@vger.kernel.org>; Sun, 08 Mar 2026 17:06:16 -0700 (PDT)
X-Gm-Message-State: AOJu0YzKpVqy9uf1/1pX9NjFkQLhhZqS6oyKVBrFF8h86hCSzWIx8pet
	wyexRwfUaQf5ho9nnCs1BhbTIZ9hKdVx4zOwVisrPi7gUubckTbk90nswLWrHBwfrQY0EnUsKI3
	JQJLFFbiObwTLGQquJfqT+y9P2tbM13k=
X-Received: by 2002:a05:690c:4d86:b0:796:3c99:1833 with SMTP id
 00721157ae682-798dd7aa7ccmr92587587b3.60.1773014775703; Sun, 08 Mar 2026
 17:06:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308021535.48098-1-rosenp@gmail.com>
In-Reply-To: <20260308021535.48098-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 9 Mar 2026 01:06:04 +0100
X-Gmail-Original-Message-ID: <CAD++jLkLj235Q=U_9E-hSneW5E42JjU=dRBJxKJNnqwgBLCm=w@mail.gmail.com>
X-Gm-Features: AaiRm50BkNsacwf3vNv8Po8_uyxzkaR51BCh7HDgMk0GF4BnX_1Cwh-_3Tsm4-Y
Message-ID: <CAD++jLkLj235Q=U_9E-hSneW5E42JjU=dRBJxKJNnqwgBLCm=w@mail.gmail.com>
Subject: Re: [PATCH] gpio: msc313: remove kcalloc
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>, 
	linux-hardening@vger.kernel.org, gustavoars@kernel.org, 
	Romain Perier <romain.perier@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	"moderated list:ARM/MStar/Sigmastar Armv7 SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C6C18232D64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,thingy.jp,kernel.org,gmail.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-32789-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 3:15=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrote=
:

> Use a flexible array member to combine kzalloc and kcalloc.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
(...)
>  struct msc313_gpio {
>         void __iomem *base;
>         const struct msc313_gpio_data *gpio_data;

Do you wanna add:

const unsigned int saved_size;

> -       u8 *saved;
> +       u8 saved[];

u8 saved[] __counted_by(saved_size);

>  static int msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, =
int value)
> @@ -631,16 +631,12 @@ static int msc313_gpio_probe(struct platform_device=
 *pdev)
>         if (!parent_domain)
>                 return -ENODEV;
>
> -       gpio =3D devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
> +       gpio =3D devm_kzalloc(dev, struct_size(gpio, saved, match_data->n=
um), GFP_KERNEL);
>         if (!gpio)
>                 return -ENOMEM;

gpio->saved_size =3D match_data->num;

I know it takes some bytes more but it feels way safer.

Yours,
Linus Walleij

