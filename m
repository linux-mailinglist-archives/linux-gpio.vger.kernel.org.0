Return-Path: <linux-gpio+bounces-7609-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DF59124D7
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 14:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FCF31C22C9B
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 12:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7370174EE1;
	Fri, 21 Jun 2024 12:14:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F8D174EC5;
	Fri, 21 Jun 2024 12:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718972090; cv=none; b=gQgszOiP3GFfNvcgcM7E6APImaps0syalrAQQKFHNVtVpEESp6NvCF7M7/WUIi0ElizYMIp03ZcBKLX6jxjmkm23vLFDuYCM8idr3Wm/PKkd+2rCwFZ4sIZn5kcz59Doc41Zf7kiZcLth9Rpam4S2lCyewxsYvH93+9lU07lxEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718972090; c=relaxed/simple;
	bh=94g3tM/ZAogs23CyOkAaJeXL/ZQ6PrCZNN/NnGCYPao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qaOC35c0EBVPOtpifiOOy8KAF/AZjMjznR+phl2f4oXPyNroFoG2zT/PqQaxYqZENLvgNXaJWKBVQCWrUIcw0ZwmOWa7dzq35UOEKT9YuF8MHbXAiVQZUPL2jhvoQRHJqP8fsKb7t1HMLsjqCgM6o4xMX4mhV4nCIGrPRZP35NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-63bca6db118so19321857b3.3;
        Fri, 21 Jun 2024 05:14:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718972087; x=1719576887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y89JFKHmQRpMDq4ODJLJ3KIgXOHBuEgTn4kIaXR3d4E=;
        b=ujwMYgbw0tyzzhzOYl7JsioSlD6DuVPweKXsSJMi1FbsKS82wNiS56dAgjDRVCYoAU
         8e/2gKdkABaa2zolgAr6JyB+nKGxcr1zDCae7Ox9XCNMLP/rptIYBntuD02/GihIzQLj
         pXFR02BApjV1d+JJrd1y3X6xO5BGtpFOVNDV1cxwKy7LLHFiA70kz2aF59UyGmYb8kbd
         h2QI5H51/GBEJTR8u61fXDHB1hocOS6MPezA/sHeX28uW4NQl3PvuYnqJ+skr5tnnLk3
         tUiwivg6yIEOqRCdmyB5zonBKhtwbsn24kkRfa5q0ums9Glwh1X9Xkq6XLjZFV1qWnT8
         dgTw==
X-Forwarded-Encrypted: i=1; AJvYcCUb4JF66wYkrLaLb7PLNJXeO5Ur0o0rihdGXG8prTuenK+nOVeeGbgwSbJj0UKa8YwBZjte915zqqYgo09hWz6QRGftK8owthwaTDQqUeoGapEktj/wF1wqeuWqPkx/Hl5gdY9lry2iUOSaaVxecM4wpcYISaoVU8OIZVzABPqnTw5wDtytisiuwh21
X-Gm-Message-State: AOJu0Yz/RvsFHTiARow+LUoIYD6thXuSBR40ZwYrYg52jXQiYl/d1Os1
	9nIs8VhWLBr229zloU5H/U3NgwDE984pd61KPAt5H9UAslVyzox/VGjpMohx
X-Google-Smtp-Source: AGHT+IEe2hSsAIB/Fue6XxIxQ6xFZfb1kP++Yf5hl3hqYb2o2fjkANlwy/bOmkp5uZ5yJ0mXC7AbLA==
X-Received: by 2002:a81:f001:0:b0:615:10f8:124a with SMTP id 00721157ae682-63a8e0e3160mr72619177b3.29.1718972086864;
        Fri, 21 Jun 2024 05:14:46 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f154d5eedsm2988077b3.109.2024.06.21.05.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 05:14:46 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-63bca6db118so19321487b3.3;
        Fri, 21 Jun 2024 05:14:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXE4gazpshlM+nd6y7BMacL+jmNFDISdMA193JFbWNcl6a2iRX1wnk9ZhQqUyMIoRsm1+EjpnV83C0kW8TeXCj+ILuax3zu8J9IVOykO7pyrxrcWD+0+wVueKdMxvjwpFuzTvYhfTct7Mt1YnuyVec59maz3HCrLhVzg8hiIFi1e3tUsouPOtDDjw82
X-Received: by 2002:a81:f001:0:b0:615:10f8:124a with SMTP id
 00721157ae682-63a8e0e3160mr72618837b3.29.1718972085944; Fri, 21 Jun 2024
 05:14:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618174831.415583-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240618174831.415583-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240618174831.415583-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Jun 2024 14:14:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXLqC-ckkR_8_1DPDeStxopgV9FmxUa3Ex2y5AwaoE0Og@mail.gmail.com>
Message-ID: <CAMuHMdXLqC-ckkR_8_1DPDeStxopgV9FmxUa3Ex2y5AwaoE0Og@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: renesas: rzg2l: Adjust bit masks for
 PIN_CFG_VARIABLE to use BIT(62)
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 7:48=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Shift the bit masks for `PIN_CFG_PIN_MAP_MASK` and `PIN_CFG_PIN_REG_MASK`=
,
> to accommodate `PIN_CFG_VARIABLE` using `BIT(62)`.
>
> Previously, these bit masks were placed higher up in the bit range, which
> did not leave room for `PIN_CFG_VARIABLE` at `BIT(62)`. By adjusting thes=
e
> masks, we ensure that `PIN_CFG_VARIABLE` can occupy `BIT(62)` without any
> conflicts. The updated masks are now:
> - `PIN_CFG_PIN_MAP_MASK`: `GENMASK_ULL(61, 54)` (was `GENMASK_ULL(62, 55)=
`)
> - `PIN_CFG_PIN_REG_MASK`: `GENMASK_ULL(53, 46)` (was `GENMASK_ULL(54, 47)=
`)
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

