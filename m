Return-Path: <linux-gpio+bounces-18638-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B967EA83E24
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 11:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 091B6A01450
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 09:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3AC20CCEB;
	Thu, 10 Apr 2025 09:07:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9791D5143;
	Thu, 10 Apr 2025 09:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744276058; cv=none; b=nsgNV7djS+dzAJY6trq28i+jjYSOLWl5JFP5E6CccqnDYnrGuu1NxDRyDyV0SS8JKf0fwVQfWshlCSrOYp2T4cjRUUmIRVi8+uuITJKX+bxXP+girV6chCHbMcyy0/zdYjrQ9MBK0rvEcIyoKDGlMIhEvmi4C6JmJ7YXZz9Oo8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744276058; c=relaxed/simple;
	bh=8OCzwr89gfo3EPpB6MxJdzvOIhhvCt/3FusABEzsj8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=abycAcErPh5naNvURxzDXWBTJMJOsTI/BTwjG5Zq/2fCtPHf/SCToqe8WRau/qmB4TrnU3MZuTOqProFjp3b8tiwbBCnYEpZGJWvby3oP4nDpl1ib2JHon7SqkYCzBKcUiYeq7isF+GonbgFctwBVQaKAOIh8ryrTpfyKHeLEH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86fab198f8eso228071241.1;
        Thu, 10 Apr 2025 02:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744276054; x=1744880854;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Hj5jMU+hKHWCk6ITEuBX7mFwQOOBkyiGAOFy/et6jU=;
        b=GI6RlZUhzfgOvA06iSngnQazhohlguTsNAT16UXSfT5Hs0KNRW3MZpbsC4lBZGw0l7
         68mdf13R8upwwviJLCefODBIeXrQK2nX8oecB0UCLTSsVRTtNGemFMEgKgkgwRhzAxzB
         77mMxagVyTpDyYCZWwfE17e2qXUYm9XJA6ae+0l8sPG5KV05pz9YUuQaX2FkxQf+bpCv
         3TIzCSJmIbJQIfiBlI7YlOLmI7yZE7MXKR2ZK7bFBhArs6IfZyp5RCeb7h35jGndjQox
         SNgRkppviF9EnZseU7k7SJQcACoVW5L0U2sDI87ScrseytW05T6V0bbKPPlQg2mbkFuQ
         Cayg==
X-Forwarded-Encrypted: i=1; AJvYcCUl3IYPUQJsdtFvaALwQM+0PbyxTT21+AQQYb39BwbPWF/JwSJPqZYodUllNQu95ykXPvnxLeq4Yv7i@vger.kernel.org, AJvYcCVETYp1xdf4RcJ1ttFxx8JhEBzyxlB0CdDvg3K7PWpyV5wTFe90JAOvtSlzCwGFtUsGE0kDPVOuVomZ1W8K@vger.kernel.org, AJvYcCVLNKUo58XTOus+OLKw8ioGpTjdeyfp0txU8eE8ZgMJk0dbuQ4jqA0rKA4pryIgTIi3cA09wnZTMGQm@vger.kernel.org, AJvYcCVhe8NZ7CSmmalHhUqc6dPSV+UOtXxpenD9R3e1fouOYjZIUwNPdserBQS3RTBpzgCtqX3UgBkxY85VrGzLznWVelY=@vger.kernel.org, AJvYcCWVpNdRmGgy0qR3DtTENcYirWbTA2qRxXpuU0exdpPxeR903+IkHBEo8JaE9WqCAj4aA5SAf1uwY1NY4Q0Y@vger.kernel.org, AJvYcCX2Kq1IDbvIrpciwEUUxmGMd5XKSvoHuxDVCcAntdrEeKz+E8CYzk+eL9u7oZoRZsiJqEyL+/ZI1sapfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiIgmW7106Yj755v1asmD1RDoaJp8/kykP+5S4xcMg0JzEOi4U
	m25GjQkHfQZOyvKJDTVHh/4JpOrBhzHmCiruYtlPXNJuHuM7Nwn+ZK4+ZBn0
