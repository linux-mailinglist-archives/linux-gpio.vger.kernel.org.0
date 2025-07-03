Return-Path: <linux-gpio+bounces-22700-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D96AF6F99
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 12:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22E3F1C43C91
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 10:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB882E266F;
	Thu,  3 Jul 2025 10:02:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988B72E175F;
	Thu,  3 Jul 2025 10:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751536940; cv=none; b=TBu67o/O/ng6EvyJZSFzJJjr12YEebXokt3oHIDlDuwOlC6I4eUSy9ZRXLRwTCmToi3myiXCJZCHiV8hDbD2b87kIXp8YZ//N5lc2QldYN61akNKi2zZN2nQBDD0gJKXoZvA5ExN8De6FyDhuIXC40LjfvcDox71eTUE4g8lrEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751536940; c=relaxed/simple;
	bh=gDX780VY4dR/qG1ozIAynPHoGgqIhKcREQIqdk8HTsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=grmJTsGcGItgzEJ0lGdIp0JKnbth4ySPUIBLNkz8nN7bvoMjRpVC5jnyqPQ1xw5pdBKNUd7RNU3muXoqVcZnk5BSME8aQN6qFbfE6uWayVg0tLT2qHF1ax9yveRj5GwsVbJAwFdrJGWidqDoW0sYwARe5UCDVjYx86p+53xiz9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d3900f90f6so519074585a.1;
        Thu, 03 Jul 2025 03:02:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751536937; x=1752141737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvo2bpcwGrGHE2F3u33rAVWzmYgZxRKIZST4sTWJ+JM=;
        b=k7a6P2YBIHnRk8xtQocNCnUDmnFfAzllz5dW+AlWKUrrnZ12nvXKnG+064KUl4L8Bv
         gar4rhclkXksHV8sh8hhnn5yObYhSxAdvgaRx2XFISFbKjWCP1gr/gFUUxT4NuRj+uV+
         UW8DthGNTh3Ad+Nx6c3oMbdP76T7gevNwmeyedx/d6G/2CgYiAjf+K7hM29yfYWF0YDJ
         MHcw85A+upDx8YHcCI6HyACuXoSLnO+CrNhdXDqUWW367ekz1nlJ3FLNEVwc0HQvRIFi
         SSkPIp1yyC+PzJaE+btgK5H29VVyKg7d14j6iOH2iT/GCg+xGU4XPhp2fDrMVxGEQ8s+
         cSIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb8XyzhhvhdmGU6rhamRvTPpReZAp07X248iRQZSfhjThrLzNtnzrnUOGoKo2Chb9kfyj9xtUrCPXj2FY80ZrkH8U=@vger.kernel.org, AJvYcCWdgNhQE2pBNaHMGSFyQ5rYu0qZtSPRKLu3biOcMlY46WYne5b1o6JFbc7FKXLp7pjyMpKvysJrBzr2IXKz@vger.kernel.org, AJvYcCWoTWDQBUYUCE7LVyOeV+KOJCcNRnPPyQMlOXiAGQ5ZzNAHenK5R3fvS5Ofzx4MGZb2MdK/lygaNvw5@vger.kernel.org, AJvYcCX8Q2DLfGePVLH8rKlRL8c1UR7+Wtl68Vo3qBNuszLpT1uo4OzOQmYOPNwHzOue6Eqw9uTrLLjpsSk9gA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyic/kYFYqxxLOIIS7vPt3eVIDhKV/zJI525adAEI2OzCvuIQ/7
	YIpek/eMDRvBV+5MAUJzt3sGNUD8jyIt8+hmAXEsr3jTvQMOva912+mxf4yXaeA0
X-Gm-Gg: ASbGncv3ub9aTAAhtn6tgTjnQzMR4P0k9JyGB9TnmGiraz7jsnFWnhPBYsziUQiQuYI
	5T2/aijwukrOFFpG5mfbIWrCPw1Y9JAWj2jwVztvO70ochshBKRBDI3cNt1w+XDlQZ9YuUKfMac
	DKG77SyPBqiLibcsiWuzXmeTE8rVrTJ3G1KlTpDcGemxyMwTyn33t+y3G+Zg6m2j5gxFR0BGH4K
	MQdtumT2SsuMrxKs/48F5MD3eKk/vHeNOp0B81JeW4lOyCcoRgNeWonHh1QSnOZfMNkmRFT6EsB
	RdP8jcTaSHNqqIRbo5q/fceTuUkA7yFAaHdSOqvX6SR3mKGknZdiiDiJ/5ErmB7G5yG/Dxnhk+2
	gIBMNUfR1QwymlkGcHJlkXTWuXD7A
