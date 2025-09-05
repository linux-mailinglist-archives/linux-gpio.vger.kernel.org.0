Return-Path: <linux-gpio+bounces-25665-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03911B453F1
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 12:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE72E5A25CD
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 10:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB47427780E;
	Fri,  5 Sep 2025 10:00:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6C042A82;
	Fri,  5 Sep 2025 10:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757066443; cv=none; b=SJToDhJUsthFBF66SOPIAYc04yFdz3/Txa6wra3sBTQf2ImJoZrTcCoons3JaGKgE9nsisoQABmcpwgfF/9sUBgGtRq1PQxeGT71Bvh/mGn88RBjHUULiLQI/YWp4q7CnJjnGbCLw7nzC2i/5KkDVL7RtuHhB8C85Ttq9ixpjow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757066443; c=relaxed/simple;
	bh=fVhvQVGTOq1A/MBmXlxoc/2fLddkjNqzHFz1c1M4YfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQLoE5ltOu5SGjSkwUjC1tL//O8t6WzBa77zVN/w6QivvNpGXnkPMrGE/CFcIWRscmtxKT/n0GyHF9Q9M5zjJBQVHbG/tEn4RfqUIDQX+AsYcu81vBJe9t6jetpnWv4IFLv/3m7CsYtN6cTmiYTxE/jOqbOjOeeo2MBtuHZS3CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-544c598b9a4so656632e0c.1;
        Fri, 05 Sep 2025 03:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757066440; x=1757671240;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0UuxKQaYqkVCEKDR66TBlglNbbViMirsUqJ4RUaDj8U=;
        b=xBIWtg/fclzcb5mZQ+WR6z61z2PsNyeKc1DOvrz7jFkfL8EH1bhrL9eGAsSk2D2m5e
         qsTHswJJkPKIbC2AhN9n/Tdlf+t4n1T0s5nfnxg4+VVCi4Bxd+9ZNyhWeZ+GEFrVPxRh
         dyHCOiPzJDM+CsQ1sHyc0sZSWTMUtuBGKJZDTZ5IGB+oaeX1mAGWUzOB4zDbaRLLJ0OY
         MFEexHjLI/5zVF4Wk9WGA3YrbKFDdvvOWKkLACW+to9JL6+4fqQPoEM/eMHDouvmcsIE
         gDb78q86UuVlsK2Swhtnoa9B/4yihkOZbd+n7dlgaAlj1pvlsnS4H/KdXnbgGIHZkCk0
         gIKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGP6kJGQrhxeipyOkHIbelBUFD5AP+4KyJTvT9N+5NJygyhWaNfLTwn5Uf8XqyBug/G0YtdCNRcygy@vger.kernel.org, AJvYcCVqYKMGzlknwaL1khRDm5zJ+DflV4vnR4f6ca3j+zeZ4BQRMEaz7MwicVCmYqGGu0WuygB1wf/VXlUgMo3Y7bkESQ8=@vger.kernel.org, AJvYcCX5YH8Rh45orDWEXqmDHUKv6w8ICtrf2k+T+wdDaq19z8E7mADKT636uuFZRX3sfY5mmlLIZ2N/5ltuFpZT@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3RZar0wSkmOwyle/ZYLEmM3F5PhpP5vJd8q/LW006LB18W9a3
	VECkZM8LArkRpGCRWtaJpfD/PFAveE/tHh40FnxPuYGBlL1JBsRy6KDVefPEMfqP
X-Gm-Gg: ASbGncvyNQRXM00AF4uIK3F2SsI43gy8bYlVkZbZ21MZqLCsGni1mR3MpJMwlSKQKR3
	6k1v1HRS3ooNHylqsGU5XO+En123N/FGgMnaXfduSnFluvTXuJohNOj9wXzai+RAmmeY8MkueDp
	yuIRTxYvlRqR+X3Q0VqO2SUhEdNoZhKlcJellWpHOTKmwQiasik4emvy5fLvifS2DSVQk/LM0W8
	/UmrZUjTuxt3BOaEN0nlpyabozd1DWz99CEl0jGUPSvG7iV9iFKl8EU+ZEm3AKijquMhiG4mNS1
	Az0yqRupKnOBiebrDKE21xtsH4lWyQc0mb6fYku8nmb03f4JxufxGuIleb0k0rg9GAi3EFMf1GH
	9zm6+sy3AEWkQku++SLBuVIzrRDIMZxtLtRZEQG5h+UGn2B6r8CTnHF4EAP3M72L/0nvi7ik=
