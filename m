Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09E9D6AB57
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 17:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388005AbfGPPFB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jul 2019 11:05:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:59284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728513AbfGPPFA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Jul 2019 11:05:00 -0400
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A42C5217D9;
        Tue, 16 Jul 2019 15:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563289499;
        bh=qMHT4LhKbcv+81uzP1b96TgMB2OKJqjrClLOLrRU3oY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oaUfITiv0hgNcoMzLW5x0E3tl1bFDM+0lhBpP6AXrQwJVWslnjSba/YecYFcrrIHJ
         RAs7GpHEICPg/7+qPj5o9FC4PnFzSWAMw+CpiOTO4IQ1JqpquMsCTlhLGhy24nWOjQ
         HYDDRSSPyYlI+2cI5N6rp8YSJpJQNE0bf6WvVQJk=
Received: by mail-qk1-f169.google.com with SMTP id m14so14788295qka.10;
        Tue, 16 Jul 2019 08:04:59 -0700 (PDT)
X-Gm-Message-State: APjAAAUcgU+xP2q/JkShwuU4O7Q23wCdHaavchasOnDJkw58ueSKWmc5
        0p2JlJnVyCnap/h2zbFC3FY4Mt3wcmny34yGFg==
X-Google-Smtp-Source: APXvYqzc1lGEIRKUk6W2DI5gAbyEEw14Pfpx9QFeFOfiGi6kMZ0tKAfX5GbQ1wOWhsE111TtrPjFiaJgvs+cASy4LFY=
X-Received: by 2002:a37:a44a:: with SMTP id n71mr21002339qke.393.1563289498889;
 Tue, 16 Jul 2019 08:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190715223725.12924-1-robh@kernel.org> <CACPK8Xdz98CQzgE2KCjz8eOhPtx=H8jTe1hVT7LvP77U_gGASQ@mail.gmail.com>
In-Reply-To: <CACPK8Xdz98CQzgE2KCjz8eOhPtx=H8jTe1hVT7LvP77U_gGASQ@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 16 Jul 2019 09:04:47 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+AJDNZ-676iP=vv6G-pjWqBJyZ3bJ26o7i=c=KWbozSw@mail.gmail.com>
Message-ID: <CAL_Jsq+AJDNZ-676iP=vv6G-pjWqBJyZ3bJ26o7i=c=KWbozSw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: aspeed: Fix 'compatible' schema errors
To:     Joel Stanley <joel@jms.id.au>
Cc:     devicetree <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-aspeed@lists.ozlabs.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 15, 2019 at 5:17 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Mon, 15 Jul 2019 at 22:37, Rob Herring <robh@kernel.org> wrote:
> >
> > The Aspeed pinctl schema have errors in the 'compatible' schema:
> >
> > Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml: \
> > properties:compatible:enum: ['aspeed', 'ast2400-pinctrl', 'aspeed', 'g4-pinctrl'] has non-unique elements
> > Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml: \
> > properties:compatible:enum: ['aspeed', 'ast2500-pinctrl', 'aspeed', 'g5-pinctrl'] has non-unique elements
> >
> > Flow style sequences have to be quoted if the vales contain ','. Fix
> > this by using the more common one line per entry formatting.
>
> >
> >  properties:
> >    compatible:
> > -    enum: [ aspeed,ast2400-pinctrl, aspeed,g4-pinctrl ]
> > +    enum:
> > +      - aspeed,ast2400-pinctrl
> > +      - aspeed,g4-pinctrl
>
> Thanks for the fix. However, we've standardised on the first form for
> all of our device trees, so we can drop the second compatible string
> from the bindings.

Doing that would introduce validation warnings until the dts file is
updated. So we still need this change until that happens.

Rob
