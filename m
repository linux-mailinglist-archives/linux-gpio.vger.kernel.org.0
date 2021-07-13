Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8A83C71C9
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jul 2021 16:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236832AbhGMOGU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jul 2021 10:06:20 -0400
Received: from mail-il1-f178.google.com ([209.85.166.178]:34509 "EHLO
        mail-il1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236809AbhGMOGT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jul 2021 10:06:19 -0400
Received: by mail-il1-f178.google.com with SMTP id e13so23300905ilc.1;
        Tue, 13 Jul 2021 07:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=W0tPxTxBFqwVjrERv5yBUzJYH1KOoxA14jOPXeTsapQ=;
        b=bR91lGqkMdz4olayLpBSeAENnbHKZ6120q7JP7xzGxTa+fbeX+ysTwi2uuYZwb5ub4
         w8qfFJHfDM285H5cbhVxi03D58AIcuKHoI4HMv0JPDJnsFAj/X0o+AL17Pp25MFW/evf
         LTk1Bz1W6TPNIrDz1U1e6GI8n5jdZHftTkMZSgUkmsCO7XS/ZKFKz8ba2Ce4XO82DbGs
         hQNa3VPxXxe3vOr3SzVzKN/66N7bX9r8zEkhtrnT7SOlYn4efVcOGI96MbKj1YQcD+ow
         VMSIHbqkuMCzesW1O8egEs4lT86+Gdih6WJnGIO2P5F0c7LCGc0sb0naOdsZksaH3eUv
         Zd8g==
X-Gm-Message-State: AOAM532gJSIaCnF2qUTj7o7n6zTTSELwcg4FXxUhEykqkR1pYbMilhvk
        UoWbUOl3fF/0NXaumNDT3A==
X-Google-Smtp-Source: ABdhPJwtHCLdHMImB7FGf/LTlwtrd/GDrGn+A00ynbPDFQORtkdIz28oeNvQHmIoGkb0xe9e6AIBjQ==
X-Received: by 2002:a92:3f08:: with SMTP id m8mr2957950ila.104.1626185009476;
        Tue, 13 Jul 2021 07:03:29 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id e14sm9527471ilc.47.2021.07.13.07.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 07:03:28 -0700 (PDT)
Received: (nullmailer pid 129715 invoked by uid 1000);
        Tue, 13 Jul 2021 14:03:13 -0000
From:   Rob Herring <robh@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        devicetree@vger.kernel.org,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Jason Wang <jasowang@redhat.com>,
        Bill Mills <bill.mills@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        Jie Deng <jie.deng@intel.com>
In-Reply-To: <268086e273df0c53e3a9a1e751304c63e50ebe12.1626173013.git.viresh.kumar@linaro.org>
References: <cover.1626173013.git.viresh.kumar@linaro.org> <268086e273df0c53e3a9a1e751304c63e50ebe12.1626173013.git.viresh.kumar@linaro.org>
Subject: Re: [PATCH 5/5] dt-bindings: gpio: Add bindings for gpio-virtio
Date:   Tue, 13 Jul 2021 08:03:13 -0600
Message-Id: <1626184993.671493.129714.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 13 Jul 2021 16:20:34 +0530, Viresh Kumar wrote:
> gpio-virtio represents a virtio GPIO controller and this patch adds
> binding for the same. The gpio-virtio subnode can be part of a
> virtio,mmio node and is based on its binding.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> Depends on:
> 
> https://lore.kernel.org/lkml/7c716c2eb7ace5b5a560d8502af93101dbb53d24.1626170146.git.viresh.kumar@linaro.org/
> ---
>  .../devicetree/bindings/gpio/gpio-virtio.yaml | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/virtio/mmio.yaml'
xargs: dt-doc-validate: exited with status 255; aborting
Documentation/devicetree/bindings/gpio/gpio-virtio.example.dts:19:18: fatal error: dt-bindings/virtio/virtio_ids.h: No such file or directory
   19 |         #include <dt-bindings/virtio/virtio_ids.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/gpio/gpio-virtio.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1504545

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

