Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8278938CB06
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 18:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233409AbhEUQcN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 12:32:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:36700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231621AbhEUQcN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 21 May 2021 12:32:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8D03613AF;
        Fri, 21 May 2021 16:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621614649;
        bh=Gsz7yuXP5bdGbG2AnmimRSB7YwtOJcRdSaqp/btEGw0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=R1aPYV3AboHfwqgvwSrIYkEOtSq8IJUtLv6v3MnEFHbdTedstbQv/ASUkWkrWLoMB
         VdAOFsbuD26jPmTnO3v3udF3+iBw1GFAQSDVlZZNkMTbQo4lPzstGVwuct/150lOx6
         ZmSUtVww6eeMzjcmF97vzYqOhfEziJr8jlAo+wnNbhH/00kSHqzU7Hwshz+hVY7pmz
         Le+Ko1iXXMIP5llGBfmMUU1FuUSHX7NLtV8Ls9qBCzmbB39r+cJHGe0CozP1yTvKM+
         iJseRFTMqiY0k5oC/mJwIXJomz+/3k+6orUfUaIW2UH0VBOcH7E9ybmuCa/gavVtFg
         NsevhRKSHbXgA==
Received: by mail-ej1-f41.google.com with SMTP id s22so31143304ejv.12;
        Fri, 21 May 2021 09:30:49 -0700 (PDT)
X-Gm-Message-State: AOAM533VKRSj6h7kPfi0V1WoEtXq7fuHIgZJO8RckIg1CNB5Fr8fuamF
        yzCe2UlnNBH6bsB+DbhozwAskhvS6icgnoDbKA==
X-Google-Smtp-Source: ABdhPJw+7EoEUERdDMupKIrRfpxIOGAi4+3ULLAqX5gbaNn8ZXyzBAgUw9pdrRhJ0k/uWh8i5J7Cjfm4C2xM6j/dGJo=
X-Received: by 2002:a17:907:76b8:: with SMTP id jw24mr11141962ejc.359.1621614648460;
 Fri, 21 May 2021 09:30:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210511090122.6995-1-a-govindraju@ti.com> <20210517221513.GA3263368@robh.at.kernel.org>
 <861cefe2-7bb6-c435-ab0d-483155852876@ti.com> <CAL_JsqKyuXYJocBMLGXL6aXuK0YnrW7qdLugV2bxdP-LJ=2+cg@mail.gmail.com>
 <42ec7cbd-1364-8dfe-c652-79b16bb6b87c@ti.com>
