Return-Path: <linux-gpio+bounces-30287-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4E6D05298
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 18:47:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D633132172BA
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 16:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E99F2DC34B;
	Thu,  8 Jan 2026 16:51:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402032DCF46
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 16:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891082; cv=none; b=h/9yK86FzyBOaeKta0Q9sb7QtnAd5SQ9j9cdt/4+sDR/8xluJff8ZVGUaVDqw0Mm7Eb58HGDj599FAe6sOf3ZFrFQt1HsnhMRdcrPwO5Rqboh8OglwZtTBzyhiqJwz4udFZLh8EM8GwRBRrSCGv9oScQ3bnbgUzeCCMkk3GF9aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891082; c=relaxed/simple;
	bh=ubwXu+btsiX1PB4I4N5BYmf0b7pajCdwdkJ9TDT2OtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B933pL+pqlwWD5AwE8OtSHHtUh/dxe2hhLE0owbqHRn1iG43NybuTlEL+n7SerxuhQQhRn/Ubtpkod2BgP+wamnInMqVvFBP6VUf6pf1yA8Jb9yF2KKU9Px7Y4m7JKz2APj6FENPJTtruKdLSATw/1Cc1//J/9tkbb8q8TSu3UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-55b09d690dcso1188781e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 08:51:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767891074; x=1768495874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C875+rgiQSif2Oc/xF4OEYxzU+NtNWW3c7tGrI4duZo=;
        b=E3PTidY2EB/08OiHSP+ARSJsPIh1DaHr6xk0VDHu1xgh1hOkTxRFpPM9Mmdbddte3a
         nfyInSLpzWuLqoaKiOt78LGFpLPKNgUL5hday98Li8pPqqfAB9OAbJBTz3+CtIYiqrPU
         YAHn39NOzQmJhCHgLdKQGzL3CDnN7YtLxPZZmHmRj2crvNwLK2Yp6rk2GGwHaJixBUhl
         CLOgJxojxfAf12G95p4KOggpUz53cLw2Cc/+MNIOEZ//M20VAUJfx51w5P92pyPeIo8e
         bMnpnYR2wO8zjx07SkT5d4hUKL184a4wDAjutF5eybxlo//nwnwninERsMJEj8Q1Xk6T
         ONCA==
X-Forwarded-Encrypted: i=1; AJvYcCVV6RwqinByJst9ZjmEhhl4UYdnaUx+yTSFLpsxKjUUH33jWhaFmngjTyHTG4F6nDA9TIueKEwMd3T3@vger.kernel.org
X-Gm-Message-State: AOJu0YysJyrYUaleYe6/ij7bnC9f4mrrpZ/ZdqwKI0bQhENttNmCVMyo
	pNnkRG8YxlmalwabjEi8o7zwBMhsSjWX0sKbI0RUMd42GEg4RZjrkVFpp07B/6cX
X-Gm-Gg: AY/fxX71AI7FmpF7iDTiQm2zw72/3EU41o0RLSqKDC8EATaKKK+dXdo/PimI/GxyB3M
	a0pzWq28CDa0AGlxp6vWwMab7yL8TTtVc64xO6igid69zMnA2iOIVqKJ+jcjnB/8zkojVzWh/Nc
	2aCkPQjPInTdfKtcNTCnFaCa9g97SHZhOSGOb9h1wiXSkMjxqPl5PXjxARJiKkjd/orIFwQXwCp
	6rSxyUbKTnMKrWG8A25iNOK54yb202DmtRzsXCz56s1CEiC4VQBil+xtbybrYv9avhRTg/qaasG
	dsBZzl/e/zJwJO6EZjCNJTJeCdY6dsSNsHN2NENIbDqRa2JG8FsL8XnoTQux194LUDDUwNazdMq
	M22jVMQWp0THUImIXpK2zjmxvUsZ4A8K6D/M3eZJbtGk/dF41qfP+4aMFV3KE0e4zmgIzgn5yZm
	AGD6IarKLzH0PcJw/roc2/LVjzuhwt9ab6r8yNgc4GQKQwqCmx
X-Google-Smtp-Source: AGHT+IFMCw4AowCdezYL2YK8+UX6BhMwSni0hFthWy5CcX86SVesDT0OhydvHcEKZAxFxz0lpDFpiQ==
X-Received: by 2002:a05:6122:4593:b0:54a:9fe8:171e with SMTP id 71dfb90a1353d-56347d8330amr2714385e0c.7.1767891074401;
        Thu, 08 Jan 2026 08:51:14 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a443e32sm6731034e0c.22.2026.01.08.08.51.13
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 08:51:13 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9413e5ee53eso1998400241.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 08:51:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXiTHpeU07sg70QfRWR/O3jz/+fYsDhmhF6pYH+2kkA0jlYgotqAV+RJdUZ7oiEcw4g0F/Kk5zGGY5f@vger.kernel.org
X-Received: by 2002:a05:6102:c0b:b0:5db:fce3:af72 with SMTP id
 ada2fe7eead31-5ecb1eadbd9mr3013232137.11.1767891072901; Thu, 08 Jan 2026
 08:51:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251205150234.2958140-3-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251205150234.2958140-3-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 17:51:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWV4uOMnz_FBMW4brWx+6snQ-WOQck5b_YXAxzHhjJgXA@mail.gmail.com>
X-Gm-Features: AQt7F2pQ9Vlmf7HToBPagR5k-XQIvskfUPMsiSefk36sh5QQiJyR2JQPpu4Zals
Message-ID: <CAMuHMdWV4uOMnz_FBMW4brWx+6snQ-WOQck5b_YXAxzHhjJgXA@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] pinctrl: renesas: rzt2h: allow .get_direction()
 for IRQ function GPIOs
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Dec 2025 at 16:03, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Setting up an IRQ would normally be done in the .activate() and
> .deactivate() ops of the IRQ domain, but for hierarchical IRQ domains
> the .activate() and .deactivate() ops are overridden in the
> gpiochip_hierarchy_setup_domain_ops() function.
>
> As such, activating and deactivating need to be done in the .translate()
> and .free() ops of the IRQ domain.
>
> For RZ/T2H and RZ/N2H, interrupts go through the pin controller, into
> the ICU, which level-translates them and forwards them to the GIC.
>
> To use a GPIO as an interrupt it needs to be put into peripheral
> function mode 0, which will connect it to the IRQ lines of the ICU.
>
> The IRQ chip .child_to_parent_hwirq() callback is called as part of the
> IRQ fwspec parsing logic (as part of irq_create_of_mapping()) which
> happens before the IRQ is requested (as part of gpiochip_lock_as_irq()).
>
> gpiochip_lock_as_irq() calls gpiod_get_direction() if the
> .get_direction() callback is provided to ensure that the GPIO line is
> set up as input.
>
> In our case, IRQ function is separate from GPIO, and both cannot be true
> at the same time.
>
> Return GPIO_LINE_DIRECTION_IN even if pin is in IRQ function to allow
> this setup to work.
>
> Hold the spinlock to ensure atomicity between reading the PMC register
> (which determines whether the pin is in GPIO mode or not) and reading
> the function of the pin when it is not in GPIO mode.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

