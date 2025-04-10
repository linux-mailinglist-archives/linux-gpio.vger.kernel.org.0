Return-Path: <linux-gpio+bounces-18639-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F7BA83E2B
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 11:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A509CA01763
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 09:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A7E20FA9C;
	Thu, 10 Apr 2025 09:08:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB901EB1B7;
	Thu, 10 Apr 2025 09:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744276093; cv=none; b=rCyZjWcVxbftOr9CMtTT6D8CiOm1HbYpvNr4Av/OHv4EtWGz3+FXs3/akAQDrQ/dhPvjevNqs4kuixh+Qtg1B/gfKhGiTlT/iqrXjpUhMSMFZgJTK0U8qbQtSX/+TSepRiDf4zmBdGalkpoE4imoZLP7XXTSu/mWJ7B3ir4OEGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744276093; c=relaxed/simple;
	bh=TfarEfTOCkxqzbClFMk+tCAmwP/yvSQ85D7ruEjqh2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h8imWcSqqZzg+QhFixHp4n3WIJXuRoPh3EvR2FJn+nOCwMxd6x4pBbSK4WGW5nzBvWBR5in2fYI7RBqvSvwTzRfm5qB7kdHoXiARw3BroqjfJ5+oacBx+F6oARta9ZmowQzCd8GDzw8HWZ7w+O9RQWUMGNa11C+NAMIPYv7SasU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-523f1b31cf8so251167e0c.0;
        Thu, 10 Apr 2025 02:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744276089; x=1744880889;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AuwVRPvMl3wdfk0qtDISjiniiWptCa7pFN3JEVE/WmA=;
        b=ZFQo7HoZRyIN+thz7y+IqPmT8T64tkJlGbKaThIAahg4msYXWvSHnKpPZcfcOtBz3Y
         5t+Ch2r6q4ztxa6TcuLzCjGnpx5meUlgyIpbHLh/CxnZi5bID2KeiwURCSkYgXO9RNph
         78Q6tnKCxaejKWxvGX/7tTizkieImFvcxlRbROcvDQ0lCJLTMAUBxwSMN8aU4a6U8o0D
         MOvoRteXfkO5ScuiWbF/XFX0lEcS2zWz9F0lxdCYWv0hzwrRbWRUaU2o+DdFz1lxA+e6
         HCw4AfBj637cA33aAe2PCdc/NLpwn38aNfGPzk+gWV2n/LbZAz2wn+6Qb6uGk2JnL4r+
         0uSw==
X-Forwarded-Encrypted: i=1; AJvYcCUXovfPwQE0y5l9IDlrF5vgNQsEHge4/z95mAvSl0deqnEj6iu6WO6deck+Kfcc5WFKnBwG2ohRkq+w@vger.kernel.org, AJvYcCUeGqiH8pFjrIbzvKNfnl+qyabxd8WX4QJ7p5+3wJOqzrMFeP8Gv+qLT/4hEjgHHf1OA0ksFQm+WDkNmGC0@vger.kernel.org, AJvYcCUy9R09NGMl6OppqQoHo1vSOfdsawfWkyYKjCZ+rMRpkK6KUDBKR7q9YsluASES4dtwIFOJnbYPTJxBzTon@vger.kernel.org, AJvYcCV60dgeH25tzzsBxnOmOWbOK2ysslBCzSqtMit9aeAZ40UIoRuP/jmjkwVi1sBuMEIIyeb39CYODRRu@vger.kernel.org, AJvYcCWzD1CBtJvA2UaYjsmaoUUdwjL8HtGjLxFwbXX/RzlUuxRvlz4bjtc4pt+70ykx7/pe4Ktp2RwnevpBGg==@vger.kernel.org, AJvYcCXxDmbPk5jTcwMQ5VncQVOG5iQbk1aafOkoO+vNJb6GLx2piVxLqH1XCeY6r55cmfqqSmH9duCB/LE2UBrsUda8dqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YydrY0Pcxzy1dCl+acmwPkD+ndWjwiUZXN7RINZDGpKru64ZiFD
	91IW+oUeJmSl65FyB04J1wb+jIF1/77/2p88dWWAlgHmMS6tWAg81Djn3BNc
