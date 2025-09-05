Return-Path: <linux-gpio+bounces-25663-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA47AB45386
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 11:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8516B3AF41D
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 09:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B116278751;
	Fri,  5 Sep 2025 09:40:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76244263C91;
	Fri,  5 Sep 2025 09:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757065205; cv=none; b=gzx8c4ceOCV/M4uGQ1ottL0kp0ZtR1l85GnPmIL//H3lWfLKBiq3nb+t7awBFtWg+NF4x5+KNS0RfKcK8QixoXr2LRjxgfOc/uRwVp9+3Rle1Q/AeEWgUOAeHP/UDDM5tgC4/qr0nBakh9HHUlHjxVu9Q7hfi5feB+MCHidmc80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757065205; c=relaxed/simple;
	bh=uH4ASOvviKG4mPCbrhkKIG5yf/DQJkUk4Ade9UY/ke8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PXk4049cffYRoAvJAC1o5Hih60sg4vLOdyftoQqwkftHdZW41V1iHwYH+yW3RtPsZ8tQxwuFtSou7gBlH9290WAbREur3To0GvQUt2WFNNidz+XqvQyOFirsVZy1VLIWSzR+NoDFIlQ+nv5qz3oHzuWURwLG6jydu15YN7Og6Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-538e108f6cfso475178137.0;
        Fri, 05 Sep 2025 02:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757065202; x=1757670002;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPuHH9wR+3JMtwt0Mt/r9BQgDVGSAd7W7JN3EdSC2gA=;
        b=HyTM3jKUdTxCgYBa5bu+jt2UpYJrN5ZJxGTq+wqFnB2idSNOyNWSXwu5jwpYYg3JCc
         CGVdIb+/Oxxd+8AipSSijlzVbadWwCIw0KONJwPhMTSF9OVJ2kA6Mpx3rttSI74d3Esj
         RzAFZdFburiZhm8j6kxVOeX6BKDroUN9GTy1NQ6H3PqpUHm3d7kF/lHoAFNz/tecpmJn
         XK4+Ub/I4xwKZ0L6+4MHmoRSjD2bCIgD6QnNpt7stFG2BgFXspsiv1MBN78QmveLFFg/
         LLKK0r4fdeaTBgCBkliEHwsQaODye+tJuIkHSnQ69utnYwepvvPI6UxMKueSLUjANX2s
         X+rA==
X-Forwarded-Encrypted: i=1; AJvYcCVXLTkBicQeQYvXt0+Uo4jV+YbcZpjSLHcfA5ugbhJd/7LfTHb73Chc19M94blbjJYfHIoKbVime5oByr9t3OovmN4=@vger.kernel.org, AJvYcCW3LGXdlTih0Ku71tLrZrVamxGxkpi0ca6zUtGzsCQElCCnmFAdtyF6ZpOU8xIuwmVkdXlpYr/u8AolRzFP@vger.kernel.org, AJvYcCWOX30ZHKhQ54X+iVLZCoNWfYrH15BlBJLiWuoxmDmOfp+TfMu+aiGykEaZ5tPpuIWHki/kKnedB7zY@vger.kernel.org
X-Gm-Message-State: AOJu0YzOqHx8hY0hkxAfeGU1YbylaflaRqkoTVkl2yhNfkHpeqfq/ifa
	ZMkhHtByHUaDhmFYh0leKhxSu9vqnyTT+hoq/36YV3hnTUL7df5eoGjPUYU3GgcX
X-Gm-Gg: ASbGncuRiudaeBIgSqz7CwKS5hNTTPw3YSTPLwqJ+i6n1YrrKRAQKRLWAPZrL5+f6ED
	v46SZubT/WEEiy9sjwxVQQMf/55LAv+3h76zMXFVl4WugeXoILN7bXAZnPAbpA6NRjXLSX+0Roc
	9nuLUIb3bjWw6TxLcRPMvF/CWrLnkm5lXyxN88KSPuVGBWv4uEmRa8XaISqLiSsG10dtoAx/7Z/
	B9UOGWWHbKBxg3vW+rIwX1IGCfiZ13m3e9kAXx077aQacwCtvffp2AxayBAXJENVj2vboRi0kF9
	9pAca6qUDZVxeXsdiGqFrcv0gMBQ/OzDpzF6+VpDvroW4FeOV4Pgqn99jowqO1XwkXsxXl6o8+M
	h6aCr/AIK0E9gk2wNqksvhhoG+264hR4o5OTKEliKgGcK/q7dHW7jmW0Kvp7Wip8C
