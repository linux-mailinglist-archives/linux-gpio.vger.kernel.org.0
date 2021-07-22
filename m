Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92C433D1BAA
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jul 2021 04:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbhGVB3j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jul 2021 21:29:39 -0400
Received: from mail-il1-f172.google.com ([209.85.166.172]:34377 "EHLO
        mail-il1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbhGVB3j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Jul 2021 21:29:39 -0400
Received: by mail-il1-f172.google.com with SMTP id e13so4075808ilc.1;
        Wed, 21 Jul 2021 19:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=HgcF4ypBQsmKvuTQAhAvI4SDF29ESe8doGZm2BtBLrc=;
        b=p3TOrCHFRp7js8TScALQvhwmDXKCGCPyxeZcvJhcMrlR9Mm1iC8TZ+/P2VfIhHmtok
         XGV/6a5ALu/GUNN8gPWbGia6ZB6sRjJ3mHnqBcIYOu99FUQJ2LAMX9s4IYw9JN772DtX
         vh5HMqNpYzh9FoGN0zK2Qk+Xb5qK3SQq578IlasdVNliwgVt6TnXZ+YE2ZXoiCQq+eO/
         MSrGRmI+NnxfZ+FCOf2iKkTrCbzNyzwDoa0Y8oe6ykmZa+6Pe8G2lu2ayGU5PnajCkFF
         Q3tXbkAM7wDtv4z/T00ZFW0LyWmdG7dPct54id3BRNyqkoxJkKHeqvyaYyEoxOkF4po3
         yL2Q==
X-Gm-Message-State: AOAM530LJkSYlgQoEQbbqo34OrFyKtTuTBycjAAJ1ACx6zTAchR2lGsu
        7KS61MLyJmDnUADvCxWllg==
X-Google-Smtp-Source: ABdhPJzpaVTee2drpinZixSzJ9UVv/APEfI0XnLMbKGoZGK4xJ+1DpBrIMlHlVDBBKfYaEg7bP6TaA==
X-Received: by 2002:a92:dc8e:: with SMTP id c14mr26714633iln.91.1626919813759;
        Wed, 21 Jul 2021 19:10:13 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id c16sm14540135ilo.72.2021.07.21.19.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 19:10:13 -0700 (PDT)
Received: (nullmailer pid 3145327 invoked by uid 1000);
        Thu, 22 Jul 2021 02:09:56 -0000
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-sunxi@googlegroups.com,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Chen-Yu Tsai <wens@csie.org>
In-Reply-To: <20210721140424.725744-14-maxime@cerno.tech>
References: <20210721140424.725744-1-maxime@cerno.tech> <20210721140424.725744-14-maxime@cerno.tech>
Subject: Re: [PATCH 13/54] dt-bindings: gpio: Convert X-Powers AXP209 GPIO binding to a schema
Date:   Wed, 21 Jul 2021 20:09:56 -0600
Message-Id: <1626919796.964107.3145326.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 21 Jul 2021 16:03:43 +0200, Maxime Ripard wrote:
> The X-Powers AXP PMICs feature a GPIO Controller supported by Linux
> thanks to its device tree binding.
> 
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
> 
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../devicetree/bindings/gpio/gpio-axp209.txt  | 75 -----------------
>  .../bindings/gpio/x-powers,axp209-gpio.yaml   | 84 +++++++++++++++++++
>  2 files changed, 84 insertions(+), 75 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-axp209.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.example.dt.yaml:0:0: /example-0/i2c/pmic@34: failed to match any schema with compatible: ['x-powers,axp209']
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1508257

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

