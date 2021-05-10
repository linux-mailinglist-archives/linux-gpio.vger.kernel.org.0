Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 138D03796EC
	for <lists+linux-gpio@lfdr.de>; Mon, 10 May 2021 20:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231668AbhEJSTu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 May 2021 14:19:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:42922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231538AbhEJSTu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 May 2021 14:19:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 497AC61482;
        Mon, 10 May 2021 18:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620670725;
        bh=MKrc8vxS2hqXSFWYT5qeFMnsprfwoWsgRYppPKS+pYs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WlQXgxkDUb8Y+UzZafia+3jSCAC4mZVopyOWkmhHfYd0xiiRzQhHXWT1J2TnUTelv
         ecT98+BaetxDHp81MQevQaY0Pu9wh5AabTKtv9h7n10g6pbHh388LWc46UmnYSW+Kh
         04ir2WZD0/Hrd+OIYc6a4O8HuzML126orV6+uUq9bO1X5GKvQKnVid1yeW90SiaLCs
         1GGGatvcE5+PGtxcR0/byPOo1TyZqfs+IWo2xueyCU2jl0IT3QB/5HU+oB4rHaKx5W
         HinybqQLSLiN9IR1VB34CCpspFoWpokoHhNXfeZxMTAIS01zbSTsp+o81xZ1vqd2/C
         WaTk/qCWa1BpA==
Received: by mail-ej1-f51.google.com with SMTP id t4so26016428ejo.0;
        Mon, 10 May 2021 11:18:45 -0700 (PDT)
X-Gm-Message-State: AOAM531SC7l1AfFYSh+HHx/NFRscNoxUHJ9gfnta3tiveaqa/xUmaD2Q
        w8h2KYHwJBIgspS3y2H9dIqUPvaFbD0Qzk8H8Q==
X-Google-Smtp-Source: ABdhPJzH+hWCzV2ejRCH4BuU2aXMIebOAlVCVaxn3xqgOo25O8ps5efikMC8FhthVf6UqTFwq48Jn4/sdw6T+XLt4I8=
X-Received: by 2002:a17:906:dbdc:: with SMTP id yc28mr7579257ejb.130.1620670723760;
 Mon, 10 May 2021 11:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210508142000.85116-1-kettenis@openbsd.org> <20210508142000.85116-2-kettenis@openbsd.org>
 <1620655299.786306.41436.nullmailer@robh.at.kernel.org>
In-Reply-To: <1620655299.786306.41436.nullmailer@robh.at.kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 10 May 2021 13:18:31 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJVOW2YV=-DOgv8Rzke57KP+1D=60d0RF7mcV7TZbdm5Q@mail.gmail.com>
Message-ID: <CAL_JsqJVOW2YV=-DOgv8Rzke57KP+1D=60d0RF7mcV7TZbdm5Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add DT bindings for apple,pinctrl
To:     Mark Kettenis <kettenis@openbsd.org>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hector Martin <marcan@marcan.st>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 10, 2021 at 9:01 AM Rob Herring <robh@kernel.org> wrote:
>
> On Sat, 08 May 2021 16:19:55 +0200, Mark Kettenis wrote:
> > The Apple GPIO controller is a simple combined pin and GPIO conroller
> > present on Apple ARM SoC platforms, including various iPhone and iPad
> > devices and the "Apple Silicon" Macs.
> >
> > Signed-off-by: Mark Kettenis <kettenis@openbsd.org>
> > ---
> >  .../bindings/pinctrl/apple,pinctrl.yaml       | 103 ++++++++++++++++++
> >  MAINTAINERS                                   |   2 +
> >  include/dt-bindings/pinctrl/apple.h           |  13 +++
> >  3 files changed, 118 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
> >  create mode 100644 include/dt-bindings/pinctrl/apple.h
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/pinctrl/apple,pinctrl.example.dts:19:18: fatal error: dt-bindings/interrupt-controller/apple-aic.h: No such file or directory
>    19 |         #include <dt-bindings/interrupt-controller/apple-aic.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:377: Documentation/devicetree/bindings/pinctrl/apple,pinctrl.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1414: dt_binding_check] Error 2

Ignore this. I've now updated the base to 5.13-rc1.

Rob
