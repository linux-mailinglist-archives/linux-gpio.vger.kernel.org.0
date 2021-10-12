Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00C3742A8B6
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 17:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237386AbhJLPpm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 11:45:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:36494 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237382AbhJLPpm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 Oct 2021 11:45:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 613B8610EA;
        Tue, 12 Oct 2021 15:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634053420;
        bh=+NcxmneZwUx/KAF+cqk+pHvqjws8+6x2l8OhgWrHevU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qwcmib2Pj7qScOVbfak9KfICE8srqHBjI+ZRC7Q+wI5uoFA8pyr6q3lMorRbHJ+nJ
         L520NvZxgYUUdORHO5YJaZPXYDQC/+DDJ7qhJfd142GhlsR05uS1++O/2i4jgCDmpt
         kMno/HuZy0ustZbOyjN/cRO+gxX570sDObyPBXj8NG2xBgeB8nWb0/W6vtVSN+lLss
         KTgmldBNXNlMVmSBFeG6yaCzfwFjRK4EyAGwcKTtz1OHc3qQTitHqg9SIDs61brcWa
         Z+uwJtxRbWk14cJOLu7Y/v0nShkMhh1z4pzRpzxwom/VBezFyf5D3uHYMEq2FpuqRc
         druf5zbu/5q+A==
Received: by mail-ed1-f49.google.com with SMTP id r18so1101077edv.12;
        Tue, 12 Oct 2021 08:43:40 -0700 (PDT)
X-Gm-Message-State: AOAM533QBy3oN+Doqm6OA4U/ABcee0xJENRGTdQKFfBiX+lAoAPST39Y
        4rsqOOaHP+uANPi6Wze9N15O0R52h4lk5FyA9A==
X-Google-Smtp-Source: ABdhPJzDPMAET5T6iDEfX4w4s6nnhrxBrU1iVlj20mqSc1ZcQR/zAgPvd4gaR+L1QD+PX3Or/0NH570WwlZYOionBMw=
X-Received: by 2002:aa7:c357:: with SMTP id j23mr725044edr.145.1634053418356;
 Tue, 12 Oct 2021 08:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210924071614.868307-1-maxime@cerno.tech> <CAL_JsqL3BUX8jO4X12Au_VAytboisQAoxDYz03rQfDMJjL4EDA@mail.gmail.com>
 <YWWg0PjnuBCKO3Tq@google.com>
In-Reply-To: <YWWg0PjnuBCKO3Tq@google.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 12 Oct 2021 10:43:26 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKK_ZC95QfDYsKWdFM3bF+DD7wD=R=--6d74DwqHkgexA@mail.gmail.com>
Message-ID: <CAL_JsqKK_ZC95QfDYsKWdFM3bF+DD7wD=R=--6d74DwqHkgexA@mail.gmail.com>
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

On Tue, Oct 12, 2021 at 9:51 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Tue, 12 Oct 2021, Rob Herring wrote:
>
> > On Fri, Sep 24, 2021 at 2:16 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > The X-Powers AXP PMICs feature a GPIO Controller supported by Linux
> > > thanks to its device tree binding.
> > >
> > > Now that we have the DT validation in place, let's convert the device
> > > tree bindings for that driver over to a YAML schema.
> > >
> > > Cc: Chen-Yu Tsai <wens@csie.org>
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: linux-gpio@vger.kernel.org
> > > Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > >
> > > ---
> > >
> > > Changes from v1:
> > >   - Removed the example and moved it in the mfd schema
> > > ---
> > >  .../devicetree/bindings/gpio/gpio-axp209.txt  | 75 -------------------
> > >  .../bindings/gpio/x-powers,axp209-gpio.yaml   | 55 ++++++++++++++
> > >  2 files changed, 55 insertions(+), 75 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-axp209.txt
> > >  create mode 100644 Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> >
> > This one not being applied with the rest of the series is also
> > breaking linux-next.
> >
> > b4 am -P_ -sl -o - 20210924071614.868307-1-maxime@cerno.tech | git am
>
> Thanks for the link.
>
> Seeing as there are no *real* dependencies, it would be better for
> Linus to take the patch (if he's okay with it of course).

Only that 'make dt_binding_check' is broken for anyone using your
branch (and linux-next ATM). It's as real as a broken build due to a
missing header. If you don't think this is a problem, then don't apply
MFD binding patches.

Rob
