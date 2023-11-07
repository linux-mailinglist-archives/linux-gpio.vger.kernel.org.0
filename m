Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6927E3D1F
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Nov 2023 13:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234610AbjKGM0E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Nov 2023 07:26:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234082AbjKGMZo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Nov 2023 07:25:44 -0500
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F1ED28A6B
        for <linux-gpio@vger.kernel.org>; Tue,  7 Nov 2023 04:18:32 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5a7af20c488so67404557b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Nov 2023 04:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699359512; x=1699964312; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AjUrVizqyH1nfI6x/UZaYgw1z+MKM3l8dtyFAmAVDWw=;
        b=yaKLipwya77Nb9STHS6f5skNVFquQj9pxhrnBIy2ZOUQXhjwxxZ4DX79l/+lRFDIiw
         zDFUnybuJO3nLdzgtIO+5Cy+DsdzxBer0kY4Bb4KeKdg6w6qZ9mRMWYjpEx+ivHny6vt
         2nWCGqyaWhriac5mfb+XpB6Vjv1V1yJ12CT7Ii50NVnStSye11JRJuGLParf5lk4xYkk
         tOUxhS6zXvRTdoFmmV50HkmUuwEW6XH2JlYhKFE+vIrNd6QL8fu/GoDiuSQt6eaIucvQ
         it3dGbFKcjBQHYGKbveLKw0sJachoGYFKF/dJgSJMen8OrMQySq09VlGpe8Kcd6yZTjk
         NSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699359512; x=1699964312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AjUrVizqyH1nfI6x/UZaYgw1z+MKM3l8dtyFAmAVDWw=;
        b=wxcd13/X2PrN+cPKz0nxyO+E+iIfhmL0lhroW1Cd3rmm5j/l7nA6a4LBMzVtGRUhiD
         8RwubpCRCXT7o0pP3snL8tBG+5RfsVCyhxlTxYYwCHI696CGeTxRDKgofiMt7U6PbfIt
         cQmRGyIyim4NfNuhfYJd9Nxs2Wp5EoELL4GRQYHZQzbhevHnenM39pJs3T5sWmHt5kPU
         SnM8PgLO3erX1J1u6I07aRg91kNj+H5azKs5ILlPfn3R63ZBnlXxr0f8uvpda9m8shVY
         5tChtJC8eirX8+dLvtBYTyqXyog5WpK0PEGJvjF2ZFHB1CQhJYEZwJs0MPgsWvWDpXMb
         kQrw==
X-Gm-Message-State: AOJu0YyIbKWwpJOMYl9NXfhkhXu7ZrQ12WkykKD/mZZIEXkdkZIioQ7a
        A3oigK2DJwROErOyUGtuEslKCAL9X2kmEW18Jeb9aw==
X-Google-Smtp-Source: AGHT+IEfNk5GXDy4Op4JDSJ5jjpGKCs5RJ5m+Jq4s18y1HSS1sLqrMJRFHEjKKMGNS3lWsWeWVrZ/XIvsrSt6UA57OM=
X-Received: by 2002:a0d:e6cb:0:b0:5a8:62f2:996a with SMTP id
 p194-20020a0de6cb000000b005a862f2996amr14903778ywe.6.1699359511723; Tue, 07
 Nov 2023 04:18:31 -0800 (PST)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-7-peter.griffin@linaro.org> <20231016134106.GA2643742-robh@kernel.org>
In-Reply-To: <20231016134106.GA2643742-robh@kernel.org>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Tue, 7 Nov 2023 12:18:20 +0000
Message-ID: <CADrjBPqB_tDjo68qODKsJMQLmDRoQo9U-LFR7os8bExjDNeEZw@mail.gmail.com>
Subject: Re: [PATCH v3 06/20] dt-bindings: pinctrl: samsung: add
 google,gs101-pinctrl compatible
To:     Rob Herring <robh@kernel.org>
Cc:     krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, gregkh@linuxfoundation.org, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

Thanks for your review.

On Mon, 16 Oct 2023 at 14:41, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Oct 11, 2023 at 07:48:09PM +0100, Peter Griffin wrote:
> > Add the "google,gs101-pinctrl" compatible to the dt-schema bindings
> > documentation.
> >
> > Add maxItems of 50 for the interrupts property as gs101 can have
> > multiple irqs.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../bindings/pinctrl/samsung,pinctrl.yaml     | 22 ++++++++++++++++++-
> >  1 file changed, 21 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> > index 26614621774a..6dc648490668 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> > @@ -35,6 +35,7 @@ properties:
> >
> >    compatible:
> >      enum:
> > +      - google,gs101-pinctrl
> >        - samsung,s3c2412-pinctrl
> >        - samsung,s3c2416-pinctrl
> >        - samsung,s3c2440-pinctrl
> > @@ -58,7 +59,8 @@ properties:
> >    interrupts:
> >      description:
> >        Required for GPIO banks supporting external GPIO interrupts.
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 50
> >
> >    power-domains:
> >      maxItems: 1
> > @@ -134,6 +136,24 @@ allOf:
> >            minItems: 1
> >            maxItems: 1
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: google,gs101-pinctrl
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          description:
> > +            Required for external wakeup interrupts. List all external
>
> Is it external GPIO interrupts or wakeup interrupts?

These are external wakeup interrupts.

Looking again I believe this can be dropped entirely as re-reading
samsung,pinctrl-gpio-bank.yaml we are already defining the
external wake-up interrupts on each bank in gs101-pinctrl.dtsi.

>
> > +            wakeup interrupts supported by this bank.
> > +          minItems: 1
> > +          maxItems: 50
>
> For a given SoC, I don't see how this is variable? If it is variable,
> how do you know which entry is what?

It isn't variable.

Peter.
