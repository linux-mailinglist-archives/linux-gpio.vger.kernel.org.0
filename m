Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA6B06B8ED1
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Mar 2023 10:33:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbjCNJdZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 14 Mar 2023 05:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbjCNJdY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2023 05:33:24 -0400
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A39B16B32E;
        Tue, 14 Mar 2023 02:33:21 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id s12so15980938qtq.11;
        Tue, 14 Mar 2023 02:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678786400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7XbWMDY02aVFXblAgDLLKxMSPg9BGDC2vsGo+cpiDY=;
        b=0jCBGej6i/aM/rmVVH76hH4X9IP2rViL0TCu06tpZeR22prwQs/KhQhbcttD7++H7t
         NVf8fim9uqaoZzPZ2gEKoWCduLFkmWI37yKjZdwKPM+K5DIgHQGqjfyIU/0EM4M36yYS
         plryRGSSPYRXKrqfF9qJ9CD+rbxtGGT8GMBgex1/4pCM8x1nUA8HMu3cO1uN/tGvbaBa
         2jbF/cAilzjAOMilUoejbasvrg94Rca7Z+dfgPwhTxGELfpTkfrCWrM9DiRHvQsFgsgm
         Lzjft9KEmwI+PZx7DJ04KxPHdqwof3bJQcWYFgHq8n899Nmv6IEAyPKO+5TtwT3qffkr
         vCKQ==
X-Gm-Message-State: AO0yUKVljzbOn+NTG4jk76YDriE7Y6ZbvuwNBwmu6LdRL546PefuyRT7
        ot9xaQpHesK+9QHbZt9lwFrDUBOwt4C2Uw==
X-Google-Smtp-Source: AK7set84z2AQkm1zV5ltJHpNZZHTlGsXadh9E9qFmnzzCxUG2cZMIdZv+k4kO8PRYgBMLpUdibhrBA==
X-Received: by 2002:ac8:7dc9:0:b0:3d2:3257:215c with SMTP id c9-20020ac87dc9000000b003d23257215cmr2472187qte.42.1678786400580;
        Tue, 14 Mar 2023 02:33:20 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id i7-20020a378607000000b007422eee8058sm1386655qkd.125.2023.03.14.02.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 02:33:19 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-536af432ee5so293441857b3.0;
        Tue, 14 Mar 2023 02:33:19 -0700 (PDT)
X-Received: by 2002:a81:ae18:0:b0:52e:b22b:f99 with SMTP id
 m24-20020a81ae18000000b0052eb22b0f99mr24440964ywh.4.1678786399207; Tue, 14
 Mar 2023 02:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
 <20230306090014.128732-2-biju.das.jz@bp.renesas.com> <ZAZ4LY+xG2LGiHwh@surfacebook>
 <OS0PR01MB5922EA0703F259A99C157D3286B79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75Vd6qTG67_1DGiemy8n-mQn=9kiGrC0rEYw2XO0rm4Tbag@mail.gmail.com>
 <OS0PR01MB59224CECBB888ADC9214145286B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75VfDL74cEUQkxC1JuUB7SS1vYTPj_K7+VkQ-i-MKXad5Lw@mail.gmail.com>
 <OS0PR01MB5922CC51889D094129820C0C86B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CACRpkdZS5UKc7bDPs-zx_QyJU9GwJAhB7372oSC9tB-txgghtw@mail.gmail.com> <OS0PR01MB5922D0321A0779A8E78B96AA86BE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922D0321A0779A8E78B96AA86BE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Mar 2023 10:33:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXqXg7xa3wvk3hvoxUAD+sg_OD-QpAXDpm8qdvuuDK4Rw@mail.gmail.com>
Message-ID: <CAMuHMdXqXg7xa3wvk3hvoxUAD+sg_OD-QpAXDpm8qdvuuDK4Rw@mail.gmail.com>
Subject: Re: [PATCH v6 01/13] pinctrl: core: Add pinctrl_get_device()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Biju,

