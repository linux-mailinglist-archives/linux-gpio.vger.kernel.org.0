Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58D76168CB3
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Feb 2020 06:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgBVFdU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 22 Feb 2020 00:33:20 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:58306 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbgBVFdT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 22 Feb 2020 00:33:19 -0500
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 01M5XDb8000801;
        Sat, 22 Feb 2020 14:33:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 01M5XDb8000801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582349594;
        bh=kfkRB8NqTSB8RfnnWhYO851m+pZCn26htPS02MwccbU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jGpTyMmaQFCA/yAC8SI4sEY5rRsGwV7n37iHBsYx0Tf7yhCGxJurnEkRnYv7mXkEJ
         JsG/XgCkElNDfWpzULElIwahEskifFcCgfbfMXCevqXYv/LoxA47zlm0vQm2c+wXks
         9sU0GorFjzp+hiEZTdTagyKsg7jPMB0IirRAzwYH6j1ZvpUe4A//reJSJZAgZdootB
         2g7WnMlVvqwRfef0X7RYd/XXHwhTzr55mpoceajykax0eZUJhKShxiuBLuEbqxsn9r
         23cnn4NQdvEhPKtWkgxQp/tWiyQ7DXLBQ2ZGCkxLv13OY12pHAVXycTmv8OGqxec2N
         bHWw0f1u66WqQ==
X-Nifty-SrcIP: [209.85.221.175]
Received: by mail-vk1-f175.google.com with SMTP id w4so1193531vkd.5;
        Fri, 21 Feb 2020 21:33:14 -0800 (PST)
X-Gm-Message-State: APjAAAX9u7kSV5E4z26VhT21c5/p6BMSVa0JSalDpoLUTvi30+AlUk11
        5KHMakTJ92TETGCzaHaUkDF5RruOVSnLL0yU3B0=
X-Google-Smtp-Source: APXvYqw0koqWOvytLQ0hXmAEc9eS7xUecajG9z93OX8duyLUDb6bva5IL7M/xtzmqsUqDWyYc6mF9iWEJjnMvLa+UjA=
X-Received: by 2002:a1f:1bc3:: with SMTP id b186mr19356263vkb.96.1582349592746;
 Fri, 21 Feb 2020 21:33:12 -0800 (PST)
MIME-Version: 1.0
References: <20200221021002.18795-1-yamada.masahiro@socionext.com>
 <20200221021002.18795-2-yamada.masahiro@socionext.com> <20200221153215.GA9815@bogus>
In-Reply-To: <20200221153215.GA9815@bogus>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 22 Feb 2020 14:32:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNARhXbyUwMwXK=afXLnBVzg_MPv2D=oyn5qWkZtv12zmRg@mail.gmail.com>
Message-ID: <CAK7LNARhXbyUwMwXK=afXLnBVzg_MPv2D=oyn5qWkZtv12zmRg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: gpio: Convert UniPhier GPIO to json-schema
To:     Rob Herring <robh@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

On Sat, Feb 22, 2020 at 12:32 AM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, 21 Feb 2020 11:10:01 +0900, Masahiro Yamada wrote:
> > Convert the UniPhier GPIO controller binding to DT schema format.
> >
> > I omitted the 'gpio-ranges' property because it is defined in the
> > dt-schema project (/schemas/gpio/gpio.yaml).
> >
> > As of writing, the 'gpio-ranges-group-names' is not defined in that
> > file despite it is a common property described in
> > Documentation/devicetree/bindings/gpio/gpio.txt
> > So, I defined it in this schema.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> > I have a question about the range about 'ngpio'.
> >
> >   ngpios:
> >     minimum: 0
> >     maximum: 512
> >
> > The 'ngpio' property is already defined as 'uint32' in the dt-schema tool:
> > https://github.com/robherring/dt-schema/blob/master/schemas/gpio/gpio.yaml#L20
> >
> > 'uint32' is unsigned, so 'minimum: 0' looks too obvious.
> >
> > I cannot omit the minimum because minimum and maximum depend on each other.
> > I just put a sensible number, 512, in maximum.
> >
> > If this range is entirely unneeded, I will delete it.
>
> This property is generally for when you can have some number less
> than a maximum number implied by the compatible string.
>
> If there is really no max (e.g. 2^32 - 1 is valid), then just do
> 'ngpios: true'


What does ': true' mean?


If it is documented somewhere,
could you point me to the reference?

Even if I remove the 'ngpio' entirely
from my dt-schema, the 'ngpio' is checked
correctly.




>
> >
> >
> >  .../bindings/gpio/gpio-uniphier.txt           | 51 -----------
> >  .../gpio/socionext,uniphier-gpio.yaml         | 89 +++++++++++++++++++
> >  MAINTAINERS                                   |  2 +-
> >  3 files changed, 90 insertions(+), 52 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-uniphier.txt
> >  create mode 100644 Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
> Error: Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.example.dts:38.34-35 syntax error
> FATAL ERROR: Unable to parse input tree
> scripts/Makefile.lib:300: recipe for target 'Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.example.dt.yaml' failed
> make[1]: *** [Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.example.dt.yaml] Error 1
> Makefile:1263: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
>
> See https://patchwork.ozlabs.org/patch/1241747
> Please check and re-submit.

OK, I will.



-- 
Best Regards
Masahiro Yamada
