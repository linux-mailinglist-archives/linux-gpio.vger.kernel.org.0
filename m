Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10991EB65A
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2019 18:51:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728561AbfJaRvO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Oct 2019 13:51:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:48364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726602AbfJaRvO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 31 Oct 2019 13:51:14 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1B1E42067D;
        Thu, 31 Oct 2019 17:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572544272;
        bh=zhmMKUTLwGOLkNxC1vCZG7S32lZJoG/WRDbEbnRFarU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oT65MvjP6peplfZ/wSFv/rFNulH7Vb0RS4ke6ddCDvWxZz/42xCRCbszNzLb6dzee
         Y7toaGN7SLHU3pvsILgd8qa0fQaaDRW6FjJP7ybHSPadv7Dvo/OjGs/rc4NGSYH4Cm
         reZSMMYJJRK81PTFXIPGhur/pKJbzbEPhuIKUgm0=
Received: by mail-qk1-f180.google.com with SMTP id e66so7847314qkf.13;
        Thu, 31 Oct 2019 10:51:12 -0700 (PDT)
X-Gm-Message-State: APjAAAUobNGqUwA36oEJY1deW1yHQoqGiJs2c0b/Kdo3a133x5t9yizh
        uJI1vn7jqKin4iAyEM2vFuHixrxTAElgqsSnZA==
X-Google-Smtp-Source: APXvYqyyBycVGgR82w3nJ2gAeNKcxZHW7J9XVnJiGMY/B+GhYIuxpzQdNSLNOx3KK09ue5JgLjpNGUGDtH1dwXd4I9s=
X-Received: by 2002:a37:9847:: with SMTP id a68mr6570552qke.223.1572544271035;
 Thu, 31 Oct 2019 10:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
 <0182df3c49c6c804ee20ef32fc4b85b50ff45fca.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
 <ed0b2aa8-8a70-0341-4ecf-8959f37c53bd@ti.com> <5c793f1308ccc6e787260b64fe6a875a8d0eb9d0.camel@fi.rohmeurope.com>
 <20191029193440.GA1812@bogus> <3e0f0943cd599cae544bd7a7a49dded46d57a604.camel@fi.rohmeurope.com>
 <CAL_JsqJgnYqv1q=wf++5FOX-niRWQ=H9wWYgUKy+z=H933Qraw@mail.gmail.com> <1e3901d1c7c26f4dbbc1de78b607b92bf9ddc098.camel@fi.rohmeurope.com>
