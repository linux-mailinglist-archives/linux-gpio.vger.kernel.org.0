Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79AEC3D9258
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 17:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbhG1Pvk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 11:51:40 -0400
Received: from mail-io1-f41.google.com ([209.85.166.41]:46851 "EHLO
        mail-io1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbhG1Pvk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 11:51:40 -0400
Received: by mail-io1-f41.google.com with SMTP id z7so2665121iog.13;
        Wed, 28 Jul 2021 08:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=QGlRQ7YvLwv8K5AbN7ZnxnSoIhB/O2l82NrH2XfQAws=;
        b=Mv6N5P9IxHdI/9yK8xG1g3OMplQOQVZoUao/p+6NUgmEBm7Vx8X+7fWZ7nJOlpgbEZ
         OlKv0IziEvqdCTsPOptjnOcBlY4IBnNHnkdFGu13kPXALEIAoMwDyZpLIfQeUmOGcfsl
         Cyz/FoRAp2xBAZ6e49qdjrGMTTklGDx8cGhPF1G9IRxWWE3Nf1RAadOlvhorV1hiXkOh
         JTxveLtSfhoDi1vRsFfl0FTyOmpxspLREL6GAi9DMZCwYitQ4UizSWcGirY12wcX45Ui
         Mav37uDp5PMKILvGNdPUVq1M30HC8sF0I8tIU0Yey6aGYe8PUkO2mHN7QZC+sLZrag+6
         URQg==
X-Gm-Message-State: AOAM533GvLFN/b3y/HV5yYFf3f4cg2GEaRH6iFyx04sRIV1J+JKyHuux
        zfP981d9j7MyeLjGO3P9tA==
X-Google-Smtp-Source: ABdhPJzaxRpaGHuNLWhFtE2F69DI0X2Ny22fQs48Z8P6xy+5OSHIaCODrcsxpUgXTInNv5LVA4hffg==
X-Received: by 2002:a6b:1685:: with SMTP id 127mr99194iow.135.1627487498497;
        Wed, 28 Jul 2021 08:51:38 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id t15sm238450iog.26.2021.07.28.08.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 08:51:37 -0700 (PDT)
Received: (nullmailer pid 1132983 invoked by uid 1000);
        Wed, 28 Jul 2021 15:51:35 -0000
From:   Rob Herring <robh@kernel.org>
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
In-Reply-To: <20210728135534.703028-2-pgwipeout@gmail.com>
References: <20210728135534.703028-1-pgwipeout@gmail.com> <20210728135534.703028-2-pgwipeout@gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: gpio: rockchip,gpio-bank: increase max clocks
Date:   Wed, 28 Jul 2021 09:51:35 -0600
Message-Id: <1627487495.967642.1132982.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 28 Jul 2021 09:55:26 -0400, Peter Geis wrote:
> The rk356x adds a debounce clock to the gpio devices.
> Increase the maximum clocks to account for it.
> 
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.example.dt.yaml: gpio@2000a000: clocks: [[4294967295, 9]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.example.dt.yaml: gpio@2003c000: clocks: [[4294967295, 10]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1510854

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

