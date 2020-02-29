Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E31F61744D9
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Feb 2020 05:16:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgB2EQn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Feb 2020 23:16:43 -0500
Received: from condef-09.nifty.com ([202.248.20.74]:33965 "EHLO
        condef-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbgB2EQm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Feb 2020 23:16:42 -0500
Received: from conssluserg-06.nifty.com ([10.126.8.85])by condef-09.nifty.com with ESMTP id 01T4DO5Q030881
        for <linux-gpio@vger.kernel.org>; Sat, 29 Feb 2020 13:13:24 +0900
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 01T4D41A025071;
        Sat, 29 Feb 2020 13:13:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 01T4D41A025071
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582949585;
        bh=a0pOxn4yBaf/CY6aaFvzsHrraptkGWxpAnq3v9ZlKRY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fOA7El3gUZ+0vookKfso5oCJGJGXdyvfax5sR2I/8GpIokf76DL8pZ24WAfMfeSsr
         U7g4VUlvoWMwe1QlKJpl07c3DuxJ/MGi0QDqFrqw6n0JpWMNuoLETbC07BHzdeAItd
         MTQLLRf2TjHMAKc/3tbB7Meg8Bk2AHfj+eeqIC3P+Qr4p1rWTzJ8zuBuapk70KdDKh
         UM/w7Twnn9o3Ak63xkR61NljF9Zv95d9dv0KWFD3oEATkysMmFDXXO2EO88kCU9Hmv
         qfPybMSMqk+vbkeDzepC1vTHr+Byx7sq7FNW+a9XY6bWhiE2oUUqJNYSbl3XJmHi+E
         +zHW1cnleh1kw==
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id a19so3132715vsp.6;
        Fri, 28 Feb 2020 20:13:05 -0800 (PST)
X-Gm-Message-State: ANhLgQ2esNiX7087hKcGA+ocLH9MW4dfAtWIvmgEEqlDDnSe/eIOFREJ
        B1qYzWTkhdM7wvHgVRKSHSbnergQsoseF/+f8F8=
X-Google-Smtp-Source: ADFU+vvxO1CRnyMOWLQZldeIlAa6RWJEku0VkeJX/ZGM7zhqt+hXfohIi/gRZqN4pvVQXSryjtSgwIaIwyqYdEqkVts=
X-Received: by 2002:a05:6102:3102:: with SMTP id e2mr4205619vsh.179.1582949583909;
 Fri, 28 Feb 2020 20:13:03 -0800 (PST)
MIME-Version: 1.0
References: <20200221021002.18795-1-yamada.masahiro@socionext.com>
 <20200221021002.18795-3-yamada.masahiro@socionext.com> <CACRpkdbrowXC-Awy_N1gq+LxuEMhgLNf81cCZ=bwZwFdJXLWDA@mail.gmail.com>
In-Reply-To: <CACRpkdbrowXC-Awy_N1gq+LxuEMhgLNf81cCZ=bwZwFdJXLWDA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 29 Feb 2020 13:12:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNASMn_xMtBa8sCj0AW2LTpSEMpv=haDhWrfkZrrKbwSeug@mail.gmail.com>
Message-ID: <CAK7LNASMn_xMtBa8sCj0AW2LTpSEMpv=haDhWrfkZrrKbwSeug@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bingings: pinctrl: Convert UniPhier pin controller
 to json-schema
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Sat, Feb 29, 2020 at 7:13 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Feb 21, 2020 at 3:10 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>
> > Convert the UniPhier pin controller binding to DT schema format.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Nice!
>
> > In the original .txt file, there is a description:
> > The UniPhier pinctrl should be a subnode of a "syscon" compatible node
> >
> > I did not figure out how to represent (or check) it in dt-schema.
> > I just moved it to a comment line in 'examples'.
> > If there is a better way, please let me know.
>
> There is no way to do that AFAICT, we are checking nodes from
> one node and downwards, never upwards. The syscon needs to
> have its own binding file: if it has another specific compatible
> such as compatible = "foo", "syscon"; then for the DT bindings
> for foo, make sure to add this subnode as optional/compulsory
> if you want to tie up the whole thing.


Thanks for your advice.


Documentation/devicetree/bindings/mfd/syscon.yaml

already contains sunxi-specific compatibles, but
I hesitate to add more and more platform-specific stuff
in this file.

Maybe, I can add

Documentation/devicetree/bindings/mfd/socionext,uniphier-soc-glue.yaml

and then, check 'reg' and compulsory sub-nodes.



> > -Required properties:
> > -- compatible: should be one of the following:
> > -    "socionext,uniphier-ld4-pinctrl"  - for LD4 SoC
> > -    "socionext,uniphier-pro4-pinctrl" - for Pro4 SoC
> > -    "socionext,uniphier-sld8-pinctrl" - for sLD8 SoC
> > -    "socionext,uniphier-pro5-pinctrl" - for Pro5 SoC
> > -    "socionext,uniphier-pxs2-pinctrl" - for PXs2 SoC
> > -    "socionext,uniphier-ld6b-pinctrl" - for LD6b SoC
> > -    "socionext,uniphier-ld11-pinctrl" - for LD11 SoC
> > -    "socionext,uniphier-ld20-pinctrl" - for LD20 SoC
> > -    "socionext,uniphier-pxs3-pinctrl" - for PXs3 SoC
>
> But:
>
> > +    soc-glue@5f800000 {
> > +        compatible = "socionext,uniphier-pro4-soc-glue", "simple-mfd", "syscon";
> > +        reg = <0x5f800000 0x2000>;
> > +
> > +        pinctrl: pinctrl {
> > +            compatible = "socionext,uniphier-pro4-pinctrl";
> > +        };
> > +    };
>
> It looks like you want to check also for "simple-mfd" and "syscon"
> following after the enum (two consts)
>
> It seems you want to check that reg is there.


Documentation/devicetree/bindings/mfd/syscon.yaml

already checks the 'reg' by the 'contains syscon' pattern,
but I can repeat it in my yaml file.

Thanks.


> It seems the subnode pinctrl is also compulsory.
>
> All of this have examples in example-schema.yaml IIRC.
>
> Yours,
> Linus Walleij



-- 
Best Regards
Masahiro Yamada
