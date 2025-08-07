Return-Path: <linux-gpio+bounces-24057-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B234B1D2D2
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Aug 2025 09:00:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6B6458382B
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Aug 2025 07:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F5722D7A5;
	Thu,  7 Aug 2025 07:00:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E980022B8A6;
	Thu,  7 Aug 2025 07:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754550014; cv=none; b=XYUQnMoJDnBbBQBmZhefXEwuPmLdAvthtRaxmJBESbn+8WnPONnTkP4LS4PcTD5vIdrpjhQL6Tkt+W4NGlUJ9lbPxAKe1tLE3YVys7BIawxFfA6q4kaIauNDpGpWuRm0r/eiAu7Nc3kFUt65R9yJyGPBY+z3w4DE/vEbgd4bYXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754550014; c=relaxed/simple;
	bh=+/slOU3pwtXDU6BXBFYohlSOkD/AYGKOqSKOEoMCn+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=icKlQ1cSs8wKigkrkq0nHwTfxiiUKNLpWShQ+wI7BXj2ia33Pvibcx4ETghP+ivD2atmvfZgMgND+2ptDltCI8SLWeiBcxjNvrNCmwyrXYbTbEvy3dE5poFds17L1R1E08D8XCAz1lxlmU1RyfzPHzkZcI/PP/XNH3JKIxc6vlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4dfa2aeec86so711358137.1;
        Thu, 07 Aug 2025 00:00:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754550011; x=1755154811;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFWs6B1AgH9jESWC4e0YGopanw5Uf+DzPsf6Yx6R0sk=;
        b=PKlthBnhr7UN46GIcQsnoR5jgxcMbyfkSW9Tby863fT/xl7D0eOGNYIPut13E3ci34
         WWzxOxvsccvl0xtpLYmrsnPvu345WtNMDBNvref2CKrSetv3HLv2fGFyfUmjpwkZjvM+
         XVe30101Msl4m3Muuk9AcmRLhYA7NaB2XWZOMdMQP6HszCuS8BDK5FLGNRRPT3D36y+Z
         ADEidCIdDBgyFjWk1sGRASsvRqLCI62/RifnZMfBHEnj9xtDbziCV1gOYAPQb/8n6Vxp
         0/aqlnbvc2ir+DIedXP9GGfc2CsAhBA3nFzK+4koqNlEYGezSnBmAfZfHAQYNh8eIXfH
         J7iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLICM2IBYVO4xi2vdnaWkjGrKSkzcb19UYYyR8oXf1w5e/M/3IxxD2lpWSX2M2Mr77BFK6S2UOb6GYfZyU@vger.kernel.org, AJvYcCWye0cxuRjb5dZDpX4gnTGX3Bv6Gyt4hoQosmro2J01ZXw6B2nFe6CIeQfr+DdtSOlAcc0WfVoTJrB4Un8k282ub4Y=@vger.kernel.org, AJvYcCXPh2hqpefCEYx/HRoGQQLBrAlbv2vAgJhMWzK24JaU6s4YTD5/vEbfYJQr09bZpoFF3+3AQDq9rjOD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+eXMrFld7f+UFkOg2n9fX4sZzB8MT/vtcLEYOcimAxZCdvM6x
	xLp6FCETFycW9s4YMV1fr9KrXmOQ/ljDTZA4Qet0KwGnM2GLED/skq4fuq2Pkx3sEow=
X-Gm-Gg: ASbGncsHn0jc12pFGPpcoYrVQHGXYgJMGXsOL7hgMUkUB6rb/fiN/adCCVfxTNsrwqF
	EHKwpdjVnojmEB98o658TZM7Ae4nNOqbK8/Y8Oq1yYI4itTGrqSzUg+JO9NEWzVKZodRYZxlIO9
	A6ywPF7KGkzIV1icQKk6w4M3/quj3SGFgjB/YX2bwytWHD49WLfeC1Nn/EbRAH7kuXlfEGvfze0
	pk6MnX2N2WOfkg3RWZrtjZzKt/DKq96xYde0wHh2bCXsIRxmdeTM3WornHlzMjGGzyiuaL79TgI
	ZsnBjm+gcClBruZRMAUqevga7ovLVIMjhwFyrw1uVnENTDZPAq4pDkZ9madk1KAdQFMWV3aYQaI
	5l4FK2UZQ1WdcTtxEvEA8MQGdK+qZEwLvdk9/aWc82N6EZHcSFW5tg8246qPE
X-Google-Smtp-Source: AGHT+IEnmK/giDGFzYrWdmiY/9d3FiarDdyzItXzcZQUfatetumQ8UU2ju6ZKIMGn/wBEW3fR7hP2A==
X-Received: by 2002:a05:6102:2ad3:b0:4e5:93f5:e836 with SMTP id ada2fe7eead31-5037b6d4ef0mr2704944137.25.1754550011452;
        Thu, 07 Aug 2025 00:00:11 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88e026e8c19sm207570241.7.2025.08.07.00.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 00:00:11 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4fc009e3050so517493137.0;
        Thu, 07 Aug 2025 00:00:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIHFl++fdThxqSE1NQ7lW7KhFFfnQ5vx/Q9Q8PKkmmcCrfHF4ZAMAb33DhTG3lYgyRxlwRDTD7FL1zopYs@vger.kernel.org, AJvYcCX8BeO82GkwGatLiamqKuIW/Gc89MsnkWVw15xuAWIloeKikVog+DrcWUCw8xil7aP/VaDrBJ3c3hQfh7BlaeEHcaQ=@vger.kernel.org, AJvYcCXMFZtMUly4TjZ8IMEp9e92j2IUgHfPjdgz9k6DEtgjk0g52AGKuFtVEdeQa4qLtQxexvDN4/KOg4UQ@vger.kernel.org
X-Received: by 2002:a05:6102:3a0b:b0:4e9:b793:1977 with SMTP id
 ada2fe7eead31-50375b2a2f0mr3091727137.0.1754550010907; Thu, 07 Aug 2025
 00:00:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250806195555.1372317-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250806195555.1372317-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250806195555.1372317-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Aug 2025 08:59:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW3oOG+JUc-KbEXNn2+q-XLjoJ5ioCb-KULEOQ-cdj0Kg@mail.gmail.com>
X-Gm-Features: Ac12FXyHNW_hJJPNybN55N8M8QZ6wJTk12cwxH5esIQCUDumBPV1jAXrUtdI7S4
Message-ID: <CAMuHMdW3oOG+JUc-KbEXNn2+q-XLjoJ5ioCb-KULEOQ-cdj0Kg@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] pinctrl: renesas: rzg2l: parameterize OEN register offset
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Aug 2025 at 21:56, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Prepare for supporting SoCs with varying OEN register locations by
> parameterizing the OEN offset in the rzg2l driver. Introduce an `oen`
> field in the rzg2l_register_offsets structure and update rzg2l_read_oen(),
> rzg2l_write_oen(), suspend/resume caching, and SoC hwcfg entries to use
> this offset instead of the hard-coded ETH_MODE value.
>
> As part of this change, rename the field `eth_mode` in the register cache
> to `oen` to better reflect its general purpose and decouple the naming
> from a specific register.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Renamed `eth_mode` to `oen` in the rzg2l_pinctrl_reg_cache struct
> - Added a if condition to check if the OEN register offset is defined
>   before reading/writing it in suspend/resume functions
> - Updated commit message

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.18.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

