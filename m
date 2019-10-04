Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC91CC03E
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 18:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390132AbfJDQJO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 12:09:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:43284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389835AbfJDQJO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 4 Oct 2019 12:09:14 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 30A3B222BE;
        Fri,  4 Oct 2019 16:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570205353;
        bh=PIZY0X68txs0nQhBK6aK4rjR5Mh4EuLhaWuSLyBDxaQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EYEn1HnKvwmE0HqhAw+zIvGgpSpfSp6DLraWq95YaXaj1pYZ2AbLQpC7IaM0ZZvZ5
         4YEjRr5vkxPwI5yVIk/0teNWsNxoDMkZCQPl7mNQvA0DGSaE1MD1kwCmyCvPMbWFJa
         Icd+Myodxjg4jVcMMXBFVar2jNQK1JKThZeJjm4Y=
Received: by mail-qk1-f170.google.com with SMTP id z67so6249484qkb.12;
        Fri, 04 Oct 2019 09:09:13 -0700 (PDT)
X-Gm-Message-State: APjAAAWM/L+12RpY9OEmPPe9KCiDvNfCf4aLM5gwmVAKyaex1WLi+ek+
        VtUCqE6MnVF0YTcuYB29CaOm+i/Kab1qjL/Dsg==
X-Google-Smtp-Source: APXvYqwKlIhUP9LhQHjfV/+UU/RoF0uAyM8gXBjsoGHUdD9ORAY0trGuu2BXFKjTXRpcy6p+Cn3wURmELX9X/OwsZvk=
X-Received: by 2002:a05:620a:7da:: with SMTP id 26mr9972307qkb.119.1570205352273;
 Fri, 04 Oct 2019 09:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190927100407.1863293-1-paul.kocialkowski@bootlin.com>
 <20190927100407.1863293-3-paul.kocialkowski@bootlin.com> <20190927221550.GA28831@bogus>
 <20191004144551.GR18429@dell>
In-Reply-To: <20191004144551.GR18429@dell>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 4 Oct 2019 11:09:00 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+J9z3zzENZxXwjjsVMbFr8uYpXX6jYbCqdQEKBQXOu9A@mail.gmail.com>
Message-ID: <CAL_Jsq+J9z3zzENZxXwjjsVMbFr8uYpXX6jYbCqdQEKBQXOu9A@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: mfd: Document the Xylon LogiCVC
 multi-function device
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 4, 2019 at 9:45 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Fri, 27 Sep 2019, Rob Herring wrote:
>
> > On Fri, Sep 27, 2019 at 12:04:04PM +0200, Paul Kocialkowski wrote:
> > > The LogiCVC is a display engine which also exposes GPIO functionality.
> > > For this reason, it is described as a multi-function device that is expected
> > > to provide register access to its children nodes for gpio and display.
> > >
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > ---
> > >  .../bindings/mfd/xylon,logicvc.yaml           | 50 +++++++++++++++++++
> > >  1 file changed, 50 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml b/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
> > > new file mode 100644
> > > index 000000000000..abc9937506e0
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
> > > @@ -0,0 +1,50 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +# Copyright 2019 Bootlin
> > > +%YAML 1.2
> > > +---
> > > +$id: "http://devicetree.org/schemas/mfd/xylon,logicvc.yaml#"
> > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > +
> > > +title: Xylon LogiCVC multi-function device
> > > +
> > > +maintainers:
> > > +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > +
> > > +description: |
> > > +  The LogiCVC is a display controller that also contains a GPIO controller.
> > > +  As a result, a multi-function device is exposed as parent of the display
> > > +  and GPIO blocks.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - xylon,logicvc-3.02.a
> > > +      - const: syscon
> > > +      - const: simple-mfd
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +select:
> > > +  properties:
> > > +    compatible:
> > > +      contains:
> > > +        enum:
> > > +          - xylon,logicvc-3.02.a
> >
> > I've seen a couple of these with 'syscon' today, so I fixed the schema
> > tool to just exclude 'syscon' and 'simple-mfd' from the generated
> > 'select'. So you can drop select now.
>
> Does this need to happen before this patch can be applied?

Drop the 'select'? Yes that should happen first.

Rob
