Return-Path: <linux-gpio+bounces-24029-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C103DB1C66E
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 14:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 708133A85D4
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 12:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434EE28C033;
	Wed,  6 Aug 2025 12:55:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6626928C022;
	Wed,  6 Aug 2025 12:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754484936; cv=none; b=ivNrGyMzeanzPlxKFoUu3VpqBLWDOWFxmTWNRGDeL5z+KhaOmErwC6DpmXoC5EbDnJ24AKYzKSCy3ffwiBpetoeTjCWGUnnFH3K+DB3Dc0z+ibQO3QNYu/YM/yDSeTKRqSn0HPj7VdQ+wHysD/4EWrtmMXywXTRYvuaD0Nqahug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754484936; c=relaxed/simple;
	bh=+vC7dshLif9EeOy+DboCVkMAkqDRGD11vQKPIlIhiDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jN44xyIgGeDI5xiSiNrTLx2k3RLRzLXHrE1EkH7/OPIdnBL8qT184Oc3l9NAmJSotth0VsU53c1GmoAQJK10cmyYcpMMzaZAOpJpAnKNBNXixHKX1ZolbBlO739NU8+/ALIg8RSFKFRAHCsuKHLOhsQElQvItv4OXiQg/GItNY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-88bc71ff9b0so2785632241.1;
        Wed, 06 Aug 2025 05:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754484932; x=1755089732;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJKti4l1NFXSCH9fz51mgs3fUN7duxKJHLuHbi3c+uM=;
        b=PUEaFn1WjdYxjf3F6pMCj9WlOWQzLLuUDhRGZrhpt/dsh580q8betlq0jEnoEMcOUL
         YhJctxBGrFKwGoy8Uq9pajF8J9/6g4ZyXyGodgs9Na5HlpPw+laPppBXXrt33dJwxw72
         fTdPAI6Hpg2Am9tGNTEWJDxXUuasTv1746ytXvsJaEQvOw9J+uHK6pJzXt5cMQvAf6Yn
         GdujfVvfR8ES2TCeWP4ztk0SfBqmyRDBv4tvTmRHvskVz1/4/RSiyoH85g/6LKNxPKaR
         l5Za5+cqKJ3cSUG+wdqbw68lGvffeQf0GzhxKKEkX2KUvzsVHQG2ff9xGTKP0HzOEDIw
         A5Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVhJdU0nqMKjfMMp0h1ou32k8639/yitTpo5mq6t3yWaODUFieYqmKev48dDADtHl1tNWfTgLXjZkW+ACX8@vger.kernel.org, AJvYcCWzJqGUr7/xGw9TAhJSu4EyBj/BIK0EzHHb4P8FQYINUNbti1VnvkfwluvV+wN03VdE0P0nNFEScWl9@vger.kernel.org, AJvYcCX1ifDujjznejxfyGUIC6KIxc64jkqZAOt3ZsmSeQibDZW015NnN3ZfD+N907PkoxHapMvohqxDbBJDAnOgLXVx40U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM9M1Yx8iL3OaXUIOJW/xsYKtpYWi6SYHW8BinlJoujn6ojjNV
	qSndqCDFPRkxe1kiU748Irr0egegYmVHn57Hd9NPj2x1mooDJmNUMUQK4h2/nVEh
X-Gm-Gg: ASbGncsVFzQwz2MxQITGOuBh9wtmYAb54qnNrAiHZ9N4wReYALDGrbixbw53wRqpeJ+
	Aypn/R7YQeh62wXIjAnQO1MWR3E3MZTOdQnZX0a/31gtcCj85ZDavp6+ocsvLCiIxgbpqogcPOk
	QgPD5XpYqQYVZpt0KDY99SDkgZLkpvTOo/EAP+GYNoZiWKl7Jhy3QgKiE44SwIQ1EsGVdSxfQkZ
	rZGELr3yk9xjCnHLYlqMbmb5Fq06sJ5752QX9MWxE8H2jL+bQJ9QnBuLl/+JJKZiKdHL1LMXzun
	j1xU9Do/x8e9eimfDMfhWwi7GfOhcCsR35Rw3HJDWjEB18on/fQdqHZsPqApLpqJpGm34lQgXvg
	EzPJwS/H48L6AfAc7sxqd2dswxAbRsvoFI/t19G21ACI/wU4njCjvhv9DimL6
