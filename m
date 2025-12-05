Return-Path: <linux-gpio+bounces-29279-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E66FFCA719D
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Dec 2025 11:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BE89279E60
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Dec 2025 08:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A493176F2;
	Fri,  5 Dec 2025 08:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rVucRhT6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2280C30C635
	for <linux-gpio@vger.kernel.org>; Fri,  5 Dec 2025 08:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764924025; cv=none; b=FwkG8YGASFhljH7UDMytuLOby9dHXfngZyATmIe4ssMn2IfD8+lqLxqQmBiyU2e5oDvqss82z2sdrdeRJ5nz6t1Ub2Qcayj1TiwP1kaJECIJ8pwAY/5Mi7g35rGz1J2ZOMEllruMg2WOmT8tjakJsrwY4P0tavgD3saxl8JKv9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764924025; c=relaxed/simple;
	bh=ZL7WeGi0P1pWbpx6+nbKI47zaRTC4HD6NKnSXWp7/aI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ptEkdt7xUqjdSVcOn9BgvN/Y0lz8AN0WECgSJy9BDueI3IddmvjSCSTS6DURhGv0EeeBqcCHU02IaXEV/ShCxEP6y3qBtpYBMPEcZWHXNUtoCMrZaB7y3cJ6xubaEOj6+2N0WapYdDPgs3kXXhuUvFjxUltn8w/2aHWzf+cGV/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rVucRhT6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF90C116C6
	for <linux-gpio@vger.kernel.org>; Fri,  5 Dec 2025 08:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764924023;
	bh=ZL7WeGi0P1pWbpx6+nbKI47zaRTC4HD6NKnSXWp7/aI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rVucRhT6G4NM2rFUn5dU6ymC+dIatFRi414fvUCYiT7ECCzA52YmrXWaj/krGTOUl
	 XCqpWyXpbTPRASOwdemWLPT/5HPw27Jz8tVBmMt47peku+aFbTlJLQ0XkDY5PengCv
	 PD9LHODkXLE2AMY1XKxA8wWMEL54oMea/cQPj0UmSlN/LcVnlU7xKUahFplo8szJPk
	 2bJgXoGsy2ohOQ2QzXzC+w8ANzcxNHJ6rOAtLUd2mw8/CWDI5+AhNHzoHRGoyZe44f
	 TT86JPc7D4jeh6ID4aq2wAyuN+vWjGhulBDU2xPE0mpojiXOdAjYEhwKQbTNjlGq2/
	 JddNcTFIrFZ6A==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5942bac322dso1908847e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 05 Dec 2025 00:40:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWGVr3bVBh2/x8qlnFpn7d9a7GY4yS4G6zANmdh4Zb7ZZZ8P4e7KrMNJ45cx664ZidRgmWIsRlfR+7G@vger.kernel.org
X-Gm-Message-State: AOJu0YxUV75HahPTHgBlGbTiE9+p+OQRnVCnOGcb7k9qzsSzh7bHyuQA
	+bOMqMNp//g04r8IKdL2tb26XxtEQzou+ktZq5g8pykj5TehyudE6DmLKHAKeH1CZczJMXve4iq
	qLGMCnbt4wiUpbwRBvRGHnjzeg8RVTuWkzRVS0mkCRA==
X-Google-Smtp-Source: AGHT+IGJ2wWKIn4jt+dzV+ahaoL4TS7FuDPl/g+ysQXKyfJXIeobbAurwwgHc+66N72L2T2A2CWPj11Vv4MuN+zfarw=
X-Received: by 2002:a05:6512:1248:b0:594:31af:4de0 with SMTP id
 2adb3069b0e04-597d3e96a2fmr3408132e87.0.1764924021862; Fri, 05 Dec 2025
 00:40:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251204095001.1031736-1-arnd@kernel.org>
In-Reply-To: <20251204095001.1031736-1-arnd@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 5 Dec 2025 09:40:10 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mf65TkjnWG6rEqx95za4miO_gU459B87-SOYiZZmu2PaA@mail.gmail.com>
X-Gm-Features: AWmQ_bk5gEC1eZDaJpVZcJmj6cgZ-do1Mne5hqkaIcd3X8WUTrtBlhc1vKsPyZY
Message-ID: <CAMRc=Mf65TkjnWG6rEqx95za4miO_gU459B87-SOYiZZmu2PaA@mail.gmail.com>
Subject: Re: [PATCH] gpio: tb10x: fix OF_GPIO dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Peng Fan <peng.fan@nxp.com>, 
	Lee Jones <lee@kernel.org>, Koichiro Den <koichiro.den@canonical.com>, 
	Christophe Leroy <chleroy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 10:50=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Selecting OF_GPIO is generally not allowed, it always gets enabled
> when both GPIOLIB and OF are turned on.
>
> The tb10x driver now warns about this after it was enabled for
> compile-testing:
>
> WARNING: unmet direct dependencies detected for OF_GPIO
>   Depends on [n]: GPIOLIB [=3Dy] && OF [=3Dn] && HAS_IOMEM [=3Dy]
>   Selected by [y]:
>   - GPIO_TB10X [=3Dy] && GPIOLIB [=3Dy] && HAS_IOMEM [=3Dy] && (ARC_PLAT_=
TB10X || COMPILE_TEST [=3Dy])
>
> Use the usual 'depends on' here.
>
> Fixes: 682fbb18e14c ("gpio: tb10x: allow building the module with COMPILE=
_TEST=3Dy")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Hi Arnd!

Actually a better fix is to simply drop this select and not introduce
the depends on. This driver doesn't call any symbols from gpiolib-of.h
and even then - they provide stubs. This also limits the COMPILE_TEST
coverage to systems with OF_GPIO selected.

Same for the other patch you sent.

Bart

