Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 916BB3971C2
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 12:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbhFAKqM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 06:46:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbhFAKqM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jun 2021 06:46:12 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A91C061756
        for <linux-gpio@vger.kernel.org>; Tue,  1 Jun 2021 03:44:30 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id b18so16959430lfv.11
        for <linux-gpio@vger.kernel.org>; Tue, 01 Jun 2021 03:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MNIiBPe7Xgkk/pQlTn5d5oBTgg8+i5Bf4QSJR9wISVM=;
        b=UXkQHT3eBr+4JEvtzopIhZ1FvV3ocxuIYgeJ+7Su7fYCJ+dkwEyccmnGDbXqTpQXBa
         4D+czka30Sntd5pqwadbJ+Fq33TIkGQPN/0YVo+5mMyrYwik/0aYGD2jMwvJjph5Rge8
         bNtZVVIfMKVzC/NorGzwfSkYaX5RvV5LNk72BsdEO4C+pupjQurW+qDzc5Y/IuE3T7xH
         iZSlq0ilBaxuxQtypbr/oNlRsEVlCHBT2DwLZ/AV1234NH1yvTnSH2mkoawJTx3nr8dF
         aA0TZ051QZhPIuAHoUCZdxCT+zP+kapzbmeLw7kbjQ0sx/riAhd+J1zA3hxxAY0dCTSl
         wAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MNIiBPe7Xgkk/pQlTn5d5oBTgg8+i5Bf4QSJR9wISVM=;
        b=ohCDtrRF12cDfQ0JeJrrKCj1+ehGrp2AZZWSOEb0Vg55kN214xtDktM6NQGTPJ38Wy
         UrB9PCtl1RflgYFN0MIeixvwRDckwa5x70qAwZ4t1YtSnMivLKaPzTQdzDbN3BF3X952
         kShe6qdUbLRc3BvaKG83J40JO09Syh0oVpZGtSP0iUhIDE7+eWrEpjp5RY1aLNNLpyIu
         GbJ+Aaw2bmL6OK7hv2EdFbxvL19ClzT3bLcewnO4LJKUwwsAH4kBNgq/KxopsiGXWXYJ
         0zuD+fgHBIj3Ec7K9mlcc5WPW7Xlsidi26uxngKKT5kpeqYjT3+kb8KugaVvY0qohILD
         0SqQ==
X-Gm-Message-State: AOAM530MHZ/AwgWZSI9mp/WHp3enW/das7wUFUm3r0L+TSw5ECiNXZTZ
        SKVML0DhyaHESso26tVFQlWbpIlrvhyu/tT/5fBrvg==
X-Google-Smtp-Source: ABdhPJymNy/m+dkQx0iYjjTIrVKPk7L2Q0TqaniD+inM4naMM/JHehOqRI2qhFyGjgM79n4LG885n/7C85sCH1/cmGA=
X-Received: by 2002:a05:6512:3e03:: with SMTP id i3mr14333979lfv.529.1622544269211;
 Tue, 01 Jun 2021 03:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210530161333.3996-1-maukka@ext.kapsi.fi> <20210530161333.3996-2-maukka@ext.kapsi.fi>
In-Reply-To: <20210530161333.3996-2-maukka@ext.kapsi.fi>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 1 Jun 2021 12:44:18 +0200
Message-ID: <CACRpkdZfdd=ogHoNGuLzGGZYkvw7xtNO2VJm-t-2vMibGNy=dA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: gpio-mux-input: add documentation
To:     Mauri Sandberg <maukka@ext.kapsi.fi>
Cc:     Mauri Sandberg <sandberg@mailfence.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Drew Fustini <drew@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 30, 2021 at 6:16 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:

> Add documentation for a general GPIO multiplexer.
>
> Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
> Tested-by: Drew Fustini <drew@beagleboard.org>
> Reviewed-by: Drew Fustini <drew@beagleboard.org>

After some thinking I realized these bindings should not
be restricted to just input. There exist electronic constructions
such as open drain that would make it possible to mux also
outputs.

>  .../bindings/gpio/gpio-mux-input.yaml         | 75 +++++++++++++++++++

Rename it just gpio-mux.yaml

> +$id: http://devicetree.org/schemas/gpio/gpio-mux-input.yaml#

Also here

> +title: Generic GPIO input multiplexer

Generic GPIO multiplexer

> +description: |
> +  A generic GPIO based input multiplexer

Not just input

> +  This driver uses a mux-controller to drive the multiplexer and has a single
> +  output pin for reading the inputs to the mux.

Make this clearer and do not mention "driver".
Here is a suggestion:

This hardware construction multiplexes (cascades) several GPIO
lines from one-to-many using a software controlled multiplexer.
The most common use case is probably reading several inputs
by switching the multiplexer over several input lines, which in
practice works well since input lines has high impedance.

Constructions with multiplexed outputs are also possible using
open drain electronics.

> +  For GPIO consumer documentation see gpio.txt.

No need to mention this I think, not your problem :D

> +  pin-gpios:

I still want this renamed like in my previous mail.

Hope all is clear!

Yours,
Linus Walleij