In-Reply-To: <42ec7cbd-1364-8dfe-c652-79b16bb6b87c@ti.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 21 May 2021 11:30:35 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Ft0V8d_3GJ6cgb2g5uocKL-Xn5WUsfPbn+mFmWHDhuw@mail.gmail.com>
Message-ID: <CAL_Jsq+Ft0V8d_3GJ6cgb2g5uocKL-Xn5WUsfPbn+mFmWHDhuw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: gpio-davinci: Convert to json-schema
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Aswath Govindraju <a-govindraju@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Keerthy <j-keerthy@ti.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 21, 2021 at 11:06 AM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
>
> Hi Rob,
>
> On 21/05/2021 15:56, Rob Herring wrote:
> > On Fri, May 21, 2021 at 3:32 AM Grygorii Strashko
> > <grygorii.strashko@ti.com> wrote:
> >>
> >> Hi Rob, All
> >>
> >> On 18/05/2021 01:15, Rob Herring wrote:
> >>> On Tue, May 11, 2021 at 02:31:20PM +0530, Aswath Govindraju wrote:
> >>>> Convert gpio-davinci dt-binding documentation from txt to yaml format.
> >>>>
> >>>> Signed-off-by: Aswath Govindraju <a-govindraju@ti.com>
> >>>> ---
> >>>>    .../devicetree/bindings/gpio/gpio-davinci.txt | 167 ---------------
> >>>>    .../bindings/gpio/gpio-davinci.yaml           | 193 ++++++++++++++++++
> >>>>    MAINTAINERS                                   |   2 +-
> >>>>    3 files changed, 194 insertions(+), 168 deletions(-)
> >>>>    delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.txt
> >>>>    create mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
> >>>> deleted file mode 100644
> >>>> index 696ea46227d1..000000000000
> >>>> --- a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
> >>>> +++ /dev/null
> >>>> @@ -1,167 +0,0 @@
> >>>> -Davinci/Keystone GPIO controller bindings
> >>>> -
> >>>> -Required Properties:
> >>>> -- compatible: should be "ti,dm6441-gpio": for Davinci da850 SoCs
> >>>> -                    "ti,keystone-gpio": for Keystone 2 66AK2H/K, 66AK2L,
> >>>> -                                            66AK2E SoCs
> >>>> -                    "ti,k2g-gpio", "ti,keystone-gpio": for 66AK2G
> >>>> -                    "ti,am654-gpio", "ti,keystone-gpio": for TI K3 AM654
> >>>> -                    "ti,j721e-gpio", "ti,keystone-gpio": for J721E SoCs
> >>>> -                    "ti,am64-gpio", "ti,keystone-gpio": for AM64 SoCs
> >>>> -
> >>
> >> [...]
> >>
> >>>> -};
> >>>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
> >>>> new file mode 100644
> >>>> index 000000000000..1e16172669c7
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
> >>>> @@ -0,0 +1,193 @@
> >>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>> +%YAML 1.2
> >>>> +---
> >>>> +$id: http://devicetree.org/schemas/gpio/gpio-davinci.yaml#
> >>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>> +
> >>>> +title: GPIO controller for Davinci and keystone devices
> >>>> +
> >>>> +maintainers:
> >>>> +  - Keerthy <j-keerthy@ti.com>
> >>>> +
> >>>> +properties:
> >>>> +  compatible:
> >>>> +    oneOf:
> >>>> +      - items:
> >>>> +          - enum:
> >>>> +              - ti,k2g-gpio
> >>>> +              - ti,am654-gpio
> >>>> +              - ti,j721e-gpio
> >>>> +              - ti,am64-gpio
> >>>> +          - const: ti,keystone-gpio
> >>>> +
> >>>> +      - items:
> >>>> +          - const: ti,dm6441-gpio
> >>>> +      - items:
> >>>> +          - const: ti,keystone-gpio
> >>>
> >>> These 2 can be expressed as an 'enum'.
> >>>
> >>>> +
> >>>> +  reg:
> >>>> +    maxItems: 1
> >>>> +    description:
> >>>> +      Physical base address of the controller and the size of memory mapped registers.
> >>>
> >>> Drop. That's every 'reg' property.
> >>>
> >>>> +
> >>>> +  gpio-controller: true
> >>>> +
> >>>> +  gpio-ranges: true
> >>>> +
> >>>> +  gpio-line-names:
> >>>> +    description: strings describing the names of each gpio line.
> >>>
> >>> Any constraints like min/max number of lines?
> >>>
> >>>> +
> >>>> +  "#gpio-cells":
> >>>> +    const: 2
> >>>> +    description:
> >>>> +      first cell is the pin number and second cell is used to specify optional parameters (unused).
> >>>> +
> >>>> +  interrupts:
> >>>> +    description:
> >>>> +      Array of GPIO interrupt number. Only banked or unbanked IRQs are supported at a time.
> >>>
> >>> Needs constraints. How many items and what are they?
> >>>
> >>>> +
> >>>> +  ti,ngpio:
> >>>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>>> +    description: The number of GPIO pins supported consecutively.
> >>>> +    minimum: 1
> >>>> +
> >>>> +  ti,davinci-gpio-unbanked:
> >>>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>>> +    description: The number of GPIOs that have an individual interrupt line to processor.
> >>>> +    minimum: 0
> >>>> +
> >>>> +  clocks:
> >>>> +    maxItems: 1
> >>>> +    description:
> >>>> +      clock-specifier to represent input to the GPIO controller.
> >>>
> >>> Drop description.
> >>>
> >>>> +
> >>>> +  clock-names:
> >>>> +    const: gpio
> >>>> +
> >>>> +  interrupt-controller: true
> >>>> +
> >>>> +  power-domains:
> >>>> +    maxItems: 1
> >>>> +    description:
> >>>> +      Phandle to the power domain provider node.
> >>>
> >>> Drop.
> >>>
> >>>> +
> >>>> +  "#interrupt-cells":
> >>>> +    const: 2
> >>>> +
> >>>> +patternProperties:
> >>>> +  "-hog$":
> >>>> +    type: object
> >>>> +    properties:
> >>>> +      gpios: true
> >>>> +      gpio-hog: true
> >>>> +      input: true
> >>>> +      output-high: true
> >>>> +      output-low: true
> >>>> +      line-name: true
> >>>> +
> >>>> +    required:
> >>>> +      - gpio-hog
> >>>> +      - gpios
> >>
> >> I see that gpio-hog.yaml dtschema has been added.
> >> Can it be reused here and how?
> >
> > It's applied to any node containing 'gpio-hog' property, so all you need is:
> >
> > required:
> >    - gpio-hog
> >
> Thanks for you comments. But I'd like to clarify the Hog child node definition - will work as below?

Yes, but...

> patternProperties:
>    "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
>      type: object
>
>      properties:
>        gpio-hog: true

Don't need this.

>
>      required:
>        - gpio-hog
>
> In general, patternProperties duplicates $nodename in gpio-hog dtschema.

I'd hope you could be a bit stricter here and only support one form.

Rob
