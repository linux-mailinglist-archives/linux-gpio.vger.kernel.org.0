Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC2B93BA794
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Jul 2021 08:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbhGCGsi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Jul 2021 02:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbhGCGsh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Jul 2021 02:48:37 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 468E3C061765
        for <linux-gpio@vger.kernel.org>; Fri,  2 Jul 2021 23:46:04 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id 22-20020a17090a0c16b0290164a5354ad0so10771961pjs.2
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jul 2021 23:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=In75uxFR1f0iXFnBnQMn4UIW5uQb27tGmOe3rOogkRU=;
        b=YNnAZq2AKyT9OOLR+3d2bWD1lC1lF4flke9oKN3/785NvB132pNtaZ30aSz0StJoXp
         kgAiNDKb4EohrIW0HzJifWeHOx58nE8OH0Z+81AT3WUO/S9jYP0fctUIECHJ2dYodCJ5
         DIu5FJiHIqgcnRwWufYGzxUsrSCQQU+uX5NxsXbiX5kgVBEeQyvs/2pWdvKxmM3vZILS
         3TXTrTJ2t1jqQUNDLReT8omjNu36VmGmISofUAqFVInOfxrf/1eFao6WXZS82VimFIhn
         XzDp84Sm91ytaXTj7x7j+ejlUpAIqjdlB+BszbTjR8PwmkQMqTcH9TPXlEnoKJ4ilark
         lL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=In75uxFR1f0iXFnBnQMn4UIW5uQb27tGmOe3rOogkRU=;
        b=hIgFklTUY3TE/HD0zBBH+MRcjSUBlKOhYTe5TV1ZJVTTHLWozltVEpohY5661xaxAZ
         bUKPulBZZIqFlPLQ58ueh74ookSPOrAWG/GePM2a50zFlGCPj7T26MIE3MstxeMJLPBr
         A2tovs6jKs4Y3OBhHr9qNvyeKumGQpnZCJGaLKEnJ/EEjTO/WCTqmg0MsPI8KSdB+jxG
         Rr5YJm/O2Cj2+WFFGY2RXRrA/EGhwkdikYIG34z29xakd1/sCn1BpzDbo0hbF3bACXHt
         MP9YQO9wStYY6OE8mAXAkoAjQIGKaAbn3OrxEShhci34NRXlwU4PmYezFStEcVfsnIEj
         usFw==
X-Gm-Message-State: AOAM533NJK+My1h8Jhl/50FmojTB4az8w35fopHYV5RtngTk540gXrik
        3xTyEFGUVALeHBTtpNY9ijgLiA==
X-Google-Smtp-Source: ABdhPJxzXYoxFlZenjuKy8bSI01iltLabOUzGbF3FFBEv+o6bfNo0jh0C+KUc52cTnj08U8ibFh1gQ==
X-Received: by 2002:a17:90a:c484:: with SMTP id j4mr363259pjt.218.1625294763472;
        Fri, 02 Jul 2021 23:46:03 -0700 (PDT)
Received: from x1 ([2601:1c0:4701:ae70:f236:257f:88f9:445e])
        by smtp.gmail.com with ESMTPSA id s8sm2733556pfg.190.2021.07.02.23.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 23:46:02 -0700 (PDT)
Date:   Fri, 2 Jul 2021 23:46:00 -0700
From:   Drew Fustini <drew@beagleboard.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Huan Feng <huan.feng@starfivetech.com>
Subject: Re: [RFC PATH 1/2] dt-bindings: gpio: add starfive,jh7100-gpio
 bindings
Message-ID: <20210703064600.GA1050194@x1>
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-2-drew@beagleboard.org>
 <CAMuHMdWLNy6_CnFEYDvHSEdMYH=T_Fy=DCjZCF9kPGWcD-B0Qw@mail.gmail.com>
 <20210702205622.GA1035183@x1>
 <CAMuHMdXiebr7SnpShhcN9BPyha+=n=cNiX88q0wMVLrDY0r=qA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXiebr7SnpShhcN9BPyha+=n=cNiX88q0wMVLrDY0r=qA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 02, 2021 at 11:03:56PM +0200, Geert Uytterhoeven wrote:
> Hi Drew,
> 
> On Fri, Jul 2, 2021 at 10:56 PM Drew Fustini <drew@beagleboard.org> wrote:
> > On Thu, Jul 01, 2021 at 10:34:56AM +0200, Geert Uytterhoeven wrote:
> > > On Thu, Jul 1, 2021 at 2:22 AM Drew Fustini <drew@beagleboard.org> wrote:
> > > > Add bindings for the GPIO controller in the StarFive JH7100 SoC [1].
> > > >
> > > > [1] https://github.com/starfive-tech/beaglev_doc
> > > >
> > > > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > > > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> > >
> > > Thanks for your patch!
> > >
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/gpio/starfive,jh7100-gpio.yaml
> > > > @@ -0,0 +1,60 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/gpio/starfive,jh7100-gpio.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: StarFive JH7100 GPIO controller
> > > > +
> > > > +maintainers:
> > > > +  - Huan Feng <huan.feng@starfivetech.com>
> > > > +  - Drew Fustini <drew@beagleboard.org>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - const: starfive,jh7100-gpio
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  interrupts:
> > > > +    description:
> > > > +      Interrupt mapping, one per GPIO. Maximum 32 GPIOs.
> > > > +    minItems: 1
> > > > +    maxItems: 32
> > >
> > > What about clocks and resets?
> >
> > Thank you for your feedback, Geert.
> >
> > GPIO controller uses clk_apb1_bus under dom0_sys.  I believe the device
> > tree node would use something like this:
> >
> >   clocks = <&clkgen JH7100_CLK_APB1>;
> >
> > I see the sifive-gpio.yaml has:
> >
> >   clocks:
> >     maxItems: 1
> >
> > Would that be the correct way to do it for the starfive gpio yaml?
> 
> Yep.
> 
> > The reset for GPIO controller is presetn under dom_sys.  Do you think
> > know you know an example that has reset in the YAML?  Is there some code
> > that would actually make use of that information?
> >
> > >
> > > > +
> > > > +  gpio-controller: true
> > > > +
> > > > +  "#gpio-cells":
> > > > +    const: 2
> > > > +
> > > > +  interrupt-controller: true
> > > > +
> > > > +  "#interrupt-cells":
> > > > +    const: 2
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - interrupts
> > > > +  - interrupt-controller
> > > > +  - "#interrupt-cells"
> > > > +  - "#gpio-cells"
> > > > +  - gpio-controller
> >
> > Do you think I should add 'clocks' to 'required:'?
> 
> I'm still having issues with i2c if the GPIO block lists a clock, due to
> fw_devlink dependencies.
> 
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +      gpio@11910000 {
> > > > +        compatible = "starfive,jh7100-gpio";
> > > > +        reg = <0x11910000 0x10000>;
> > > > +        gpio-controller;
> > > > +        #gpio-cells = <2>;
> > > > +        interrupt-controller;
> > > > +        #interrupt-cells = <2>;
> > > > +        interrupts = <32>;
> >
> > I would add:
> >
> >   clocks = <&clkgen JH7100_CLK_APB1>;
> >
> > But I am not sure how reset would work?
> 
> That should become "resets = <&rstgen JH7100_RSTN_GPIO_APB>",
> but we don't have the reset controller in Linux yet (we do in barebox).

Do you think I should add reset item like this?

  resets:
    maxItems: 1

I suppose this is supposed to describe the hardware and it shouldn't
matter whether or not Linux uses the property, right?

Thank you,
Drew
