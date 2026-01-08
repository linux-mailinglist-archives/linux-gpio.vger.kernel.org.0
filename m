Return-Path: <linux-gpio+bounces-30284-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B02CD043B7
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 17:14:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE4D432999C2
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 15:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3169FCA6B;
	Thu,  8 Jan 2026 15:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gIZZNtCc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71A719CCF7
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 15:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767887559; cv=none; b=C+Gta7J++7xPU7mnJJLyG94t8zH/3f67ugIo3O2DNiEozHBV6Nvm/lhhsvYiOaEDTifcLfju4OngiELbKKzNB3bhguU+o7fpokimIJwz4yvYuLT4KGIqWFww1gbfa8pQEDuEqoDw/RJCkAS7tv1z6gxouzflSBUSve/Ehob/U/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767887559; c=relaxed/simple;
	bh=Iq+Ya+SUVo2dSRzNFgQe9wGGhbs+drEROu81OB000Ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eJ1pw6hxFluHMneCGVP51Mphl4nJ+EQzIthvXFEz0iRnSn18ZiG+wbsxNakXHVvDq+puabOID3293GEEKSvk+7az+NWjq5JBm5I7sKNqdhn1c9jozRC4YNeX2bQrQQ0OiTmPPTJUGRW8coCuTo1wp3wOZuGJGyC+ZDcua02KC9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gIZZNtCc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DDD2C2BC86
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 15:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767887558;
	bh=Iq+Ya+SUVo2dSRzNFgQe9wGGhbs+drEROu81OB000Ps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gIZZNtCc3KOvewDday0hikO/GOCk/CNJRfMfX6e/2F2/t38tHxQbhAybKLqT0Wlv1
	 8Cq1YRJ86RLaNjd3n/0EiLAkz4NgOHyPLQLNQIVXjt7iB2AP+LN+827Ed6+XxsT1Ql
	 wQVlJqdCPFpLdjYEqgXSNON5oIK45Yww+BLpPu9GsF0KpqU4fzsIoC0Gaz9aqpaWD2
	 bqr0hZYR7UiZFmwme6W/e7Ztqmh1GjAzrT01IR+C+bPWNe5qXRHQLzgjsUPzwN/ij9
	 n+MbLkVdZyIwupqJ76AHlfpJd1E4pthBu2SdgobywL6UN5tOPAb8L4NhuhJ/pJiY0S
	 W0G3vAEXzKozw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59a10df8027so3793113e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 07:52:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX5lbmGxnQxHmCHSpFypjApOmqiRPd/a0SgSkOAnao1XnHppRzTtT1PFbtqLqWnxIvbXOJtmiQooiRb@vger.kernel.org
X-Gm-Message-State: AOJu0YzJWllXOrFrnZYmUCF+oGR5FLT7jvxn+vktpL/EL7tzMABylw11
	bs2s9JXCGcFE/HfEAU9pGQBvW5uR9KWLJpa55VG4vvzJZac6p9C+EFdMr4b0oOTtbkgbhttzF+u
	NkhLY2QvMKttHjPHnbyO3PhbfgYKNn61PUPAcTWTFFw==
X-Google-Smtp-Source: AGHT+IEgJbfqVRuNjlWSQBVKdCOEAA+chQkn5r8y6NHescSg4NzXi4PPMTHBBA5YhF17tz/lTg8tGkBOG+FZYFN2S+U=
X-Received: by 2002:a05:6512:a88:b0:599:289c:67b with SMTP id
 2adb3069b0e04-59b6f02a39fmr1859887e87.21.1767887557219; Thu, 08 Jan 2026
 07:52:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-gpio-shared-reset-gpio-proxy-v1-0-8d4bba7d8c14@oss.qualcomm.com>
 <20251222-gpio-shared-reset-gpio-proxy-v1-3-8d4bba7d8c14@oss.qualcomm.com> <0bce9429-1cff-4a62-bdae-57697daf2920@sirena.org.uk>
In-Reply-To: <0bce9429-1cff-4a62-bdae-57697daf2920@sirena.org.uk>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 8 Jan 2026 16:52:24 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeUBhDqQWKqSbRP+bpBcc0Xptdgdj9CMfOzJmgqARJMDQ@mail.gmail.com>
X-Gm-Features: AQt7F2qfGLAEBz654xxry68R4Y1gzwJ0DzZ2ttOuEHzAmQ9Qxfca973HelVStas
Message-ID: <CAMRc=MeUBhDqQWKqSbRP+bpBcc0Xptdgdj9CMfOzJmgqARJMDQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: shared: allow sharing a reset-gpios pin between
 reset-gpio and gpiolib
To: Mark Brown <broonie@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, Aishwarya.TCV@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 4:46=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Dec 22, 2025 at 11:01:28AM +0100, Bartosz Golaszewski wrote:
> > We currently support sharing GPIOs between multiple devices whose drive=
rs
> > use either the GPIOLIB API *OR* the reset control API but not both at
> > the same time.
>
> We're seeing futher issues which bisect to this patch in today's
> next/pending-fixes on db845c:
>
> <1>[   18.348426] Unable to handle kernel NULL pointer dereference at vir=
tual address 0000000000000008
>
> ...
>
> <4>[   18.799534] Call trace:
> <4>[   18.799536]  gpiod_direction_output_nonotify+0x14/0x194 (P)
> <4>[   18.799541]  gpiod_configure_flags+0xb0/0x364
> <4>[   18.799543]  gpiod_find_and_request+0x144/0x504
> <4>[   18.832617]  gpiod_get_index+0x58/0x90
> <4>[   18.836657]  devm_gpiod_get_index+0x20/0xb0
> <4>[   18.841139]  devm_gpiod_get_optional+0x18/0x34
> <4>[   18.845881]  lt9611_probe+0x130/0x488 [lontium_lt9611]
>
> Some prior instances were fixed by:
>
>    https://lore.kernel.org/all/20260106-gpio-shared-fixes-v2-0-c7091d2f75=
81@oss.qualcomm.com/
>
> but that's only in next/master, not next/pending-fixes, and in any case
> the issue also appears in next/master which should include them.
>

Does the following fix it by any chance?

https://lore.kernel.org/all/20260108102314.18816-1-bartosz.golaszewski@oss.=
qualcomm.com

Bart

