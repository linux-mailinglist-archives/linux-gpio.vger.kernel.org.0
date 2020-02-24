Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2F0716AAFB
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2020 17:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727378AbgBXQM3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Feb 2020 11:12:29 -0500
Received: from condef-09.nifty.com ([202.248.20.74]:50430 "EHLO
        condef-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727299AbgBXQM3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Feb 2020 11:12:29 -0500
X-Greylist: delayed 366 seconds by postgrey-1.27 at vger.kernel.org; Mon, 24 Feb 2020 11:12:27 EST
Received: from conssluserg-05.nifty.com ([10.126.8.84])by condef-09.nifty.com with ESMTP id 01OG0bi9015523
        for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2020 01:00:37 +0900
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 01OG0UlE011600;
        Tue, 25 Feb 2020 01:00:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 01OG0UlE011600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582560031;
        bh=rh6OBdUNfww3vfiDk7WD78TGBu735cgnzCKrnQQSFwk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=frP9VDGV+IdXmi+d2H1VLwqNi9TOUHIUpDWaGV0WsA9WBVGXo82zaO7VQ9ZV7l7lB
         cNqERuRmFO09j53hlRurJ0XJlIsdtcWE7jKsB5bLXjjxush2tHAF9DtHSnvzcD6Twb
         tfW7AnOy8BNvd+nN+Drt2gopc8j1zZZRrPTuiB8+VmO005XNNQDsqRzsRan/r29dp2
         FzopPo/MpG/p5iMhHqrK7o9Bw0Og+koZWMhRfasK0aOLol+6Gm1E1ceEAVb4pHplCe
         tonTF8rzDZBl8mHk/8qSJPQ4XB0+IcKvR39Ojwue3IKWhISkDYYqVdJa0SNdtPesZg
         qYM+IR2xN68+A==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id 7so5975443vsr.10;
        Mon, 24 Feb 2020 08:00:30 -0800 (PST)
X-Gm-Message-State: APjAAAVPy1Sba5M+aIwFGx953Qg95Uxoj38z6fOnY5i6+1JbcHP0Xo3j
        7+TO4ZLQVuleD3aS0wLGzDjPC2Yz9pxwYUdCRaI=
X-Google-Smtp-Source: APXvYqxrUculoOzlOLP1qyhLbdIH9BNbNU6LljUdGNKtFWdx+eGRpP3R6f5HAN/+ktdJA4PyOAMI8Mb0oQ0eTgUkzOM=
X-Received: by 2002:a67:fa4b:: with SMTP id j11mr27414888vsq.155.1582560029807;
 Mon, 24 Feb 2020 08:00:29 -0800 (PST)
MIME-Version: 1.0
References: <20200221021002.18795-1-yamada.masahiro@socionext.com>
 <20200221021002.18795-2-yamada.masahiro@socionext.com> <20200221153215.GA9815@bogus>
 <CAK7LNARhXbyUwMwXK=afXLnBVzg_MPv2D=oyn5qWkZtv12zmRg@mail.gmail.com> <CAL_Jsq+za-2VQ3uaLK0bUoziTyoNeL4T48F+hVv1Wy4b+5rAGA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+za-2VQ3uaLK0bUoziTyoNeL4T48F+hVv1Wy4b+5rAGA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 25 Feb 2020 00:59:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNASLaEX_Ocph88ZYMyi03KPQmr6-3mMhrZeAZCoAgUrEtQ@mail.gmail.com>
Message-ID: <CAK7LNASLaEX_Ocph88ZYMyi03KPQmr6-3mMhrZeAZCoAgUrEtQ@mail.gmail.com>
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

On Mon, Feb 24, 2020 at 11:52 PM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Feb 21, 2020 at 11:33 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Hi Rob,
> >
> > On Sat, Feb 22, 2020 at 12:32 AM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Fri, 21 Feb 2020 11:10:01 +0900, Masahiro Yamada wrote:
> > > > Convert the UniPhier GPIO controller binding to DT schema format.
> > > >
> > > > I omitted the 'gpio-ranges' property because it is defined in the
> > > > dt-schema project (/schemas/gpio/gpio.yaml).
> > > >
> > > > As of writing, the 'gpio-ranges-group-names' is not defined in that
> > > > file despite it is a common property described in
> > > > Documentation/devicetree/bindings/gpio/gpio.txt
> > > > So, I defined it in this schema.
> > > >
> > > > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > > > ---
> > > >
> > > > I have a question about the range about 'ngpio'.
> > > >
> > > >   ngpios:
> > > >     minimum: 0
> > > >     maximum: 512
> > > >
> > > > The 'ngpio' property is already defined as 'uint32' in the dt-schema tool:
> > > > https://github.com/robherring/dt-schema/blob/master/schemas/gpio/gpio.yaml#L20
> > > >
> > > > 'uint32' is unsigned, so 'minimum: 0' looks too obvious.
> > > >
> > > > I cannot omit the minimum because minimum and maximum depend on each other.
> > > > I just put a sensible number, 512, in maximum.
> > > >
> > > > If this range is entirely unneeded, I will delete it.
> > >
> > > This property is generally for when you can have some number less
> > > than a maximum number implied by the compatible string.
> > >
> > > If there is really no max (e.g. 2^32 - 1 is valid), then just do
> > > 'ngpios: true'
> >
> >
> > What does ': true' mean?
>
> It's a schema that always passes validation. It's purpose here is just
> to say you are using this common property for this binding.



OK, I see two useful cases:

[1]
Documenting purpose in order to clarify
that you are using this property

[2]
You need to explicitly specify ': true'
if you have 'additionalProperties: false' .
Otherwise, the following warning is displayed:
... do not match any of the regexes: 'pinctrl-[0-9]+'



For [1], it is already clear that this binding
is using ngpios from 'require'


require:
  - ngpios



> >
> > If it is documented somewhere,
> > could you point me to the reference?
>
> https://github.com/devicetree-org/dt-schema/blob/master/schemas/gpio/gpio.yaml
>
> >
> > Even if I remove the 'ngpio' entirely
> > from my dt-schema, the 'ngpio' is checked
> > correctly.
>
> Yes, if you change it to a string value for example, it should fail.
> (Only if DT_SCHEMA_FILES is not set without my kbuild changes)
>
> You should also add 'additionalProperties: false' at the top level of
> your schema and then it will also fail if you don't list ngpios in
> properties.

Hmm, I am confused.

'require: - ngpios' will warn if you don't list ngpios.

'additionalProperties: false' will warn if you list
other properties than what is explicitly specified.



BTW, I will not add 'additionalProperties: false'
in this binding.


The real DT files have

 interrupt-parent = <&aidet>;
(arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi line 324)

but, commit 791d3ef2e11100449837dc0b6fe884e60ca3a484
removed interrupt-parent from bindings.





--
Best Regards
Masahiro Yamada
