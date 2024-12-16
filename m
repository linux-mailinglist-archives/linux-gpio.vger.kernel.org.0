Return-Path: <linux-gpio+bounces-13918-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A809F345F
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 16:22:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60ECD7A034F
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 15:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28D3145A16;
	Mon, 16 Dec 2024 15:22:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FC41E493;
	Mon, 16 Dec 2024 15:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734362558; cv=none; b=g+AVJJ+Bs6HovfGhuO6kf+u/AIOAi/BZL0vKP5Vd/TXoBhK0Q2aavLjfGhQmqUgT8pyH2yEhSGQwppTEfM4ZySuSQHu3rqjk7O5s7X5Qmu55iwiLF9VvzDnUokp5p1W7SXjZVm7BWMX9VmrphAwEaedaK80u3lZFhyj88f7UGH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734362558; c=relaxed/simple;
	bh=MSotFg5wJ4l3hxx0TcxA3ZD0NPxfUaHHiP3OGGiGtDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X5/n6gBmc/APbC2uJdlmYJ/qErywXLjO20xYKmq07jSNdUyiPt36AZfKl1H1FxJ1bQ/vI/AKRmV917ndKDpM4Fl8VYEneOWVz1DzjkO7MoYlaWQPPwR3KGD7jHVQJpPsFC6IA8zIgABU4RLBcb3u+IbgUMEu1S5WWLwnECr7ma8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6d900c27af7so49000236d6.2;
        Mon, 16 Dec 2024 07:22:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734362554; x=1734967354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hG4PP9QWcWI+diTGsMCD3CyuMAtDTWKxLhuoDm8ZR9c=;
        b=gQDWLQ8c9AhR57YegF/dp2bKl559jPqzbJTHHWjevghYWC9zUbApoS6eK8shFZtRcx
         InJhQuOd/q0VblNQYH/3XQRO65aWkA+FnvS7JEh1YxYUXTbYSvHErArlgTNsHQGIuT9S
         4i+bKVUQ3Kht1rmdjiDbo15VX/tMNNZBoBovClX64qGs4q4BPh/p9rxq9d+5ZOP3zQp3
         XeQ4IkfCPTgtlOecufQ6BIGOaLSyvE/NnL/3knVXW6863q2G77VL9hzyonGqnowcVUym
         YoXdhk7N9YNOtQJrlxqQRPHGKUvnjzuvxNZxPdRSseQvUTsTxXdC2zSGWC/yrieGUpjC
         QoKg==
X-Forwarded-Encrypted: i=1; AJvYcCUVOlcQBNYHNfhqLRDW+9qz5ThJozllXdqDwE/jZnTOJVOx/J62dXum1WIjKicm+9pquJw4VaYZPcBcCF2tAYoHho0=@vger.kernel.org, AJvYcCVqfGBnHPi1ZaJQ4irsMUG495NdOFRFcsfuUpR6kKcaHHf/tnVzaw37TiuWXWlkS/Em1vT/SNHZyLkQoQ==@vger.kernel.org, AJvYcCXAWdFgPpKoTrvc30zSfxy1QDFWZYujOZRbz9s2JgDTrsaXtYjeaGsTIeA4IUn9LC4vgqW93Ss5yGet@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw5mawwsJVsBUNuMpdVmIK5HZ+BUOL3lMUU2ElMem3ZLeJ2Jmi
	+Vj4MQMcG9OIy5WLwCg6bcwEfls/caemt4bfEghiKIk82TLjo0uJIWknvZKf
X-Gm-Gg: ASbGncsWR3sPmvbbyxdEh2DqcCgpYqCYsxa9pw/XZM5kBpckFqQqnMgjf0kt7RVXjHb
	voXMeuvBXQJFpUu0vN2IKq0txq1buvf+vGQnMjDxKtihSoFvWEsK6Uh6nC+apbPh1nWonOxPHfA
	zRrESMdUQgUv9vsvMcozdyIu2B7yxg4vpRsrKaMf7KWfB23kL77ks0VfX0HOJKIOYBw9a3oYug4
	lOdxuHRwN/VC3FYaqQQn3dTZ3JIoNzbZGhsCwU8reZl7567KZ5hA/YTaQh/+7cvPOW8tLaYfk9A
	fPIcEqBMGeC+uj8nUXM=