In-Reply-To: <1e3901d1c7c26f4dbbc1de78b607b92bf9ddc098.camel@fi.rohmeurope.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 31 Oct 2019 12:50:59 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ6kmZyfXtZy_gz_6sxgK2CTXKTcpARkaf462QiwJXYZA@mail.gmail.com>
Message-ID: <CAL_JsqJ6kmZyfXtZy_gz_6sxgK2CTXKTcpARkaf462QiwJXYZA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/13] dt-bindings: mfd: Document ROHM BD71828 bindings
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "lee.jones@linaro.org" <lee.jones@linaro.org>,
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
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "broonie@kernel.org" <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 31, 2019 at 7:54 AM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
>
>
> On Wed, 2019-10-30 at 14:22 -0500, Rob Herring wrote:
> > On Wed, Oct 30, 2019 at 3:27 AM Vaittinen, Matti
> > <Matti.Vaittinen@fi.rohmeurope.com> wrote:
> > >
> > > On Tue, 2019-10-29 at 14:34 -0500, Rob Herring wrote:
> > > > On Fri, Oct 25, 2019 at 05:49:17AM +0000, Vaittinen, Matti wrote:
> > > > > Hello Dan,
> > > > >
> > > > > Thanks again for checking this :)
> > > > >
> > > > > On Thu, 2019-10-24 at 14:35 -0500, Dan Murphy wrote:
> > > > > > Matti
> > > > > >
> > > > > > On 10/24/19 6:41 AM, Matti Vaittinen wrote:
> > > > > > > ROHM BD71828 Power management IC integrates 7 buck
> > > > > > > converters,
> > > > > > > 7
> > > > > > > LDOs,
> > > > > > > a real-time clock (RTC), 3 GPO/regulator control pins, HALL
> > > > > > > input
> > > > > > > and a 32.768 kHz clock gate.
> > > > > > >
> > > > > > > Document the dt bindings drivers are using.
> > > > > > >
> > > > > > > Signed-off-by: Matti Vaittinen <
> > > > > > > matti.vaittinen@fi.rohmeurope.com>
> > > > > > > ---
> > > > > > >
> > > > > > > No changes since v1
> > > > > > >
> > > > > > >   .../bindings/mfd/rohm,bd71828-pmic.txt        | 180
> > > > > > > ++++++++++++++++++
> > > > > > >   1 file changed, 180 insertions(+)
> > > > > > >   create mode 100644
> > > > > > > Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.txt
> > > > > >
> > > > > > I will let maintainers weigh in here but if this is new this
> > > > > > should
> > > > > > probably be in the yaml format to avoid conversion in the
> > > > > > future
> > > > >
> > > > > Oh... This is new to me. I guess there are reasons for this -
> > > > > but I
> > > > > must say I am not excited as I have never used yaml for
> > > > > anything.
> > > > > I'll
> > > > > do as you suggest and wait for what others have to say :)
> > > > > Thanks
> > > > > for
> > > > > pointing this out though.
> > > >
> > > > Sorry for your lack of excitement. It could be XML...
> > >
> > > Thanks, I appreciate that, apology accepted X-D
> > >
> > > > There aren't many MFD examples yet, but there is max77650 in my
> > > > tree
> > > > and
> > > > linux-next.
> > >
> > > I looked at the max77650 MFD binding from linux-next. After that I
> > > also
> > > looked some of the generic documents for DT bindings (I know - I
> > > should
> > > have done that earlier and your job had been easier). But all that
> > > left
> > > me "slightly" puzzled. After some further wandering in the virtual
> > > world I spotted this:
> > > https://elinux.org/images/6/6b/LPC2018_json-schema_for_Devicetree.pdf
> > >
> > > I think this link in some dt-yaml-binding-readme might be helpful.
> >
> > Presentations bit rot, so I'd rather not. I'd hope that
> > writing-schema.rst and example-schema.yaml capture what's in the
> > presentation. What do you think is missing?
>
> I personally wanted to understand "why?". Why not text doc. What is the
> yaml thing aiming at? What are the problems we are solving here. And
> maybe most crucially - I had no idea what is schema? It sure sounded
> like some toolchain thingy or perhaps piece of new yaml representation
> of dts (please note, I somehow thought that dts files were going to be
> converted to yaml - maybe due to some reading about DTC getting yaml
> support) which I thought would not need to be touched by me :) It took
> me quite a while to understand that the old binding doc is actually a
> schema. Without that piece finding out the new format of binding docs
> was painful.

I guess 'why' is easy enough to address.

> Also, binding and binding document were not completely same thing in my
> mind. I thought that binding is actual piece of dt - probably living
> under arch/x/boot/dts - binding document is what explains how that
> should be construct and is under Documentation/devicetree/bindings/.
> This is probably largely due to my ignorance and habit oh skipping much
> of reading and just trying out things. But I hoped I had these cleared
> in first documents I tried reading for creation binding docs..
>
> ...which brings me here. I looked at the
> Documentation/devicetree/bindings folder and did read the 'writing-
> bindings.txt' and 'submitting-patches.txt' from there. Then I also
> checked the Documentation/devicetree/usage-model.txt None of which
> helped me out. I did also open the 'writing-schema.rst' but I didn't
> read it carefully enough. Probably because I thought after reading the
> opening chapter that this described how to do actual dts in yaml.

Things are a bit scattered around I'll admit. I feel like we need a
'start here', but the challenge is people have different starting
points.

