Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E59C64DC14
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Dec 2022 14:16:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiLONQp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Dec 2022 08:16:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiLONQo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Dec 2022 08:16:44 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC40D2BB31
        for <linux-gpio@vger.kernel.org>; Thu, 15 Dec 2022 05:16:42 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-3bfd998fa53so40367777b3.5
        for <linux-gpio@vger.kernel.org>; Thu, 15 Dec 2022 05:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b+01YxeCWojKq6MJnZMxV+gUTYg2WewOwWLQORXvvzk=;
        b=UTrxKYqyQzS4BswNluwwBff3YvsX3mkcPOv7ju9IoTtMDPQZ28qcbyXO0ag06eOEzq
         Zy8aOB6cq5R+kJCxMx/WzPoCsf6JREGPtNi618PAqFu0YDobnH5GwvXnbJBGPI8lMZRg
         OiLSbTDu2VG5sDwQnn2/gwpml+UZHp6F0KV8SdFpju+XEvobKHZpeU9up6V4psxDDGfi
         Y9waTerQQ5vwhfwYbKoH7r+ApzXQ6AuIvhOoUR1hHDSPfyXB9pBJHIi/QwLINS57uICD
         rxJfBOnOS3nJChHhjyoMwnv0HfjVZ61Z4/OqKGj3baTFM7ymCc1l1NUj4CA2a9wL6OeZ
         0xtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+01YxeCWojKq6MJnZMxV+gUTYg2WewOwWLQORXvvzk=;
        b=vfC936JViwU86Jac8woVWxLgg+fXKbnSLLFRJ7MbgyaTs+vaCY+MVRjtkN+vc5tQTj
         FPbtK54BvFVVI6Lezq2nkToiWwyPKpDvMjgEmMDfbC0q44yYZHXwFz114hahl8qcMCyW
         jwwSgEp0smScU4axILheV7mL01zwwOFqJQAmfDr9FhAmLclLhiT1nCrRgSXbGNvYBLK/
         T20XR9gIToOA1w3COdS0CwsS3a9lizJOjdzdUK2vXfmdWUSoEolIN3FjOPFTuIqgnJFQ
         qj0mirhv+VSEYFwKqtt4tW1TAQM5wy/D3qK/YGtQZSvdC46JSAQd1Ga1glN6Etbc0XvG
         ni0Q==
X-Gm-Message-State: ANoB5pl5IHxSIyVH6tIb1nN8WTWHYdzllEYsJdRALxdVvWjmoKdo8U4W
        OkI9SIoh8IH/jmklF/72Kkvl9qeFh5MFtaKRv4rg0g==
X-Google-Smtp-Source: AA0mqf6WFpejkWYTC7NxN49XkR4nmcIx4LNbKcsmlCcpF/OPfjrtoXUpMJdGmmgPd3ZjT1BUwvzsgsvSgUAhUbd9Q+w=
X-Received: by 2002:a81:1e04:0:b0:391:fccf:db48 with SMTP id
 e4-20020a811e04000000b00391fccfdb48mr26873545ywe.257.1671110202086; Thu, 15
 Dec 2022 05:16:42 -0800 (PST)
MIME-Version: 1.0
References: <20221214095342.937303-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20221214095342.937303-1-alexander.stein@ew.tq-group.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Dec 2022 14:16:30 +0100
Message-ID: <CACRpkdbPy0krGYDdR4-Ga7tE=Wd6d2_KQ50b94VUvV=Zv=iBvA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] gpio: Add gpio-delay support
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 14, 2022 at 10:53 AM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:

> thanks for the feedback I've received. This is the reworked RFC for
> adressing a platform specific ramp-up/ramp-down delay on GPIO outputs.
> Now the delays are neither specified as gpio-controller nor
> consumer-specific properties.
>
> v2 is a different approach than v1 in that it adds a new driver which will
> simply forward setting the GPIO output of specified GPIOs in OF node.
> The ramp-up/ramp-down delay can now be actually defined on consumer side,
> see Patch 1 or 3 for examples.

I really like this approach, it looks better than I imagined.

> Thanks a lot to the existing gpio-latch driver where I could learn/copy
> from a lot for creating this driver!

Yeah that one is really neat, and also kind of sets a standard for
how we should do these things.

This patch set overall:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
