Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6CD96BAA4A
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Mar 2023 09:01:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231672AbjCOIBs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Wed, 15 Mar 2023 04:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231898AbjCOIBi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2023 04:01:38 -0400
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77DFF73007;
        Wed, 15 Mar 2023 01:01:18 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id m6so6379093qvq.0;
        Wed, 15 Mar 2023 01:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678867270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4bAr1YxX2lXoaSWFJY0KULcLlOSxq2AmJaIre8Xos3Q=;
        b=j0uT4+jZABOT4vzaAtrpnzJyo0FraYlLss24YxU5VoLblEuBtHRxonCs5fu7BoCHZL
         pukEmF2rSkDp1owQ+LUeuvJKqbW1sFEZqKQJO8WTZlSCvH8t5fG9vNhSj3x6TigpEVf0
         o8qogGWK+i3WlCK18xyavkP7APBBn7zjuG5NR5jbmiTxUJ5sYQlQQHF0kzh05T7oLu+H
         AbaGN8gF+BRMVQCy0zwfGvuz+y44euJC+g21imJO90eQuCRdYcl/XTcyMg0Ff5TzI5FP
         uJQf+7xIwcwA1wbnokwYs9E2kbNpiYlJ3f7TdCu/G08IqUqFCbVzSJd6pCj+ZTnMCrFX
         m/WQ==
X-Gm-Message-State: AO0yUKU6OR2uydrafWXBWHeTsjtQaxgdYxb1fxQQOyph5PMosmAnEo7W
        gjaAqfBBIHp2o7O5/38pVdyqMdF4F87+KV21
X-Google-Smtp-Source: AK7set91qYsWE8iC3Q8UIqBnDuS73CFoWYi6XW3mw4sgaf6ipKjsHfRHI1Jg2QnvUw5D98Nl0JykGQ==
X-Received: by 2002:a05:6214:194a:b0:570:bf43:48c with SMTP id q10-20020a056214194a00b00570bf43048cmr28074018qvk.17.1678867270024;
        Wed, 15 Mar 2023 01:01:10 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id dt5-20020a05620a478500b007456e020846sm3352262qkb.13.2023.03.15.01.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 01:01:09 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5416b0ab0ecso223252287b3.6;
        Wed, 15 Mar 2023 01:01:09 -0700 (PDT)
X-Received: by 2002:a81:ae5e:0:b0:541:a17f:c779 with SMTP id
 g30-20020a81ae5e000000b00541a17fc779mr6864622ywk.4.1678867269018; Wed, 15 Mar
 2023 01:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
 <20230306090014.128732-2-biju.das.jz@bp.renesas.com> <ZAZ4LY+xG2LGiHwh@surfacebook>
 <OS0PR01MB5922EA0703F259A99C157D3286B79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75Vd6qTG67_1DGiemy8n-mQn=9kiGrC0rEYw2XO0rm4Tbag@mail.gmail.com>
 <OS0PR01MB59224CECBB888ADC9214145286B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75VfDL74cEUQkxC1JuUB7SS1vYTPj_K7+VkQ-i-MKXad5Lw@mail.gmail.com>
 <OS0PR01MB5922CC51889D094129820C0C86B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CACRpkdZS5UKc7bDPs-zx_QyJU9GwJAhB7372oSC9tB-txgghtw@mail.gmail.com>
 <OS0PR01MB5922D0321A0779A8E78B96AA86BE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXqXg7xa3wvk3hvoxUAD+sg_OD-QpAXDpm8qdvuuDK4Rw@mail.gmail.com> <OS0PR01MB5922232D53D31CA09210A5ED86BE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922232D53D31CA09210A5ED86BE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Mar 2023 09:00:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVW+dQcCpfYJA6Xf97PXjpE4HNgN8=OgcJ4HZG_Paoymw@mail.gmail.com>
Message-ID: <CAMuHMdVW+dQcCpfYJA6Xf97PXjpE4HNgN8=OgcJ4HZG_Paoymw@mail.gmail.com>
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Biju,

