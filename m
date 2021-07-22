Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 236EF3D1BB1
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jul 2021 04:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbhGVBcy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jul 2021 21:32:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:38708 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230017AbhGVBcw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Jul 2021 21:32:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0353861279;
        Thu, 22 Jul 2021 02:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626920008;
        bh=370stALHR0Ip623QlakYl1SiBljMLZjy+3f2TkFJyYQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uveRBhnwfwA+rN/yTOrouJ1Wjn6iflOlW2Ky7/PkQcwMjn4Kbyo7ZLqZv8uIGGDk+
         YysqPTvA7nDGxtIkRfizgbIMkOM06Z9ezo9T2OkKY1UtopyxKUVAbe/WcPhKX3mbIW
         ce7+jwET19JFfQNBNYWT6J0inCeCdcfbqRMmeIDv3gl8qXwy9pIaZRy2gQ8xRQRxyr
         AAnR1xKoPyt5seoPz98iHKCKBRaWXRedh3zALGS9gAlbsPMBUf2uNgvq//p13kNFXw
         0WAEXzojCd3D4XP9LLflVNxmZwExAeoE8yyTCPYhDBWurOD/jkM+qdgVXQJwTUUqMg
         DYPIZNf10ArOA==
Received: by mail-ej1-f52.google.com with SMTP id c17so6097947ejk.13;
        Wed, 21 Jul 2021 19:13:27 -0700 (PDT)
X-Gm-Message-State: AOAM533iF9JODhySNMpHoI7HPVYyl7breh7otA/jycAlyAv5QMspXRHg
        rUYczqN580+RpbjgkM05VSPnR4QXPgS6Yus+sg==
X-Google-Smtp-Source: ABdhPJwQoQZQ2l52Ur+LV4/CGbAsuwKxel9DQ5dk7268sFD3mqa9rcFkLuDlZneZI6MrqdHzuoFJjOtUMFces4nrf88=
X-Received: by 2002:a17:906:5fc1:: with SMTP id k1mr40216933ejv.360.1626920006572;
 Wed, 21 Jul 2021 19:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210721140424.725744-1-maxime@cerno.tech> <20210721140424.725744-14-maxime@cerno.tech>
 <1626919796.964107.3145326.nullmailer@robh.at.kernel.org>
In-Reply-To: <1626919796.964107.3145326.nullmailer@robh.at.kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 21 Jul 2021 20:13:15 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLdSd0RpV8YyvQrF5eLzrdScBccqRX2sOqpQPxEot7Jjw@mail.gmail.com>
Message-ID: <CAL_JsqLdSd0RpV8YyvQrF5eLzrdScBccqRX2sOqpQPxEot7Jjw@mail.gmail.com>
Subject: Re: [PATCH 13/54] dt-bindings: gpio: Convert X-Powers AXP209 GPIO
 binding to a schema
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-sunxi@googlegroups.com,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Chen-Yu Tsai <wens@csie.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 21, 2021 at 8:10 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, 21 Jul 2021 16:03:43 +0200, Maxime Ripard wrote:
> > The X-Powers AXP PMICs feature a GPIO Controller supported by Linux
> > thanks to its device tree binding.
> >
> > Now that we have the DT validation in place, let's convert the device
> > tree bindings for that driver over to a YAML schema.
> >
> > Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Cc: Chen-Yu Tsai <wens@csie.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: linux-gpio@vger.kernel.org
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  .../devicetree/bindings/gpio/gpio-axp209.txt  | 75 -----------------
> >  .../bindings/gpio/x-powers,axp209-gpio.yaml   | 84 +++++++++++++++++++
> >  2 files changed, 84 insertions(+), 75 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-axp209.txt
> >  create mode 100644 Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.example.dt.yaml:0:0: /example-0/i2c/pmic@34: failed to match any schema with compatible: ['x-powers,axp209']

Please make the mfd schema example complete if not already and drop
the example here.

Rob