X-Google-Smtp-Source: AGHT+IGVNPi6OailqTg/PkmRLQxaGmE6uZ0rQlhdnK1oXW57COEuCqmHsgHGdLPn0JKfOkjmGJQFcA==
X-Received: by 2002:a05:6102:3053:b0:4fc:1631:cdd1 with SMTP id ada2fe7eead31-5037404654dmr1111563137.15.1754484931812;
        Wed, 06 Aug 2025 05:55:31 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fc0d1c4befsm3446668137.4.2025.08.06.05.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 05:55:31 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-88dbde4a2abso2477307241.3;
        Wed, 06 Aug 2025 05:55:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGFUeb20/z3RDIOAsAns/WE7iPbFPWYBqJOW06ALa2gJnuxiLp2SaH290+wOKiJ1O8gKMLPjhGZ3akpTjldQr43Sk=@vger.kernel.org, AJvYcCUNp/3Vv7ilhDaNevhwm+XyJPSBJEwQCo4zFjtTV4HTqTDadBQhk+40PKaac8rSox0LUhBjIOfrf6k09w0C@vger.kernel.org, AJvYcCVXW+gnwknkYn489IVBLUEP0MWBOqEDnZTsWzYouDsAXo8geWZLP34KwPPZqUCYGuAaY/XpTKh7sV1u@vger.kernel.org
X-Received: by 2002:a05:6102:5111:b0:4e5:ac0f:582c with SMTP id
 ada2fe7eead31-50374047a83mr1163770137.13.1754484930850; Wed, 06 Aug 2025
 05:55:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709160819.306875-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250709160819.306875-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250709160819.306875-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 14:54:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUKvC1HWGZc=52gCRJSKHcyM2NgAo6_YioGy31hBmTSbA@mail.gmail.com>
X-Gm-Features: Ac12FXzVgJ48Jfj2OtEbjlEsoCHIPDXUYVLe76EusAsODAxrwcnkC_Xjt_vquVE
Message-ID: <CAMuHMdUKvC1HWGZc=52gCRJSKHcyM2NgAo6_YioGy31hBmTSbA@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] pinctrl: renesas: rzg2l: Unify OEN access by
 making pin-to-bit mapping configurable
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Wed, 9 Jul 2025 at 18:08, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Refactor the RZG2L pinctrl driver to support reuse of the common
> rzg2l_read_oen() and rzg2l_write_oen() helpers across SoCs with
> different output-enable (OEN) bit mappings.
>
> Introduce a new `pin_to_oen_bit` callback in `struct rzg2l_pinctrl_data`
> to allow SoCs to provide custom logic for mapping a pin to its OEN bit.
> Update the generic OEN read/write paths to use this callback when present.
>
> With this change, SoCs like RZ/G3S can reuse the common OEN handling
> code by simply supplying their own `pin_to_oen_bit` implementation.
> The previously duplicated `rzg3s_oen_read()` and `rzg3s_oen_write()`
> functions are now removed.
>
> This improves maintainability and prepares the driver for supporting
> future SoCs with minimal duplication.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -296,6 +296,7 @@ struct rzg2l_pinctrl_data {
>  #endif
>         void (*pwpr_pfc_lock_unlock)(struct rzg2l_pinctrl *pctrl, bool lock);
>         void (*pmc_writeb)(struct rzg2l_pinctrl *pctrl, u8 val, u16 offset);
> +       int (*pin_to_oen_bit)(struct rzg2l_pinctrl *pctrl, unsigned int _pin);
>         u32 (*oen_read)(struct rzg2l_pinctrl *pctrl, unsigned int _pin);
>         int (*oen_write)(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oen);
>         int (*hw_to_bias_param)(unsigned int val);
> @@ -1070,7 +1071,9 @@ static u32 rzg2l_read_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
>  {
>         int bit;
>
> -       bit = rzg2l_pin_to_oen_bit(pctrl, _pin);
> +       if (!pctrl->data->pin_to_oen_bit)
> +               return 0;

Please add a blank line.

> +       bit = pctrl->data->pin_to_oen_bit(pctrl, _pin);
>         if (bit < 0)
>                 return 0;
>
> @@ -1084,9 +1087,11 @@ static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oe
>         int bit;
>         u8 val;
>
> -       bit = rzg2l_pin_to_oen_bit(pctrl, _pin);
> +       if (!pctrl->data->pin_to_oen_bit)
> +               return -EINVAL;

Likewise.


> +       bit = pctrl->data->pin_to_oen_bit(pctrl, _pin);
>         if (bit < 0)
> -               return bit;
> +               return -EINVAL;
>
>         spin_lock_irqsave(&pctrl->lock, flags);
>         val = readb(pctrl->base + oen_offset);

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