X-Google-Smtp-Source: AGHT+IHeawmtd5DaG+LivgEhnr5ym1ywvbz9RWXYcvJYmFk3wjaRyO1sQvEhJ4dGH5+8UXmpaV1a3A==
X-Received: by 2002:a05:6214:ac8:b0:6d8:ab3c:5c8 with SMTP id 6a1803df08f44-6dc96890057mr231033276d6.49.1734362554398;
        Mon, 16 Dec 2024 07:22:34 -0800 (PST)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com. [209.85.219.47])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd37bbb4sm28129776d6.98.2024.12.16.07.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 07:22:33 -0800 (PST)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6d932b5081eso38705486d6.1;
        Mon, 16 Dec 2024 07:22:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVW22NLYmOYCmsY6gstCqLQRsivi78R0+bNllGDEKS8lwMeaYr/05v7UG5BbjhCHx57Lrjrq0ETg/G6@vger.kernel.org, AJvYcCVmXI9jmrBwdHfekCsdP+C8M/YCsD2flMYuGU7YrYXSN3Ujnn2/MerFvhBcin7y7HW48c660RLF1ALohQ==@vger.kernel.org, AJvYcCWXYtoJfzs+++0+EAN7sB6KWWFa8benBYmW6yjRxjoLCuHuXe7EwVxaP2fBjUSoBN0kjeza5R1BAOIrxCvgBEb1BD0=@vger.kernel.org
X-Received: by 2002:a05:6214:1311:b0:6d8:8874:2131 with SMTP id
 6a1803df08f44-6dc8ca56807mr236563946d6.13.1734362553216; Mon, 16 Dec 2024
 07:22:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213173901.599226-1-biju.das.jz@bp.renesas.com> <20241213173901.599226-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241213173901.599226-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 16:22:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWKQvfySPvrck8LL8dQ8E9_oMKEkN4tnk_JcLsRuZPYgA@mail.gmail.com>
Message-ID: <CAMuHMdWKQvfySPvrck8LL8dQ8E9_oMKEkN4tnk_JcLsRuZPYgA@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: pinctrl: renesas: Document RZ/G3E SoC
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

On Fri, Dec 13, 2024 at 6:39=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add documentation for the pin controller found on the Renesas RZ/G3E
> (R9A09G047) SoC. The RZ/G3E PFC is similar to the RZ/V2H SoC but has more
> pins(P00-PS3).
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Updated the macros with hardware indices in the hardware manual.
>  * The changes are trivial, so retained ack tag from Conor.

Thanks for the update!

> --- a/include/dt-bindings/pinctrl/rzg2l-pinctrl.h
> +++ b/include/dt-bindings/pinctrl/rzg2l-pinctrl.h
> @@ -24,16 +24,35 @@
>  #define PORT_P9                9
>  #define PORT_PA                10
>  #define PORT_PB                11
> +#define PORT_PC                12
> +#define PORT_PD                13
> +#define PORT_PE                14
> +#define PORT_PF                15
> +#define PORT_PG                16
> +#define PORT_PH                17
> +#define PORT_PI                18

Port PI does not exist on any supported SoC.
Hence please drop it, so DTS writers cannot use it by accident.

> +#define PORT_PJ                19
> +#define PORT_PK                20
> +#define PORT_PL                21
> +#define PORT_PM                22
> +#define PORT_PN                23
> +#define PORT_PO                24
> +#define PORT_PP                25
> +#define PORT_PQ                26
> +#define PORT_PR                27

Same for ports PN-PR.

I understand you need to keep the definition for PORT_P9, as it is
shared with RZ/V2H.

However, that could be fixed by having separate RZV2H_P* and RZG3E_P*
port definitions, like you had for RZ/G3E in v2. You already have
SoC-specific *_PORT_PINMUX() and *_GPIO() macros below.
A disadvantage is that it may grow this file when new SoCs are added.
But that can be mitigated by splitting it in multiple files:

--- include/dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h ---

    #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>

    #define RZG3E_...
    ...

--- include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h ---

    #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>

    #define RZV2H_...
    ...

What do you think?

> +#define PORT_PS                28
>
>  /*
>   * Create the pin index from its bank and position numbers and store in
>   * the upper 16 bits the alternate function identifier
>   */
>  #define RZG2L_PORT_PINMUX(b, p, f)     ((b) * RZG2L_PINS_PER_PORT + (p) =
| ((f) << 16))
> +#define RZG3E_PORT_PINMUX(b, p, f)     RZG2L_PORT_PINMUX(PORT_P##b, p, f=
)
>  #define RZV2H_PORT_PINMUX(b, p, f)     RZG2L_PORT_PINMUX(PORT_P##b, p, f=
)
>
>  /* Convert a port and pin label to its global pin index */
>  #define RZG2L_GPIO(port, pin)  ((port) * RZG2L_PINS_PER_PORT + (pin))
> +#define RZG3E_GPIO(port, pin)  RZG2L_GPIO(PORT_P##port, pin)
>  #define RZV2H_GPIO(port, pin)  RZG2L_GPIO(PORT_P##port, pin)
>
>  #endif /* __DT_BINDINGS_RZG2L_PINCTRL_H */

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

