Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69221EE851
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 20:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729194AbfKDT2P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 14:28:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:52714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728174AbfKDT2P (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 4 Nov 2019 14:28:15 -0500
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B58E1214E0;
        Mon,  4 Nov 2019 19:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572895693;
        bh=pt68eIojioAlUvFfemW0bhMdFB6WrpOnQ3bfAPgc+AE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OHylc50Pr11p+2uQI16beu7RqPEN8j4u8nB+YbPjZry2BCythROALHQEXKIb8IPSN
         /Ij2uXFw+35axNKhT6zFtzyKo37OrhG0VFXIAE/5dQKVTQPyjVQFZB1YYKczqa1ISu
         MVf6vW4xhhlmJQCidTtoULrO1iQdOxq5gsq5nelA=
Received: by mail-qk1-f178.google.com with SMTP id m16so18425681qki.11;
        Mon, 04 Nov 2019 11:28:13 -0800 (PST)
X-Gm-Message-State: APjAAAWKJhBUfqMaHNmoGPIOxnLbtrJ2fSSNUOC0biSxAj4XiQ53hV8l
        EIZyLB0zId4WU6G4epKvhxWs16j6/EpYytt+TA==
X-Google-Smtp-Source: APXvYqxIWjhlyQXoP3/EhmDYLOTpQ0t5Ybm7/5yMCKcuYQv/HF1ACIGPrPRERHamqHnNZnSGK9XiatayZOOA+FooTyk=
X-Received: by 2002:a37:f703:: with SMTP id q3mr24413885qkj.254.1572895692687;
 Mon, 04 Nov 2019 11:28:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
 <0182df3c49c6c804ee20ef32fc4b85b50ff45fca.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
 <ed0b2aa8-8a70-0341-4ecf-8959f37c53bd@ti.com> <5c793f1308ccc6e787260b64fe6a875a8d0eb9d0.camel@fi.rohmeurope.com>
 <20191029193440.GA1812@bogus> <3e0f0943cd599cae544bd7a7a49dded46d57a604.camel@fi.rohmeurope.com>
 <CAL_JsqJgnYqv1q=wf++5FOX-niRWQ=H9wWYgUKy+z=H933Qraw@mail.gmail.com>
 <1e3901d1c7c26f4dbbc1de78b607b92bf9ddc098.camel@fi.rohmeurope.com>
 <CAL_JsqJ6kmZyfXtZy_gz_6sxgK2CTXKTcpARkaf462QiwJXYZA@mail.gmail.com> <a8acd74fa9c6abc8c2daea9f016d035a1ef87b02.camel@fi.rohmeurope.com>
In-Reply-To: <a8acd74fa9c6abc8c2daea9f016d035a1ef87b02.camel@fi.rohmeurope.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 4 Nov 2019 13:28:01 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLWMfmRkxJr1NLi1FkHBO-NZR=ycq6kjbFpjNNM6mOV8g@mail.gmail.com>
Message-ID: <CAL_JsqLWMfmRkxJr1NLi1FkHBO-NZR=ycq6kjbFpjNNM6mOV8g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/13] dt-bindings: mfd: Document ROHM BD71828 bindings
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "broonie@kernel.org" <broonie@kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "pavel@ucw.cz" <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 1, 2019 at 7:52 AM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
>
>
> On Thu, 2019-10-31 at 12:50 -0500, Rob Herring wrote:
> > On Thu, Oct 31, 2019 at 7:54 AM Vaittinen, Matti
> > <Matti.Vaittinen@fi.rohmeurope.com> wrote:
> > >
> > > On Wed, 2019-10-30 at 14:22 -0500, Rob Herring wrote:
> > > > On Wed, Oct 30, 2019 at 3:27 AM Vaittinen, Matti
> > > > <Matti.Vaittinen@fi.rohmeurope.com> wrote:
> > > > > On Tue, 2019-10-29 at 14:34 -0500, Rob Herring wrote:
> > > > > > On Fri, Oct 25, 2019 at 05:49:17AM +0000, Vaittinen, Matti
> > > ...which brings me here. I looked at the
> > > Documentation/devicetree/bindings folder and did read the 'writing-
> > > bindings.txt' and 'submitting-patches.txt' from there. Then I also
> > > checked the Documentation/devicetree/usage-model.txt None of which
> > > helped me out. I did also open the 'writing-schema.rst' but I
> > > didn't
> > > read it carefully enough. Probably because I thought after reading
> > > the
> > > opening chapter that this described how to do actual dts in yaml.
> >
> > Things are a bit scattered around I'll admit. I feel like we need a
> > 'start here', but the challenge is people have different starting
> > points.
>
> cross-referencing? =)
>
> I guess that if yaml is what is expected to be used as patch format,
> then we should probably mention this in submitting-patches.txt and
> writing-bindings.txt.

