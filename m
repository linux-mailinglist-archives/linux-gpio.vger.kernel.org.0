Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16C0D5A1BE6
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Aug 2022 00:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244281AbiHYWHT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Aug 2022 18:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241598AbiHYWHS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Aug 2022 18:07:18 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91C7C7646F
        for <linux-gpio@vger.kernel.org>; Thu, 25 Aug 2022 15:07:16 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-11c5505dba2so26691383fac.13
        for <linux-gpio@vger.kernel.org>; Thu, 25 Aug 2022 15:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=LJDGkNd1saKSRZjxxFx4ES1d+h7NRh/gzjZWxJL6sDs=;
        b=XBayIBLNQk2JCRpcrMEkyckl1UFli9wEiNbPtjpODnJ5mqpDO5cm4PDj67nSzoZLA+
         ttOIGtzgaCi0UruJ9NxssC4ROvm8fELvCQRyJ/6fsCyAQXsqyAPTCiumXIm9RWcbRMwT
         x+g54/0uv8Fdzc0tNX69VMfqELadIyeH0qd+MrlhXh42B7ynq0KOa9LhihYO5C3C2H8F
         Mxs2b7VmSm0KcKFBiDj15kWjn6tA9aGy4fWPFYgPiCqqJb+SDXKzD/Uo98oHn9qo4YpD
         7kA/TtllU3UTgs9w9cnycpwIilFX6FwrpKQ1aucd33jxKKoyRoAYyu1AiCwdjdDOaI87
         IXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=LJDGkNd1saKSRZjxxFx4ES1d+h7NRh/gzjZWxJL6sDs=;
        b=GHH4RjahPq2lkbbfJ6E893qHoQZQd10Iuy/IiCRmopXFrsrQ4umyFoShejnWsEWKFl
         W1Ua1GFSIXQ5ll8I3tuq+dvvdCf3gWUtv3Tldbii6L4VmDk54jax2fzeLlP2eANhr73h
         AueCKCL1ZD7Vmsr97/9IG1QzdTdGim/HVSeyiURIgzljnBxpBRXcD93/UoxSedb3T8aE
         pxnDpkwSqvHe7sKuYcOCSwy8aDdjddEYeBSiH3PeiO6tTx93IcxWFWIu/gi6C3d35x0M
         RJf+DbomCLirp1Uh+eT/yYApSUozJ5MRfF32CuVGBcxPcA5paRrOO8Ta6qQRlgMMsfFe
         DHzQ==
X-Gm-Message-State: ACgBeo1UpC2LyTxF7XYrkWcPTcPbKBTvdptBIDV627SDiOFW9QMGFCVI
        DO2wsl7Omx2gcDoEaqqHT1P8p8FrBIV0HBd4s5kJxQ==
X-Google-Smtp-Source: AA6agR6fH7oKdSEjBd5rNIefeioikiWansNx8EtpoHWK0SnsJgzqqKg78TYupWufjVQq/dBI10g65+QlPmCJW5//hfA=
X-Received: by 2002:a05:6870:b694:b0:11e:63e7:37f4 with SMTP id
 cy20-20020a056870b69400b0011e63e737f4mr28893oab.217.1661465235889; Thu, 25
 Aug 2022 15:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220825104505.79718-1-etienne.carriere@linaro.org> <4a2a5eeb-aa65-2b33-e7ff-c1d318a9b76f@linaro.org>
In-Reply-To: <4a2a5eeb-aa65-2b33-e7ff-c1d318a9b76f@linaro.org>
From:   Etienne Carriere <etienne.carriere@linaro.org>
Date:   Fri, 26 Aug 2022 00:07:05 +0200
Message-ID: <CAN5uoS8uutDDHu9NEMWyPUop3TWqP=sX6QYV6EvfZx2z-VLe6A@mail.gmail.com>
Subject: Re: [PATCH] dt-binding: gpio: publish binding IDs under dual license
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Stephen Warren <swarren@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Krzystof,

On Thu, 25 Aug 2022 at 13:10, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 25/08/2022 13:45, Etienne Carriere wrote:
> > Changes gpio.h DT binding header file to be published under GPLv2 or
> > BSD-3-Clause license terms. This change allows these GPIO generic
> > bindings header file to be used in software components as bootloaders
> > and OSes that are not published under GPLv2 terms.
> >
> > All contributors to gpio.h file in copy.
> >
> > Cc: Stephen Warren <swarren@nvidia.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Laxman Dewangan <ldewangan@nvidia.com>
> > Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> > Cc: Andrew Jeffery <andrew@aj.id.au>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Nuno S=C3=A1 <nuno.sa@analog.com>
> > Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> >
> > Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> > ---
> >  include/dt-bindings/gpio/gpio.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/dt-bindings/gpio/gpio.h b/include/dt-bindings/gpio=
/gpio.h
> > index 5566e58196a2..f8df7511b8b4 100644
> > --- a/include/dt-bindings/gpio/gpio.h
> > +++ b/include/dt-bindings/gpio/gpio.h
> > @@ -1,4 +1,4 @@
> > -/* SPDX-License-Identifier: GPL-2.0 */
> > +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
>
> Why BSD-3 clause? Bindings are expected to be "OR BSD-2-Clause".

Fair, 2-clause seems more used. Thanks.
I'll send a v2.

Br,
etienne

>
> Best regards,
> Krzysztof
