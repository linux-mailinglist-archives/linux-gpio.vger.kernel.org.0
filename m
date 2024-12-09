Return-Path: <linux-gpio+bounces-13640-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 430439E9143
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 12:03:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A148A1886D5C
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 11:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FFC217722;
	Mon,  9 Dec 2024 11:01:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5AA215167;
	Mon,  9 Dec 2024 11:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733742081; cv=none; b=f/1nBo7QFjZcXLQlhr4jntmKNShddG6W/a8d5lQs5Xs4MqrWbLl4SW7NDvf6kr/xAC0anyMyR4sWXXsn5G2oIu2M7n3tmh1q56ISdP8hp2DuJACbNsMEnLLWBL2PSTBNs+DZE6C4AZ0O3+T1SAa0PH6W7MgPGwyvk+5Z6UBi52E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733742081; c=relaxed/simple;
	bh=Vfky8DJb+MbmUlfgv824SZLc2EdVYz8aaVmnyGcO0Kc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G5YfO7Gy5r9fFIgzm45UgUPZpnmD+0HdBXwqtRroah2a2it9mHnfEhnm3QEZ08G1MxPqBiCQJD30m1RcbFTTMAHZ6kjnjtjkW7YKYEG4aR2C1mVSx5tO9Y4/E6bUljJcCvN8VyZrgO6tV8BNmRF1x0x8miE5HAZ7/mEiHWVbO5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b6d6064b93so91798785a.3;
        Mon, 09 Dec 2024 03:01:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733742078; x=1734346878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pdLSrMJ/sKTz6sczauGRpsp6ND/VIElXQn5Z4wTz0w=;
        b=iCwDsjjmmWees614R8NYBS4DYO1cVzQlWfUr6ecilDKPSxFhpNI2K+ZBZQdZEnU8xh
         Q/WJiyPy4FuThLMn4OfwVIQpDaYUI4z0t1UfJIv1kNtzxOiAFSgeXLjJgV8eACj2ab17
         aF/2TuytkwoH7+oOJtioE14GAPLux3mNAgt/H7cqcqK14Skj2nv881O69BDnRD1E9reR
         413HhK3dmtoMrqM0DUqGQUgIIrWHsvJjCJjA6XY7auKOEy1dRynDAbk8GqfAALIGAEBW
         GLbq0F4KyFjGu38ALj4juEOs5ZR4jVgXtOO+i/DlANVRI/gqWxL2V3YABT19eHcOIjtu
         MWPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZizX9aFLJykK1sGo4mjUOpTcoN78ZQd8lkkIsYsCNRK2u/0WnBzgblO38pa9E5pEr6q7L/Ezr8Bod@vger.kernel.org, AJvYcCV3rc9E4HkCN/7A1Ye6zrlHd47Y38rP5RpPWxfIjDPQa0Q72VQzzeonDMfeAW0Q0Lv/qHrnCQ1cUSk8+rk=@vger.kernel.org, AJvYcCVvYyWsV8xZOYTWMw1tF+xvg5+Uq9voZeZlsmBKRNa7U7WXyu5CRC4vGo2hFszNQG+f4d25PMMktC5K@vger.kernel.org, AJvYcCWZaQ/yuDO4MI7Cy27vRItm+moPc5NWyWE5RNF0qFFY/AKQxH/se8+vbxmqIH2JKS2gCYAimjXfrnU24Q==@vger.kernel.org, AJvYcCWbJQvWkWW2LjC2dHd3cSjEadE0c+K0ayhYuC0E0Sm9OzqR9vmW795l5PMT5KeiwuZq/QBsQo/x2Vk4kgtG@vger.kernel.org, AJvYcCWn34FyZBjE4wDiiB0uxVEif0DU9eoN3xCWHYdyhbVRl4f3nv/yV8QDeV6CxXg2ymUfApdyI8DIiLWPXzt6pJaXXs4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHRYv/dZzLrD9FrFbfzrcThMLUDlPvJmxXGBYB3jnLc4Kqw9w7
	osrcoIUee3Ouq/F9rduayukAzRYcx83qHjGIFfQuwOCPsdM5IqQd0Pl7cQ8m5yA=
