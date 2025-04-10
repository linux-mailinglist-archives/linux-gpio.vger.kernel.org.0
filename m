Return-Path: <linux-gpio+bounces-18657-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 426C9A83FF9
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 12:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A34297B9835
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 10:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F2C202F88;
	Thu, 10 Apr 2025 10:01:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B692144B7;
	Thu, 10 Apr 2025 10:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279271; cv=none; b=UHDMsostb57ku5XrPjPzhRnpK56etmKR7cL8gXPeHUFlpZWSeI5+bJc5S8iMt7ayQgTYb8SFYqpOPtuvWn3ycwE9xXiYacOceEcxRATnW+F9WXIOWSe/UDQr8pjMSmcmlwam6MWpskpn3Nzh8zDPbpUYza+yvTIXLYlAoKyKUv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279271; c=relaxed/simple;
	bh=3YSzOSGFRoQFmlz4nC8WtFJRhSSU/q2S/7XqD3/o5s4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RAQ1NDO54Adorvjp30E8yINa4mtbz/B7ydnDn/GpU+5w0OrmnWrHznp6ip/mrL1v/E7VEPzxi7crABeogvnggvCfgEdw9gcv+zjkBqnvWULpiCXYVRRlT0M760KP5XITGxfBWX6ibMO7CcH9Gpm21dlmNQQCvR1HUoSphokF7V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e6194e9d2cso1215288a12.2;
        Thu, 10 Apr 2025 03:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744279265; x=1744884065;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKiCw7u8Hk3XYzuXQXEMVJps7P3FaweDg+0KQf7Z8zk=;
        b=mIDMervAWYWoAeJTMWo2CiZKU5yR+XRMPEU9VQH2LOuL1F7rYDO9Qn5xHp5yKaJsm6
         ip26dQFlS6N2+CaAYVZp40dWZIQj4b0bJw9pr97+irVavd2HvoiM150Ok9afxyxddN6z
         4iEpCyNZ16DRq5HyoO7UcrJ3gkXU0X28Mw81mBSb1nHqf7GfpYNJqAulrYX6Tm79hX0m
         xde+MskWMEq8B090e2xRgc61+2WvGWfbon7veO4JX5AT6rON8WWDqmCd0EkILeo7VUoL
         X0czg/HHI3HHHExLJc+gKcDxVoHXNPoR1nI3uxvZOBQKY0AlRdShUSWOne7imAmsNoBg
         Vu1A==
X-Forwarded-Encrypted: i=1; AJvYcCU6+KO9BiulHbdiMfaUMI2WSZStIruJqfFvinD/DAFM86tZKuqDKp0IahYEkIQB4FwZZJ6pyzOnIj+w@vger.kernel.org, AJvYcCUjYtZrTqubbj72P3mGeL2thPr89SnWuDy/K6h0S9K/NygKrkd7rLZlDCIY5odivBbuH2ZDSoH0TOlChQ==@vger.kernel.org, AJvYcCW+EZSJhaJo21WY7HkGgSk7MJPvWPs3iAQnOk4w9FjK2GIc2Wb+GFfXQAgV20rAxKaUiFRBAn6MjO/ktrlm@vger.kernel.org, AJvYcCWy2Gn4Gm2BX34uI/WxIGKLanMEj8MHaunOtz+aZ/tbEwM5ZYCo+jC+TV0yrZSd1tOp7jTdPgmMlSZO@vger.kernel.org, AJvYcCX2kSB4i5gk+azqcB006HHfUr6GVA+OP9ALvsMuwdq2oI6QAJuHy4CJP7ZiHSZnNTMwpOKxTdT2GkBgJ1F2l/sM0Nk=@vger.kernel.org, AJvYcCXl66JIMm8Ssz/1bsrTBnoDZ5umr+leVsfd1RqvNVnGu5O1mGnCv7K7lmF1eN7VGBgpwtkL0uB6+lh9zhBh@vger.kernel.org
X-Gm-Message-State: AOJu0YyjEosmCifWAcIWnu2DEP4re3i7yeMjnCcEOwv+vBt75SlQxjbJ
	zgZa6FLixMgIzdb7JHfkeu3OoHEtjLWlcIkCGNcJ9WkW/4/+RHFmqFtto5x9VK4=
