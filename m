Return-Path: <linux-gpio+bounces-13654-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 109449E9560
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 14:01:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1CEF16242A
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 13:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35BC228366;
	Mon,  9 Dec 2024 12:55:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23B222619B;
	Mon,  9 Dec 2024 12:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733748909; cv=none; b=tL9d4iHOk6r16pA2UkbiLcV/VVyvtBwGSnsKS0A3MszmwKUQhITbYtHUJCwpcNAjKz1ChZVyO99c3KNwWUlJqnb45dFuLaM3PBBkUS+le6VH/dJUU0bF0jgZ1QN0jrCk47fMswTvISg3HhDB0vNFhsqTTs6OgZ7Qar4QwQi6pbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733748909; c=relaxed/simple;
	bh=BoFHQnV2ZUJRZO3Onx/b6idYeF5wQgGinSz6ETWgvdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sQAihIxRsNyA0GsA/PFMk+v6wvdjku3V+P9F0L9KMOuKpZl0h26nsyoDASg8l/l84eQNageaQqkaCG+rCZSsqdeCS5PK1liKMOGeeTU5rBzeVLHmpVXMol4VWshX4MP5Ey8Ii79J++jQ2PPM7MX8wqU49Jp9BTp5ao4Bn0A5/rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4afde39e360so627552137.0;
        Mon, 09 Dec 2024 04:55:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733748905; x=1734353705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flMWz4KvijWpTCU/Mae8t1bctkfOrFBTrsRYC6H9AOI=;
        b=QN4VfUeNSFZDLqixw0hmavU8YVJorAqLHliHtnLYPA1/kngw5vHYzlAUs5MIQ6Xd3f
         3KtEZQpswL+fLitGCfchGDQGRH8tJ4AB9Sei1qpGqCWHuMdvQ1AT/Aqma9+gZjJVwO6c
         Yx62RV/68Ir7PMytGEMWDJKcneaGYj5fR0iXZoBweS2e24uLb1lhyTlbkfz3Q/LFmMUk
         B7BrLbFxUC+tcWPjniwABzskvm6vZiXf3nL/rztHhluSuDgmBo7hglrlJ/Gc/n9tEQuZ
         +hRs+beemHtHshrhzPTJUJ28dDq2QYMkbbmSRSVaXFYU8PD2nJPw+Fp7aWPlT+Fkobkb
         RE9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7LwrlQpEUrc/mNRlLL4nXcNKUjORMBXVexuQEvnmrAhwVJRI/wNDm3/5JjjZzmZn7J7ClX7Dz5r1J@vger.kernel.org, AJvYcCUGz1YK2SbZGLYWDmYJ2f5Y01+m0UBjpDr7WIFzD9mSFmrqzZh8it0+HGrBq9jclkk4brcbU82dAgnt@vger.kernel.org, AJvYcCUMhYhBoXCVC7B6qUcXtRndL99NdsXolbg6VHrsyMMtf3nRCH2mjT/QcUUwZobtLj8KfmRVQlHa8UzilzE8@vger.kernel.org, AJvYcCV2GEoOt4JQZejB0kHDrzWdYh9wMYybD6ixUsOzoPXVLcBStKz02F/89TJa4PLWZ1WDBOIAhizNyJNb6Q==@vger.kernel.org, AJvYcCXf7eECvGWI6hdE+K5+T2s3ftxhCAy+NjF+ow7OAwznclXVF5GJX71aEfuzGtaQJCA9YoZmu8fFk/Bb28Q=@vger.kernel.org, AJvYcCXiqyqCpUcbKFxPIlBJBfWt1Lnc+A6nXrhMXY6NOD+B14tjTbZj+m1+TM7okZ5pXNftUAXsEhsBw9fi00uCamlrlG4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywroq1tahT2LI2IJc8cz5uI0AjlPbAbB1NBxRFnMUpgxhizhn5u
	EIJ8Yun1Srt1dmziwcaq9coeQGhSkNR8hnk5I/UwDynAUx/VoENTYMo+zAJcgFU=
X-Gm-Gg: ASbGncv1OdHSQR6yqAZCQuw/mwGQYwYN+qw/7sDSlpwH3elZ8sTJoYOU3XtqIgVvDCj
	blLpeP7dw1ClUElzywdJ2IPLTrHAzYNP3gaM8rc4WLYX7fB8HPSpU0isp9dA5aWO5rBGPhrjH/t
	1jw0/DsTrLs+W0/UiiiwnViAKVj+6QWolE+7i6V149xwD0eoAMdIUVrdgTKNZ5DMwGP2asnTTF7
	ZIcu1wzy/uoszm3ehBbnqOeYbR5HEyRfD3TMsZoNXaopd92k4tZSFetK4hzgGN6yRv/rI8oiyCy
	mdFLN+o9Mp8/
X-Google-Smtp-Source: AGHT+IH4hnTZxCmMLebS/O3QUWC+xA2zM1dVWbyUeqfS+PlrXtSXiImSZdRB47ehj3UFuGhZdcb7yQ==
X-Received: by 2002:a05:6102:ccb:b0:4af:deaf:f891 with SMTP id ada2fe7eead31-4b116051204mr376410137.4.1733748905052;
        Mon, 09 Dec 2024 04:55:05 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c2ba7dc94sm976061241.16.2024.12.09.04.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 04:55:03 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-85c61388e68so288731241.3;
        Mon, 09 Dec 2024 04:55:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUMm+vwHBsKW2M2of129Th4T1cklHSH1cTgaXrY+GuYF23VVnbF08NVeQLEJfiEnXh5vERC4K8VEUsZMu+sWi7DfSs=@vger.kernel.org, AJvYcCVfuyTJRDg32iIcT0zl+rSSmZh1nn4ttiULZJVJ652iywuPJ+EdDcWJBjpRnyLXpuXIR4GrHxCvr7lGZA==@vger.kernel.org, AJvYcCVp057uc4nD8EEvE1jnnnDumhQEXDnX+RTpLhb9cU+yCmNfHqZX5YeZKBKO5E0qR3wT/YZful0SVP3y@vger.kernel.org, AJvYcCW3LC1vxoGZL8oYkk1vT9QObOs0cVUFOM8NyhewTadOawE0C9BnlWZLpWEyObeAJwzUmTmJAxhe7kXhOHoR@vger.kernel.org, AJvYcCWHVvOeUHlA+A7FvPpxitHYkKtTn6uXdC55igNSbvMfMyGFICun58+hc2RQplxm2meVvlXEj+VIe79U@vger.kernel.org, AJvYcCX6C1AzbnHox2XZMGC+6YHMeP6ROGd58aN7iUS1CZQIgPteaNDVnEgGdWmsdXGlPyY5a9wOl7NZFdWJ2ds=@vger.kernel.org
X-Received: by 2002:a05:6102:510b:b0:4af:f6e5:2b3d with SMTP id
 ada2fe7eead31-4b1160dc12fmr337822137.15.1733748903246; Mon, 09 Dec 2024
 04:55:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com> <20241113133540.2005850-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-5-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 13:54:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXNokax91t-N3yrcLFupeWoejBz0wtP9tbEb+EaMns6wQ@mail.gmail.com>
Message-ID: <CAMuHMdXNokax91t-N3yrcLFupeWoejBz0wtP9tbEb+EaMns6wQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/25] clk: versaclock3: Add support for the 5L35023 variant
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com, 
	broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org, 
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 2:35=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add support for the 5L35023 variant of the Versa 3 clock generator.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

