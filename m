Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4D6E5AE708
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 13:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbiIFL5t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 07:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233991AbiIFL5p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 07:57:45 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 349EA760E2
        for <linux-gpio@vger.kernel.org>; Tue,  6 Sep 2022 04:57:44 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id dc5so2808772ejb.9
        for <linux-gpio@vger.kernel.org>; Tue, 06 Sep 2022 04:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=/+p0wzFj/upkv9e1wiwyvWP1+FT9YhrV1TfR4whLT7A=;
        b=WPj6KNJpdx4ESLURazeomIr7jVFWSOZYDwnp3ZjB0SezHdvdUickHDnsxSGgA1VqWQ
         8dPftpgpnFr0XB7Uj16cBasmDTHGwe90H2XfLCV+/YSo/dw2p/nor0fgixin+8kYnZXK
         JT/Z7GeeUEQQ8NWrZwRggD8Z29+Vdgn/gLLRUymV5grVbEw6K28FPJvrK2m3H+1DUryi
         Oyg7bID4CxSu9YFBMP1oY0EgjCATJNnD0t0NGgpxrM9Rh9ZUVnT50THlikeVppp+Z4td
         V2Sjn7ZMjpFBkJE54SuXF3VauV8IUQCo70wMpvTtZKdKRcEKoyVa210h0zM8GDnCvJ19
         L+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=/+p0wzFj/upkv9e1wiwyvWP1+FT9YhrV1TfR4whLT7A=;
        b=lYFpNaTwv4NdK6dWzN9A74kfEB8c4mnnIB34PswiU4f+kxkxkNSAggRkBFmWCelSgR
         TulZIw3LQc/HNzjzlQ7acdCOadlJv2toEroy6JzrFiC3EmizBjYVVEwYyxII6k5c5Jm4
         X9i2tvPa9uxGdK5Mi+DzvBoNZQcPNsgV09TfIjhugLv0Oisqq9eBO3OLEJL9aUCHT2DN
         uALBb7X7izf8+IYjYGgwEhunrmRpUCyqO/Zc2x2BliV4N+LNi8OTJnoiHOfxEOF8VM0w
         rYZPqqYY7yMlsMiEiQAASDraAW4BSTcSecoCXHRoG+GXvUwta996971qwo3xkF2Dgflm
         UAhQ==
X-Gm-Message-State: ACgBeo1d4m7T0f0YEPylTJu+499x2F+xh5LS4h/bR29mvblBF/Dkny6B
        KKUsWs11d85WFi2Afcr1/K1vd7OdqEMOvG5Yx7Kuag==
X-Google-Smtp-Source: AA6agR4l1xB762o3DaSOS5+KZCpE8WDptXDx0mKu9slBlWSXdcqJncsF4brvN7CKb06geMDtHrbRW0K/th1I6X+zY0I=
X-Received: by 2002:a17:907:2707:b0:741:7c18:4e76 with SMTP id
 w7-20020a170907270700b007417c184e76mr27550306ejk.690.1662465462649; Tue, 06
 Sep 2022 04:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <YxDL+cAx9kkZRL8K@shell.armlinux.org.uk> <928ddeff-efac-920c-7bbf-dda35a942b93@linaro.org>
 <YxDOpCq0vIlt4VNa@shell.armlinux.org.uk> <2fedff34-6a20-f1ce-a756-2bd8671fcd52@linaro.org>
 <YxDWG5dmzErhKIXw@shell.armlinux.org.uk> <ef6c7248-1efa-5366-6bcd-900c5f10ccb2@linaro.org>
 <YxDiBFIn6artUOZm@shell.armlinux.org.uk> <CAL_Jsq+GCKisAVA0AfE=yWJYy18mAGQ7rY1sKGYraXv-berNSg@mail.gmail.com>
 <d3cec3d22e464fa8@bloch.sibelius.xs4all.nl> <20220902172808.GB52527-robh@kernel.org>
 <YxcNLU+KGEolrdfT@shell.armlinux.org.uk> <d3cecee5edd24f67@bloch.sibelius.xs4all.nl>
 <CACRpkdaSRcczEF8QZ4aO+-HDVS+n-8MXvn6ysnjJfUEabwUJ=w@mail.gmail.com> <909bb4e7-5bd2-2903-5bba-87ae37f3448a@marcan.st>
In-Reply-To: <909bb4e7-5bd2-2903-5bba-87ae37f3448a@marcan.st>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Sep 2022 13:57:31 +0200
Message-ID: <CACRpkdajhjpMzjMooDduu0jxrp0uDNJ90VfBPpHx+P14cFfskA@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
To:     Hector Martin <marcan@marcan.st>
Cc:     Mark Kettenis <mark.kettenis@xs4all.nl>,
        "Russell King (Oracle)" <linux@armlinux.org.uk>, robh@kernel.org,
        krzysztof.kozlowski@linaro.org, arnd@arndb.de, lee@kernel.org,
        alyssa@rosenzweig.io, asahi@lists.linux.dev, brgl@bgdev.pl,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        sven@svenpeter.dev, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 6, 2022 at 1:36 PM Hector Martin <marcan@marcan.st> wrote:
> On 06/09/2022 20.22, Linus Walleij wrote:
> > On Tue, Sep 6, 2022 at 11:31 AM Mark Kettenis <mark.kettenis@xs4all.nl> wrote:
> >
> >> Another argument for having sub-nodes is that the firmware actually
> >> exposes *two* GPIO controllers.  For now we only support the "master"
> >> PMU GPIOs, but there also is a "slave" PMU GPIO controller that uses a
> >> separate set of SMC "keys".  We currently don't need any of the pins
> >> on the "slave", so we don't expose it in the DT yet.
> >
> > That sounds backward, like we don't expose device X as DT node
> > because $OS doesn't use it yet. DT should just expose (by nodes or
> > other ways) all hardware that exist or at least all hardware we know
> > about no matter what $OS is using.
>
> How so? The are piles and piles of unused hardware not exposed in the
> DT, and piles and piles of hardware that will be used but we haven't
> figured out how to do it yet, so it's not exposed. For example, we know
> there are like 8 or so UARTs, but we don't define them in the DT because
> they are not connected to anything on any existing device and we don't
> need them. Apple does the same thing in their DTs (only used hardware is
> defined).
>
> I don't really see the point of exposing a GPIO controller when we don't
> actually do anything with the pins yet, and might never do so. Having
> drivers bind and stay unused just increases the amount of code running
> without any ultimate purpose, so why do it? It's not like any other OS
> would use the hardware either - GPIOs are only useful if they are
> referenced in the DT for something, and we don't have anything that
> would reference these.

This comes from the FDT background in OpenFirmware, and there is
definitely a timeline perspective (also called "waterfall model") in that
line of thinking: a DT is written that describes the hardware and flashed
into the BIOS and never changed, then the operating system is
implemented at a later point. This is how e.g. the PC ACPI BIOS tables
are also thinking about themselves.

Of course the world does not work like that, but as a standard process
DT and ACPI works with the same ambition as any such process: slowly and
impersonal, like the planets, or the plants.

The ambition that a DT should always remain backward compatible
comes from the same historical root and reasoning.

Any agile development or (heh) hardware discovers through reverse
engineering will of course drive a truck through that line of thinking.

Realistically, use the same approach as with everything else, I like the
IETF motto "rough consensus and running code", any ambition taken too
far will just stifle development. So I'd say make an honest effort to
resonably describe the nodes we see will be useful in the foreseeable
future.

Yours,
Linus Walleij
