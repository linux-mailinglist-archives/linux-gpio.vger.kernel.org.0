Return-Path: <linux-gpio+bounces-25747-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E355B4900A
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 15:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABB5E189DC23
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 13:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FBD30BF55;
	Mon,  8 Sep 2025 13:45:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEC530BB9D;
	Mon,  8 Sep 2025 13:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757339147; cv=none; b=hDA3sA5ocps9VmHgvDzl0IHeDNpQw1LOQcJ65zBG374ZYEdrO63oM3SNKvjLQjmwuVY23X/9Pud1ys1K7moY+hqzpEfQS+myJfVCsp1OLjRLo0AJWLV6PTS2m2HBgGmlbnEHI8E8JPInNogctqR9rcGzUyQSwGRy59AUqhDLGoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757339147; c=relaxed/simple;
	bh=lKauLn5+2xwHchcKZZ5CPnhjhdpYDngJAQZhK9lcAAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LmpRC/45iSjcIgLdLKFtR344H+RdrWvFG7kooBi/wJ2258QC4lDMD2w1qNXQRaYSJzTzigpVT67gAZ7Y9DAOKGJD1ANlXFoZFqOUiLOOepVFXsKzldE83nHxpE9Ahs5oenb6p6AT4sCWFDIcQ+8StMgIlj4pLO+wBXmbQWn4DTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-89948e581d5so2381184241.3;
        Mon, 08 Sep 2025 06:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757339144; x=1757943944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqxnRLg2LuoFk9SqTSQO2WUraT5Rq33d28E8i3syP3I=;
        b=eHztheZpuEQ0x83cOMpEx5SQ7Viq3ifncHamQJQd2/Q8C6osVj0yTtTFX4bINtLVwS
         xnsmwavQ3zB9AkOaMsj5/7BiPkZXviwfMIBiiu7mpnJgJfnXySQ+nyYWPW8rVS2kWrPK
         Joffe8Hza2z8CNSfniS+6phhySns3AnqElvcpRocUT9P1h/dg1KPrEn9+Qxakuzd/TSq
         5/xmzdR8h/K6WS7OAev6+bmdQceAApO0qgUq53jnyJpWvL2T8uCxosbKqZ44rSHsMYTC
         6FZZzLNJDHPIlF4l+nTYo0x7MK/KbJTxJXH71V5ZpO2I6TVV6ndpgCgUYmX6t4D/ezN8
         pueg==
X-Forwarded-Encrypted: i=1; AJvYcCUWUB6iq68rsBW1Hrj/Qx9Ub6hXRiOq+MULnxsxpgJeAoTMg+20kju3pMzt0KZPspuFs6C4Y9R0TpE6@vger.kernel.org
X-Gm-Message-State: AOJu0YyyzXT1VylEIUdBGmLR9N2gtlJlXVlh6Xr+d5KFgxa/APHcUZY2
	WZS/cH4VfhMLOKpcgHDUJ9JB8kBLpctIrcXtHcwZKGzzE/wtOH0s16/9Pl6fr3bG
X-Gm-Gg: ASbGncvaHq9VHQUAfw0/WTQ0B5ru8dgjx8lUTjqrrMf5Q6ZRtCoZOHJqxptRqQEvpNS
	MM6Dmmecz2+ZnzhvxxnnjDSDavgp50naMKB+iGN/w3bCDDdrbjx+RafyawWSs7OQeI3AvN9s8PK
	SNaPhHvHFN2/MqV9j5hve9l6NijclcC33/4QcZ3uEUOTnOEpwcjnHYrEAqACjIM/NCOBVt0Y9E0
	WPoTGE2qxKxnJkJn2i26rWA/mrR45TChNpQluPLAplq2atgiHMaCPTruCiclAHJ8kIKBsdNQaqm
	LJg/lbG5E5VaENQQGlAMewI/yucIwBzNhT7QkndCIL7RqbuZu3VbUUMl6hSfTGAZi1GUw98z/1c
	4lW4zLyIJUf6lVYJ2/NYpAa8OwAlnbQ0OGlL/J3QJNHL8B72thOANpAwmv+Z0
X-Google-Smtp-Source: AGHT+IGNXqXD/alHZLp+nStz5BHyXFOpuI/nUodVPX1OafY6icFeVcpDcL+rAHfSDrvhvEKngdm4mg==
X-Received: by 2002:a05:6102:dc8:b0:524:d902:8c80 with SMTP id ada2fe7eead31-53d22e1e883mr2453687137.28.1757339144113;
        Mon, 08 Sep 2025 06:45:44 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52aefbabb3csm10548924137.8.2025.09.08.06.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 06:45:43 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-89018ea8f7cso2296839241.0;
        Mon, 08 Sep 2025 06:45:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW2astoLtG8etF1l7Eo0JzsE9gWKRhJ/PV44Igo+4c/MDKlPsulJpIAB4SqrU/ZIBet3bCSqcXzE7hw@vger.kernel.org
X-Received: by 2002:a05:6102:4b85:b0:519:534a:6c4f with SMTP id
 ada2fe7eead31-53d2434aadbmr2513652137.33.1757339143417; Mon, 08 Sep 2025
 06:45:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6f71998cd83730f77e0ddeea4b822aa4f8b833e7.1757067771.git.geert+renesas@glider.be>
In-Reply-To: <6f71998cd83730f77e0ddeea4b822aa4f8b833e7.1757067771.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Sep 2025 15:45:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV0w5a0jYqD9Kwy7j_nXBj5CAsLgApBPNxST2yQyG_Hvw@mail.gmail.com>
X-Gm-Features: AS18NWDfQ8dqePyh8iqVprQqsoCdVehMJmNsHTNZ5Rq1SUPbY92ob8aVxkI8KKM
Message-ID: <CAMuHMdV0w5a0jYqD9Kwy7j_nXBj5CAsLgApBPNxST2yQyG_Hvw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Fix PFC_SMT_mn register offset
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Sept 2025 at 12:23, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> According to the RZ/V2H (Rev.1.01) and RZ/G3E (Rev.1.10) documentation,
> the Schmitt Control Registers are located at offset 0x3500.
>
> Fixes: 725933a54f718af5 ("pinctrl: renesas: rzg2l: Add support for configuring schmitt-trigger")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Untested due to lack of hardware.
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index 79c7792c2f549dab..52a61901aef0f191 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -142,7 +142,7 @@
>  #define PUPD(off)              (0x1C00 + (off) * 8)
>  #define ISEL(off)              (0x2C00 + (off) * 8)
>  #define NOD(off)               (0x3000 + (off) * 8)
> -#define SMT(off)               (0x3400 + (off) * 8)
> +#define SMT(off)               (0x3500 + (off) * 8)
>  #define SD_CH(off, ch)         ((off) + (ch) * 4)
>  #define ETH_POC(off, ch)       ((off) + (ch) * 4)
>  #define QSPI                   (0x3008)

Please ignore: I missed that the SMT registers are documented to start
at port 0x20 instead of 0x00, so the based address in the driver must
be 32 * 8 = 256 less.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