X-Gm-Gg: ASbGncsZK/YunA4EbFU0HrNRA1oiSN0Ip4XpVPuOTRziXdDCXGri0cpp3nHxc6nZlfm
	axirMpmPldfYPjFCOVrvXaTpOZyoDAaVYpuKaPsEzlWnfDRYPch3IDlU66t6cHhhOKSg+HUaqea
	SzfZA8kyP1GNDR6m60v1Mf1tir6Fsnn6Ri25EZPFV+6DhiBU9XdhXsqdPQ0fvjbHYNBcoOHsryP
	Q/i8WhnzqrxQxI/9eQkHS5XRQIlcFj7og0Al3W+4jIJt1TOxH/30TVWQfIv/9QkMIOaLwk93Kfl
	hNt8F9wCRT7kLw70
X-Google-Smtp-Source: AGHT+IE7QcldBVH2RXnrYWZkX5V9Pz16nW3sVSAHtZbPuNRuOn38G0hEPHnPWFEVLw5eS3H0qilLwQ==
X-Received: by 2002:a05:620a:2702:b0:7b6:d0b0:4ae2 with SMTP id af79cd13be357-7b6d0b04cfamr867273085a.48.1733742077598;
        Mon, 09 Dec 2024 03:01:17 -0800 (PST)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6d8454780sm58052085a.81.2024.12.09.03.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 03:01:17 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-46753242ef1so22213861cf.1;
        Mon, 09 Dec 2024 03:01:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUY455U2yNkpoCYlwhewp7Qf22ASTipe2gOH7tN/RCczszunCotpsOWXsE0yszHQdJ/wItn+dFVgstO@vger.kernel.org, AJvYcCUds6Q4YvfepZrtKwyHhIhaYINavo4Gq3kVeOLFu9DlUpE5CiG+h1G6Yj2X9/c18NaDUyLxpEpuZLZNU68/kwKSc1Y=@vger.kernel.org, AJvYcCUrLIm/V6ehssiX9h+BJ5KGkNhDQchyZp6k737B1SkDB85rBqeisKrD1AFGumwQXVoNb/Z9B1kERke2W9ue@vger.kernel.org, AJvYcCV3Y29y5/RptpbmhBuHC6rVnn8pO34Vjdi4+OAOV6mk9YDtEoEo/JLVLgVvkglSRm1Hwx7utje2JlHZEUA=@vger.kernel.org, AJvYcCVZs6S8scgsit2+Ed1VP8aLquzz1ob/pLNyOn0H1jqvC54gjzZMv9dKZE/YrjHxCLpVZvyD9XqhfX9q5w==@vger.kernel.org, AJvYcCVemi5CZY1EVG8jqWhQ1+GYci6a37tE7gZzes717g63GZb33oeVZbVu+PQsrr6gCNsFsplzRXfCdVW7@vger.kernel.org
X-Received: by 2002:a05:6102:418c:b0:4b1:101f:a5a0 with SMTP id
 ada2fe7eead31-4b1160c1b5cmr38195137.5.1733742066151; Mon, 09 Dec 2024
 03:01:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Dec 2024 12:00:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUg+WmH8741g-M+74TRqs4T1faQKAhQQGDg8oJxE2bC0w@mail.gmail.com>
Message-ID: <CAMuHMdUg+WmH8741g-M+74TRqs4T1faQKAhQQGDg8oJxE2bC0w@mail.gmail.com>
Subject: Re: [PATCH v3 00/25] Add audio support for the Renesas RZ/G3S SoC
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

Hi Claudiu,

On Wed, Nov 13, 2024 at 2:35=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Series enables the audio support for the Renesas RZ/G3S
> SoC along with runtime PM and suspend to RAM.
>
> Patches:
> -    01/25 - add clock, reset and power domain support
> - 02-04/25 - update versaclock3 clock generator driver to support the
>              5L35023 hardware variant; versaclock3 provides clocks for
>              the audio devices (SSIF, DA7212 codec)
> -    05/25 - add pin control support for audio
> - 06-20/25 - add SSIF support for the RZ/G3S SoC; fixes and cleanups
>              were also included
> - 21-25/25 - add device tree support
>
> Merge strategy, if any:
> - clock patches (01-04/25) can go through the Renesas tree
> - pinctrl patch (05/25) can go though the Renesas tree
> - audio patches (06-20/25) can go through the audio tree
> - device tree patches (21-25/25) can go through the Renesas tree

Note that the versaclock3 patches (02-04) do not fall under my
jurisdiction.  As there are no hard dependencies, these can just go
through the clk tree instead.

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

