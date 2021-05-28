Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1DF393AAC
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 02:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234331AbhE1Ayz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 20:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235905AbhE1Ayy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 May 2021 20:54:54 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00AF5C061760
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 17:53:18 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id q1so2836789lfo.3
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 17:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vbX6pM+seZu9wlyfbAeur9NPZdT7LDl780JRgegZV7Y=;
        b=GFq0cmtEv7xS+1fzxOfXQ7FjbeJRs3m631Nx2J4Cd/9cvIuSueyKLRXo2PBC92s7BO
         GefnKuBO6SiDsBzraZmhlg5wmODvAqPQ4OKhuhy4QiRfAxKbK8XSX/3mapffw4Hsauqj
         umsgZrH5g5PvNs+862RKm51R6xLlfIkYAFpM2tqbZUNg4S29CKWimpROvIv0wFoR+3HV
         t5lqsbfBbHkdDiFHewL1XZKrcv4ffuINTPyrKS+3Wv9XJZpqE/tcv59wP06YOjBE7YVQ
         37c05LHLqvWAsTzb1zgW5AaRgODruiy5oskubd+WZhcSHw9Dg342JNDkv3qPSD2aid4e
         +MWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vbX6pM+seZu9wlyfbAeur9NPZdT7LDl780JRgegZV7Y=;
        b=DL7jBNcDgTZ8uqVSy/JUNMGkvHy4FISH/PiqxrwvpGe7XytLEEaVT6/LWKIjBdrDln
         JJMCQu5Lups1cVbwcgyd7sBhukaMImuiiffRq33FTyQbxvj20QamrHdsBTIg0hoQlV1P
         B2fs/XsVV45DmyB6PXsyIngx88X8hdOxtAVHG2OTgFHQdAcLgqteScSSuUZd27S/tdct
         +4DtRr7p1FmxeDUbVzhlJCr0wl/iKzxrBtnDdBhQJV1pmEQbsYdeiis+tmJGLjyJzT3T
         5p+e0I83CtxAUFUumtYEN/0linrEGF8tBLZzQ4YHN9dH9voFVNztxw6C/3raMk4Ea3s1
         nj6Q==
X-Gm-Message-State: AOAM5318QFq1jO9PzT+CjXPcvIFx/wjRkF8ivxd0i25cB+3rKJWgiSIN
        8OXl745FSeAaRuBCol9eDiNGMp2BHlGemsXgOKgJ12dt1U4=
X-Google-Smtp-Source: ABdhPJyiVLd2k1988bBN8brTDYX+FK7yEB0nKuBfhRFviLijkC7Brn667eZDBeWRCanjXoe9PhoIJB5+M94CSeQcFA8=
X-Received: by 2002:a19:f616:: with SMTP id x22mr3976589lfe.291.1622163196370;
 Thu, 27 May 2021 17:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
 <CACRpkdaSr_CV1pKS44Ru15AEJ0-1429+6E7Lei2sPHdaijr9iw@mail.gmail.com> <0c2a8ffab666ef31f5cee50b8b47767285dfe829.camel@fi.rohmeurope.com>
In-Reply-To: <0c2a8ffab666ef31f5cee50b8b47767285dfe829.camel@fi.rohmeurope.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 May 2021 02:53:05 +0200
Message-ID: <CACRpkdZ2GdrGr8-XnVvf59O4AVBueBjX0PHYGtOeOdGXi=iE4A@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] gpio: gpio-regmap: Support few custom operations
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Walle <michael@walle.cc>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-power@fi.rohmeurope.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 27, 2021 at 8:32 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:

> I think that the disagreement boils down to few styling issues - and
> one more pragmatic one. And only what comes to how we allow
> implementing the IC specific call-backs for these more complex HW
> specific cases. "Styling" boils down to providing getter-functions for
> well-defined gpio_regmap properties like regmap, device and fwnode
> pointers Vs. exposing these in a well-defined structure as function
> parameters.

Just do it the way the maintainer likes it I guess? Michael wrote
the driver so do it in his fashion.

> So
> at the end of the day it's fair to go on in a way Michael and You find
> easiest to maintain.

What makes things easy for me to maintain is active and happy
driver maintainers, so it is paramount that the file looks to Michael
like something he wants to keep maintaining. This removes work
from me and Bartosz.

Maintainer style quirks are common, I have some myself (like
never allowing __underscore_functions) we just adapt to their
quirks and be good diplomats.

Yours,
Linus Walleij