On Tue, Mar 14, 2023 at 12:33 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v6 01/13] pinctrl: core: Add pinctrl_get_device()
> > On Tue, Mar 14, 2023 at 9:27 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > Subject: Re: [PATCH v6 01/13] pinctrl: core: Add
> > > > pinctrl_get_device() On Thu, Mar 9, 2023 at 3:19 PM Biju Das
> > <biju.das.jz@bp.renesas.com> wrote:
> > > > > I have an IP which detects short circuit between the output
> > > > > terminals and disable the output from pwm pins ,when it detects
> > > > > short circuit to protect from system failure.
> > > > >
> > > > > pwm-pins are involved in this operation.
> > > > >
> > > > > From user space we need to configure the type of protection for
> > > > > this pins (eg: disable PWM output, when both pwm outputs are high
> > > > > at same
> > > > time).
> > > >
> > > > Why do you want to do this from user space?
> > >
> > > To take care of the below features provided by Port Output Enable for
> > > GPT(a.k.a PWM)
> > > (POEG) IP.
> > >
> > > The output pins of the general PWM timer (GPT) can be disabled by
> > > using the port output enabling function for the GPT (POEG).
> > > Specifically, either of the following ways can be used[1].
> > >
> > > [1]
> > >
> > > Use case 1)
> > > ● Input level detection of the GTETRGA to GTETRGD pins (i.e: detect
> > > short circuit in switching circuit externally and use an external
> > > pin(GTETRGA to GTETRGD) to disable the output pins of PWM)
> > >
> > > Use case 2)
> > > ● Output-disable request from the GPT (GPT detects short circuit in
> > > switching circuit internally and disable the output pins of PWM)
> > >
> > > Use case 3)
> > > ● Register settings(Detect short circuit in switching circuit
> > > externally and use internal register to disable the output pins of
> > > PWM)
> > >
> > > The advantage of providing these options from user space is, it is
> > flexible.
> > > Runtime user can configure the use case he wants to use for his product.
> > >
> > > +Rob, + Krzysztof Kozlowski
> > >
> > > If we cannot do it in user space, then we need to make it as part of
> > > Dt bindings and users will define the use case they need in DT.
> > >
> > > Some of the failure conditions in switching circuits are like below
> > >
> > > when you use PWM push-pull configuration you SHOULD have a dead time.
> > > When + mosfet is turned off - mosfet can't be immediately turned on
> > > because you will create a direct path (short circuit) between + and -
> > > as parasitic capacitance will leave + mosfet turned on for a while .
> > > This will destroy your mosfets.
> > >
> > > Dead time is the delay measured from turning off the driver switch
> > > connected to one rail of the power supply to the time the switch
> > > connected to the other rail of the power supply is turned on.
> > > Switching devices like MOSFETs and IGBTs turn off after a delay when
> > > the gate drive is turned off. If the other switch on the half bridge
> > > is turned on immediately, both upper and lower switches may be in a
> > > conductive region for a brief moment, shorting the power rail.
> > > In order to avoid this, a dead time is maintained between turning off
> > > of one switch and turning on the other in a half bridge.
> > >
> > > POEG IP provides the below protections,
> > >
> > > 1) When the GTIOCA pin and the GTIOCB pin(PWM pins) are driven to an
> > > active level simultaneously, the PWM generates an output-disable
> > > request to the POEG. Through reception of these requests, the POEG can
> > > control whether the GTIOCA and GTIOCB pins are output-disabled
> > >
> > > 2) PWM output pins can be set to be disabled when the PWM output pins
> > > detect a dead time error or short circuit detection between the output
> > > terminals
> > >
> > > >
> > > > It sounds like something the kernel should be doing.
> > >
> > > If we cannot do the above use cases[1] in user space, then we need to
> > > make it as part of Dt bindings and it will be fully taken care in kernel.
> > >
> > > >
> > > > The kernel has a PWM subsystem, and a pin control subsystem, and we
> > > > don't even have a userspace ABI for pin control.
> > > > Pin control is designed to avoid electrical disasters and a driver
> > > > can add further policy for sure.
> > > >
> > > > If you want to add policy of different types to avoid electrical
> > > > disaster into the pin control driver, go ahead, just run it by Geert
> > > > so he's on board with the ideas.
> > >
> > > OK. Geert Can you please provide valuable suggestion how to address
> > > this use cases[1] As mentioned above?
> >
> > Is this configuration you need to do once, based on the hardware, or do you
> > need to change it at run-time?
>
> I think this configuration needed only once based on the hardware.

OK, so using DT for that would be fine.

> > Before, I was under the impression you needed to change the configuration at
> > run-time, hence the need for a sysfs API.
> > If configuration is static, DT is the way to go.
>
> At that time, I was not explored the possibility of creating poeg char device.
>
> For eg: After the initial setting in DT, I guess with poeg char device we should be able to
> achieve below use cases.
>
> Use case 1)
>  We can provide user space event indicating, Output-disable request from the GTETRGn pin occurred.
> and provide some options (rd/wr file ops) to user space to clear the fault.
>
> Use case 2)
>  We can provide user space event indicating, Output-disable request from GPT disable request occurred.
>  and provide some options(rd/wr file ops) to user space to clear the fault.
>
> Use case 3)
>  User space to control Output-disable through rd/wr file ops.
>
> Please let me know is it ok or am I missing something here??

Using a char device for that sounds fine to me.

If you just needed to clear the fault, you could use a device property in sysfs.
But that would still leave us without a way to provide events to userspace.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
