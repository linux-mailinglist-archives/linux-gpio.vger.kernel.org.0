Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5B92D46ED
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 17:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729635AbgLIQk3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 11:40:29 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36413 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbgLIQk3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 11:40:29 -0500
Received: by mail-oi1-f194.google.com with SMTP id x16so2365990oic.3;
        Wed, 09 Dec 2020 08:40:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FocGLexWGAbPIltwYbZRe/myrDdStcHxJvLxzUzr35E=;
        b=OToxeQqSANfULIjF8Q5omwuqFh//7incHl9BsFByt4gdzibXue8LWmK74e7OCUCuRZ
         T4OwltqsTrif2eOyk9vx3Ycof9XT8+Uw6NEA54P0S/6cVqRjJRGXYsfLaYZX97caIGq7
         jPqUn27pIkIH6TB0igpAoo4DBNCbRxeVxvFuk7VrPCfqaRwJ2OrU63RHY5uPdvA+DsSJ
         xE8/GO7lhylRw5/Bmra43vr+lLTKt4GfW95gjKBR8rU0CSVYgvNraLqTRVB584ThMItx
         89liumN++R2qQ9BfkrnVzoUTHRUjjFNDyPsr5pg5hAeQCK/E/ypDmkQrihXZptN0mAqj
         vtzg==
X-Gm-Message-State: AOAM532VmtgINNke2XvpciZoWdzFFgAV5kRbL218sPKZZGVx3eON14C4
        mjTHaPWtFFzlv+cT3C5+wA==
X-Google-Smtp-Source: ABdhPJz4cfCCgnE1x+yTrKorMizmKZCIJU5rV5EqmIQdFKa8GGCmyCcCeXu8B4SZzCSeoqvaPbPCzA==
X-Received: by 2002:aca:504e:: with SMTP id e75mr2436452oib.170.1607531988076;
        Wed, 09 Dec 2020 08:39:48 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y18sm414349ooj.20.2020.12.09.08.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 08:39:47 -0800 (PST)
Received: (nullmailer pid 575032 invoked by uid 1000);
        Wed, 09 Dec 2020 16:39:45 -0000
Date:   Wed, 9 Dec 2020 10:39:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Punit Agrawal <punit1.agrawal@toshiba.co.jp>
Cc:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, yuji2.ishikawa@toshiba.co.jp,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: gpio: Add bindings for Toshiba
 Visconti GPIO Controller
Message-ID: <20201209163945.GA570905@robh.at.kernel.org>
References: <20201201181406.2371881-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20201201181406.2371881-2-nobuhiro1.iwamatsu@toshiba.co.jp>
 <87sg8n483w.fsf@kokedama.swc.toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sg8n483w.fsf@kokedama.swc.toshiba.co.jp>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 03, 2020 at 05:16:51PM +0900, Punit Agrawal wrote:
> Iwamatsu-san,
> 
> Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp> writes:
> 
> > Add bindings for the Toshiba Visconti GPIO Controller.
> >
> > Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> > ---
> >  .../bindings/gpio/toshiba,gpio-visconti.yaml  | 85 +++++++++++++++++++
> >  1 file changed, 85 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> > new file mode 100644
> > index 000000000000..5168a15b90e1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> > @@ -0,0 +1,85 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpio/toshiba,gpio-visconti.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Toshiba Visconti ARM SoCs GPIO controller
> > +
> > +maintainers:
> > +  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: toshiba,gpio-tmpv7708
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#gpio-cells":
> > +    const: 2
> > +
> > +  gpio-ranges: true
> 
> I am not sure I have a good handle on the yaml schema definitions but
> "gpio-ranges" feels like it should be a list of ranges not a boolean.
> 
> Something like -
> 
>     gpio-ranges:
>       maxItems: 1
> 
> feels more appropriate.
> 
> I see both the usages in gpio bindings and for other range properties so
> maybe it's OK. I hope Rob or somebody more knowledgeable on this can
> clarify the usage.

If you know how many (or a range) entries there are for gpio-ranges, 
then maxItems is good. If you don't, then 'gpio-ranges: true' is fine. 
That doesn't make the property a boolean, but just says the property can 
be present.

Rob
