Return-Path: <linux-gpio+bounces-14478-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E12C3A00E02
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 19:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3899F1885545
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 18:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 588D21FC7D1;
	Fri,  3 Jan 2025 18:46:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F911FC7EE;
	Fri,  3 Jan 2025 18:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735929962; cv=none; b=L4vk2xO6htLTdEmD4HlkBp/Le9Ki5wYcbHYrY4zcq4Qcc6EXOm9X4r2Gwqy+r+g523FA08Ocq3NZZSDdTkP1BHHam05dFG9VZ0a66gwo1VTIX7NFJvUd2hhoNnPBKQU8iizWTSC+eOlHfgP7a1fE4i4pzN+fTi6iY+1C6zj2ROw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735929962; c=relaxed/simple;
	bh=QTREeSNUnQ3XMULGYbjDTxpeKb1XKpvlg40sHJXvQIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FYukSJXDyL3m/D434y9jEsUnYn4aofEFZckt+NYWY6tp+jv8WigDB1SWLtRL9jxS6s1wxfAs58rwTWkFIJqfC8YPQwDOGBrOaQWxRLx+oO5KpkT+aBvbwx/wzNJjHt+HYRtlX6+pv6s3pip2VJDNergXx8aH97i84Wph8dV3khE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-85bad9e0214so4421575241.3;
        Fri, 03 Jan 2025 10:45:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735929957; x=1736534757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oK0sUAMyUOLQWg/19u1VasYjzcH1fakWM82TSP9Z6h0=;
        b=qxFnR7V0r8dNTbgNzZS5CudYvrN8vz6QvLP9yZXEgKd54SXK6Fc39gdzI2piko3Dz0
         og5XAG5iUUkSzu7re0p06S4Uyh3gcYm2aabr2CiRjToKYwLjxUAANh9++VDIWLcAbhw4
         DlQtQVVeSIByhlcOtopeTNnNGtH6dGae7piG6l4SwsKcI+t7uEPRN+0QnFQJUZqefKw+
         6c64IQ2INCUAuVmJAVCbUoo7+SzVmy5bTkJ1hIaKWwzA6mhqxgm/BGTHg+BTs315ZTEv
         WZkzdcLO8u1hoDKZ5iuE1wC4TQ+ZsDRVv6UqBZeWAJqoexPKThkiAgMwCoiB/p9oCpp4
         oA2A==
X-Forwarded-Encrypted: i=1; AJvYcCVC8gocoiCrJ+yGHNOVHGc07IQ2rimqbR8fbaQRcQ0g29bHsDpnCK8M2E9LT+Vf1MWYwRpXwN1PVqdfBQ==@vger.kernel.org, AJvYcCW9+qeqRrZ61SAjTYrRreCujpy0GahvahmtvJ8tIE7kPgC4hQjwsO33UKF7jwXmiLj9BqLX84FPxQ2y@vger.kernel.org, AJvYcCWESEtV0PAe5r3eOlZ5PvDaqNCMqGbz7WmqjLbDOoAsDB/sVMyFRBX6s9pCSBqOsZ4vZhi5e36AVx3KrR2nXlvkkiw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0UECymnRrVw5ss3o1Le9nABxn/usVkftsPjnymnlV5OxM1SL7
	7h7JJA/vDCycUf6gMWLe67zFFrmVOw9vozgFhSXObx6MfWLFUzPPp+syXbPKgUw=
X-Gm-Gg: ASbGncve8NUCZpZK+nKpk+LNZh04SjeiOtFJbijWuEE78Veci5Izk9Z9kyLyoQd5A+I
	lSmh3mB4QGzTSSNS76Mkb4xMyaISmS7Ans/5yVSqsTBRkrfaJw2yK/oTHANLgHxHpP+8YLDGbhZ
	9RDUUifsjP+ArVd8WfzD/nzf2STrxPH5caf9pFtF6WX1VDk9dQPlzxlZ7CARnB1Bcats73DHmla
	lTf7viZbgsoFQnh02Jy9YhpIwtZWX7tsYaz7lc33+41F1PvgICJOGUoO9vzI4pWOMg7zdL1vBQW
	Qadn4swwk3Ufs97RXxU=
X-Google-Smtp-Source: AGHT+IFqraCrhnv2lu0kP1SrY54I37iQuIuSDupYKZ1cXyHaRosrMdrZwzi8LkPWsqtMTDvWujd3nw==
X-Received: by 2002:a05:6102:c06:b0:4b2:ad82:133a with SMTP id ada2fe7eead31-4b2cc48a608mr40200355137.25.1735929957169;
        Fri, 03 Jan 2025 10:45:57 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad3f34bsm5562160241.28.2025.01.03.10.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 10:45:55 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-85bad9e0214so4421549241.3;
        Fri, 03 Jan 2025 10:45:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNMScGT5PpKojh4XH8FiI/h1cNfJobTL45ibqJt6BlNuT7s98bhPQuFrq1HLYinciYY+r1I+oucOEXg80NtSmNh8Y=@vger.kernel.org, AJvYcCWKa5Hjp4uJLZoJK6Mmb1sZkAB+SV3lTjCc6HnA5QZTtvJzL/c3ftybUz7NrEX8s1/Rt5gbYRjDkBvI5g==@vger.kernel.org, AJvYcCWM4HNyaq4cLGDMA4NV3E6WZCYsOfokj+1htHU+FoN9GyG7yE7dMBX1/bdgsdSO2Q7xwVCCQfL9Qdy9@vger.kernel.org
X-Received: by 2002:a05:6102:3a0b:b0:4af:f8b9:bea3 with SMTP id
 ada2fe7eead31-4b2cc38561bmr37052736137.15.1735929952450; Fri, 03 Jan 2025
 10:45:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216195325.164212-1-biju.das.jz@bp.renesas.com> <20241216195325.164212-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241216195325.164212-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Jan 2025 19:45:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXBt_awS3p2GSd3eB9EGMm+L3iBSaNf+t7d-014w5aVjw@mail.gmail.com>
X-Gm-Features: AbW1kvYFTYEMTIAiupPeFKJv2tSK5lUp81fHhItdkjkKYUhSpHmlrH62yy2EYiE
Message-ID: <CAMuHMdXBt_awS3p2GSd3eB9EGMm+L3iBSaNf+t7d-014w5aVjw@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: pinctrl: renesas: Document RZ/G3E SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	Biju Das <biju.das.au@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

Thanks for the update!

On Mon, Dec 16, 2024 at 8:53=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add documentation for the pin controller found on the Renesas RZ/G3E
> (R9A09G047) SoC. The RZ/G3E PFC is similar to the RZ/V2H SoC but has more
> pins(P00-PS3).
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Dropped ack tag from Conor as there is separate file for RZG3E_P*
>    definitions

You forgot to actually drop it?
I guess it doesn't matter much...

> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * This header provides constants for Renesas RZ/G3E family pinctrl bind=
ings.
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + *
> + */
> +
> +#ifndef __DT_BINDINGS_RZG3E_PINCTRL_H
> +#define __DT_BINDINGS_RZG3E_PINCTRL_H

> +#endif /* __DT_BINDINGS_RZG3E_PINCTRL_H */

__DT_BINDINGS_PINCTRL_RENESAS_R9A09G047_PINCTRL_H__

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