X-Google-Smtp-Source: AGHT+IGZ+z94Csz+ZP4WtdLZ2Na95oYvSVK4TfhJie7x2bvY4uHcDoWI01iJFYjggGN8CrjGR0wDbg==
X-Received: by 2002:a05:6122:3c95:b0:53c:6d68:1cd6 with SMTP id 71dfb90a1353d-544a02b3eccmr8128166e0c.16.1757066439726;
        Fri, 05 Sep 2025 03:00:39 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-544a123e024sm7832209e0c.24.2025.09.05.03.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 03:00:39 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-89ea3532bfbso557430241.2;
        Fri, 05 Sep 2025 03:00:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVcfURUtVgMyLM4SfgemXHelFEjB+WIY+Dtj3du4Lez8Pp7R7Ew4RuKoMDvf5e/khfNmr3kIjXwmQ74@vger.kernel.org, AJvYcCW9W2E5xCMdCwthYGMtrma5e5T5dHdObjyVSnOvu+Yq9G7OSUXan8JBxvNWH+wN9Hsn0KxjGEV7EPYsiDxzec2lREE=@vger.kernel.org, AJvYcCWmXpwDTZzUrK1yFCK/++E4GYXx0zs0QyjZvsxSYKGANnUCAj0mCmVCcwgemFC9fNfnf/Z57109rNw5bKKD@vger.kernel.org
X-Received: by 2002:a05:6102:6ca:b0:523:863d:ecd1 with SMTP id
 ada2fe7eead31-52b19858b87mr7074466137.9.1757066439289; Fri, 05 Sep 2025
 03:00:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250817143024.165471-1-biju.das.jz@bp.renesas.com> <20250817143024.165471-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250817143024.165471-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Sep 2025 12:00:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVxQ_Mm0qNwDfBM=L7juHzkXsWAW=r-Ff1T5BtyMNP7mA@mail.gmail.com>
X-Gm-Features: Ac12FXxkAwwOeSZJNU4cPCmcn4B09o_jWUQpkRocOi7WZOFfnlX4yVY0x4yRRHA
Message-ID: <CAMuHMdVxQ_Mm0qNwDfBM=L7juHzkXsWAW=r-Ff1T5BtyMNP7mA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: renesas: rzg2l: Drop the unnecessary pin configurations
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Sun, 17 Aug 2025 at 16:30, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> There is no need to reconfigure the pin if the pin's configuration values
> are same as the reset values. E.g.: PS0 pin configuration for NMI function
> is PMC = 1 and PFC = 0 and is same as that of reset values. Currently the
> code is first setting it to GPIO HI-Z state and then again reconfiguring
> to NMI function leading to spurious IRQ. Drop the unnecessary pin
> configurations from the driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -539,7 +539,11 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
>                                        u8 pin, u8 off, u8 func)
>  {
>         unsigned long flags;
> -       u32 reg;
> +       u32 reg, pfc;
> +
> +       pfc = readl(pctrl->base + PFC(off));

As the read value may be used later, shouldn't it be read while holding
the spinlock below?

> +       if (((pfc >> (pin * 4)) & PFC_MASK)  == func)

Please drop the second space before the == operator.

> +               return;

What if the pin is currently configured for GPIO in the PMC register?
According to the documentation, that is even the initial state after reset.

>
>         spin_lock_irqsave(&pctrl->lock, flags);
>
> @@ -555,9 +559,8 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
>         writeb(reg & ~BIT(pin), pctrl->base + PMC(off));
>
>         /* Select Pin function mode with PFC register */
> -       reg = readl(pctrl->base + PFC(off));
> -       reg &= ~(PFC_MASK << (pin * 4));
> -       writel(reg | (func << (pin * 4)), pctrl->base + PFC(off));
> +       pfc &= ~(PFC_MASK << (pin * 4));
> +       writel(pfc | (func << (pin * 4)), pctrl->base + PFC(off));
>
>         /* Switch to Peripheral pin function with PMC register */
>         reg = readb(pctrl->base + PMC(off));
> @@ -3103,11 +3106,18 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
>                 pm = readw(pctrl->base + PM(off));
>                 for_each_set_bit(pin, &pinmap, max_pin) {
>                         struct rzg2l_pinctrl_reg_cache *cache = pctrl->cache;
> +                       u32 pfc_val, pfc_mask;
>
>                         /* Nothing to do if PFC was not configured before. */
>                         if (!(cache->pmc[port] & BIT(pin)))
>                                 continue;
>
> +                       pfc_val = readl(pctrl->base + PFC(off));
> +                       pfc_mask = PFC_MASK << (pin * 4);
> +                       /* Nothing to do if reset value of the pin is same as cached value */
> +                       if ((cache->pfc[port] & pfc_mask) == (pfc_val & pfc_mask))
> +                               continue;

What if the pin is currently configured for GPIO in the PMC register?

> +
>                         /* Set pin to 'Non-use (Hi-Z input protection)' */
>                         pm &= ~(PM_MASK << (pin * 2));
>                         writew(pm, pctrl->base + PM(off));
> @@ -3117,8 +3127,8 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
>                         writeb(pmc, pctrl->base + PMC(off));
>
>                         /* Select Pin function mode. */
> -                       pfc &= ~(PFC_MASK << (pin * 4));
> -                       pfc |= (cache->pfc[port] & (PFC_MASK << (pin * 4)));
> +                       pfc &= ~pfc_mask;
> +                       pfc |= (cache->pfc[port] & pfc_mask);
>                         writel(pfc, pctrl->base + PFC(off));
>
>                         /* Switch to Peripheral pin function. */

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

