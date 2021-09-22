Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70A2A4146FA
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 12:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234987AbhIVKyD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 06:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234760AbhIVKyD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 06:54:03 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33A38C061574;
        Wed, 22 Sep 2021 03:52:33 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id v22so8123473edd.11;
        Wed, 22 Sep 2021 03:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u6QWPY0ZEqxeGsKxeqJpYnJqXioykY6+tbSHoyOs44g=;
        b=q6DINLrg5LLskeE9coe+6hSwLKilWo4+SuMaLl1kl2bAHsOeGaIqSskzc7tjoP6FQ8
         Pji4wKKWhDo1UxIwWDw0LJWGmv7BnF9DHuiiCgqq5C9vvaqTakVgxrQXv/IUN6IXllkD
         GozAlJfYruN042VNsYT1VEcdFpV0KzlmGkq3gIzK61o8d7DZC0LPVysCs4klRpObSozn
         ufIMlYIznXuboSEXZipSqX1mdDFKrNOt+08cCD670yV/aqFxSgQtDTDnOGrWaaGdBphT
         3IlpqbqIlJgY8FHFqe39vKO6/6peaCe3z48Ywu207EI5qASyN/t5wvGfOaASHhjyGblX
         qQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u6QWPY0ZEqxeGsKxeqJpYnJqXioykY6+tbSHoyOs44g=;
        b=rP9Z1jr9siP42Ww+420pZZckSDEPFGs0w3HmgYpu/TiPSbjQ5y3GdH/ODDDK2EcvSj
         lf3G4ymoMH7CXl64n7Cq5x9nNqwbN4iB6rAgiMyoJgDMIDvlM97WK5JaAMxbcRB4fZlI
         PSfMz0J2b3SRlu003BL59umR4rKzNuYu0wiIbtOZkp6WrBmKNT8pwIGGr41rjN16OO+M
         Pws1+VCcD7HM5Fv5bZHzqNqx9TqeT6DdDHKsHHfFnXM5MT3OcoXDA1IkJQ3FJxuKrouC
         GjTEsUSSdvx5TXm9Qpnek6U1sHBZe5WDKRvE990RqvlWRFHdHxF8BUeAq41iCfgwu42B
         pdgw==
X-Gm-Message-State: AOAM533axxyGDqsUSu2ujVOeTulb3YRvox9QBGwEldoLnco0+7PWtQWN
        7l7c5k2RY+v521NhfkKZmbObfIpfLTGu8B8inDs=
X-Google-Smtp-Source: ABdhPJzbGf59JFRJIr0Wb+quTkgdDGmPv69vUBeTyKKxGJWNQ4RjQwYMm+TUllVO7at2zWDAgppsP+th7ItY6p/tN74=
X-Received: by 2002:a17:907:7601:: with SMTP id jx1mr39985455ejc.69.1632307951585;
 Wed, 22 Sep 2021 03:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210717045627.1739959-1-daniel@0x0f.com> <CACRpkdbE+_DJFhBCmtz5JwJupf7QkkWZhXrgf1KG_3rPqvEm0w@mail.gmail.com>
 <CAFr9PXmFHanrx4Frg3hQwo-RbAY-UXxC=FOAj++cshSHa99z3g@mail.gmail.com> <CAMpxmJUoG7qPhy2CxapCn1M=w_AssOQsEmyvXO18OpedM6hBjw@mail.gmail.com>
In-Reply-To: <CAMpxmJUoG7qPhy2CxapCn1M=w_AssOQsEmyvXO18OpedM6hBjw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 22 Sep 2021 13:51:54 +0300
Message-ID: <CAHp75VdU52rwKY3AA0Nxt3VGOFr71XtjCDqZbSxR4GNczSqihQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] gpio: msc313: Add gpio support for ssd20xd
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Romain Perier <romain.perier@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 22, 2021 at 1:21 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> On Wed, Aug 25, 2021 at 1:50 PM Daniel Palmer <daniel@0x0f.com> wrote:
> > Hi Linus, Bartosz,

...

> > I just noticed I hadn't to'd Bartosz about these. Is there anything I
> > need to do for the first patches?
>
> I only have a part of this series in my inbox and patchwork doesn't
> have it at all - can you resend it with me in Cc?

Have you tried to use the `b4` tool? It is capable of getting
everything from the lore archive.

-- 
With Best Regards,
Andy Shevchenko
