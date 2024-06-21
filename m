Return-Path: <linux-gpio+bounces-7611-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC18912500
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 14:18:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DCC02815B8
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 12:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5C21509BC;
	Fri, 21 Jun 2024 12:17:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A670528399;
	Fri, 21 Jun 2024 12:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718972278; cv=none; b=IfbIEcE2TEmjEbYG2EAAMxSDGKexPFsTbRH7CbR8ocfn0JM4fGzyb1vRlYaWdQAl0A1dihVAEOcFZ2BO2pvtTv1ynrGyWNPzOfCxSYKGsekZdKf13x4G+4Kw45TdrN2Ic73P7rOObG81fGKnC595NAVjmsJR2zblLTlRtKnylIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718972278; c=relaxed/simple;
	bh=FQ2agrzVuW/zD2YoBosKlJoO2acppwXAoeG7ssgZZQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p8QbMJGW4I/qwbd9S9QD7Obl4AgTf5lZVQ4RfEl5fIIOJ0yAcqGDHCxYLXDZLLFb7bQKUFKps0gL9kp1jp7N2C7ms3X+HyLqk6L3CqByt1bVWdbLUdCi3MStiMg0pmFZmgr7wk1yfmqV6uyJF+3M8pOUyNMpvTdjRd6V24ZKD08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-63bce128c70so14954277b3.0;
        Fri, 21 Jun 2024 05:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718972275; x=1719577075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nkLxurEt5Br1ag4C5ykRvVNSQUrZUXOds76HNbkyPkI=;
        b=b+Y04k6hy4HIK1NV6W9ysx1VhCrNJI3WUYLSBSU71pHM/KACOCCnEDE7ZInqvXTEUB
         OFMiogiZev+uF0oqCMZeHPnnpt2ZNXOD60inpk2eMODHD+UMMxzCMv6tE03vEprvoDvi
         YFOI0VrRYp8CpxExbbsh5ef7bZLwjk0L7EqkNcot3oF7WZ8FvDeRPdcdUxSqLiiuQP0m
         pC8j5Y5bDr36Q5rnjg1838V7x7JQiCtxvC3rDkyv8qzQY7IT0CYbpH4f2wctGj959K/D
         1xP+4pLiwVqB68Zc9VhS+mn1jKFKxzD1QXAI6pIeHI3+VJ+cQnzlt8xeYcehYyRKeASN
         bLKw==
X-Forwarded-Encrypted: i=1; AJvYcCX6586nJl+Wt7mKjafSlY5QDNpj1IkGDIiE8efescPxlMYVbJYs1ByDrUHjtIghD4YIMQ0okFkJUjStteBDu/56x8oJ0SlZMMRdmU3sAXpQoUmQk+7rRJnwB4UR9DX1Avi8EMwodKErHI4EDRv0x82IxN++R9k5MZ0loKoWwB8DvM6Pv0lt8XeGfuk9
X-Gm-Message-State: AOJu0YwOE9azwr/R27zchbUeebvAvZwgNYw+0B7udtW3+QuHG81y1/IF
	z26CiqQmKCwGtFwnlso6wzpUsCnkOPOkQCrZpjtmSN+9fyAUp9zVcO7d2M1n
X-Google-Smtp-Source: AGHT+IFU+3htLiKj5pRSrsdqyJkJY7b6bVLRAKM/R4hLM4yrdY19HMoLSTyJLdNLnwVngJDqcYn4zA==
X-Received: by 2002:a81:4425:0:b0:615:2fa1:c55d with SMTP id 00721157ae682-63e1cd4c8cemr23159427b3.19.1718972275105;
        Fri, 21 Jun 2024 05:17:55 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f154d5ef8sm3051577b3.117.2024.06.21.05.17.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 05:17:54 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-62f3ccc877eso22111987b3.1;
        Fri, 21 Jun 2024 05:17:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8oG8H06Y8xROoBuZwH0wLN+dvgztfnv1rAM+uDnbwSg9qsGB8Vd53cfcgQeBL5j0qyPtOOumiVJVQEAvHtO7fp+UYkz7DeO9KSXWtooZ1n/7AynTJOud1S3Unc2cZNgkDhk9552zNMFCPBe1l03uO+uvBZyxlL/PEJkzMZYgjPEh+hNgwMK1RYebO
X-Received: by 2002:a81:c30b:0:b0:640:aec2:101c with SMTP id
 00721157ae682-640aec2106dmr2504997b3.2.1718972274448; Fri, 21 Jun 2024
 05:17:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618174831.415583-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240618174831.415583-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240618174831.415583-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Jun 2024 14:17:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV16Sd5HoJr-td+OJJ8gCesbCzz3BSXNFpBpd1iR9=u4w@mail.gmail.com>
Message-ID: <CAMuHMdV16Sd5HoJr-td+OJJ8gCesbCzz3BSXNFpBpd1iR9=u4w@mail.gmail.com>
Subject: Re: [PATCH 4/4] pinctrl: renesas: rzg2l: Reorganize variable
 configuration macro
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

Thanks for your patch!

On Tue, Jun 18, 2024 at 7:48=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The `PIN_CFG_VARIABLE` macro did not indicate the capabilities of a pin
> but served as a flag indicating that the pins of a port have different
> capabilities.
>
> To better reflect its purpose, move the `PIN_CFG_VARIABLE` macro beside
> `RZG2L_SINGLE_PIN` and rename it to `RZG2L_CFG_VARIABLE`. Additionally,

Do you mind me renaming it to RZG2L_VARIABLE_CFG while applying?

> introduce new macros for packing variable port configurations:
>
> - `RZG2L_GPIO_PORT_PACK_VARIABLE(n, a)`: Combines `RZG2L_CFG_VARIABLE`
>   with `RZG2L_GPIO_PORT_PACK` to handle variable pin configurations
>   for a packed port.
> - `RZG2L_GPIO_PORT_SPARSE_PACK_VARIABLE(m, a)`: Combines
>   `RZG2L_CFG_VARIABLE` with `RZG2L_GPIO_PORT_SPARSE_PACK` to handle
>   variable pin configurations for a sparse port.
>
> Due to the above change the configuration macros have been reorganized
> as follows:
> - Shift the bit positions of `PIN_CFG_NOGPIO_INT`, `PIN_CFG_NOD`,
>   `PIN_CFG_SMT`, `PIN_CFG_ELC`, and `PIN_CFG_IOLH_RZV2H` down by one
>   to accommodate the removal of `PIN_CFG_VARIABLE`.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.11.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

