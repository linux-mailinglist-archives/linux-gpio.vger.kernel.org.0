Return-Path: <linux-gpio+bounces-32462-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEr8GxT/p2nUnAAAu9opvQ
	(envelope-from <linux-gpio+bounces-32462-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 10:44:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 184ED1FDCF4
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 10:44:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1165C3053C12
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 09:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6D139F18E;
	Wed,  4 Mar 2026 09:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RcfiT+Cb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDEE396593
	for <linux-gpio@vger.kernel.org>; Wed,  4 Mar 2026 09:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772617441; cv=none; b=BsAyyKJ1+xRbIPI+EmKyxV9jSOBXcypWxyAgPCeuzAHt5BNTdo9BxEWk6AhX/ZkAA/+H5SgKvEot8e90hXwgtedkH4AXDDqNDH6crS6o7LlJI4PYqRXy35cdkcztLVyn2uQnMSdzj/wzGIulpE2OH+0Mugq0u/IQ1iylbnxsO20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772617441; c=relaxed/simple;
	bh=8+rSrSJcs/fP61bPdboLaJ6pJ7+GkOXQuVKywbc0GCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ctaOemt0Q/lz6gDK3wWUOPtYkzlFazMDl+47X3x43jasVvd7pRIRanMxKe9LmXbtCiSXECSpJtFoNFdUg16FIhVb++O5ZiKHzycTazFv3XCokjimm7Hl9hGuQ5D7u4evI9G6aNsqcy1toJKZs4GSszgqgQhh3ciglRNxV1YEFIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RcfiT+Cb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7339C2BCB0
	for <linux-gpio@vger.kernel.org>; Wed,  4 Mar 2026 09:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772617440;
	bh=8+rSrSJcs/fP61bPdboLaJ6pJ7+GkOXQuVKywbc0GCk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RcfiT+CbhA5N32spmPfxrEhljqGZBQ60fAlClkBvvhst/61qltnhlydaOXRe56LAC
	 Fep900wxE57RKIQ/G4UB18SmNywGMgpqEaHtbEfTdTZ+fU+MKsOnGvM7eLWJ07qCOr
	 cUwHXvrodPLmsufV/2VNR7tELRFonlmGhgrnfO/kb/PYTy2GKfU8rsiFigieE/3bVs
	 2Xvmd4uU5AsZ0QVkAEz9TeJoK3rPtQVIJscvJ8R5pS5Gzrzg8N2BcC2hq0lqG/GQzH
	 MWU/JLfXQ1bWzeZaZT1dlO40zEqrydOa/PP0F/7HK9HR8DIuXqL9ZRvYaX06rJ0lWv
	 +pv2gvJYCD1CQ==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64acd19e1dfso5745344d50.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Mar 2026 01:44:00 -0800 (PST)
X-Gm-Message-State: AOJu0YxcTZpwuJH3J4NNq2rF6hqbhdv1O9pGQaB3M5NWWkrmMBv2gJHX
	mYF2xumENOvAjjzp1EcVIt81GiyfJ4smdoj3CicPYHlFVZJ5q7Di4VrN3F/tsd+Qsk+s63EhZal
	Bqiy0/nUlSAVyw6AYklARfl1U/32hjyY=
X-Received: by 2002:a05:690e:e26:b0:64c:a5f9:9b2d with SMTP id
 956f58d0204a3-64cf9b4dfaamr883263d50.21.1772617440138; Wed, 04 Mar 2026
 01:44:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304084808.440955-1-xujialu@vimux.org> <7D8A09EB5A988115+20260304084808.440955-2-xujialu@vimux.org>
In-Reply-To: <7D8A09EB5A988115+20260304084808.440955-2-xujialu@vimux.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Mar 2026 10:43:48 +0100
X-Gmail-Original-Message-ID: <CAD++jL=FCRvj_mz_E-JVnyUBV3SOidQQ7zp=ogcRqirjvphpTg@mail.gmail.com>
X-Gm-Features: AaiRm522NQIq2xqWFZ06jce3apy8wKQbz7KFc_V7_Vt72Ls_gfhCHo5PLgJpfYk
Message-ID: <CAD++jL=FCRvj_mz_E-JVnyUBV3SOidQQ7zp=ogcRqirjvphpTg@mail.gmail.com>
Subject: Re: [PATCH 1/3] nfc: s3fwrn5: convert to gpio descriptors
To: Jialu Xu <xujialu@vimux.org>
Cc: linux-gpio@vger.kernel.org, netdev@vger.kernel.org, brgl@kernel.org, 
	krzk@kernel.org, kees@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 184ED1FDCF4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32462-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,vimux.org:email]
X-Rspamd-Action: no action

Hi Jialu,

thanks for your patch!

It's *very* appreciated that you are driving this work forward!

On Wed, Mar 4, 2026 at 9:48=E2=80=AFAM Jialu Xu <xujialu@vimux.org> wrote:

> Use <linux/gpio/consumer.h> instead of <linux/of_gpio.h>.
>
> Signed-off-by: Jialu Xu <xujialu@vimux.org>
(...)

> -       phy->common.gpio_en =3D of_get_named_gpio(np, "en-gpios", 0);
> -       if (!gpio_is_valid(phy->common.gpio_en)) {
> -               /* Support also deprecated property */
> -               phy->common.gpio_en =3D of_get_named_gpio(np,
> -                                                       "s3fwrn5,en-gpios=
",
(...)

> -       phy->common.gpio_fw_wake =3D of_get_named_gpio(np, "wake-gpios", =
0);
> -       if (!gpio_is_valid(phy->common.gpio_fw_wake)) {
> -               /* Support also deprecated property */
> -               phy->common.gpio_fw_wake =3D of_get_named_gpio(np,
> -                                                            "s3fwrn5,fw-=
gpios",
(...)

old code supports the deprecated property too...

> -       ret =3D devm_gpio_request_one(&phy->i2c_dev->dev, phy->common.gpi=
o_en,
> -                                   GPIOF_OUT_INIT_HIGH, "s3fwrn5_en");
> -       if (ret < 0)
> -               return ret;
> +       phy->common.gpio_en =3D devm_gpiod_get(&client->dev, "en", GPIOD_=
OUT_HIGH);
> +       if (IS_ERR(phy->common.gpio_en))
> +               return PTR_ERR(phy->common.gpio_en);

Maybe make a second try with
devm_gpiod_get(&client->dev, "s3fwrn5,en", GPIOD_OUT_HIGH);
so we don't change the semantics?

> +       phy->common.gpio_fw_wake =3D devm_gpiod_get(&client->dev, "wake",
> +                                                  GPIOD_OUT_LOW);
> +       if (IS_ERR(phy->common.gpio_fw_wake))
> +               return PTR_ERR(phy->common.gpio_fw_wake);

Dito.

Other than that it looks pretty straight-forward and correct!

So +/- the fallback properties:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