X-Gm-Gg: ASbGncvTrYBhlhkoBwqO6/OXWb+EQeT3yC3GzJUExx1uKj5YxG4BWwoW+ed+CFsDi13
	lurp/b+K8YstCdScuwUZkffPGoJgw32NICYeUmpxAIHGI2jN2prPz+Bl+py4LUr6ueUi/e9DX9y
	9D+HdR4h47Q4Wyc+7ptmjnqWSmmcZKFZuKrQ+clC81gv5jyF7vrbjmwM0qfQKRSlIDlDC9WxBSE
	MpStA/k2pEsq3pl4v8Y393zp0U0Lz886l/Cw9wO5MNnfEvyYd9OEWq2ZJduudM3w20Bj8k02ykL
	lJLMQlNntuRMOYDwE7/icy5ep6jJVSjrsfgG6FW929BtqpCB0k2aQbWAYOaJlhoqoN2kcxlmxBp
	hOuc06hBrUBmsnA==
X-Google-Smtp-Source: AGHT+IHYqoNcj6rYHdWGPokVMu9omeQp3si9hu9JptlkE5pOYGL5jL/TkmrRRwQ94vE6xmjvWhRhdg==
X-Received: by 2002:a05:6102:149a:b0:4c3:b0:46fd with SMTP id ada2fe7eead31-4c9d362e440mr1234664137.24.1744276054300;
        Thu, 10 Apr 2025 02:07:34 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c9c97a54e2sm515625137.18.2025.04.10.02.07.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 02:07:33 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86d69774081so233713241.0;
        Thu, 10 Apr 2025 02:07:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWNNZfOsKrJyDy7gC6sNiREyk5xqvVxWSesD/0/G/P4dIz65Q55gLv7lQYP9tR6R54CAk975osxuEKh4Q==@vger.kernel.org, AJvYcCWb693UoBiXNsYNex0qL6nC6BGAcLoT9evsHyyjY9m+g0y8U+Z6zFwsUkLFLecsN5tUVgBTgPbeP0iC@vger.kernel.org, AJvYcCWq63iFr2APawO9TkhXsjVWHn+e9yd6G5JMOjS/hwfn10qdTyTTRk0cWayFwGXyZGlv5AHyKWySPTDgzOZW@vger.kernel.org, AJvYcCX2zgxVOkmC8Io6MDXGBRROrtchX6YrzeaPgOEAL1jmhwAnBy27lIvBk3AY6eLAIwErUeZhyCvUvN4J@vger.kernel.org, AJvYcCXDKWVjRP82wOZRt8Td/Fag/EVtAC2j/oH3OZ/8FRntaG2k22mFQ8lnzN+lnaHV9xgpUdv8+vupqkZlotu7@vger.kernel.org, AJvYcCXFEDK7fOpFaUwY0VsPT/djW+kgs8+n9aiiaGMzmLDjPnfY+6hy9fXRkcIjXSwSKUaeQrflyhKEHEb86lziopo3hLQ=@vger.kernel.org
X-Received: by 2002:a05:6102:2b86:b0:4bb:ecb9:b34d with SMTP id
 ada2fe7eead31-4c9d35de416mr1363043137.18.1744276053277; Thu, 10 Apr 2025
 02:07:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250407191628.323613-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407191628.323613-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 11:07:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU0ee30MCXSdW=hho42qFHeT5fpNv0_aNSAv-5wXk2g2A@mail.gmail.com>
X-Gm-Features: ATxdqUHSkDF5MA2fJWWYG6tz7UFqEDBhjsZgOhDasE7MOZZMXst_J_b_svx43vA
Message-ID: <CAMuHMdU0ee30MCXSdW=hho42qFHeT5fpNv0_aNSAv-5wXk2g2A@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] dt-bindings: soc: renesas: Document Renesas
 RZ/V2N SoC variants and EVK
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

Hi Prabhakar,

On Mon, 7 Apr 2025 at 21:16, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the Renesas RZ/V2N (R9A09G056) SoC variants, distinguishing
> between configurations with and without specific hardware features such
> as GPU, ISP, and cryptographic extensions. Also, document the
> "renesas,rzv2n-evk" compatible string for the RZ/V2N EVK board.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -551,6 +551,21 @@ properties:
>                - renesas,r9a09g047e58 # Quad Cortex-A55 + Cortex-M33 + Ethos-U55 (21mm BGA)
>            - const: renesas,r9a09g047
>
> +      - description: RZ/V2N (R9A09G056)
> +        items:
> +          - enum:
> +              - renesas,rzv2n-evk # RZ/V2N EVK

Shall I add the board part number while applying?

-              - renesas,rzv2n-evk # RZ/V2N EVK
+              - renesas,rzv2n-evk # RZ/V2N EVK (RTK0EF0186C03000BJ)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

