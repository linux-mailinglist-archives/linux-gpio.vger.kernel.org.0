Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1652116A8D3
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2020 15:52:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727515AbgBXOwF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Feb 2020 09:52:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:59604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727474AbgBXOwF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 Feb 2020 09:52:05 -0500
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DACFC20836;
        Mon, 24 Feb 2020 14:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582555924;
        bh=XRi0OmHVHDee1GTej+sJ5OKiNNLB45ifwcR2vnGTriE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=emz3wz7Ro5hhDbUK45uRjE/GOzzpc3xgdSqBISPZkQrYw3cmsSjhpNfSPlXBLnwdE
         kcewki6VbecIyeDD3mBAJWecySt85yvGUT+/ld/07q6kFoFqVchCtenkjF8QsZxBSo
         HHcfEWbBHf1CqUCwoNQSK5oHdp8sVjA8IRaRgBf4=
Received: by mail-qk1-f177.google.com with SMTP id h4so8919657qkm.0;
        Mon, 24 Feb 2020 06:52:03 -0800 (PST)
X-Gm-Message-State: APjAAAXE3OthYOmae/owoRfw3P1tJqWVVQXkFPS+db0d25c683XV4neZ
        CwHea0iQpNgBUGgxg6qYZB1eCYskZVBEc4LaYQ==
X-Google-Smtp-Source: APXvYqy3i2A/uaXUUl5KAquMuTkYSOzGwGzbCUu+blbmGe2ksR6g/Clz7i7XiWQ/ps6CvMEUu/w8BbbZd1N4Q9aboto=
X-Received: by 2002:ae9:f205:: with SMTP id m5mr50756836qkg.152.1582555922990;
 Mon, 24 Feb 2020 06:52:02 -0800 (PST)
MIME-Version: 1.0
References: <20200221021002.18795-1-yamada.masahiro@socionext.com>
 <20200221021002.18795-2-yamada.masahiro@socionext.com> <20200221153215.GA9815@bogus>
 <CAK7LNARhXbyUwMwXK=afXLnBVzg_MPv2D=oyn5qWkZtv12zmRg@mail.gmail.com>
In-Reply-To: <CAK7LNARhXbyUwMwXK=afXLnBVzg_MPv2D=oyn5qWkZtv12zmRg@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 24 Feb 2020 08:51:50 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+za-2VQ3uaLK0bUoziTyoNeL4T48F+hVv1Wy4b+5rAGA@mail.gmail.com>
Message-ID: <CAL_Jsq+za-2VQ3uaLK0bUoziTyoNeL4T48F+hVv1Wy4b+5rAGA@mail.gmail.com>
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

On Fri, Feb 21, 2020 at 11:33 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hi Rob,
>
> On Sat, Feb 22, 2020 at 12:32 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, 21 Feb 2020 11:10:01 +0900, Masahiro Yamada wrote:
> > > Convert the UniPhier GPIO controller binding to DT schema format.
> > >
> > > I omitted the 'gpio-ranges' property because it is defined in the
> > > dt-schema project (/schemas/gpio/gpio.yaml).
> > >
> > > As of writing, the 'gpio-ranges-group-names' is not defined in that
> > > file despite it is a common property described in
> > > Documentation/devicetree/bindings/gpio/gpio.txt
> > > So, I defined it in this schema.
> > >
> > > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > > ---
> > >
> > > I have a question about the range about 'ngpio'.
> > >
> > >   ngpios:
> > >     minimum: 0
> > >     maximum: 512
> > >
> > > The 'ngpio' property is already defined as 'uint32' in the dt-schema tool:
> > > https://github.com/robherring/dt-schema/blob/master/schemas/gpio/gpio.yaml#L20
> > >
> > > 'uint32' is unsigned, so 'minimum: 0' looks too obvious.
> > >
> > > I cannot omit the minimum because minimum and maximum depend on each other.
> > > I just put a sensible number, 512, in maximum.
> > >
> > > If this range is entirely unneeded, I will delete it.
> >
> > This property is generally for when you can have some number less
> > than a maximum number implied by the compatible string.
> >
> > If there is really no max (e.g. 2^32 - 1 is valid), then just do
> > 'ngpios: true'
>
>
> What does ': true' mean?

It's a schema that always passes validation. It's purpose here is just
to say you are using this common property for this binding.

>
> If it is documented somewhere,
> could you point me to the reference?

https://github.com/devicetree-org/dt-schema/blob/master/schemas/gpio/gpio.yaml

>
> Even if I remove the 'ngpio' entirely
> from my dt-schema, the 'ngpio' is checked
> correctly.

Yes, if you change it to a string value for example, it should fail.
(Only if DT_SCHEMA_FILES is not set without my kbuild changes)

You should also add 'additionalProperties: false' at the top level of
your schema and then it will also fail if you don't list ngpios in
properties.

Rob
