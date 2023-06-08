Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B02A7277D0
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jun 2023 08:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234393AbjFHGup convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 8 Jun 2023 02:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234295AbjFHGuo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jun 2023 02:50:44 -0400
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B97D173B;
        Wed,  7 Jun 2023 23:50:43 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so2097630276.0;
        Wed, 07 Jun 2023 23:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686207042; x=1688799042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kvp25ZdE/8+uBHY0ewvhRVaOH9wZTPFBAI6+vNsi2yo=;
        b=ZjS24P7qkA1bH7d6QW5p/buIIZzs85769UgFyB5zU1JNS89qLPE5b3Z0UG9j92+ZMM
         Fx8ih14TihWIgfy36rzh6couGnYQRQUv1Lesomit10/1BvGjZJJNIiLsf1OXqdYqOve+
         jELoyXKMB6xQLG+wEEt/bj3CFjXptcMq4hEP59AimpxB29aQcF2KZc3tOMxmQL992y9z
         qW7jW7eVXYhDXv9cZkCunPyCpkugYwiNAmOYZfwqtsDSv7qf47PknvufuEEveug7L/xW
         QH+Z+xL4JCeUh4yZaxjgLUCoUyTGO0PuyiyVoi+pYyFuyW16WBXwKz0/HJhV3KfC4g0R
         Ep1Q==
X-Gm-Message-State: AC+VfDwkHno8r+6M+qi8wsOy4wCx5FHoh8e4FyYDLT3I3uh22aEE/ADA
        x1LXB/6MtGhsdmZK+LS25JU0mEYslIptTA==
X-Google-Smtp-Source: ACHHUZ7FIdgj19xunvj7zPiQvx0ET5bNTKOgH/hdY6U4uNtJ/EEBHgKMIrCjCm4G1i4ZTWt2GYRf5w==
X-Received: by 2002:a0d:cc17:0:b0:565:232a:36a3 with SMTP id o23-20020a0dcc17000000b00565232a36a3mr1465297ywd.17.1686207042164;
        Wed, 07 Jun 2023 23:50:42 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id i2-20020a81d502000000b00545a08184bbsm204865ywj.75.2023.06.07.23.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 23:50:40 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-561b7729a12so21121237b3.1;
        Wed, 07 Jun 2023 23:50:40 -0700 (PDT)
X-Received: by 2002:a0d:d404:0:b0:564:eb9a:689d with SMTP id
 w4-20020a0dd404000000b00564eb9a689dmr1564417ywd.13.1686207039844; Wed, 07 Jun
 2023 23:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230530151946.2317748-1-u.kleine-koenig@pengutronix.de>
 <20230530151946.2317748-2-u.kleine-koenig@pengutronix.de> <4491320.LvFx2qVVIh@steina-w>
In-Reply-To: <4491320.LvFx2qVVIh@steina-w>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 8 Jun 2023 08:50:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWu4KZbBkvEofUV2wuA1g2S=XHHM3RUN1cNrcZBkhsPZA@mail.gmail.com>
Message-ID: <CAMuHMdWu4KZbBkvEofUV2wuA1g2S=XHHM3RUN1cNrcZBkhsPZA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: introduce hog properties with
 less ambiguity
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Alexander,

On Wed, May 31, 2023 at 8:19 AM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
> Am Dienstag, 30. Mai 2023, 17:19:45 CEST schrieb Uwe Kleine-König:
> > For active low lines the semantic of output-low and output-high is hard
> > to grasp because there is a double negation involved and so output-low
> > is actually a request to drive the line high (aka inactive).
> >
> > So introduce output-inactive and output-active with the same semantic as
> > output-low and output-high respectively have today, but with a more
> > sensible name.
> >
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > ---
> >  Documentation/devicetree/bindings/gpio/gpio.txt | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt
> > b/Documentation/devicetree/bindings/gpio/gpio.txt index
> > d82c32217fff..2f037bbd3ffa 100644
> > --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> > +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> > @@ -209,15 +209,21 @@ Required properties:
> >  - gpios:      Store the GPIO information (id, flags, ...) for each GPIO to
> >             affect. Shall contain an integer multiple of the number of
> cells
> >             specified in its parent node (GPIO controller node).
> > +
> >  Only one of the following properties scanned in the order shown below.
> >  This means that when multiple properties are present they will be searched
> >  in the order presented below and the first match is taken as the intended
> >  configuration.
> > -- input:      A property specifying to set the GPIO direction as input.
> > -- output-low  A property specifying to set the GPIO direction as output
> > with -              the value low.
> > -- output-high A property specifying to set the GPIO direction as output
> > with -              the value high.
> > +- input:             A property specifying to set the GPIO direction as
> > input. +- output-inactive:   A property specifying to set the GPIO
> > direction as output +              with the inactive value
> (depending on the
> > line's polarity, +                 which is active-high by default)
> > +- output-active:     A property specifying to set the GPIO direction as
> > output +                   with the active value.
>
> I know this is essentially just renaming currently existing properties.
> But these mutual exclusive (boolean) properties make it impossible to change
> them in DT overlay. Any ideas how to support changing the output level onGPIO
> hogs in DT overlay?

That's a good point. And despite it not working, people do try to
stick e.g. /delete-node/ in .dtso files...

I assume you can sort of remove the existing hog subnode by adding
status = "disabled" in the DT overlay, and adding a new subnode to
configure the new output level?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
