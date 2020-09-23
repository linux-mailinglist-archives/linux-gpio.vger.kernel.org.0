Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2832762D5
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 23:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgIWVIO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 17:08:14 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:33507 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbgIWVIN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 17:08:13 -0400
Received: by mail-io1-f65.google.com with SMTP id r25so1083604ioj.0;
        Wed, 23 Sep 2020 14:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sQJeQYvWYGwIhufeJuNNKhJrxUdl0QJIybJsORlJntk=;
        b=jnaOQAWtIis1hxhVofJm2acL6jzTNzGgCpOMeBcvukdVoUzD++ysVEbKU8Lo7dPSLr
         3W/55Cabisj/rMqf3psr/xfX1Yxq9OR3OJz03HK7CfTua+JL1sc2aZ7Hjx+rO24f1lDd
         ob6VDBKeqcZtacS5nKwCerS/sthh1MU2zeCTjQVkC0uLSDYRL4BGO1sgWHTq2WxkMklK
         wphiKG2ZMGPr4u6mqNQd16VWTQqbgzQIwwIojlUD7l9rDhGZFzxCCuRISKJMnJfAF7cv
         SV5Be0grLw2RA3hgbZP5BJxW9jN85ZIv9r1hIVYQAO3fQ+RO/6JM5njdgjZ+29Cm/3nc
         UP8A==
X-Gm-Message-State: AOAM532PIqBmuobmwI+Bm1d3nxzTasc6+LSJ+JTlNth8JGsSf0FmZ4e4
        hFuNuX7yOnaQfBrXaVR90A==
X-Google-Smtp-Source: ABdhPJwLhvvK8p71WvE5gl6juqm6D2PKwt6Q8pOoQtI3cVp6zSaC1wByyCGWVa1RRp3euYNcaE3cjw==
X-Received: by 2002:a6b:720d:: with SMTP id n13mr1112117ioc.210.1600895292808;
        Wed, 23 Sep 2020 14:08:12 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id l9sm402826ilq.29.2020.09.23.14.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 14:08:12 -0700 (PDT)
Received: (nullmailer pid 1312302 invoked by uid 1000);
        Wed, 23 Sep 2020 21:08:10 -0000
Date:   Wed, 23 Sep 2020 15:08:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: gpio: pl061: add gpio-line-names
Message-ID: <20200923210810.GA1312254@bogus>
References: <20200920195848.27075-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200920195848.27075-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 20 Sep 2020 21:58:45 +0200, Krzysztof Kozlowski wrote:
> Describe common "gpio-line-names" property to fix dtbs_check warnings
> like:
> 
>   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dt.yaml: gpio@e8a0b000:
>     'gpio-line-names' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v2:
> 1. Common GPIO goes to dt-schema
> ---
>  Documentation/devicetree/bindings/gpio/pl061-gpio.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