X-Google-Smtp-Source: AGHT+IH4KfkaGI+crNbYLz5U9XyfcLTcQbqsilihqV8cektXO9ZV8A8TWKAL3i0G/pS/NfkxJU13UA==
X-Received: by 2002:a05:620a:6602:b0:7d4:4b7d:fc66 with SMTP id af79cd13be357-7d5d13f3c8fmr460247985a.18.1751536934432;
        Thu, 03 Jul 2025 03:02:14 -0700 (PDT)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44320572dsm1079786085a.69.2025.07.03.03.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 03:02:14 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d3cc0017fdso588072385a.3;
        Thu, 03 Jul 2025 03:02:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVwJEl1xcb0WsLPDLYYIekDytjDwALjPc5SzfwxVU5LcbEpGTnKHJ1gHS+s4GwixJg2yZC57u8ZVyPfWw==@vger.kernel.org, AJvYcCW9VOwV7Qn/9Lhm0JHrHjt2LCutbvqY6eKswyG42zb03MGMeZ15rJzMaeN5ogxccJ1XmjtvmpPDKqt3@vger.kernel.org, AJvYcCX53FrnYRVJODX6NBgAGkgXOzw+4aJgIHemepheYQ7kPpt5MdInNDj0Snew9Y7PGxolpCMOvHz9cFesqsNKlWbjYq4=@vger.kernel.org, AJvYcCXZU28PUJe7USTXWAYXAUG+76qHpX2iN4ig8StkAXuuxVQFcYkH6jV+l2juzcnPRBYvfCuFjhEyPfCLBtgc@vger.kernel.org
X-Received: by 2002:a05:620a:2792:b0:7d4:4e42:7b43 with SMTP id
 af79cd13be357-7d5d14612f0mr347575085a.30.1751536933143; Thu, 03 Jul 2025
 03:02:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625130712.140778-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250625130712.140778-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250625130712.140778-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Jul 2025 12:02:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW1+4EhYNWOHu1skaAg7jwLc373ZkBmPOhU=R5jhLJf_w@mail.gmail.com>
X-Gm-Features: Ac12FXxLzVyjzWFl5fPBiLIrQzerhqd0vyh3KZSzE3KEWfQf4b8isxzF0-1Pg6s
Message-ID: <CAMuHMdW1+4EhYNWOHu1skaAg7jwLc373ZkBmPOhU=R5jhLJf_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: renesas: Add support for RZ/T2H
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Wed, 25 Jun 2025 at 15:07, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
>
> Add the pinctrl and gpio driver for RZ/T2H
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> Co-developed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - All the regions are now accessed by reg names
> - Added support to validate the pins

Thanks for the update!

> --- a/drivers/pinctrl/renesas/Kconfig
> +++ b/drivers/pinctrl/renesas/Kconfig
> @@ -44,6 +44,7 @@ config PINCTRL_RENESAS
>         select PINCTRL_RZG2L if ARCH_R9A09G047
>         select PINCTRL_RZG2L if ARCH_R9A09G056
>         select PINCTRL_RZG2L if ARCH_R9A09G057
> +       select PINCTRL_RZT2H if ARCH_R9A09G077
>         select PINCTRL_PFC_SH7203 if CPU_SUBTYPE_SH7203
>         select PINCTRL_PFC_SH7264 if CPU_SUBTYPE_SH7264
>         select PINCTRL_PFC_SH7269 if CPU_SUBTYPE_SH7269
> @@ -249,6 +250,18 @@ config PINCTRL_RZN1
>         help
>           This selects pinctrl driver for Renesas RZ/N1 devices.
>
> +config PINCTRL_RZT2H
> +       bool "pin control support for RZ/T2H"
> +       depends on OF
> +       depends on ARCH_R9A09G077 || COMPILE_TEST

This line is not needed, as PINCTRL_RZT2H is selected above (On RZ/A1,
RZ/A2, and RZ/N1, the pin control driver is optional).  Please move the
"|| COMPILE_TEST" to the prompt, like is done for most other drivers.

> +       select GPIOLIB
> +       select GENERIC_PINCTRL_GROUPS
> +       select GENERIC_PINMUX_FUNCTIONS
> +       select GENERIC_PINCONF
> +       help
> +         This selects GPIO and pinctrl driver for Renesas RZ/T2H
> +         platforms.
> +
>  config PINCTRL_RZV2M
>         bool "pin control support for RZ/V2M"
>         depends on OF

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

