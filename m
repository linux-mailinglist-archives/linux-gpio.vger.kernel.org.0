Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 494A05A1C25
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Aug 2022 00:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243657AbiHYWUw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Aug 2022 18:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243374AbiHYWUu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Aug 2022 18:20:50 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1288BB7EDD
        for <linux-gpio@vger.kernel.org>; Thu, 25 Aug 2022 15:20:49 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-11ba6e79dd1so26717248fac.12
        for <linux-gpio@vger.kernel.org>; Thu, 25 Aug 2022 15:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=hYB1ZQNpPY6X69YeIG/KjOq929HUz/m3ktl9NHX+xgw=;
        b=Y7owmWiWdJd8sxFvDiLnCjuWi4kAUrlOstOZGLmRPxjaIXuOLBXCQPbix2hn+PK8AQ
         +DoLzcP8br7tbcKvl0kOtoXYQOl9/p0Xj5ZEJDhJ/H9apJW5PlQy9ihDgR2j2D3HLu+z
         +0BLvcBwiY7Ur0kK+FaHn3ttFaK5Br5gEbitJSo4LEHoyiIg+fQf1tQpKwOizi9RRNH8
         X1cKx05p6oabdpBCCwJw7jJApw2v6fp4002MdGS4m751OWcr+1OV80/h4sr8KKrer7LJ
         TYYQO8IxZ5RugXVuLr1i0eWo3uEiZn0AKe/wLnPjd96T9z6kuE3NcdvKObTzX1lITbQj
         RRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=hYB1ZQNpPY6X69YeIG/KjOq929HUz/m3ktl9NHX+xgw=;
        b=Pn/nsyt9eubxrSaGpljLpwZq6QwAFuB6+BcMFwuNqeShXez5pkwIGjPxlguiCvNROq
         iEUiAxgXNSNl5zB9cxc+KBQcTa9MBWYtW/ULfLPK2hyC2BmAkmYsjr32feCXeE/gxOZZ
         +Lv6dRRUglVnTgXxUhOK37ILoPS5jDbgRzrqccvQnAPiIMiZ7va0NXvfJelN/57jzvbk
         VqDAEDvvBVJoT9fhNE3LyTkSG/xO7eZXdeFRtxG/MxgPOfLTUH31udkixeXROJpBIFi7
         xn3lyj0bXGv3Rjm9oRo4wPZmC+LK/MTKGZFICErPEFAFMaR7v5lwik3OsdfHgyBAjdIx
         NrCw==
X-Gm-Message-State: ACgBeo3Z/chy1PMltJPrh9a3EvTLh7QjUEW6fEPYiD6ucjjlL5y/He4g
        KQba99ka7Y3maDVdU8FpajnmGClxe0yjEMQm659aqQ==
X-Google-Smtp-Source: AA6agR7Q3WUHyHCZjdPdx2wnwfam+Ba3cljIdQO4m6up/yUG6pP0Tu6DtKUJNnkipd41UHSNVd091AXNNW01JUJz4Dc=
X-Received: by 2002:a05:6870:b694:b0:11e:63e7:37f4 with SMTP id
 cy20-20020a056870b69400b0011e63e737f4mr47956oab.217.1661466048368; Thu, 25
 Aug 2022 15:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220825104505.79718-1-etienne.carriere@linaro.org> <CAL_JsqLWQC-drkWdgiM4TnsZCa6h6vcMmCvrUC_E7z5=gYtcJw@mail.gmail.com>
In-Reply-To: <CAL_JsqLWQC-drkWdgiM4TnsZCa6h6vcMmCvrUC_E7z5=gYtcJw@mail.gmail.com>
From:   Etienne Carriere <etienne.carriere@linaro.org>
Date:   Fri, 26 Aug 2022 00:20:37 +0200
Message-ID: <CAN5uoS9kLTjGinBOCsTHnV=1Jg-V_GwgZ4b1d5Gj3x_Npm6wRw@mail.gmail.com>
Subject: Re: [PATCH] dt-binding: gpio: publish binding IDs under dual license
To:     Rob Herring <robh+dt@kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Stephen Warren <swarren@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Rob,

Many thanks for the feedback.

Regards,
Etienne

On Thu, 25 Aug 2022 at 18:05, Rob Herring <robh+dt@kernel.org> wrote:
>
> On Thu, Aug 25, 2022 at 5:45 AM Etienne Carriere
> <etienne.carriere@linaro.org> wrote:
> >
> > Changes gpio.h DT binding header file to be published under GPLv2 or
> > BSD-3-Clause license terms. This change allows these GPIO generic
> > bindings header file to be used in software components as bootloaders
> > and OSes that are not published under GPLv2 terms.
> >
> > All contributors to gpio.h file in copy.
> >
> > Cc: Stephen Warren <swarren@nvidia.com>
>
> We have NVIDIA permission for anything in bindings and NVIDIA
> relicensed the irq headers, so I think it shouldn't be a problem.
>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
>
> FYI, There is blanket approval from Linaro to relicense DT files.
>
> > Cc: Laxman Dewangan <ldewangan@nvidia.com>
> > Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
>
> I don't think a. blank line is copyrightable.

>
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
