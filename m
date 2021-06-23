Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2795B3B1F5A
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jun 2021 19:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbhFWR1V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Jun 2021 13:27:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:57394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229523AbhFWR1V (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 23 Jun 2021 13:27:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AF39611C1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jun 2021 17:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624469103;
        bh=gMr8rP8mpEjt0aMd757QeA4/5w7wCXBuZHVv1HwKJsg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sgZ6WZIpTQ3xU6g2vc7GhGWmHmMhzRdu4ASC2l5OiKkN1eCDlavveJGXPiq0oYV2y
         wHyWa7+N6wkt733IMm2qwSjAxc8Q10ui9LWVtnVtwdAg7ZoV6nrLiT8l+CyxOshfvW
         HM08p0KVB8plU8KdFfH8E3FZ69aE/GMn/IDXy2oh+nM/GOI423eofKI6ZTs9QSWXrS
         lPd45kbbDPhq26NX9M5NTmmBQH3UmNtaAw/qu7Aw3TfH6cRU9skA+28rV8iByoXgs9
         JkMpDm6etsGsl/WG5vAnWLSfig6Gz/u7LzwPXBdmg5ncF7MeN0edT8Nj+Z6wYrEnRO
         FY9tFapVf3K/w==
Received: by mail-ej1-f53.google.com with SMTP id ot9so4176112ejb.8
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jun 2021 10:25:03 -0700 (PDT)
X-Gm-Message-State: AOAM5307w5NCPIPoE03d/5CkIc3WZWAPzda/BHNuTjbCM4DhZFlXVVBp
        G0n3lk8a+Mh0WBdF8aCmMpj76CWuwojfY7wSZw==
X-Google-Smtp-Source: ABdhPJwXCkmvazE4I3k9S3m14D1cgGGUjG95hpd/rUr6ig/CFZ9myqLecGZuMjtpTnCWl8sT7HSAkacqxEHWfy+lDuo=
X-Received: by 2002:a17:906:82cf:: with SMTP id a15mr1136868ejy.359.1624469102187;
 Wed, 23 Jun 2021 10:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210618062449.1067106-1-jay.xu@rock-chips.com>
 <20210618062449.1067106-5-jay.xu@rock-chips.com> <5359180.zXnORWrf4K@diego>
In-Reply-To: <5359180.zXnORWrf4K@diego>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 23 Jun 2021 11:24:50 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK+TJ8H2pmjZUohJ4Shsx7goYHNvR5zWiPN4c2G+P3kiA@mail.gmail.com>
Message-ID: <CAL_JsqK+TJ8H2pmjZUohJ4Shsx7goYHNvR5zWiPN4c2G+P3kiA@mail.gmail.com>
Subject: Re: [PATCH 4/9] dt-bindings: gpio: change items restriction of clock
 for rockchip,gpio-bank
To:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Kever Yang <kever.yang@rock-chips.com>,
        Liang Chen <cl@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 22, 2021 at 7:02 AM Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Hi Jay,
>
> Am Freitag, 18. Juni 2021, 08:24:44 CEST schrieb Jianqun Xu:
> > From: Liang Chen <cl@rock-chips.com>
> >
> > The clock property need 2 items on some rockchip chips.
> >
> > Signed-off-by: Liang Chen <cl@rock-chips.com>
> > ---
> >  .../devicetree/bindings/gpio/rockchip,gpio-bank.yaml         | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.=
yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> > index d993e002cebe..0d62c28fb58d 100644
> > --- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> > +++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> > @@ -22,7 +22,10 @@ properties:
> >      maxItems: 1
> >
> >    clocks:
> > -    maxItems: 1
> > +    minItems: 1
> > +    items:
> > +      - description: APB interface clock source
> > +      - description: GPIO debounce reference clock source
>
> as said in a previous mail, please adapt this to use clock-names for the
> two clock variant. Maybe something like
>
> clocks:
>   minItems: 1
>   maxItems: 2

While this is fine, the version above with descriptions is better.

> clock-names:
>   minItems: 1
>   maxItems: 2

Don't need maxItems here. Implied by 'items' length.

>   items:
>     - const: apb_pclk
>     - const: debounce
>
> if:
>    properties:
>      clocks:
>        items:
>          const: 2

This says clocks must have values of 2. You want this:

clocks:
  minItems: 2

Note that is condition will also be true if 'clocks' is not present. I
assume it's required elsewhere.

> then:
>    required:
>     - clock-names
>
> [not yet sure if that works]
