Return-Path: <linux-gpio+bounces-694-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C35E7FDB7E
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 16:32:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE1881C20945
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 15:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8EC238DFE;
	Wed, 29 Nov 2023 15:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A7451980;
	Wed, 29 Nov 2023 07:32:04 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-db527023652so615835276.3;
        Wed, 29 Nov 2023 07:32:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701271923; x=1701876723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4vTG8Hn0SjV13nxaNu0/LCBSnyuhM59vYVhKd+lgjk=;
        b=Y5mWtG57AbHu8VEZR/evz8d3hqEr0Y/g4WCbAGMcscQfp/adYYZwptXAkVsN/Tkba1
         097VXv1DcNvYR/OiLrfItGivK/tohQSl4yk/SAI4eutek7qjwNgdP7wzKaVyryiN91mE
         Wre6oO2fsO7GE30GWlepWppDTIyxEeX5iFPfrvj7kuHmx7tvQHE2XfMtgWRGcoNJKbkb
         wtQ6CsNRGlSzd5E17EbAHEvNAwPk5BGBxc2/pgKLALY5V5neVMhEhnJQ94WiJbYtKjKE
         k8MgeD/Fey+SifnSlxCKxggbgauzRLoZbiZhf11jeemZH9ovFw3DRGeYeHoqJqEp0WB4
         ggQA==
X-Gm-Message-State: AOJu0YzwJfS6U9A9nOd82q36BKh+A4GVCJ6luSJr5f6rYNHqI6XtRAdl
	Kh4FNqL4NEhoBkXpQeJCvhcfqIOq1v3VhA==
X-Google-Smtp-Source: AGHT+IFoaIggFrWqGlHroWcJZ3Dkpos4tSHNDNIS7ZCv/ZV6OuM8iFA+yTxeun+1JYU72098usIB7A==
X-Received: by 2002:a25:2417:0:b0:da3:ab31:ce22 with SMTP id k23-20020a252417000000b00da3ab31ce22mr16778335ybk.2.1701271923341;
        Wed, 29 Nov 2023 07:32:03 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id z6-20020a256646000000b00da0c63aa9f1sm4113831ybm.20.2023.11.29.07.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 07:32:03 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5cc642e4c69so69637447b3.0;
        Wed, 29 Nov 2023 07:32:02 -0800 (PST)
X-Received: by 2002:a81:9a97:0:b0:5d2:b29a:5e08 with SMTP id
 r145-20020a819a97000000b005d2b29a5e08mr1119149ywg.17.1701271922781; Wed, 29
 Nov 2023 07:32:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231017104638.201260-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CA+V-a8t3sGn83vpgjECf5dw=bbz2yPXpnn+v2Dx2q3yJRPsKgA@mail.gmail.com>
In-Reply-To: <CA+V-a8t3sGn83vpgjECf5dw=bbz2yPXpnn+v2Dx2q3yJRPsKgA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Nov 2023 16:31:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXMRj4quvO87LbLHCCLr14EK2AXsvr_muTDrBrA8+BMjg@mail.gmail.com>
Message-ID: <CAMuHMdXMRj4quvO87LbLHCCLr14EK2AXsvr_muTDrBrA8+BMjg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add missing port pins for RZ/Five SoC
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, Nov 29, 2023 at 3:44=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Tue, Oct 17, 2023 at 11:47=E2=80=AFAM Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> > This patch series intends to incorporate the absent port pins P19 to P2=
8,
> > which are exclusively available on the RZ/Five SoC.
> >
> > Cheers,
> > Prabhakar
> >
> > RFC -> v2:
> > * Fixed review comments pointed by Geert & Biju
> >
> > RFC: https://lore.kernel.org/lkml/20230630120433.49529-3-prabhakar.maha=
dev-lad.rj@bp.renesas.com/T/
> >
> > Lad Prabhakar (3):
> >   pinctrl: renesas: rzg2l: Include pinmap in RZG2L_GPIO_PORT_PACK()
> >     macro
> >   pinctrl: renesas: pinctrl-rzg2l: Add the missing port pins P19 to P28
> >   riscv: dts: renesas: r9a07g043f: Update gpio-ranges property
> >
> >  arch/riscv/boot/dts/renesas/r9a07g043f.dtsi |   4 +
> >  drivers/pinctrl/renesas/pinctrl-rzg2l.c     | 263 ++++++++++++++++++--
> >  2 files changed, 242 insertions(+), 25 deletions(-)
> >
> Gentle ping.

As the kernel test robot reported a build issue for PATCH 1/3, I had
removed this series from my review queue.
Do you still want me to review v2, or do you want to send a v3 first?

Thanks!

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