X-Gm-Gg: ASbGnctvfGusODGlzpbI/Re3sOuxG2UQG7OZW+lmnhsFhZCUzliyYdsaelu8GYsUHlU
	E/C/r9Ps39y5HqFIoD/Ke0ANN+wAvbEJZTYzOMcbtugFI55AzkN36kC1rGzdQ+0pB39GXe0PucZ
	3B+rLk0gbrLeC+2j139uDwoV/bpzAd9EqlLBedHhSyDtcl5MNwdz/G2yBl39ZTvuqXF/s9UOoJl
	2vhvFrZpkJeZDn7SvTG1kvvOUEVA3CnKr1JmylHFQiyHBEUB7F1XCiH3SWyJjzWZrGSyEgFBrZN
	rawUpRzOUbFww5oCzmhdrNtFL95f9fAW2VUPx6rCc8f9n/rTXi7hT5PoeL9QH/H76zsIb/es6HM
	R5kc=
X-Google-Smtp-Source: AGHT+IFeR7IwJ+vn9uwBsf9eWqAUT7O3w0eaF59Bqst38A2EIw55JnXmGVV5zrTi3/+tVGDytw+zsg==
X-Received: by 2002:a05:6102:8083:b0:4c1:a448:ac7d with SMTP id ada2fe7eead31-4c9d34a9ffamr1338865137.10.1744276089152;
        Thu, 10 Apr 2025 02:08:09 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c9c979cfa2sm515634137.13.2025.04.10.02.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 02:08:08 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86dddba7e0eso233740241.1;
        Thu, 10 Apr 2025 02:08:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYJfMY7Q6E+dfnXPn8mOejHrWz2TjkX0iAcHyF/IrXp6TcpBBxcSp/jn2XPc/lyJblXTg967plSULgXcWIJSu+7GA=@vger.kernel.org, AJvYcCXFtTHFvO1bOdJ9UMCNt2J7yb9+wIcaqex8DXA29/cpgo5w+3nWdRxPP+0IpAWK2DqK82mjYFEfPwAr/puN@vger.kernel.org, AJvYcCXJY4NpVQOEfz3iqzrsFtcxmFgdq+wj1vl5mMsgwXFSaBpZrB4iwg2JT9AahjcSjLqwUVwqln2OJiYreQ==@vger.kernel.org, AJvYcCXc6XSatoKPFgcPS7e6FJ3/ClUExiz6E/QVT/BIQfI0Ir4VLgMlIM3BuTFk2fXjYb3uQH8ZXEKEo6hV@vger.kernel.org, AJvYcCXnh7/DoDVEwbBcLZH+sumRa7WwTkYBqJngqP+1Ju3AUoU1Oh7DmmUyQ86Daxqg7FhA3YwPXXxe8RZ8jX4G@vger.kernel.org, AJvYcCXwLV4iT1x4P/O3DKIwYlCy72BGoMwtG65P3MlMZfnT9lpjLx1cfXxIHzVGLfiBC7jYRW7s0Spg9vKx@vger.kernel.org
X-Received: by 2002:a05:6102:38ca:b0:4bb:c490:7d6c with SMTP id
 ada2fe7eead31-4c9d34ad613mr1283191137.9.1744276088614; Thu, 10 Apr 2025
 02:08:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250407191628.323613-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407191628.323613-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 11:07:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYsx2XS=q85oDVEk_=PJwkjBEXxLyUDO+UhEP2_G1kTg@mail.gmail.com>
X-Gm-Features: ATxdqUEwpUxcOFGKhCUVVlG88vheZ8eu-I4T6lSe7ekmYJ7bu86LizYCbC6vt9A
Message-ID: <CAMuHMdUYsx2XS=q85oDVEk_=PJwkjBEXxLyUDO+UhEP2_G1kTg@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] soc: renesas: Add config option for RZ/V2N
 (R9A09G056) SoC
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
> Add a new Kconfig option, ARCH_R9A09G056, to enable ARM64 platform support
> for the Renesas RZ/V2N SoC. Default this option to "y" when ARCH_RENESAS is
> enabled, ensuring that support for the RZ/V2N SoC is automatically included.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1-v2:
> - Selected the SoC by default when ARCH_RENESAS is enabled.
> - Updated the commit message

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