I've actually added that to submitting-patches.txt already and
checkpatch.pl now warns for non-schema bindings. Both are pending for
5.5.

> Actyually, I think that writing-bindings.txt
> could be combined with writing-schema.rst - they are about the same
> thing, right?

Not really. writing-bindings.txt is about how to design bindings. It's
the DO's and DON'Ts that I give in review comments over and over and
over. Mostly an attempt to ensure I'm saying things that are
documented somewhere. Probably need to come up with better names, but
naming is hard(TM).


> > > > There is some notion to convert the DT spec to schema and then
> > > > generate the spec from the schema. Take properties, their type,
> > > > and
> > > > descriptions and put that back into tables for example. Would
> > > > love to
> > > > have someone work on that. :)
> > >
> > > I am glad to hear you have developed / are developing such tooling.
> >
> > TBC, I have not and am not. It's just an idea. There's been nothing
> > done beyond experimenting if rST could be embedded into yaml.
> >
> > > I
> > > really appreciate it. What comes to giving a helping hand - I'd
> > > better
> > > to stick the simple C drivers for now ;) But if I ever get the
> > > feeling
> > > that I don't know what to do I'll keep this in mind :] Let me do
> > > some
> > > calculus... Only 11 years and my youngest son will probably leave
> > > our
> > > house - do you think 2030 is a bit too late? Just let me know if
> > > this
> > > is still relevant then - and I'll buy you a beer or write a tool
> > > (of
> > > some kind) xD
> >
> > I've scheduled you in for 2030. :)
>
> Fine. Let's see if it is a beer or a tool then :]
>
> > > Meanwhile... I have tried to convert the BD71828 DT doc from the
> > > RFC
> > > patch to yaml - and I am having hard time. Especially with the
> > > regulators node - which I would like to place in
> > > Documentation/devicetree/bindings/regulator/rohm,bd71828-
> > > regulator.yaml
> > >
> > > My problem is the
> > > regulators {
> > > buck1: BUCK1 {
> > >                     regulator-name = "buck1";
> > >                     regulator-min-microvolt = <500000>;
> > >                     regulator-max-microvolt = <2000000>;
> > >                     regulator-ramp-delay = <2500>;
> > >                     rohm,dvs-runlvl-ctrl;
> > >                     rohm,dvs-runlevel0-voltage = <500000>;
> > >                     rohm,dvs-runlevel1-voltage = <506250>;
> > >                     rohm,dvs-runlevel2-voltage = <512500>;
> > >                     rohm,dvs-runlevel3-voltage = <518750>;
> > >                     regulator-boot-on;
> > >     };
> > >     ...
> > > };
> > > node which only contains BUCKX and LDOX sub-nodes. It has no own
> > > properties.
> > >
> > > From MFD yaml I did try:
> > >
> > >   regulators:
> > >     $ref: ../regulator/rohm,bd71828-regulator.yaml
> > >     description:
> > >       List of child nodes that specify the regulators.
> > >
> > > and in rohm,bd71828-regulator.yaml
> > >
> > > I tried doing:
> > >
> > > patternProperties:
> > >   "^BUCK[1-7]$":
> > >     type: object
> > >     description:
> > >       Properties for single regulator.
> > >     properties:
> > >         ...
> > >
> > > but this fails validation as properties: is not given.
> > >
> > > [mvaittin@localhost linux]$ dt-doc-validate
> > > Documentation/devicetree/bindings/regulator/rohm,bd71828-
> > > regulator.yaml
> > > /home/mvaittin/torvalds/linux/Documentation/devicetree/bindings/reg
> > > ulat
> > > or/rohm,bd71828-regulator.yaml: 'properties' is a required property
> > >
> > > If I try and add:
> > >
> > > properties:
> > >   foo: true
> > >
> > > patternProperties:
> > >     "^BUCK[1-7]$":
> > >       type: object
> > >       description:
> > >         Properties for single regulator.
> > >       properties:
> > >         ...
> >
> > That's a case of needing to adjust the meta-schema (the schema that
> > checks the schemas). It's a bit overly restrictive just to try to
> > contain what's allowed. I've fixed it now. Update dtschema and it
> > should work now.
>
> Thanks. At least the make dt_binding_check passed now. dt-doc-validate
> is not able to locate the regulator.yaml and errors out - but it does
> no longer complain about missing 'properties:'.

Either look at how Kbuild calls dt-doc-validate or just use 'make
dt_binding_check'. (It needs the base path to the schema passed in.)

Rob
