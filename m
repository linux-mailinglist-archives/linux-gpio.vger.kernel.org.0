Return-Path: <linux-gpio+bounces-26452-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D376B91608
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 15:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 097B61885EC6
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 13:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A19628D839;
	Mon, 22 Sep 2025 13:21:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B43D28E571
	for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 13:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758547271; cv=none; b=uA4tg9hsWwkDa4XAe5Hdvhi6X06SsLtAay9UMSfwvLS5QCPKtVg5NvD993f7XQk/urVa3i4l9VebqvJu/a53zFR3af/GXo1VmJNiSChn/dCHQG4ic8n7vnPuHoWaG9Vm19qcyfnL4QoCkazFBm9P5Pw5B+ywMFh5gTvlLI5PPVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758547271; c=relaxed/simple;
	bh=twHi5A9x4cQ/6G+wv9NhTj7Vvql2JLIedMZaL1HDcCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jxf5EwxfugsfghkYYuCYvY5zl6IW9pSnQAczjfifbWuhj4vwedLiMcBHBQ6BWw2ArONGwheqll2Gu/w0jk8+I892CJl3oczum9k73j4ulIfEXbdFYU083BhdViOTeXDR4jQYkM8TQVm06+QEe+i2KUoYod+JkfB5w3aZOQ3sDHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-54a9482f832so1517314e0c.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 06:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758547268; x=1759152068;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7oT2yfLN/4pYPbEtz7ZQcc5Ja0yXs/qEChj5LREg+X4=;
        b=GLuBI72Gl+ihvUtcI6IAfCJbl1GXONMPqaYbpicLkzr2mmBIOBMthPB4pNl1+xhs8F
         Skebk/rF6eqYWeGl/9ftBVgM8yway3JQfr4jqYi52tATr88KYl0rRDl50Kjw/Dxv3thg
         w9F+GCwPrAmTaAa9hAZ2UCqYJdvyP/7X8AFFWihWteS5MXGfsac8gTxBwNWd9mDmqBbT
         C5Bf5P9YJk+6TgPoHnAvod09KC9J8rdmifDi2yEN3sNU5ehXXQlrwfdxSEO7LAfrXG04
         bctIa/iHcixipwNh5vy18gnJWc+rnIy1EFzBoLsKH25LL1vY3p9AxgJdDoxH1rwvjUKz
         uwSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJapFSy/VWK3yPunUc1TK5HqqzhhfCwegg9xhjQvtcSBamRkW9rJ0gacCIMT7FKGZvSH6SUTdMbTwY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy260A/73YaYy0zF+7ECrdRopXlSQyeiMnylBJy+Uwy+nfao6mY
	d/HX/z9bzWXfQlbKAGPlfcd37+yF0UsT2kHgF47gvlcyZ1iOQXBg8ol3Wbb+A7mQ
X-Gm-Gg: ASbGncvM6Nr8LaPZEshd1/eN11UYNApLhGHHU37dCc19bQi5bGJmUt4iF/hsN+RTTZ8
	tY8CG2dxyAOkHB5BAl77EYoKW3HlzG/Nsf+c9vSs6lIkmVQHRm+wswCXZFhLqTMJLICOQS72cB1
	PbC6n4Gm6Rn5Id8l7LmdKgMgxk3xOCSKAUR7LOMDK0GPAh94HIhfL7B89v2z4FAiqyiMO0JsL/I
	nKUnCAQyM2Dqw2ymodnVfRmC6bfd05zVBubhltUdHm3VR6STzsjAWMQTVf9liazntwbEk5IoSfv
	oI5W02MSMl5GI2N9hlh8zP78rV7DhsDNIivxDCTO0Ipi6NdIQsMfbCH8qWx/mNzlF8qwKd3UKlG
	iYOU0LJxrNMkryA2zfeu1UkYnd+iD/FffUnFGCzyut2r91NQ/cI7eBqUx4T0QSR7/5mliwHQ=
X-Google-Smtp-Source: AGHT+IGISTTqrSs4yOWuRVmUTQSi/seFwXtlZc9cA1KMPBJmmZR9L23KkLzwKz5EjAjVgjpyKFSHZg==
X-Received: by 2002:a05:6122:1348:b0:535:e35d:49f4 with SMTP id 71dfb90a1353d-54a83894c5cmr4010023e0c.11.1758547267824;
        Mon, 22 Sep 2025 06:21:07 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a7275991asm2698533e0c.9.2025.09.22.06.21.07
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 06:21:07 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-50f8bf5c518so3307438137.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 06:21:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1aPmCgOxSUilQtDqUp0OBRW9kIR5IGv6k0EBM6m6aXOzwsxF7uWymPjFasuHsLh4dPQr945qUvqrh@vger.kernel.org
X-Received: by 2002:a05:6102:d8c:b0:521:ed06:1fc7 with SMTP id
 ada2fe7eead31-588bb9bf4c8mr3821613137.0.1758547267049; Mon, 22 Sep 2025
 06:21:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250921111557.103069-1-biju.das.jz@bp.renesas.com> <20250921111557.103069-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250921111557.103069-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 15:20:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWtpv325awR06pFA+_EHh5GZ90K6OEf5S6Wkg+_89uRBQ@mail.gmail.com>
X-Gm-Features: AS18NWDdF71ys-sJ9xzdE3pXCvKO4zAavWIwsnrvZsEZ2kjh3SpCcOFmdVkNVPA
Message-ID: <CAMuHMdWtpv325awR06pFA+_EHh5GZ90K6OEf5S6Wkg+_89uRBQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pinctrl: renesas: rzg2l: Drop the unnecessary pin configurations
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Sun, 21 Sept 2025 at 13:16, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> There is no need to reconfigure the pin if the pin's configuration values
> are same as the reset values. E.g.: PS0 pin configuration for NMI function
> is PMC = 1 and PFC = 0 and is same as that of reset values. Currently the
> code is first setting it to GPIO HI-Z state and then again reconfiguring
> to NMI function leading to spurious IRQ. Drop the unnecessary pin
> configurations from the driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * No change.
> v2->v3:
>  * Dropped extra space before the == operator.
>  * Moved spinlock acquire before reading pfc value.
>  * Make sure it is configured for function in PMC register for
>    skipping GPIO switch.

Thanks for the update!


> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -541,7 +541,11 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
>                                        u8 pin, u8 off, u8 func)
>  {
>         unsigned long flags;
> -       u32 reg;
> +       u32 reg, pfc;
> +
> +       pfc = readl(pctrl->base + PFC(off));
> +       if (((pfc >> (pin * 4)) & PFC_MASK)  == func)
> +               return;
>
>         spin_lock_irqsave(&pctrl->lock, flags);
>

Looks like you accidentally switched back to the code from v2?
Shall I take v3 instead?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

