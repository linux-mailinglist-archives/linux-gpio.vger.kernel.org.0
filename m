Return-Path: <linux-gpio+bounces-1070-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D52807269
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 15:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CE6A1C20D75
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 14:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFADD3EA73;
	Wed,  6 Dec 2023 14:30:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67C6A1BF;
	Wed,  6 Dec 2023 06:30:12 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5d747dbf81eso43225027b3.1;
        Wed, 06 Dec 2023 06:30:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701873011; x=1702477811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKgGiwP9nAffHhrzMau6NrZ+ya7fy76CJB3C0voaPJ0=;
        b=sdRKDy9GiPeJYP3lqahBlPIqqUy0OZTGMnICGHIcq7KQU8wfb3LHE4I2iaLVDnJa2Y
         qhByelZkqWwzbhiDoIM1vybQFbCuqHhdPc4UJ48/EBXdfPrFuSXTFfsJ32l4pL6nwgls
         3TwoUG8iiAxlgsSo3sc6r9DfwoN+GDfIEt/ZYFC9FnjKB2g/FZ7a6azFFGmJ+ZH1T4Fy
         qbuW0jVShvjlR1fk001ktoSEDG+gl3KWRJDe7icas5SBsWwdBfj/oFXEU2IizKLhMyy8
         0+PoL6nDw5Rk5DmN6dx+AkNJEOuTpovT+JISDl6cW7BGQvXAMsE/0nxMSJ7acoHlVelO
         ORYQ==
X-Gm-Message-State: AOJu0YzqL03If5dTpFAPlyvBqStodqeA9+Omno5RDm+B9ul8ynWZV7SL
	VpD654IAQIzGsy86mRa7BFP9xteMLn21nP3j
X-Google-Smtp-Source: AGHT+IHjDSZfWf7/GDHlgHwSwlx9oiOT6tT+oGfEiqGG3806yH0mv3K+TZzXYQ/LmntWSpcaYVObSg==
X-Received: by 2002:a81:c944:0:b0:5d7:545e:3bdd with SMTP id c4-20020a81c944000000b005d7545e3bddmr842146ywl.3.1701873011474;
        Wed, 06 Dec 2023 06:30:11 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id d17-20020a81ab51000000b005d6fb42cf39sm3801123ywk.52.2023.12.06.06.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 06:30:07 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5d3d5b10197so61975817b3.2;
        Wed, 06 Dec 2023 06:30:07 -0800 (PST)
X-Received: by 2002:a05:690c:706:b0:5d7:1941:acb with SMTP id
 bs6-20020a05690c070600b005d719410acbmr666458ywb.102.1701873007473; Wed, 06
 Dec 2023 06:30:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201131551.201503-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20231201131551.201503-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20231201131551.201503-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Dec 2023 15:29:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=1tLt0QX7jR9+2ZvYBW4BEGwM9OJQkKch3y5KLvtQww@mail.gmail.com>
Message-ID: <CAMuHMdW=1tLt0QX7jR9+2ZvYBW4BEGwM9OJQkKch3y5KLvtQww@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] riscv: dts: renesas: r9a07g043f: Update
 gpio-ranges property
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

Thanks for your patch!

On Fri, Dec 1, 2023 at 2:16=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> On RZ/Five we have additional pins compared to the RZ/G2UL SoC so update
> the gpio-ranges property in RZ/Five SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> +++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> @@ -46,6 +46,10 @@ cpu0_intc: interrupt-controller {
>         };
>  };
>
> +&pinctrl {
> +       gpio-ranges =3D <&pinctrl 0 0 232>;
> +};
> +
>  &soc {
>         dma-noncoherent;
>         interrupt-parent =3D <&plic>;

I believe this has a hard dependency on the pinctrl driver changes, due to
the following check in in rzg2l_gpio_register():

    if (of_args.args[0] !=3D 0 || of_args.args[1] !=3D 0 ||
        of_args.args[2] !=3D pctrl->data->n_port_pins) {
            dev_err(pctrl->dev, "gpio-ranges does not match selected SOC\n"=
);
            return -EINVAL;
    }

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

