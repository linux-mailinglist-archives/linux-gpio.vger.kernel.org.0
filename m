Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14FFA3BA4DB
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 22:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231559AbhGBU67 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 16:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230274AbhGBU66 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jul 2021 16:58:58 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC46C061762
        for <linux-gpio@vger.kernel.org>; Fri,  2 Jul 2021 13:56:26 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id a127so10113810pfa.10
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jul 2021 13:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1AEvcX79wTwRSqbgBLrkHdiDfFShg8BM5FD9raF2EWY=;
        b=IKuq5TByHH3DkX3ppDM5EBgRgnaAP3gRxzEx/9k8gJBKVC2i35+kz++q7w1A9sq8JK
         JIe1c7iiGsUtCfUQBtZ1rmKNuKFnY9UJlS3Iyx66zNFBQg2cPztZkL+tPnuQW9g5stJO
         LofVqXnk0H3/nl3BiqcovVZdRYE/OGJxIczEKYEz3eggxQATcNROQVhd8hOkxxgcj30F
         NwBFRw1hXahDBiHBoCdhHV7F3jGZ6LH00hhgSFQqx9kmU0LCbpw6JJBPhehoZi9fixSo
         klkKgmmuHew3Sm0ZZCO8V4IZ5H1kjDrOtBhoxyE1HwvAv2zHOVLJtCCjk9yo93bQCGns
         BlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1AEvcX79wTwRSqbgBLrkHdiDfFShg8BM5FD9raF2EWY=;
        b=WvcIDKTi8Q+R6iV52Wg0VPXcOPjjBEIk/WgUEWh/55jTOc4oL7EXvitvJOeJhiXHi4
         v7XB5/7lzkcw2zX3QIMwnLEIv40Ckuw2c14c8ut47yYeDWWmu+tMtpvH4STrCZOvsXq4
         rRo7AAFeIYLRrIvZNcYZIqsVAsyVXBfkBoC9DNVLg7ZjCV0X9R63nK18aGi/C0FF0QaH
         7C0PzqB+UJaxVUe5DJQ84qJTRFGhAiXPZNzaCmKcbBZKdajFxUQMKKeSmnGjsdTFVe0Q
         uP0ozvDLlu4wLx2ognrwUtGr7fkU1UAloSFEWTJEmkj+HxpCtIJyKm+c/UbMWS7Ev4CB
         tIIg==
X-Gm-Message-State: AOAM533Jopnc/c0aZtQKrIONIk7LpUFQMOJfk6YnpCWETx/nB2hUoIq0
        EZzbAkHE5UGZ0fvbMMvxnfhnmA==
X-Google-Smtp-Source: ABdhPJy//fWJHUgOfLQXNO5yR56HJiJp3eYtU+jnWyQxCWPl2c7tstUnyhlF0EcmYQlhyMVWmYGR+w==
X-Received: by 2002:a63:6246:: with SMTP id w67mr1850437pgb.66.1625259385386;
        Fri, 02 Jul 2021 13:56:25 -0700 (PDT)
Received: from x1 ([2601:1c0:4701:ae70:f236:257f:88f9:445e])
        by smtp.gmail.com with ESMTPSA id j16sm4908574pgh.69.2021.07.02.13.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 13:56:24 -0700 (PDT)
Date:   Fri, 2 Jul 2021 13:56:22 -0700
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
Message-ID: <20210702205622.GA1035183@x1>
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-2-drew@beagleboard.org>
 <CAMuHMdWLNy6_CnFEYDvHSEdMYH=T_Fy=DCjZCF9kPGWcD-B0Qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWLNy6_CnFEYDvHSEdMYH=T_Fy=DCjZCF9kPGWcD-B0Qw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 01, 2021 at 10:34:56AM +0200, Geert Uytterhoeven wrote:
> Hi Drew,
> 
> On Thu, Jul 1, 2021 at 2:22 AM Drew Fustini <drew@beagleboard.org> wrote:
> > Add bindings for the GPIO controller in the StarFive JH7100 SoC [1].
> >
> > [1] https://github.com/starfive-tech/beaglev_doc
> >
> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> 
> Thanks for your patch!
> 
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/starfive,jh7100-gpio.yaml
> > @@ -0,0 +1,60 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpio/starfive,jh7100-gpio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: StarFive JH7100 GPIO controller
> > +
> > +maintainers:
> > +  - Huan Feng <huan.feng@starfivetech.com>
> > +  - Drew Fustini <drew@beagleboard.org>
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: starfive,jh7100-gpio
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    description:
> > +      Interrupt mapping, one per GPIO. Maximum 32 GPIOs.
> > +    minItems: 1
> > +    maxItems: 32
> 
> What about clocks and resets?

Thank you for your feedback, Geert.

GPIO controller uses clk_apb1_bus under dom0_sys.  I believe the device
tree node would use something like this:

  clocks = <&clkgen JH7100_CLK_APB1>;

I see the sifive-gpio.yaml has:

  clocks:
    maxItems: 1

Would that be the correct way to do it for the starfive gpio yaml?


The reset for GPIO controller is presetn under dom_sys.  Do you think
know you know an example that has reset in the YAML?  Is there some code
that would actually make use of that information?

> 
> > +
> > +  gpio-controller: true
> > +
> > +  "#gpio-cells":
> > +    const: 2
> > +
> > +  interrupt-controller: true
> > +
> > +  "#interrupt-cells":
> > +    const: 2
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - interrupt-controller
> > +  - "#interrupt-cells"
> > +  - "#gpio-cells"
> > +  - gpio-controller

Do you think I should add 'clocks' to 'required:'?

> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +      gpio@11910000 {
> > +        compatible = "starfive,jh7100-gpio";
> > +        reg = <0x11910000 0x10000>;
> > +        gpio-controller;
> > +        #gpio-cells = <2>;
> > +        interrupt-controller;
> > +        #interrupt-cells = <2>;
> > +        interrupts = <32>;

I would add:

  clocks = <&clkgen JH7100_CLK_APB1>;

But I am not sure how reset would work?


Thank you,
Drew
