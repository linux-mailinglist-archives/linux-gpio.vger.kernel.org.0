Return-Path: <linux-gpio+bounces-3213-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAA7851882
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 16:54:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1C0A1F20F76
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Feb 2024 15:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1512F3CF64;
	Mon, 12 Feb 2024 15:53:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F42283B297;
	Mon, 12 Feb 2024 15:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707753238; cv=none; b=Xn2qxkHYopiSxXUIU+7fvvZeJxzrzi78eJh+jx7bFm49U5Gime8ffwbnyC4k0n1MlgTRTXCKLaeW9ZOoITv236PFm9XEe9E1riUejvLHl8xmlnC7K3+R8XIeV0fQzX6ci5GJgCmR3zhdnp1W0vx6IZdZ/ATUZKfuDjjurU47Jk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707753238; c=relaxed/simple;
	bh=3lBqUTT0Lc5waCtr9ikr2szkQbtkryvHC+RkGGPWKPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+8A7WsGUuzLwJwR6dWZclIkn3p6lFiraQHtwm/aA1eB1w8/W1n4Vi3RGlNGn6LXfrZFbmymlPiYr9zWBVtxTns1ySs68gP1ULIt+PgCwcXaeTWsPc6PrSzXkLZrzUteVcVCNfBKy17uL3EnbZshJrSWp+CVpLY29uWddw8yxBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-60757c46e34so10370067b3.1;
        Mon, 12 Feb 2024 07:53:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707753236; x=1708358036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZiO4jDdXKJWfEzbLNQ/qsisUcoQNar0qa79KbnHchP0=;
        b=kjCDtOB/hZcvFGytmyYu/EmufjZQsJ64iC6QBNKL7GNSpltTrgFOSqZlcCQNKpygqa
         RzgTKhTlhvdXqe9cbnZZekk+m3nswlh+tV7kvOZaqGOWt/FL+LANQHnOg33HSuXNdAsF
         lgjG11uC7yepJqRI19s3FJHhjbtevIrr+w0HbX+Lz/aJDiUChILqkkqC/jXpd/RwTmRw
         o9ZsgqOE19obYWeCtQ8MIzohK4e84LYQhnCIA1/MierS42PVr0b6aFCOvULZ/T9BTnfO
         xe9Hr+HhmPl3DkAM/wge6ajv2j0Hxyo3LeT9j1lD0eZMnk8wxQb12tcwUXdCIe99WT80
         JGAQ==
X-Gm-Message-State: AOJu0YwmrZQ1vVTYLyIRpOOuiA2CgSXHEKc2L/x/wRxGeIAtrzmu8sno
	fDYV4ycSIRajmsoBsXDmMs/emWwDU5ie2w4C7eqJyFTJsF0YSdqKSRlu2eSzib0=
X-Google-Smtp-Source: AGHT+IHHC1k6r6D/w2zIebSbI/u6+1YrN+wCJfCUBiJWDfF6fyQzmaophVARzZAQEHSeqqRwycMtDA==
X-Received: by 2002:a0d:ddcb:0:b0:5ff:83f3:9465 with SMTP id g194-20020a0dddcb000000b005ff83f39465mr5687134ywe.1.1707753235772;
        Mon, 12 Feb 2024 07:53:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVkegi1nydiuGDP9Vi1HRGjPfByKAeeJBQIax/BPljWYko1ZOXigHB7tGe55HQkLVCm22xRhhzutC91hf0b8SzE+yyl5h0Bs2ALIg1iwW6prFqo8yxuCQgqjGRqaQLlOstEaSt20oYSwGI9NvIH
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id t188-20020a0deac5000000b00604ac29fbdcsm1230903ywe.38.2024.02.12.07.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 07:53:55 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc75c5e3151so2048329276.1;
        Mon, 12 Feb 2024 07:53:55 -0800 (PST)
X-Received: by 2002:a05:6902:e12:b0:dc6:ff32:aaea with SMTP id
 df18-20020a0569020e1200b00dc6ff32aaeamr6587870ybb.24.1707753235327; Mon, 12
 Feb 2024 07:53:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206135115.151218-1-biju.das.jz@bp.renesas.com> <20240206135115.151218-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240206135115.151218-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Feb 2024 16:53:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWwHwZcGj9Efuqp-vnAh0Dy9br7RScOjpsL5zcCKFcbhw@mail.gmail.com>
Message-ID: <CAMuHMdWwHwZcGj9Efuqp-vnAh0Dy9br7RScOjpsL5zcCKFcbhw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: renesas: rzg2l: Simplify rzg2l_gpio_irq_{en,dis}able
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Tue, Feb 6, 2024 at 2:51=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> Simplify rzg2l_gpio_irq_{en,dis}able by adding a helper function
> rzg2l_gpio_irq_endisable().
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2:
>  * New patch

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Note that this conflicts with Prabhakar's "[PATCH 2/5]
irqchip/renesas-rzg2l: Add support for RZ/Five SoC"
https://lore.kernel.org/all/20240129151618.90922-3-prabhakar.mahadev-lad.rj=
@bp.renesas.com

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

