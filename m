Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62C943C724C
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jul 2021 16:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236757AbhGMOho (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jul 2021 10:37:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236636AbhGMOho (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jul 2021 10:37:44 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3647BC0613DD;
        Tue, 13 Jul 2021 07:34:53 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id r132so35138990yba.5;
        Tue, 13 Jul 2021 07:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o26ZWzPRkUKxW7dKY8cTnlaNNdlHOXHXpVuJuquhP0A=;
        b=Vu1RQ75f9qBy76rHqt3Hcd0Yb+0r7nJDqi+zaGM5TdAEJKRFiJimauCSJE1b3WXTC9
         dLiu0Cogkj3K0IHdVmHuGRqvChcQJBg2xNMO78iLXN6FKuodi/ls7z/pkwdqvr+NOnYJ
         0EujToruwaAdYV6jepuXW3pYpXk6/PVW/r9fjqCMHQ3UC81NXku3ObKRm5LggfcfqW2i
         dyHhQrSJwxKkBqdknn6zGOA5GztWAVGEmND9BFTEcgyB6WQliki8ZkjG8H9vBW2tpdHS
         en8L7O+91QQVkdwF7341UpIF2on+V0KBI8O4YEMjsYvW6G0Re1KILppzl9D9vC0l/6MQ
         sdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o26ZWzPRkUKxW7dKY8cTnlaNNdlHOXHXpVuJuquhP0A=;
        b=ncr2PIZ9WDXAuo2VOGzYNApLzjO4UeC2HCeRg4PepEmbkOk5uwBLe/gHdlcUnpKTRH
         nyjKHyr21KWo0IWqq9E8MxSN/rSxhOcqxkRCaRwVf9GTBSY3+EULle8yXH/BxDMzeJg4
         hNF0w8a86BQyUuvHRAuaDAe9kLNznsB+8UsxE+cW5fWXC9Dj7jeb6J0Us2vS2rZGKVuq
         zCIfunk5QatcLVq6GN85vp9BswcUrOowApFVWAJZD6ghuUhY6nk4hLgOK9bavsFvdVe1
         jxOaILJkdtIKK6ZFgPwT5UAo/b1Fc8XYlLTq/pf37isr+XB/5JQDHbLy8ctdMNDKInO7
         B8HA==
X-Gm-Message-State: AOAM533hFA8x5SgZW6X3Cp8eeQ/IMUwicduN1obWyIRsUWsupxkzLkKf
        LjInwN04sZpSkLRjliu971rYQqN99zMCtrrVzFA=
X-Google-Smtp-Source: ABdhPJyJ7Xf38f0WykdTNWoI680e4zcq7wrLMtkjotg66KWRFaSxmNQfshRrUqs2zFuHBAK1fPsTzIZmlxINm8JYY5s=
X-Received: by 2002:a25:d491:: with SMTP id m139mr6192892ybf.156.1626186892341;
 Tue, 13 Jul 2021 07:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210712194422.12405-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210712194422.12405-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <53e6c8fa-311f-f100-dd06-d806ab593488@gmail.com>
In-Reply-To: <53e6c8fa-311f-f100-dd06-d806ab593488@gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 13 Jul 2021 15:34:26 +0100
Message-ID: <CA+V-a8uB-QmtYjBQ7sondsfeQvBOMhmsYPd=0R4TrxzvO=zs6w@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: renesas: rzg2l-smarc: Add scif0 pins
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Sergei,

Thank you for the review.

On Tue, Jul 13, 2021 at 12:18 PM Sergei Shtylyov
<sergei.shtylyov@gmail.com> wrote:
>
> On 12.07.2021 22:44, Lad Prabhakar wrote:
>
> > Add scif0 pins in pinctrl node and update the scif0 node
> > to include pinctrl property.
>
>     Properties? There are a couple... :-)
>
Agreed will update the commit message.

Cheers,
Prabhakar

> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >   arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > index adcd4f50519e..0987163f25ee 100644
> > --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> [...]
> >       clock-frequency = <24000000>;
> >   };
> >
> > +&pinctrl {
> > +     scif0_pins: scif0 {
> > +             pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>, /* TxD */
> > +                      <RZG2L_PORT_PINMUX(38, 1, 1)>; /* RxD */
> > +     };
> > +};
> > +
> >   &scif0 {
> > +     pinctrl-0 = <&scif0_pins>;
> > +     pinctrl-names = "default";
> >       status = "okay";
> >   };
> >
>
> MBR, Sergei