> Anyways, I might add some notes about using yaml format (and perhaps
> shortly note that the yaml dt binding doc is called schema) in
> Documentation/devicetree/bindings/writing-bindings.txt and
> Documentation/devicetree/bindings/submitting-patches.txt
>
> I could also appreciate some note about benefits/goals of using yaml
> instead of text docs in writing-schema.rst - although I understand that
> this may not be relevant for all readers.
>
> > > So if I understand this correctly, idea is to convert the dts
> > > sources
> > > to use yaml (right?). This is seen better because more people
> > > knowsubmitting-patches.txt
> > > JSON/YAML than dts format(?) Fair enough. Although some of us know
> > > dts
> > > format decently well but have never used JSON or yaml. I guess dts
> > > support is not going away though and yaml examples do not seem
> > > terribly
> > > hard at first sight.
> >
> > No, nothing is changing for .dts files (other than fixing errors the
> > schemas find). The free form, human readable only prose called
> > binding
> > documentation is changing to YAML formatted, json-schema vocabulary
> > binding schema which can be used to validate dts files.
>
> Thanks for sorting this out. It all makes more sense now.
>
> > > What comes to binding docs - well, in my eyes (which may be biased)
> > > writing documentation in anything intended to be interpreted by a
> > > machine is still a step backwards for a human document reader. Sure
> > > syntax validation or reviewing is easier if format is machine
> > > readable
> > > - but free text info is more, well, informative (form me at least).
> > > I
> > > for example wouldn't like reading a book written in any script or
> > > markup language. Nor writing one. It is difficult for me to
> > > understand
> > > the documentation change to yaml, maybe because I am more often
> > > using
> > > the binding docs for composing DT for a device than reviewing them
> > > ;)
> >
> > ICYMI, all the kernel docs are in a markup language now...
> >
> > Free form descriptions are easier to use because you can put in dts
> > whatever you want. Nothing is going to check. There's been no
> > shortage
> > of errors and inconsistencies that we've already found.
>
> I won't start arguing on this :)
>
> > You can have as much description and comments as you like (though I'm
> > trying to cut down on the copy-n-paste genericish 'clock for the
> > module' type comments).
>
> This is good to note. Thanks.
>
> > > Anyways, I guess I'd better either try learning the yaml, figure
> > > out
> > > what are schemas and see how to convert yaml docs to text for nicer
> > > reading (I assume this is doable) and how to verify yaml binding
> > > docs
> > > are Ok - or quit contributing. No one is forcing me to do this.
> > > Continuing complaining on this is probably not getting us anywhere
> > > so I
> > > might as well shut up now :/
> >
> > There is some notion to convert the DT spec to schema and then
> > generate the spec from the schema. Take properties, their type, and
> > descriptions and put that back into tables for example. Would love to
> > have someone work on that. :)
>
> I am glad to hear you have developed / are developing such tooling.

TBC, I have not and am not. It's just an idea. There's been nothing
done beyond experimenting if rST could be embedded into yaml.

> I
> really appreciate it. What comes to giving a helping hand - I'd better
> to stick the simple C drivers for now ;) But if I ever get the feeling
> that I don't know what to do I'll keep this in mind :] Let me do some
> calculus... Only 11 years and my youngest son will probably leave our
> house - do you think 2030 is a bit too late? Just let me know if this
> is still relevant then - and I'll buy you a beer or write a tool (of
> some kind) xD

I've scheduled you in for 2030. :)

> Meanwhile... I have tried to convert the BD71828 DT doc from the RFC
> patch to yaml - and I am having hard time. Especially with the
> regulators node - which I would like to place in
> Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml
>
> My problem is the
> regulators {
> buck1: BUCK1 {
>                     regulator-name = "buck1";
>                     regulator-min-microvolt = <500000>;
>                     regulator-max-microvolt = <2000000>;
>                     regulator-ramp-delay = <2500>;
>                     rohm,dvs-runlvl-ctrl;
>                     rohm,dvs-runlevel0-voltage = <500000>;
>                     rohm,dvs-runlevel1-voltage = <506250>;
>                     rohm,dvs-runlevel2-voltage = <512500>;
>                     rohm,dvs-runlevel3-voltage = <518750>;
>                     regulator-boot-on;
>     };
>     ...
> };
> node which only contains BUCKX and LDOX sub-nodes. It has no own
> properties.
>
> From MFD yaml I did try:
>
>   regulators:
>     $ref: ../regulator/rohm,bd71828-regulator.yaml
>     description:
>       List of child nodes that specify the regulators.
>
> and in rohm,bd71828-regulator.yaml
>
> I tried doing:
>
> patternProperties:
>   "^BUCK[1-7]$":
>     type: object
>     description:
>       Properties for single regulator.
>     properties:
>         ...
>
> but this fails validation as properties: is not given.
>
> [mvaittin@localhost linux]$ dt-doc-validate
> Documentation/devicetree/bindings/regulator/rohm,bd71828-
> regulator.yaml
> /home/mvaittin/torvalds/linux/Documentation/devicetree/bindings/regulat
> or/rohm,bd71828-regulator.yaml: 'properties' is a required property
>
> If I try and add:
>
> properties:
>   foo: true
>
> patternProperties:
>     "^BUCK[1-7]$":
>       type: object
>       description:
>         Properties for single regulator.
>       properties:
>         ...

That's a case of needing to adjust the meta-schema (the schema that
checks the schemas). It's a bit overly restrictive just to try to
contain what's allowed. I've fixed it now. Update dtschema and it
should work now.

BTW, what you will also need is to reference the common schema:

"^BUCK[1-7]$":
  type: object
  allOf:
    - $ref: regulator.yaml#
  properties:
   rohm,dvs-runlvl-ctrl:
     type: boolean
     description: ...
   ...

Rob
