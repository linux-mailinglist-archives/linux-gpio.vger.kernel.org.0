Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36153DCF07
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2019 21:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbfJRTH3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Oct 2019 15:07:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:58594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436505AbfJRTH3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 18 Oct 2019 15:07:29 -0400
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 070A2222CC;
        Fri, 18 Oct 2019 19:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571425648;
        bh=ZvKSuxQuN/jT3Fmjbjwnw6yt3Bbj3F9A+MC7acj1eYo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=r3J6l9JZJc1Zp8tJF9mLQSmXEA68DllcySKWuRRg/es60oLadlYjJhDaAjldnASSb
         ATx8Um+zjpqNtXvhGwZLcVJe0hgMmNdA9edlIZqFx/1a8JB/Sb5YemGVg4SUJXOiKR
         jRtSfzVPwCdgSZPJWLYASOe3Oyl6UG1dXPjI3dRE=
Received: by mail-qk1-f176.google.com with SMTP id u184so6302458qkd.4;
        Fri, 18 Oct 2019 12:07:27 -0700 (PDT)
X-Gm-Message-State: APjAAAVqzXlNJnNjJ81jSPsM8O8tkPvTcnq71VAfKdCP4a0THxoUFi0+
        uzBdVPjL2XkndqxsBQZDVGI1oMTwUbSLk2Dtdw==
X-Google-Smtp-Source: APXvYqyEfCrAtNPgA6gsKBq8urq8H5iqVlTDcHX0aikHpYcOCmiQnShU4x9vV/ge/RWs5MTLKNtafQj54U/NALrxbdY=
X-Received: by 2002:a05:620a:12f1:: with SMTP id f17mr10482791qkl.152.1571425646996;
 Fri, 18 Oct 2019 12:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191017031051.20366-1-chris.packham@alliedtelesis.co.nz>
 <20191017031051.20366-2-chris.packham@alliedtelesis.co.nz>
 <20191017192437.GA24080@bogus> <CAMpxmJVrFK38BPjoUtGt99sqgFeOA=wHFAu=QNQg_5Rj1gU92A@mail.gmail.com>
In-Reply-To: <CAMpxmJVrFK38BPjoUtGt99sqgFeOA=wHFAu=QNQg_5Rj1gU92A@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 18 Oct 2019 14:07:15 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+iad9+SE8kwKdxKfOF6TsbTF1V+3yNOLhNNsgnmhSCiA@mail.gmail.com>
Message-ID: <CAL_Jsq+iad9+SE8kwKdxKfOF6TsbTF1V+3yNOLhNNsgnmhSCiA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: brcm: Add bindings for xgs-iproc
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 18, 2019 at 1:00 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> czw., 17 pa=C5=BA 2019 o 21:24 Rob Herring <robh@kernel.org> napisa=C5=82=
(a):
> >
> > On Thu, Oct 17, 2019 at 04:10:50PM +1300, Chris Packham wrote:
> > > This GPIO controller is present on a number of Broadcom switch ASICs
> > > with integrated SoCs. It is similar to the nsp-gpio and iproc-gpio
> > > blocks but different enough to require a separate driver.
> > >
> > > Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > > ---
> > >
> > > Notes:
> > >     Changes in v2:
> > >     - Document as DT schema
> > >     - Include ngpios, #gpio-cells and gpio-controller properties
> > >
> > >  .../bindings/gpio/brcm,xgs-iproc.yaml         | 83 +++++++++++++++++=
++
> > >  1 file changed, 83 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/gpio/brcm,xgs-i=
proc.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc.ya=
ml b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc.yaml
> > > new file mode 100644
> > > index 000000000000..71998551209e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc.yaml
> > > @@ -0,0 +1,83 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/gpio/brcm,xgs-iproc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Broadcom XGS iProc GPIO controller
> > > +
> > > +maintainers:
> > > +  - Chris Packham <chris.packham@alliedtelesis.co.nz>
> > > +
> > > +description: |
> > > +  This controller is the Chip Common A GPIO present on a number of B=
roadcom
> > > +  switch ASICs with integrated SoCs.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - brcm,iproc-gpio-cca
> >
> > enum vs. const usage depends on whether you think you'll add more
> > compatibles.
> >
>
> What if you don't know yet? For instance we use a const compatible and
> then a new chip is released for which we can reuse the driver?

Then you just change it to an enum (or oneOf if the new compatible has
a fallback to the old one). Not really a big deal.

> Is this
> something that is expected to remain stable in the binding document?

No, only in the sense we want to minimize changes.

> The question is unrelated to this patch, I'm just unsure about my own
> approach to writing yaml bindings.

We could perhaps just say single entries should always be 'const'
because then we could write a meta-schema enforcing that:

properties:
  enum:
    minItems: 2

I don't think we should be that strict though unless it becomes a
frequent review topic. So either way is fine, it's up to your
judgement, and let's stop talking about it before I change my mind. :)

Rob
