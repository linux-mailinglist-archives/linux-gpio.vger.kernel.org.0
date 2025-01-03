Return-Path: <linux-gpio+bounces-14477-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7B5A00DB8
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 19:43:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A87DA163B4F
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 18:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB8A1FBEA6;
	Fri,  3 Jan 2025 18:43:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825681F9F7D;
	Fri,  3 Jan 2025 18:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735929803; cv=none; b=LtrE+NosGqSl0FpXvOcOUeIXIuNWFFqwcJ9/LODwkH5uqM3LnyGRf4ws6g+2lBgWJQe2jeJQjTPymdR6MYdzEryix1NN7oDu2wFg7oA1MRCXFja88Lgii//FwEvaj5LZBDG4NnWqkM9sjHs9MH3e2BacL+9yqFhO4IpDVdzBwXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735929803; c=relaxed/simple;
	bh=BFS79rOqYTtyIkovNYxwwMGMMxycI2OnDra/Q8Ghw1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pxyk1mefKKdHw1Qu0X8yldgEHk0ptFu5a6Iu62Fx5x5OCpodWxdTTt0vw3cxaCkktA/5jngOL/v984Fn2vNhESiS1ri4d1b6ZTdezT/Qjj+A74n7T7m9gs5oO2NnBhEYmSOkhFmXYhcdBGgiBDDKnvzBvCbvaESrb2DMp+Ik+04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4afe2a1849bso7238849137.3;
        Fri, 03 Jan 2025 10:43:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735929799; x=1736534599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAHPf999xM3p/2tqOu01A4JQAAGkSfIwg0+gefbg2Hg=;
        b=EFX+zXIy1NrmKTqSWVVrnc3mlQryUgG/35l5ByoXN4WPKP9vWSNc65m5iiKR1QJgO5
         ei2LoTxRKkJ8NgwM83bmjTxIK60Fj3IPvCmUdS1IMzodPZSe7XIiQNONETlMCi7aiUxU
         ZtV8RvdxTIHS/ly1yhf1TZ+zWgppJ9yZ7gV9FABWCd7pRYqfiIZeEDuVgWYcXwdp5kcR
         W8G8O0g09NOjA1jrdAf0GKy6MVhRdh/5aBAHzdUv7dpe8HLx5iyy+QzA09v/fDIj4Y7M
         dPeaBcL6hkSL0VcR8+Ywqa9bymldb74zuqXF3CbwxOHel01/t28+7usIMRG2fHKLU0BJ
         a3ug==
X-Forwarded-Encrypted: i=1; AJvYcCVNRzfJNstRPcJLu9oPwzXJyVR1WBDaePeldpeT46Ja7Z1aW9jHCpQ92Mgrq45x631LLHgokSGFtciz@vger.kernel.org, AJvYcCWkGqRnxpjwYuAgnH3NK4UzjXuzhpvxBgiaR+wvjeO87qJemgxmnGcGgD8Dx/RN35+XXzO8CSgxUUC7sIX1YeeQF2c=@vger.kernel.org, AJvYcCXuQ6mrMAG/QdzBMMyb8AhaFkAc1ABEQvwsVSd1dy7fyNG+HLtpMsTTiXHIs18imMNxc9axyT+dJzWX4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5C89VmDeAqGAKV2etcgaVhmtD4iKpHuaTvnAB3YMg1Mvgqz6g
	A7QTgX4v93p863K/EMXMFkVnB9kU/VjJmg5YtuDD+iUWPmakZae8c8e3Zh87ql0=
X-Gm-Gg: ASbGncuZotfNKHiAdayX9CNiRXXlxYctRj0I/KzblZ3/fNXStFhwZXrnKtvDRPcBjpr
	Tyh8Dk4tvgX5cDjZ8QOwSwQD4Q1D5tJLhw4l4HiPH7QT38kd5Ak4xc5feoWRpwQduBwv0cclgZI
	uSEcRjd/KZCjwyaH4d7Lk4yQ5QzZ7QwomJs3CQOp/I8ryvnokyzudZqaPc0omSck0kfCKFPCjwz
	jVvsK6YVkcge62B8GhSYYFub9HaCh56eN+KKtAQyz3s1kH0q9bmF/4oN8H6RlG86LBRjM6PSGNJ
	fQNXvkbKDwuaPsTZ6sY=
X-Google-Smtp-Source: AGHT+IH2JNGs9tf9MpRnVpbTrxV+x96laWMSnyqHS/gk05n6miK+fenGbZo0csL3D/lABhvCuZsuNw==
X-Received: by 2002:a05:6102:548d:b0:4b1:1b67:6a5c with SMTP id ada2fe7eead31-4b2cc44935emr35651654137.18.1735929799201;
        Fri, 03 Jan 2025 10:43:19 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad582cdsm5665205241.32.2025.01.03.10.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 10:43:18 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4b2c0a7ef74so7030987137.2;
        Fri, 03 Jan 2025 10:43:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1bf3QARecVOTqsgvrp+Qq0i3pnPXNx+NoICxzKbrcvemf+Svb6REFYa2CTRSLBmA4RfQpaxK7xfaVdw==@vger.kernel.org, AJvYcCX/EscSXzCX+f/+VU9O9GODPHik+gTm5werlo3AjibH5gcbDx4OfueNKQl1JO0rDw6pEI/CCwwaT/BHhdmHnRZUuGA=@vger.kernel.org, AJvYcCX5aQV3Rwzl4IY+85mkK3M7v9kvst/JvnfvhTLoWN6nO97NqCz7MGNm75eNqllhKN8Cmu9+n9Xe0WKb@vger.kernel.org
X-Received: by 2002:a05:6102:440b:b0:4b2:49ff:e470 with SMTP id
 ada2fe7eead31-4b2cc449353mr33420135137.21.1735929798416; Fri, 03 Jan 2025
 10:43:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216195325.164212-1-biju.das.jz@bp.renesas.com> <20241216195325.164212-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241216195325.164212-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Jan 2025 19:43:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVcDc1YK70WT9YF+tTR5Qxk8Wq1v+moPG9xK5EgnYyhag@mail.gmail.com>
X-Gm-Features: AbW1kvbkX6QiVHTCjHm6HXFL-TymisvIFgX9yu4DL_ZA-Im4za9PZ-vtQNtQNXY
Message-ID: <CAMuHMdVcDc1YK70WT9YF+tTR5Qxk8Wq1v+moPG9xK5EgnYyhag@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Add alpha-numerical
 port support for RZ/V2H
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, Dec 16, 2024 at 8:53=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> RZ/V2H has ports P0-P9 and PA-PB. Add support for defining alpha-numerica=
l
> ports in DT using RZV2H_* macros.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Added new header file with separate RZV2H_P* definitions.

Thanks for the update!

> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * This header provides constants for Renesas RZ/V2H family pinctrl bind=
ings.
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + *
> + */
> +
> +#ifndef __DT_BINDINGS_RZV2H_PINCTRL_H
> +#define __DT_BINDINGS_RZV2H_PINCTRL_H

> +#endif /* __DT_BINDINGS_RZV2H_PINCTRL_H */

__DT_BINDINGS_PINCTRL_RENESAS_R9A09G057_PINCTRL_H__

Will fix that while applying, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.14.

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

