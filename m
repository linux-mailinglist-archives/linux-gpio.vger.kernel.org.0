Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 841E22C5237
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Nov 2020 11:43:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388155AbgKZKnA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Nov 2020 05:43:00 -0500
Received: from mail-oo1-f67.google.com ([209.85.161.67]:46361 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729386AbgKZKnA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Nov 2020 05:43:00 -0500
Received: by mail-oo1-f67.google.com with SMTP id w9so229232ooh.13;
        Thu, 26 Nov 2020 02:42:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JP/o0KCxV+hjR4qYH26j/gYgrajM2R1HBMLwhM9o1z0=;
        b=mEDq2PbdC8hFA8RZozYMrUBTBL27DsubhXeDpVOjPRcmfwWKTWWu3BEw8BQTyfZd19
         u/D4pCdthFvRD0AaC1zJCnJtpQmBgCBXrJO4uhdNtSdfR0eUNmuFTu2sqKAWPCvvGOnl
         UiaS5fU0Ij42kQDsXjdiYrNxjwTsB5urtKCUhPM3rVlxSQlcZps1T2qR1Ziu3G+8m/7I
         PX96KFs2Z2gBpxkVVGI6HxBxmiP1CE+7vqHuRajHtSR4YvE0LX3K/lZNpOgPzTXr4pWb
         EiBpz8xtRBLC+1A9tL27GcUsodsbqV1i8zRxf1q0f1rlOs0spRvYLWJ003gnLtGn61dZ
         KF5g==
X-Gm-Message-State: AOAM530WSeKdqeeLqzisNn+sVvLl/3Ib8KK7PKk08FquUdIT8QhNxGDd
        +JoYBqNbNNlY5m3niihC7c+hePrCgpldRsf6w1AvG/Ij4yg=
X-Google-Smtp-Source: ABdhPJxSUujMoQ0N/5YrOv0NkzjAOa1DYFknhYanT7tS1RZmC6dOxwX49R3l21pExpAU9KLPRmFl+mNeZMpsj+2TkBc=
X-Received: by 2002:a4a:abc9:: with SMTP id o9mr1585403oon.1.1606387377622;
 Thu, 26 Nov 2020 02:42:57 -0800 (PST)
MIME-Version: 1.0
References: <20201124043728.199852-1-damien.lemoal@wdc.com>
 <20201124043728.199852-10-damien.lemoal@wdc.com> <CAMuHMdXov3Dr7EmAeE7yrKRmtu_L3539u9cjeiGiaRu32YVPQQ@mail.gmail.com>
 <CH2PR04MB6522F476C51D4C65F116BE9EE7FB0@CH2PR04MB6522.namprd04.prod.outlook.com>
In-Reply-To: <CH2PR04MB6522F476C51D4C65F116BE9EE7FB0@CH2PR04MB6522.namprd04.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Nov 2020 11:42:46 +0100
Message-ID: <CAMuHMdU_3B4jogmeisykbeH8QCbUrKMM3Zd8qHftdGGKYbtJoQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/21] dt-bindings: Document canaan,k210-fpioa bindings
To:     Damien Le Moal <Damien.LeMoal@wdc.com>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Damien,

On Tue, Nov 24, 2020 at 11:05 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> On 2020/11/24 18:49, Geert Uytterhoeven wrote:
> > On Tue, Nov 24, 2020 at 5:40 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
> >> Document the device tree bindings for the Canaan Kendryte K210 SoC
> >> Fully Programmable IO Array (FPIOA) pinctrl driver in
> >> Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml. The
> >> new header file include/dt-bindings/pinctrl/k210-fpioa.h is added to
> >> define all 256 possible pin functions of the SoC IO pins, as well as
> >> macros simplifying the definition of pin functions in a device tree.
> >>
> >> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> >
> > Thanks for your patch!
> >
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
> >
> >> +  canaan,k210-sysctl-power:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> >> +    description: |
> >> +      phandle of the K210 system controller node and offset of the its
> >
> > of its
> >
> >> +      power domain control register.
> >
> > Your k210-sysctl-v15 branch has a bogus trailing space here.
>
> Oops. Forgot to push the fixed up patches. Just did it now (forced update
> k210-sysctl-v15).

$ make dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml:59:1:
[error] syntax error: found character '\t' that cannot start any token
(syntax)

DT binding files should use spaces, not TABs.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
