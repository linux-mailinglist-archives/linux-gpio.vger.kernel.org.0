Return-Path: <linux-gpio+bounces-1068-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E55D8070A9
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 14:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33C9E1F21653
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 13:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41579374E9;
	Wed,  6 Dec 2023 13:13:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 725C0122;
	Wed,  6 Dec 2023 05:13:25 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5d400779f16so7643657b3.0;
        Wed, 06 Dec 2023 05:13:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701868404; x=1702473204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QpA0ectE+0fOxvKG7PAumxgR/vsxQ2Vp0KirOSeTgT4=;
        b=VCg5QEuSkjpVPQ9S5NNQB0Yi+fFG8AY8/prZKKKHayfYBf/vXR9n3hFzhemy8BaVx8
         Lr/mg+CQwx/EGwv6PetCU/x/gHNWCZgmBOeI6WfdD3RuGRbEg1zWLeqmsjzZJyVsN1fr
         nC7ASNLRS+SXcb3pfpTTk6bHw4+HfgOwpRhDFKinQtMMhiD+We3nnUA4Z5j/CKuzqmf7
         aC2rkmcsFaklxlyAtneTAERj68O/9Zljb+Dg72izWkOvI0aebWs5z8fAb44Sy5hJzz6i
         it+Xt+4ZEQIJF+At2iZMYVnqmyz4HsjFSBfg3hZqtinBk7K6A13T63jW0BV0TYPi7CM5
         RBcQ==
X-Gm-Message-State: AOJu0Yx/0qeqIlrLiQnuUXXJ0L99uvDRDX26nj1+fWEyzNKdDiN6C6ar
	jpCOB6mSRb8QKITx32H89EvJ173NlOso6Q==
X-Google-Smtp-Source: AGHT+IGHjHeQp5S9UvTqYD7nYMwo/R4n6sauUfCRxRxR/sBTzIK8FJDMVzipE2Kl2/qDZgrVTcFImA==
X-Received: by 2002:a81:b646:0:b0:5cd:ef57:ce3a with SMTP id h6-20020a81b646000000b005cdef57ce3amr506826ywk.0.1701868404480;
        Wed, 06 Dec 2023 05:13:24 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id p67-20020a819846000000b005d379110c89sm4792304ywg.8.2023.12.06.05.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 05:13:22 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-db548da6e3bso762757276.0;
        Wed, 06 Dec 2023 05:13:22 -0800 (PST)
X-Received: by 2002:a25:d289:0:b0:db3:523f:2351 with SMTP id
 j131-20020a25d289000000b00db3523f2351mr2026647ybg.10.1701868402141; Wed, 06
 Dec 2023 05:13:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201131551.201503-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20231201131551.201503-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20231201131551.201503-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Dec 2023 14:13:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUiaL__+CDaFxRbUFgrz69SYBNfZm4JvY_qQRKLMTCY0w@mail.gmail.com>
Message-ID: <CAMuHMdUiaL__+CDaFxRbUFgrz69SYBNfZm4JvY_qQRKLMTCY0w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] pinctrl: renesas: rzg2l: Include pinmap in
 RZG2L_GPIO_PORT_PACK() macro
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Fri, Dec 1, 2023 at 2:16=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Currently we assume all the port pins are sequential ie always PX_0 to
> PX_n (n=3D1..7) exist, but on RZ/Five SoC we have additional pins P19_1 t=
o
> P28_5 which have holes in them, for example only one pin on port19 is
> available and that is P19_1 and not P19_0. So to handle such cases
> include pinmap for each port which would indicate the pin availability
> on each port. As the pincount can be calculated based on pinmap drop this
> from RZG2L_GPIO_PORT_PACK() macro and update RZG2L_GPIO_PORT_GET_PINCNT()
> macro.
>
> Previously we had a max of 7 pins on each port but on RZ/Five Port-20
> has 8 pins, so move the single pin configuration to BIT(63).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -80,15 +80,17 @@
>   * n indicates number of pins in the port, a is the register index
>   * and f is pin configuration capabilities supported.
>   */
> -#define RZG2L_GPIO_PORT_PACK(n, a, f)  (((n) << 28) | ((a) << 20) | (f))
> -#define RZG2L_GPIO_PORT_GET_PINCNT(x)  (((x) & GENMASK(30, 28)) >> 28)
> +#define RZG2L_GPIO_PORT_PACK(n, a, f)  (((n) > 0 ? ((u64)(GENMASK_ULL(((=
n) - 1 + 28), 28))) : 0) | \

The mask creation can be simplified to

    ((1ULL << (n)) - 1) << 28

but see below...

> +                                        ((a) << 20) | (f))
> +#define RZG2L_GPIO_PORT_GET_PINMAP(x)  (((x) & GENMASK_ULL(35, 28)) >> 2=
8)
> +#define RZG2L_GPIO_PORT_GET_PINCNT(x)  (hweight8(RZG2L_GPIO_PORT_GET_PIN=
MAP((x))))

I think we've reached the point where it would be easier for the
casual reviewer to #define PIN_CFG_*_MASK for all fields, and use
FIELD_{PREP,GET}() to pack resp. extract values.  That would also
make it more obvious which bits are in use, and how many bits are
still available for future use.

>
>  /*
> - * BIT(31) indicates dedicated pin, p is the register index while
> + * BIT(63) indicates dedicated pin, p is the register index while
>   * referencing to SR/IEN/IOLH/FILxx registers, b is the register bits
>   * (b * 8) and f is the pin configuration capabilities supported.
>   */
> -#define RZG2L_SINGLE_PIN               BIT(31)
> +#define RZG2L_SINGLE_PIN               BIT_ULL(63)
>  #define RZG2L_SINGLE_PIN_PACK(p, b, f) (RZG2L_SINGLE_PIN | \
>                                          ((p) << 24) | ((b) << 20) | (f))
>  #define RZG2L_SINGLE_PIN_GET_BIT(x)    (((x) & GENMASK(22, 20)) >> 20)

Likewise.

> @@ -180,12 +182,12 @@ struct rzg2l_hwcfg {
>
>  struct rzg2l_dedicated_configs {
>         const char *name;
> -       u32 config;
> +       u64 config;
>  };

The rest LGTM.  It's a pity we have to switch to 64 bits, but I'm
afraid there is not much we can do about that...

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

