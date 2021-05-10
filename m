Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E89E379040
	for <lists+linux-gpio@lfdr.de>; Mon, 10 May 2021 16:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233321AbhEJOKE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 May 2021 10:10:04 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:35751 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236589AbhEJOC5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 May 2021 10:02:57 -0400
Received: by mail-ot1-f44.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so4313326otg.2;
        Mon, 10 May 2021 07:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=zkNOi+AeYy8RqgiLSjU5eLDqV8SPceK2kxXHGYMi+Fk=;
        b=CjaF/k3xFbHfnlZ8TmIVYiiuyc10VxLMd9Dzsy9ybSskqrJXf8ILDg9v/u2Vki6yBH
         Rf5SqUQQoIysNNi4UU0YSlMi9jpKwrr9XH4lV9JZkRQEq79gj7TQxJosgQP8GjQ25xAO
         H5rs1iNSFMqLtPbO8vEhQ/K65pyvOCwDR/luxxQiWyTKSfvA77HDkfka67/gXNP9mKTB
         oYsiFFUStZUqrbna/haj9HwHYoBG9wQlOlC0+kV7QrTeA/c+Z3kHw8WURI6tpifMxu8D
         Bfq9fL981mAc3usOKfPW36E+1M+ig2KOzfmz4X+UselOVY5D4vVQLjmJ5wC9FsThQUFR
         z7Sw==
X-Gm-Message-State: AOAM532miDmB2pmiEJDdhRIoLuRuNaHSRgB142JRrkCUc2REkws0U36w
        aYgq5GhEk8SH6xu9yfy2Cg==
X-Google-Smtp-Source: ABdhPJwNxwGjOycSmIuO9shvFfAj414aImA73XnzlSatPsdU0cbJlY7ybYvfpWCuc0uIUATaVU4tYQ==
X-Received: by 2002:a9d:4697:: with SMTP id z23mr22002463ote.109.1620655312421;
        Mon, 10 May 2021 07:01:52 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k8sm2610032oig.6.2021.05.10.07.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:01:51 -0700 (PDT)
Received: (nullmailer pid 41437 invoked by uid 1000);
        Mon, 10 May 2021 14:01:39 -0000
From:   Rob Herring <robh@kernel.org>
To:     Mark Kettenis <kettenis@openbsd.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Hector Martin <marcan@marcan.st>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
In-Reply-To: <20210508142000.85116-2-kettenis@openbsd.org>
References: <20210508142000.85116-1-kettenis@openbsd.org> <20210508142000.85116-2-kettenis@openbsd.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add DT bindings for apple,pinctrl
Date:   Mon, 10 May 2021 09:01:39 -0500
Message-Id: <1620655299.786306.41436.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 08 May 2021 16:19:55 +0200, Mark Kettenis wrote:
> The Apple GPIO controller is a simple combined pin and GPIO conroller
> present on Apple ARM SoC platforms, including various iPhone and iPad
> devices and the "Apple Silicon" Macs.
> 
> Signed-off-by: Mark Kettenis <kettenis@openbsd.org>
> ---
>  .../bindings/pinctrl/apple,pinctrl.yaml       | 103 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +
>  include/dt-bindings/pinctrl/apple.h           |  13 +++
>  3 files changed, 118 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/apple.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/apple,pinctrl.example.dts:19:18: fatal error: dt-bindings/interrupt-controller/apple-aic.h: No such file or directory
   19 |         #include <dt-bindings/interrupt-controller/apple-aic.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:377: Documentation/devicetree/bindings/pinctrl/apple,pinctrl.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1414: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1475875

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

