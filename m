Return-Path: <linux-gpio+bounces-19551-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF42EAA70C9
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 13:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F1771BC3F5B
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 11:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E822417E6;
	Fri,  2 May 2025 11:43:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B8822F152;
	Fri,  2 May 2025 11:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746186183; cv=none; b=pwVEmNHOvOhFMvqXSjJmNqasS27wTqY5/PwnHUKckTv/BiiIELF/mYjyx7bEklcgS8CU7VZd66Hp7qDY6s/S74I1ioOwCQeLSXBZKAbQmnucB16/RjE51pPHPAoWO29dZQiR1DkMGFy25/bMWCofsLArSBHOG/wU03oquR6TjMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746186183; c=relaxed/simple;
	bh=+bKH78JkWpMbuLiMH2klT+W2jWWSwU2GBJo+cDrKX5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ra+b+wI8aVSQoMimKddbjCl2k0KA3JNfZV/rg7cJTM3so1zCt68bWoXOxWtp3Asa86tKrO6N/49v5ioUwH07M/7FVlnwuM/iX7DtkNVjKJtGGfW7nlJyBIbdXLioio+bSzUmWwrGnDtwR4twJgJloAjZkUA09YlS7Fp5C0+0kbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5241abb9761so575887e0c.1;
        Fri, 02 May 2025 04:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746186179; x=1746790979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xx93yRVM4w/R+TEdbPsidsu/QFUjb5pgYuRlHQSKOPE=;
        b=fYWUdTUF4wyJxQjlMlGrf+dOJ5Ck7ms+5nbYnnWo1o1sGdb51heePfGr0Ugaebdn2n
         /zVJl1kY5yPviwuxsuY6kEWS7GHW8Hmq9tCA0uGLeWtoucFe1xLy9OU21VThgcXlgljm
         Wn6QIlXye2f4nFv1v6TQ9wRYWa/8NeSj3pEU/9uc5VsE0mq75nNVtvdm7kx7UrRwNCYR
         vjpn74VXBGPkwSNEeGARmiWivDhTOvbIS3GYbSD2STZCew3njn4ZTJUv66a2gXWNh74+
         j6np5EIFHuspGnZXcSazqq5DvYHBmktbvkF39wSp1ugWNRa+q5N4iyfPHaScKsoMupXk
         y3xA==
X-Forwarded-Encrypted: i=1; AJvYcCVFF5H+X+XYBWi4GCekztdYqiu+SKNV3RVcZko5QbFMh97Bywgkh3kktqySlEcXGliQeuHhvVQJUe8L@vger.kernel.org, AJvYcCWHwx0jijpUJ02x2Q6w22UkX8Pno/S4kCvc5ZU7pBKUSNPNVD1SmHgWnySrK+Zq+re4/h2pDVQSG8DTBYmo@vger.kernel.org, AJvYcCX59PVpjaLwu9JmaqIRgCkFtNPosV3w0UPo4W02B8WMztPZ4GbYdvUAca3YVffjrhyInIXAKSWEKN6aIhWbXtzVwyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrQuCvEuhFo05iFLPAlPwaFoP0r5pNeSaDTNg0ZvMeU/dIuZ4o
	s5X2wJml+IdXsp8btYeUKmfbxQyhtaZSUvZwRfrWtTV0oG25NQh5t7k9kXXw
X-Gm-Gg: ASbGncvAbS8QxwhkbhBYNttLc2u54V/pMaarM2FGqzdlHs6Aw20wnmvterpsY+IIHLX
	y9Ip/3IuAco/xO4/pIE94WJyzu4ddvojVpxhIx0MIEd9cbPPxISxBor+5hIr5C5tXdZRuI4DgJV
	IOj1f/VRu8kq+h1tMFXgKeSWVUizavhtt8ZnQrRMd9WNNXyIjRxEXUxGqdPCBI2S4eTtJBlb/p7
	i1kFYzJXKo8r32BksZRrPkFkTxsvAZ9AQS1MsdIy+YeKjjcXOALJwF47GewgMt3Sk6OSGoiDThZ
	PEsnGrzYYJy5aq9h9WAA+FipglzEJgGXJbNZgElYdkf9vMMTU3JkXsaq0UaY0V8u56cE1Sd/QDs
	AE4U=
X-Google-Smtp-Source: AGHT+IEO1w1g1QUECyrQMLxwQQdjFP6jVO0zHzv4tVTRXMkP5O6ihqRIOgGnCmbEeGUAKaUNGLgafg==
X-Received: by 2002:a05:6102:3c86:b0:4bb:cdc0:5dd7 with SMTP id ada2fe7eead31-4dafb68b6damr1234793137.16.1746186179513;
        Fri, 02 May 2025 04:42:59 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8780afe9cdesm255690241.5.2025.05.02.04.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 04:42:58 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-873a2ba6f7cso508139241.3;
        Fri, 02 May 2025 04:42:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVoVaDlLmzw/1JSYfjyQNoisshX3AGZuEEtLI3vs8Nj1ueqzKCL32bSqo2QH3V53qFo5i1mnufWXK9QifS@vger.kernel.org, AJvYcCW04m3c4gkD08BwItAhZhklwY7H9MWNQPnQJ1m3Vbmg0QWp4C1n52xbWrkLYojYFnaqNls87AcPBa9G8q5jtP/1B8o=@vger.kernel.org, AJvYcCXrXfc2eafx3e7PrH2UOm3dsPplk+cDkFBxQ/d9XiSqVtlb56FPnK1Gx/KJVacxmvnGDdQ5Y5V0fx0q@vger.kernel.org
X-Received: by 2002:a05:6102:4b1b:b0:4c1:9738:820d with SMTP id
 ada2fe7eead31-4dafb4f7276mr1451231137.6.1746186178555; Fri, 02 May 2025
 04:42:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415130854.242227-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250415130854.242227-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 May 2025 13:42:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVh+Xr2o7YMPpk3gwYDAD8z-W0OOWO=2Gq0VunyaoH-tA@mail.gmail.com>
X-Gm-Features: ATxdqUHz4lf0vegjX0kY0z5gx-e18rdT0Qc71om7yw5cMjLBX0VHQIlaIHl9fxc
Message-ID: <CAMuHMdVh+Xr2o7YMPpk3gwYDAD8z-W0OOWO=2Gq0VunyaoH-tA@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: renesas: rzg2l: Add support for RZ/V2N SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Apr 2025 at 15:09, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add pinctrl support for the Renesas RZ/V2N SoC by reusing the existing
> RZ/V2H(P) pin configuration data. The PFC block is nearly identical, with
> the only difference being the absence of `PCIE1_RSTOUTB` on RZ/V2N.
>
> To handle this, the rzv2h_dedicated_pins array is refactored into a common
> and pcie1 subset. This enables reuse of the common portion across both
> SoCs, while excluding PCIE1_RSTOUTB for RZ/V2N.
>
> This change allows the pinctrl-rzg2l driver to support RZ/V2N without
> duplicating large parts of the RZ/V2H configuration.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Hi All,
> This patch is from series [0]. Since most of the patches have already
> been queued, I'm sending this one separately.
> [0] https://lore.kernel.org/all/20250407191628.323613-11-prabhakar.mahadev-lad.rj@bp.renesas.com/
> Cheers, Prabhakar
> v2->v3:
> - Split up rzv2h_dedicated_pins into common and pcie1 subsets to
>   facilitate reuse for RZ/V2N.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

