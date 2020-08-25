Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61B67251275
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Aug 2020 08:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729268AbgHYG5C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Aug 2020 02:57:02 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37275 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728440AbgHYG5B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Aug 2020 02:57:01 -0400
Received: by mail-ot1-f65.google.com with SMTP id k2so2982494ots.4;
        Mon, 24 Aug 2020 23:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QgmWakfGzlYbO0ljlUwKI6Yfn9O1Rwl8ggXKdPZE8fU=;
        b=VPbFfGrtUDdMvtQHjSoZBm8rM67HXuetUVDp7jaNakl/ZOXXtRw5u21wPIuCHVF8ox
         /e2LMwMgwpQE3+/FxEb5re1PcvxnC5j8Ywnn5kNds+032FHYxbJogGBDAaJ9FItGHFkw
         QTOOlVaQZKvzP/huaMbC0aHBcCDnarh4g4wEmHg52u2urPfq50VmwoPf8sum0dTpJpJg
         M7aXUelVIsDUEUM+xzNHDM6+IsH6+APVUpupeD64sGBEwCSLXRSaqxss2gUba2kS7OQu
         LqsnR6BVI1KZSlPkY0/zJ7OnrmHW2rcAWaMJDxbu6upFPJn1SpVuuhYbxgkhQDb7dQTT
         B2jA==
X-Gm-Message-State: AOAM532kOHipqChR04iiNfvv8DsuYu5xkC/BAm/FW6cy4As7wfJBA0DZ
        pubiCysqhHDdrtHP1FapvOYp+ZxEt+hdOfvEYZo=
X-Google-Smtp-Source: ABdhPJzHQO0yAe1Cq0Vf1R8l/rKlVOnpJ3cb7ChgIvVfnCs4jMYfskKbRHQqJUGLZRmaTFbx+mBrA7mlVlM7MseFM50=
X-Received: by 2002:a9d:7d8c:: with SMTP id j12mr6120302otn.250.1598338620365;
 Mon, 24 Aug 2020 23:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200821111956.4989-1-geert+renesas@glider.be> <20200824091340.htydmmo2fazq2gku@uno.localdomain>
In-Reply-To: <20200824091340.htydmmo2fazq2gku@uno.localdomain>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 25 Aug 2020 08:56:49 +0200
Message-ID: <CAMuHMdWy=jsFf2CyyiG6H5i0jNX8pg65y-1AEzA0XK7LB9--Xw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: rza1: Convert to json-schema
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jacopo,

On Mon, Aug 24, 2020 at 11:09 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
> On Fri, Aug 21, 2020 at 01:19:56PM +0200, Geert Uytterhoeven wrote:
> > Convert the Renesas RZ/A1 combined Pin and GPIO controller Device Tree
> > binding documentation to json-schema.
> >
> > Rename "rza1-pinctrl" to "rza1-ports", to match the compatible value
> > scheme.
> > Use "pinctrl" generic node name.
> > Drop generic and consumer examples, as they do not belong here.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml

> > +    properties:
> > +      gpio-controller: true
> > +
> > +      '#gpio-cells':
> > +        const: 2
> > +
> > +      gpio-ranges:
> > +        maxItems: 1
> > +
> > +    required:
> > +      - gpio-controller
>
> Doesn't 'true' imply required ?

No, true means that a property for which the schema is declared
elsewhere is applicable here.

> > +      - '#gpio-cells'
> > +      - gpio-ranges
> > +
> > +
> > +additionalProperties:
> > +  anyOf:
>
> Confused by this part. This describes a GPIO consumer, doesn't it ?
> Does this part belong here ?

It describes the ping multiplexing sub-node, as a child (first item of
anOf), or grandchild (second item of anyOf).

> > +    - type: object
> > +      allOf:
> > +        - $ref: pincfg-node.yaml#
> > +        - $ref: pinmux-node.yaml#
> > +
> > +      description:
> > +        A pin multiplexing sub-node describes how to configure a set of (or a
> > +        single) pin in some desired alternate function mode.
> > +        A single sub-node may define several pin configurations.
> > +        A few alternate function require special pin configuration flags to be
> > +        supplied along with the alternate function configuration number.
> > +        The hardware reference manual specifies when a pin function requires
> > +        "software IO driven" mode to be specified. To do so use the generic
> > +        properties from the <include/linux/pinctrl/pinconf_generic.h> header
> > +        file to instruct the pin controller to perform the desired pin
> > +        configuration operation.
> > +        The hardware reference manual specifies when a pin has to be configured
> > +        to work in bi-directional mode and when the IO direction has to be
> > +        specified by software. Bi-directional pins must be managed by the pin
> > +        controller driver internally, while software driven IO direction has to
> > +        be explicitly selected when multiple options are available.
> > +
> > +      properties:
> > +        pinmux:
> > +          description: |
> > +            Integer array representing pin number and pin multiplexing
> > +            configuration.
> > +            When a pin has to be configured in alternate function mode, use
> > +            this property to identify the pin by its global index, and provide
> > +            its alternate function configuration number along with it.
> > +            When multiple pins are required to be configured as part of the
> > +            same alternate function they shall be specified as members of the
> > +            same argument list of a single "pinmux" property.
> > +            Helper macros to ease assembling the pin index from its position
> > +            (port where it sits on and pin number) and alternate function
> > +            identifier are provided by the pin controller header file at:
> > +            <include/dt-bindings/pinctrl/r7s72100-pinctrl.h>
> > +            Integers values in "pinmux" argument list are assembled as:
> > +            ((PORT * 16 + PIN) | MUX_FUNC << 16)
> > +
> > +        phandle: true
> > +        input-enable: true
> > +        output-enable: true
> > +
> > +      required:
> > +        - pinmux
> > +
> > +      additionalProperties: false
> > +
> > +    - type: object
> > +      properties:
> > +        phandle: true
> > +
> > +      additionalProperties:
> > +        $ref: "#/additionalProperties/anyOf/0"

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
