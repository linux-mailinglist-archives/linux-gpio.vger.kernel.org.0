Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2764434E75
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Oct 2021 17:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhJTPDg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Oct 2021 11:03:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:44314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229952AbhJTPDg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Oct 2021 11:03:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C35F46138F;
        Wed, 20 Oct 2021 15:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634742081;
        bh=z7VI6hj0K9Fo796pWRUpy2R1Q9kn8kHQhTlWYJrfePw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dyBLcFuF+wn3BShsvjbGx4E3RAwbQT4nrgtZZ2ucQvW0WJgGinS3ELMs5itRcixwb
         ukujKpk5TavF++yrwmYtJS7EyK/0fz1PIVIE+WyV0I67wCiAtnrfE3wag4Qd9yLaL7
         KV8rDitLkufEhSpKc/d+gD48aaFTz+DgYMSzEeWhi1uLQcvS7deh3aU0jbxdWD6tyx
         RGtonH4EvPfPD2kHgFdqJWKT45DtBQiGrzHLWMlViisxbEI4OiUaRJ282itbkWxfup
         Vtvf7hB4MFH0JgXc+FxcveOCU70eyqJsCazXnt40oLBTGOi7JQ8S4kXVyOPcLbd4n1
         WFhfh9pRAtqIg==
Received: by mail-qk1-f173.google.com with SMTP id 77so3353902qkh.6;
        Wed, 20 Oct 2021 08:01:21 -0700 (PDT)
X-Gm-Message-State: AOAM532IPeoffr01SKhBodx2bramKkKnFBZkrD6pmDHwgvhrXC6rkngU
        2FGBfFgWmE2NoCAWb3s+hzxcn41nLD4AVWfQAw==
X-Google-Smtp-Source: ABdhPJyF4QCRR727Up4VIKtIer6TwAG0Kp1SH4RXVSOp5/OcQ0MGQA8sNFtv8DACvo+5a6zmtaeiQivPLevTM4/xvDY=
X-Received: by 2002:a05:620a:4150:: with SMTP id k16mr16220qko.357.1634742080892;
 Wed, 20 Oct 2021 08:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210924071614.868307-1-maxime@cerno.tech> <YWfREhBIFLD/9aqo@google.com>
In-Reply-To: <YWfREhBIFLD/9aqo@google.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 20 Oct 2021 10:01:09 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+tX2TNBLwohWCh05qPsuiYb6n6qmap9f-sko1oOEsi7A@mail.gmail.com>
Message-ID: <CAL_Jsq+tX2TNBLwohWCh05qPsuiYb6n6qmap9f-sko1oOEsi7A@mail.gmail.com>
Subject: Re: [RESEND v2 1/3] dt-bindings: gpio: Convert X-Powers AXP209 GPIO
 binding to a schema
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Maxime Ripard <maxime@cerno.tech>, Chen-Yu Tsai <wens@csie.org>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 14, 2021 at 1:41 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Fri, 24 Sep 2021, Maxime Ripard wrote:
>
> > The X-Powers AXP PMICs feature a GPIO Controller supported by Linux
> > thanks to its device tree binding.
> >
> > Now that we have the DT validation in place, let's convert the device
> > tree bindings for that driver over to a YAML schema.
> >
> > Cc: Chen-Yu Tsai <wens@csie.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: linux-gpio@vger.kernel.org
> > Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >
> > ---
> >
> > Changes from v1:
> >   - Removed the example and moved it in the mfd schema
> > ---
> >  .../devicetree/bindings/gpio/gpio-axp209.txt  | 75 -------------------
> >  .../bindings/gpio/x-powers,axp209-gpio.yaml   | 55 ++++++++++++++
> >  2 files changed, 55 insertions(+), 75 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-axp209.txt
> >  create mode 100644 Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
>
> Applied, thanks.

Pushed out? Still failing in linux-next.

Rob
