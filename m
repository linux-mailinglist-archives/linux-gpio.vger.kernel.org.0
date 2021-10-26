Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1893E43BAB3
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Oct 2021 21:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238682AbhJZT2A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 15:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231424AbhJZT15 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Oct 2021 15:27:57 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A0B9C061570;
        Tue, 26 Oct 2021 12:25:33 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id i9so235082ybi.8;
        Tue, 26 Oct 2021 12:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rBUgQseJq2zPtCP8x6ikcKAwJhDgfwgdMRbCuv6rnd0=;
        b=oss7Pu7S5ldBRdue1h6+N1MDWSnadoF3IcgqegToIi18/+MxEvE7CnoVKLuTQv6gAJ
         v4RnBgVLOFVMmN3gZNvijYmuNomM3ckwYHJWNxAA6AwxE1UaqEBNNQXRzYMHOlfoKZHf
         K2rHuYa+lsWege8VGiCnv6uE4/XogOfFs+UFx7IENGc6RIYZeIfhJFKHpmeU9ng43PW5
         gBJ8sL9yFLydG9k0b6YagFLc0eOc6IuW21Fv69H2+4/rSAezcJkpfDhNJLuS8XMgTRlr
         sg7KPoXpX7K4cofJeBvrOf266cPCcKgXlCoY57cu6Q96n59is/QiDd3XOaSs54QgtFIV
         VUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rBUgQseJq2zPtCP8x6ikcKAwJhDgfwgdMRbCuv6rnd0=;
        b=3G77BtyO/k+MtE6S68FeKprC8gs9kDvX/k19fii2KC4L75Al9xm3N+IdaIgFbp0OkL
         cXhl26m/KN3ICD0aQ8/DtAs8l9iKtzZZxUBZWu/5yB8RmFlJTQY+4E9Uo4GEw9fkalh2
         mtOglhXIFf20i7umeBEiaz8aWrARABmi89lT4+yG2Vwse+wzUfFeStTSEQuCpzH4loCm
         MS8UqK5ILufbIdrbMxvNptMa+e3LQ7QHP0XzKALQ/th/wAy09Xkk8ps3F63D10WllwaI
         hEG9H5E/xldhXTVzf6t2odEJciKB9enodxl8xrTVbjRYqwUi+tBIwcR/+CmmvaAIe0cD
         z0WQ==
X-Gm-Message-State: AOAM53051qybYD87Q7JpB30vzucUECVW7fE4EJOyLk4Cp5hyneJlMNqN
        veGbg5R/1x4NL4PJacFQ95W5JShlkE52A3Ibc9yHXwyluL4=
X-Google-Smtp-Source: ABdhPJzHAKQhzCSpYIQJ5XiYFGPUfMteyGetlG3MivLJ23mW0y6eDlso9Zn7YyS6GJ9dpSoERFQhIsplZouMBrJsbfA=
X-Received: by 2002:a25:b7c6:: with SMTP id u6mr25954633ybj.16.1635276332116;
 Tue, 26 Oct 2021 12:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210930121630.17449-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210930121630.17449-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <YV4RypY6/n23Bl2T@robh.at.kernel.org>
In-Reply-To: <YV4RypY6/n23Bl2T@robh.at.kernel.org>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 26 Oct 2021 20:25:06 +0100
Message-ID: <CA+V-a8s4ti-WNxiEPB8WCVNdwEv-Y6rZgMKuc=TmsxAGiaet1g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] dt-bindings: pincfg-node: Add "output-impedance" property
To:     Rob Herring <robh@kernel.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

Thank you for the review.

On Wed, Oct 6, 2021 at 10:14 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Sep 30, 2021 at 01:16:27PM +0100, Lad Prabhakar wrote:
> > On RZ/G2L SoC for Group-B pins, output impedance can be configured.
> > This patch documents "output-impedance" property in pincfg-node.yaml so
> > that other platforms requiring such feature can make use of this property.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > index 71ed0a9def84..cdcb23daeca2 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > @@ -114,6 +114,10 @@ properties:
> >      description: enable output on a pin without actively driving it
> >        (such as enabling an output buffer)
> >
> > +  output-impedance:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>
> Use standard unit suffix and drop the type.
>
Sure will do in the next version.

Cheers,
Prabhakar

> > +    description: set the pins output impedance at most X ohm
> > +
> >    output-low:
> >      type: boolean
> >      description: set the pin to output mode with low level
> > --
> > 2.17.1
> >
> >