X-Google-Smtp-Source: AGHT+IHJ4+sOHwJPe9u8+PrAh5hMEZl+9oQks3ENTqg0K1Mx8AqhxnW/WnR+xYJx67+aPTd8QKtMnQ==
X-Received: by 2002:a05:6102:5121:b0:4c3:6393:83f4 with SMTP id ada2fe7eead31-52b19846470mr7901759137.2.1757065202102;
        Fri, 05 Sep 2025 02:40:02 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52af19156ecsm8097146137.12.2025.09.05.02.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 02:40:01 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-544aa9b536eso1454158e0c.3;
        Fri, 05 Sep 2025 02:40:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/LJ7rQalGQ3IUteBBKpwCPGnStXVu+2WQv3xxE/GPrNAletfuRJgAJxcGguBtllyPj2g5bHw83ykQ@vger.kernel.org, AJvYcCWWCJ0lwmqSNFroc3Ji2hQDTyv7QBrqMiMNb1t5hTz++wyHslL685f8vGZ/uU3D+0+0NAdTEFaU6N/bqKC+oChTY30=@vger.kernel.org, AJvYcCWvqABIqDHtxfnl1+Pig6GeZwICTWIvAITwCAI1XM3WkSN+DdzSEcbg9zs0UQcOCcuRI6El2NGo4HgCAjBx@vger.kernel.org
X-Received: by 2002:a05:6122:2225:b0:538:d438:15bd with SMTP id
 71dfb90a1353d-544a0215b05mr7768579e0c.8.1757065201574; Fri, 05 Sep 2025
 02:40:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250817143024.165471-1-biju.das.jz@bp.renesas.com> <20250817143024.165471-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250817143024.165471-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Sep 2025 11:39:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW3_-3qC99htcUT-R0wTmXuLhLE=Tx5yKUeG-KiD+x3zA@mail.gmail.com>
X-Gm-Features: Ac12FXwjNxsXkzEiflViwn8T6QWVO6M_cvlX8tpA1Zz-WWT4TeCb2FyJuC6r-iY
Message-ID: <CAMuHMdW3_-3qC99htcUT-R0wTmXuLhLE=Tx5yKUeG-KiD+x3zA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: renesas: rzg2l: Fix OEN resume
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Sun, 17 Aug 2025 at 16:30, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The write to PFC_OEN register is controlled by the write protect register
> (PWPR). Currently OEN register write in resume() is done without enabling
> the write access in PWPR leading to incorrect operation.
>
> Fixes: cd39805be85b ("pinctrl: renesas: rzg2l: Unify OEN handling across RZ/{G2L,V2H,V2N}")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.18.

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> @@ -3174,7 +3176,15 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
>         }
>
>         writeb(cache->qspi, pctrl->base + QSPI);
> +       spin_lock_irqsave(&pctrl->lock, flags);
> +       if (pctrl->data->hwcfg->oen_pwpr_lock) {
> +               pwpr = readb(pctrl->base + regs->pwpr);
> +               writeb(pwpr | PWPR_REGWE_B, pctrl->base + regs->pwpr);
> +       }
>         writeb(cache->oen, pctrl->base + pctrl->data->hwcfg->regs.oen);
> +       if (pctrl->data->hwcfg->oen_pwpr_lock)
> +               writeb(pwpr & ~PWPR_REGWE_B, pctrl->base + regs->pwpr);
> +       spin_unlock_irqrestore(&pctrl->lock, flags);
>         for (u8 i = 0; i < 2; i++) {
>                 if (regs->sd_ch)
>                         writeb(cache->sd_ch[i], pctrl->base + SD_CH(regs->sd_ch, i));

Would you mind if I moved the spin_*lock* calls inside the if-statements
while applying?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