On Tue, Mar 14, 2023 at 9:27 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v6 01/13] pinctrl: core: Add pinctrl_get_device()
> > On Thu, Mar 9, 2023 at 3:19 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > I have an IP which detects short circuit between the output terminals
> > > and disable the output from pwm pins ,when it detects short circuit to
> > > protect from system failure.
> > >
> > > pwm-pins are involved in this operation.
> > >
> > > From user space we need to configure the type of protection for this
> > > pins (eg: disable PWM output, when both pwm outputs are high at same
> > time).
> >
> > Why do you want to do this from user space?
>
> To take care of the below features provided by Port Output Enable for GPT(a.k.a PWM)
> (POEG) IP.
>
> The output pins of the general PWM timer (GPT) can be disabled by
> using the port output enabling function for the GPT (POEG).
> Specifically, either of the following ways can be used[1].
>
> [1]
>
> Use case 1)
> ● Input level detection of the GTETRGA to GTETRGD pins (i.e: detect short circuit in switching circuit
> externally and use an external pin(GTETRGA to GTETRGD) to disable the output pins of PWM)
>
> Use case 2)
> ● Output-disable request from the GPT (GPT detects short circuit in switching circuit internally and
> disable the output pins of PWM)
>
> Use case 3)
> ● Register settings(Detect short circuit in switching circuit
> externally and use internal register to disable the output pins of PWM)
>
> The advantage of providing these options from user space is, it is flexible.
> Runtime user can configure the use case he wants to use for his product.
>
> +Rob, + Krzysztof Kozlowski
>
> If we cannot do it in user space, then we need to make it as part of
> Dt bindings and users will define the use case they need in DT.
>
> Some of the failure conditions in switching circuits are like below
>
> when you use PWM push-pull configuration you SHOULD have a dead time.
> When + mosfet is turned off - mosfet can't be immediately turned on
> because you will create a direct path (short circuit) between + and -
> as parasitic capacitance will leave + mosfet turned on for a while .
> This will destroy your mosfets.
>
> Dead time is the delay measured from turning off the driver switch
> connected to one rail of the power supply to the time the switch
> connected to the other rail of the power supply is turned on.
> Switching devices like MOSFETs and IGBTs turn off after a delay
> when the gate drive is turned off. If the other switch on the half
> bridge is turned on immediately, both upper and lower switches may be
> in a conductive region for a brief moment, shorting the power rail.
> In order to avoid this, a dead time is maintained between turning off
> of one switch and turning on the other in a half bridge.
>
> POEG IP provides the below protections,
>
> 1) When the GTIOCA pin and the GTIOCB pin(PWM pins) are driven to an active level simultaneously, the
> PWM generates an output-disable request to the POEG. Through reception of these requests,
> the POEG can control whether the GTIOCA and GTIOCB pins are output-disabled
>
> 2) PWM output pins can be set to be disabled when the PWM output pins detect a dead time error
> or short circuit detection between the output terminals
>
> >
> > It sounds like something the kernel should be doing.
>
> If we cannot do the above use cases[1] in user space, then we need to make it as part of
> Dt bindings and it will be fully taken care in kernel.
>
> >
> > The kernel has a PWM subsystem, and a pin control subsystem, and we don't
> > even have a userspace ABI for pin control.
> > Pin control is designed to avoid electrical disasters and a driver can add
> > further policy for sure.
> >
> > If you want to add policy of different types to avoid electrical disaster
> > into the pin control driver, go ahead, just run it by Geert so he's on board
> > with the ideas.
>
> OK. Geert Can you please provide valuable suggestion how to address this use cases[1]
> As mentioned above?

Is this configuration you need to do once, based on the hardware,
or do you need to change it at run-time?

Before, I was under the impression you needed to change the
configuration at run-time, hence the need for a sysfs API.
If configuration is static, DT is the way to go.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
