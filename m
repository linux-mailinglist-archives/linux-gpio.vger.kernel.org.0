Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 853B7184F01
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2020 19:53:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgCMSxt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Mar 2020 14:53:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:53310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726477AbgCMSxt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 13 Mar 2020 14:53:49 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 73F9C20746;
        Fri, 13 Mar 2020 18:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584125628;
        bh=gnpxFQ6kyuv8cFJo/3Zkqq3inKgjgPxdNfOajCalHP4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0078zKpvvUv1c+PsA9vCK/xKx8XXEJInBx9+MguxNTCWmLdfMvwFJHrS2kObDs4Ya
         HBHit0+PgmsC2scop4Tj7zRrPezAm8Y5xrIFaBjiaiZEumS70afq/118mW+ZCD5WWY
         LrZpXqXkhgU62aXogfxtjv27UQvUhjq/oXpKEstI=
Received: by mail-qk1-f170.google.com with SMTP id p62so14366596qkb.0;
        Fri, 13 Mar 2020 11:53:48 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3mbNpRzwdC2lOUs0nfdC2dzjYN7K355c+crPuwDRj0HdOhAUbs
        qjoepMy9fG5XobDdtVEhtA6zW4Ssn0oSC6g7UQ==
X-Google-Smtp-Source: ADFU+vtIQWQ1iyBd9Hq/goh29DIW1Lm+8rr9b55lPBnrLwCB1yi/G66Yu2tNriWzEW+xFzAkAZJDQpZngvLu/4FVld8=
X-Received: by 2002:a37:2cc6:: with SMTP id s189mr15023829qkh.223.1584125627547;
 Fri, 13 Mar 2020 11:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200306132448.13917-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132510.AC2108030794@mail.baikalelectronics.ru> <CAL_JsqKRk+adXnej_XUU3dr9Z9G09oZTY+X1i=gYpD7vrbWCZg@mail.gmail.com>
 <20200313184005.gtlwzyak3sp6gier@ubsrv2.baikal.int>
In-Reply-To: <20200313184005.gtlwzyak3sp6gier@ubsrv2.baikal.int>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 13 Mar 2020 13:53:35 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLFdjRkmtahBMTNhG3Vss2eL61MfucCb5KcnW9PX_PLHQ@mail.gmail.com>
Message-ID: <CAL_JsqLFdjRkmtahBMTNhG3Vss2eL61MfucCb5KcnW9PX_PLHQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: gpio: Replace DW APB GPIO legacy
 bindings with YAML-based one
To:     Sergey Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 13, 2020 at 1:40 PM Sergey Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> On Thu, Mar 12, 2020 at 08:47:56AM -0500, Rob Herring wrote:
> > On Fri, Mar 6, 2020 at 7:25 AM <Sergey.Semin@baikalelectronics.ru> wrote:
> > >
> >
> > Subject is kind of long and wordy. Perhaps:
> >
> > dt-bindings: gpio: Convert snps,dw-apb-gpio to DT schema
> >
>
> Ok. I'll also do this for all similar patches in another patchsets.
>
> > > From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > >
> > > Modern device tree bindings are supposed to be created as YAML-files
> > > in accordance with dt-schema. This commit replaces Synopsys DW GPIO
> > > legacy bare text bindings with YAML file. As before the bindings file
> > > states that the corresponding dts node is supposed to be compatible
> > > with generic DW I2C controller indicated by the "snps,dw-apb-gpio"
> > > compatible string and provide a mandatory registers memory range.
> > > It may also have an optional clocks and resets phandle references.
> > >
> > > There must be specified at least one subnode with
> > > "snps,dw-apb-gpio-port" compatible string indicating the GPIO port,
> > > which would actually export the GPIO controller functionality. Such
> > > nodes should have traditional GPIO controller properties together
> > > with optional interrupt-controller attributes if the corresponding
> > > controller was synthesized to detected and report the input values
> > > change to the parental IRQ controller.
> > >
> > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > > Cc: Paul Burton <paulburton@kernel.org>
> > > Cc: Ralf Baechle <ralf@linux-mips.org>
> > >
> > > ---
> > >
> > > Synopsis DesignWare APB SSI controller has a bindings property
> > > "snps,nr-gpios" of numeric type, which means the number of GPIO pins
> > > exported by the corresponding controller port. There is also a generic
> > > pattern-property "*-gpios", which corresponds to a GPIOs array. As you
> > > can see the GPIOs array property wildcard matches the vendor-specific
> > > property "snps,nr-gpios" property while having an incompatible type.
> > > Due to this the DW APB GPIO dts-nodes evaluation will report the
> > > following error:
> > >
> > > snps,nr-gpios:0:0: 8 is not valid under any of the given schemas (Possible causes of the failure):
> > > snps,nr-gpios:0:0: missing phandle tag in 8
> > >
> > > I didn't manage to fix the problem by redefining the property schema (this
> > > might be impossible anyway). In my opinion the best way to solve it would be
> > > to change the DW APB SSI Controller bindings so the driver would accept the
> > > standard "ngpios" property for the same purpose. But in this case we would have
> > > to alter all the dts files currently having the "snps,dw-apb-ssi" compatible
> > > nodes (it's a lot). I know the bindings modifications aren't that much welcome
> > > in the kernel community and there are good reasons why. So what do you think
> > > would be the better way to fix the problem with the property types collision?
> >
> > Does this change (to dt-schema) work for you?
> >
> > diff --git a/schemas/gpio/gpio.yaml b/schemas/gpio/gpio.yaml
> > index 1d9c109f9791..d1c08ccfdc1a 100644
> > --- a/schemas/gpio/gpio.yaml
> > +++ b/schemas/gpio/gpio.yaml
> > @@ -34,7 +34,7 @@ properties:
> >        - $ref: "/schemas/types.yaml#/definitions/phandle-array"
> >
> >  patternProperties:
> > -  ".*-gpios?$":
> > +  "(?<!,nr)-gpios?$":
> >      $ref: "/schemas/types.yaml#/definitions/phandle-array"
> >    "^gpios$":
> >      $ref: "/schemas/types.yaml#/definitions/phandle-array"
> >
>
> It partly fixes the problem. There is meta-schems/gpios.yaml ,
> which also has a rule for the properties with "-gpios" suffix. So yours
> alteration together with the next one shall fix the problem completely:

Oh right. I'll commit a fix for both.

>
> --- a/meta-schemas/gpios.yaml   2020-03-13 20:20:10.072900019 +0300
> +++ b/meta-schemas/gpios.yaml   2020-03-13 20:20:16.000953216 +0300
> @@ -19,9 +19,7 @@
>      $ref: "cell.yaml#array"
>
>  patternProperties:
> -  '.*-gpio$':
> -    $ref: "cell.yaml#array"
> -  '.*-gpios$':
> +  '(?<!,nr)-gpios?$':
>      $ref: "cell.yaml#array"
>
>  dependencies:
>
> Regarding the generic schemas/gpio/gpio.yaml . Do you think I should be
> also allOf-ing it in my DT schema?

Only if you want to check everything twice. Most of the core schemas
always get applied. The exception is generally bus controllers like
SPI, I2C, etc.

Rob
