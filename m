Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A214316B1FD
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2020 22:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbgBXVSW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Feb 2020 16:18:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:34358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726980AbgBXVSW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 Feb 2020 16:18:22 -0500
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BD04221D7E;
        Mon, 24 Feb 2020 21:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582579100;
        bh=t1eTliHoc2mPAZ5+cMY6XLRoRkBliWk7pQLe/PrJWQI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IQ5Jg+rXkq7W86aSzgukHnRm7wF3TjjR/Jna466xzekRDyTwVhDBAT5AclTrdbD7T
         cNlGlb+F33za6e4LO7OgYC5Jk3lTGe6ZF0C8zGTww4lbv+gb/EderrWBWBmv307J4V
         jgMBqobB+3c4BmAybfSm8O6i6kTzYaBfqvbgLl+M=
Received: by mail-qk1-f170.google.com with SMTP id h4so10067560qkm.0;
        Mon, 24 Feb 2020 13:18:20 -0800 (PST)
X-Gm-Message-State: APjAAAWS8i+XGOFyVw+n+qQWilw9QKgIaSUxnNlne3iH+md9ZH55dglV
        CSNNZUP0A/8fCtrEfE9tAgw5Dk7PFV0ULauBjQ==
X-Google-Smtp-Source: APXvYqwElsUFz2YJr9sAnpK7fUd2MZkG+RiH3HIosqqkDZ4NSI+i7fmzLXB5Du6ldT1zi6ODN/u/qWHFAarLhawea4I=
X-Received: by 2002:ae9:f205:: with SMTP id m5mr52638795qkg.152.1582579099834;
 Mon, 24 Feb 2020 13:18:19 -0800 (PST)
MIME-Version: 1.0
References: <20200221021002.18795-1-yamada.masahiro@socionext.com>
 <20200221021002.18795-2-yamada.masahiro@socionext.com> <20200221153215.GA9815@bogus>
 <CAK7LNARhXbyUwMwXK=afXLnBVzg_MPv2D=oyn5qWkZtv12zmRg@mail.gmail.com>
 <CAL_Jsq+za-2VQ3uaLK0bUoziTyoNeL4T48F+hVv1Wy4b+5rAGA@mail.gmail.com> <CAK7LNASLaEX_Ocph88ZYMyi03KPQmr6-3mMhrZeAZCoAgUrEtQ@mail.gmail.com>
In-Reply-To: <CAK7LNASLaEX_Ocph88ZYMyi03KPQmr6-3mMhrZeAZCoAgUrEtQ@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 24 Feb 2020 15:18:08 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKZ6uZ=gEQX6akL+ASwF6ZfJJyeT_r52UaCQbaqVxxr2w@mail.gmail.com>
Message-ID: <CAL_JsqKZ6uZ=gEQX6akL+ASwF6ZfJJyeT_r52UaCQbaqVxxr2w@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: gpio: Convert UniPhier GPIO to json-schema
To:     Masahiro Yamada <masahiroy@kernel.org>
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

On Mon, Feb 24, 2020 at 10:00 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hi Rob,
>
> On Mon, Feb 24, 2020 at 11:52 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, Feb 21, 2020 at 11:33 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > Hi Rob,
> > >
> > > On Sat, Feb 22, 2020 at 12:32 AM Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Fri, 21 Feb 2020 11:10:01 +0900, Masahiro Yamada wrote:
> > > > > Convert the UniPhier GPIO controller binding to DT schema format.
> > > > >
> > > > > I omitted the 'gpio-ranges' property because it is defined in the
> > > > > dt-schema project (/schemas/gpio/gpio.yaml).
> > > > >
> > > > > As of writing, the 'gpio-ranges-group-names' is not defined in that
> > > > > file despite it is a common property described in
> > > > > Documentation/devicetree/bindings/gpio/gpio.txt
> > > > > So, I defined it in this schema.
> > > > >
> > > > > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > > > > ---
> > > > >
> > > > > I have a question about the range about 'ngpio'.
> > > > >
> > > > >   ngpios:
> > > > >     minimum: 0
> > > > >     maximum: 512
> > > > >
> > > > > The 'ngpio' property is already defined as 'uint32' in the dt-schema tool:
> > > > > https://github.com/robherring/dt-schema/blob/master/schemas/gpio/gpio.yaml#L20
> > > > >
> > > > > 'uint32' is unsigned, so 'minimum: 0' looks too obvious.
> > > > >
> > > > > I cannot omit the minimum because minimum and maximum depend on each other.
> > > > > I just put a sensible number, 512, in maximum.
> > > > >
> > > > > If this range is entirely unneeded, I will delete it.
> > > >
> > > > This property is generally for when you can have some number less
> > > > than a maximum number implied by the compatible string.
> > > >
> > > > If there is really no max (e.g. 2^32 - 1 is valid), then just do
> > > > 'ngpios: true'
> > >
> > >
> > > What does ': true' mean?
> >
> > It's a schema that always passes validation. It's purpose here is just
> > to say you are using this common property for this binding.
>
>
>
> OK, I see two useful cases:
>
> [1]
> Documenting purpose in order to clarify
> that you are using this property
>
> [2]
> You need to explicitly specify ': true'
> if you have 'additionalProperties: false' .
> Otherwise, the following warning is displayed:
> ... do not match any of the regexes: 'pinctrl-[0-9]+'
>
>
>
> For [1], it is already clear that this binding
> is using ngpios from 'require'
>
>
> require:
>   - ngpios
>
>
>
> > >
> > > If it is documented somewhere,
> > > could you point me to the reference?
> >
> > https://github.com/devicetree-org/dt-schema/blob/master/schemas/gpio/gpio.yaml
> >
> > >
> > > Even if I remove the 'ngpio' entirely
> > > from my dt-schema, the 'ngpio' is checked
> > > correctly.
> >
> > Yes, if you change it to a string value for example, it should fail.
> > (Only if DT_SCHEMA_FILES is not set without my kbuild changes)
> >
> > You should also add 'additionalProperties: false' at the top level of
> > your schema and then it will also fail if you don't list ngpios in
> > properties.
>
> Hmm, I am confused.
>
> 'require: - ngpios' will warn if you don't list ngpios.
>
> 'additionalProperties: false' will warn if you list
> other properties than what is explicitly specified.

Yeah, that's a quirk of json-schema. We could probably ensure that
anything listed in 'required' also has a property schema, but in this
case I think it's better to be explicit.

Without 'additionalProperties: false', then the validation will pass
with a 'foo-bar' property. Or worse, typos like 'ngpio', 'nrgpios',
'#gpios-cells', etc. will pass validation.

> BTW, I will not add 'additionalProperties: false'
> in this binding.
>
>
> The real DT files have
>
>  interrupt-parent = <&aidet>;
> (arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi line 324)
>
> but, commit 791d3ef2e11100449837dc0b6fe884e60ca3a484
> removed interrupt-parent from bindings.

interrupt-parent is automagically added by the tools for any node with
'interrupts'. Similarly, 'interrupts-extended' will also work.

Rob

>
>
>
>
>
> --
> Best Regards
> Masahiro Yamada
