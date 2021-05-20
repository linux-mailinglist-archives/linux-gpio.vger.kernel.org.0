Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E811938B47B
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 18:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233689AbhETQmn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 12:42:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:39864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232796AbhETQmm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 May 2021 12:42:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C3AF61019;
        Thu, 20 May 2021 16:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621528881;
        bh=awSiHVeGzJRRHkeF4CGvWgRsRaK/KjYATUm/abbBIIc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Fi2TL2WZCTo1uvMAEA9rSm5JD213/Ei7uNCAJHL8SRqDbEP49pI++0Clls5LR3/Q1
         4udZS4786wBjfgzZMwLktVrRYPi7FAjfr/1ncvX6uVOd01B8mfNT3X/QDh9KndeljF
         Q1QNDeiFQxFGIK+3uPJ1yXhgeG4pteTt4nPgfIGNvOwkGXbBQcDUS5TWOBrzk0TQsB
         pj0gpCnbWw1JUrY0FOGZ1dKQ9pG/OKpbU8wwzn8/4kE2wh4C0p0OxCHsQ9TY+X4TUA
         872xohX/ATEO0eI8xZcXt+mMciUR5oj0NWX0szkHW364EcbI91tmgrJy+3J8E6G45X
         +bjuyZoYPX3Vg==
Received: by mail-ed1-f54.google.com with SMTP id w12so12425845edx.1;
        Thu, 20 May 2021 09:41:21 -0700 (PDT)
X-Gm-Message-State: AOAM530R1d+4/+yx1yFLHX1LAcHmRbch+1bAZUj9T64iOWUDlm2pcwFr
        fKdRixiOuWst25qUhdBiqwHOt/Rl13Dh4Vmkdw==
X-Google-Smtp-Source: ABdhPJzNfOK9kMEcPqLpjClyB2Nr76A4rY18B920Fi6CuDkCnEo31srKm0zLPRVv1WnY7X/FVdtqNPP5rdt+j7avqNw=
X-Received: by 2002:a05:6402:c7:: with SMTP id i7mr6095866edu.194.1621528879987;
 Thu, 20 May 2021 09:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210511090122.6995-1-a-govindraju@ti.com> <20210517221513.GA3263368@robh.at.kernel.org>
 <e239365e-35d7-694a-55cc-7dabfa66b108@ti.com>
In-Reply-To: <e239365e-35d7-694a-55cc-7dabfa66b108@ti.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 20 May 2021 11:41:07 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKM5unmiXdYBzM9xfEETfTVTF9RMXPuT7Lb7w0cnwd1mw@mail.gmail.com>
Message-ID: <CAL_JsqKM5unmiXdYBzM9xfEETfTVTF9RMXPuT7Lb7w0cnwd1mw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: gpio-davinci: Convert to json-schema
To:     Aswath Govindraju <a-govindraju@ti.com>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
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

On Tue, May 18, 2021 at 9:13 AM Aswath Govindraju <a-govindraju@ti.com> wrote:
>
>
> Hi Rob,
>
> On 18/05/21 3:45 am, Rob Herring wrote:
> > On Tue, May 11, 2021 at 02:31:20PM +0530, Aswath Govindraju wrote:
> >> Convert gpio-davinci dt-binding documentation from txt to yaml format.
> >>
> >> Signed-off-by: Aswath Govindraju <a-govindraju@ti.com>
> >> ---
> >>  .../devicetree/bindings/gpio/gpio-davinci.txt | 167 ---------------
> >>  .../bindings/gpio/gpio-davinci.yaml           | 193 ++++++++++++++++++
> >>  MAINTAINERS                                   |   2 +-
> >>  3 files changed, 194 insertions(+), 168 deletions(-)
> >>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.txt
> >>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
> >>
>
> [...]
>
> >> +properties:
> >> +  compatible:
> >> +    oneOf:
> >> +      - items:
> >> +          - enum:
> >> +              - ti,k2g-gpio
> >> +              - ti,am654-gpio
> >> +              - ti,j721e-gpio
> >> +              - ti,am64-gpio
> >> +          - const: ti,keystone-gpio
> >> +
> >> +      - items:
> >> +          - const: ti,dm6441-gpio
> >> +      - items:
> >> +          - const: ti,keystone-gpio
> >
> > These 2 can be expressed as an 'enum'.
>
> I will change this.
>
> >
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +    description:
> >> +      Physical base address of the controller and the size of memory mapped registers.
> >
> > Drop. That's every 'reg' property.
> >
>
> I'll drop this.
>
> >> +
> >> +  gpio-controller: true
> >> +
> >> +  gpio-ranges: true
> >> +
> >> +  gpio-line-names:
> >> +    description: strings describing the names of each gpio line.
> >
> > Any constraints like min/max number of lines?
> >
>
> The max number of lines will be equal to ti,ngpio. Is there any way to
> equate maxItems to the a property value in json schema ?

There have been discussions about something like that for json-schema,
but nothing yet AFAIK. Is there a max for ti,ngpio? Nothing means
2^32. Surely there's something less than that. You can always adjust
the max later.

> >> +
> >> +  "#gpio-cells":
> >> +    const: 2
> >> +    description:
> >> +      first cell is the pin number and second cell is used to specify optional parameters (unused).
> >> +
> >> +  interrupts:
> >> +    description:
> >> +      Array of GPIO interrupt number. Only banked or unbanked IRQs are supported at a time.
> >
> > Needs constraints. How many items and what are they?
>
> Here also the maximum number of interrupts is equal to ti,ngpio in
> unbanked interrupts case. Same as above is there anyway to equate
> maxItems to ti,ngpio property in json schma ? If not, then what would be
> the best way to handle this ?

Banked means 1 combined interrupt?