X-Gm-Gg: ASbGnctwvVSwABcV/dc/EODjCe5UEnTor0g9lUmc1rNRmw+Ioem9M++br8X9UBvt8Wl
	H3T5QO5/+7xndIbR106rHmhTYHd0nPflrhOC2dvEN3p03A+D/gXIYV3/HsOgfXYFojPq0aew4r2
	DmCDUa3AwZEwQYp42LoB76xjOO/HU3enLzIOkU+fbcqdgsFyk/mne90ZANrymAc2bCVqEc6+jb7
	NCfzngfxfXWhOfIbAVg+rVQ+bc6ofK44x8X+rYFAGgpbPSzhRzLiH5oPFT3RSDPNkQ0FNIFwQH3
	SyFhmLlCjhAX1BZRXejVvwgef3l66wwnqOKqhnS8V3F1G/B/QLu8STqvicxpmH7ebvv0m6zvGon
	NOEY=
X-Google-Smtp-Source: AGHT+IEuZ5RvKuFQKafeOnV/iU1rR8BECSnP3FouxBQzmkQdAGCMmlh9H0f5bOLZLa2l8x8sHXP/qA==
X-Received: by 2002:a05:6402:5c9:b0:5eb:ca9b:523a with SMTP id 4fb4d7f45d1cf-5f3292946a2mr1687307a12.20.1744279265044;
        Thu, 10 Apr 2025 03:01:05 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f2fbc2e1ebsm2070348a12.41.2025.04.10.03.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 03:01:01 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5eb5ecf3217so1196178a12.3;
        Thu, 10 Apr 2025 03:01:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8ovPtS18n8FyBvitUfFBNRwTVOCxAlqQjQY9XFngmgaS+87QIc7zRvhVDshR/VmdsYjMVjeT6lUl02DLcxv5/Udg=@vger.kernel.org, AJvYcCUk0VsleRaVwr00iFIWlgGHBdmLjYLvDe+BjtEt161cqSPhCEhqdpBCBS5a9aSLGiCAkq85jD+gHINN@vger.kernel.org, AJvYcCUvR9aCM06HSA2dNdyZY+PjyDoEyTEJc23tb/VU63xUBQwZmj+9QXzxi+BmQNvCrO0GvYP9RneJHLhFi/hO@vger.kernel.org, AJvYcCV2sKaWaM86dKe4mIOgqMtEuW9v0tG/wc/FGqe05LheqhYS+Rq5eCTCFPXNeP7i4vxLE8hx8a5UUcamcA==@vger.kernel.org, AJvYcCVE8GMifMBhT+82cY2VSJDg6yundyynbz4B00UxvjxO6Z7F3o6SY/AlR8A02j2kj+a5ZW4q77s6+Eh7@vger.kernel.org, AJvYcCXx3ekcxXtIe6ULWEY7xUXoim9vh6wouyd/cp+b6j9kMJtQU5F4B7AI3dQWO+IL9CPin83yqsZwZH0XArwO@vger.kernel.org
X-Received: by 2002:a05:6402:3490:b0:5e6:17db:898d with SMTP id
 4fb4d7f45d1cf-5f329244ab0mr1708385a12.2.1744279261452; Thu, 10 Apr 2025
 03:01:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250407191628.323613-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407191628.323613-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 12:00:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUwnQyR+RFe6k6ywOe+Raib--pkznhZ3ECw_qJ9VFOcAQ@mail.gmail.com>
X-Gm-Features: ATxdqUGeKhSrvS6PJEJf__skUFDUoBreynUF4B-R_BDEFpM3UJ2E9HaDJJ3viRA
Message-ID: <CAMuHMdUwnQyR+RFe6k6ywOe+Raib--pkznhZ3ECw_qJ9VFOcAQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] clk: renesas: rzv2h: Add support for RZ/V2N SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 21:16, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The clock structure for RZ/V2N is almost identical to RZ/V2H(P) SoC
> with less IP blocks compared to RZ/V2H(P). For eg: CRU2/3 are present
> only on the RZ/V2H(P) SoC.
>
> Add minimal clock and reset entries required to boot the Renesas
> RZ/V2N EVK and binds it with the RZ/V2H CPG family driver.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

