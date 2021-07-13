Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE683C728F
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jul 2021 16:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236763AbhGMOtT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jul 2021 10:49:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:58486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236636AbhGMOtT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 13 Jul 2021 10:49:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 17A1C60E0B;
        Tue, 13 Jul 2021 14:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626187589;
        bh=8OfT0pQARDOsKTvRaO4tWkRS4CwArG5IMRk8JhdFeGw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=eDx98K8UcwT5s+ILi3q9xSEhE89E71SJQCdRNBXkfnG8CjAiWOG5zZGkz4+1AfG86
         c4l1McC1/A++77qKRxjuT8JC52h0TVFfbHYoBwtfDGn8c+R1AfblXL9S6VaQHZMqmu
         sT2w+p3ZlCAHX2lG7MMcBGE5a9hQeV9lLJCc4dW0CuY9NZahWMliZFb3U2q7VNpY0M
         r6Xsv1F1PhDnIBuwFXvtUYDDDGVp/ZndGkSir4mr9gED4rqy6fIjdR8sq9FPnwAtYn
         5JFoJhTxoCqPW5pSs292U/QK+pAVOpxSOjsjrAbqDetboZ2cK1qwJR54N5QUUlJihh
         BAqxGKSyqCw4Q==
Received: by mail-ej1-f41.google.com with SMTP id ga14so26958813ejc.6;
        Tue, 13 Jul 2021 07:46:29 -0700 (PDT)
X-Gm-Message-State: AOAM53128dFITcGko1teOuzqCWtigpiTgUUExSfHLWYmphMOny4UmKyD
        wpJv1jMs2AVmYSRLTygTzYYx8MH4C7Srg4/ilA==
X-Google-Smtp-Source: ABdhPJxfbGVd0KOttGqI611VjMxKM2Ddx6d8nMVbxOKG2ZlXCPTSszTMxQPSdlENqS/7uh/2WhwWwGKmW32aZVK8CiA=
X-Received: by 2002:a17:906:28d1:: with SMTP id p17mr5730032ejd.130.1626187587660;
 Tue, 13 Jul 2021 07:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1626173013.git.viresh.kumar@linaro.org> <268086e273df0c53e3a9a1e751304c63e50ebe12.1626173013.git.viresh.kumar@linaro.org>
In-Reply-To: <268086e273df0c53e3a9a1e751304c63e50ebe12.1626173013.git.viresh.kumar@linaro.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 13 Jul 2021 08:46:15 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLuyhSCR=LuFRsAUwL7OUvOahhH3iU+mkQbL8GJoC-cng@mail.gmail.com>
Message-ID: <CAL_JsqLuyhSCR=LuFRsAUwL7OUvOahhH3iU+mkQbL8GJoC-cng@mail.gmail.com>
Subject: Re: [PATCH 5/5] dt-bindings: gpio: Add bindings for gpio-virtio
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Jason Wang <jasowang@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jie Deng <jie.deng@intel.com>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" 
        <virtualization@lists.linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 13, 2021 at 4:51 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
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
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml b/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
> new file mode 100644
> index 000000000000..c813cdfd60fd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-virtio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Virtio memory mapped GPIO controller
> +
> +maintainers:
> +  - Viresh Kumar <viresh.kumar@linaro.org>
> +
> +description:
> +  Virtio GPIO controller, see /schemas/virtio/mmio.yaml for more details.
> +
> +allOf:
> +  - $ref: /schemas/gpio/gpio.yaml#
> +
> +properties:
> +  $nodename:
> +    pattern: '^gpio-virtio@[0-9]+$'
> +
> +  reg:
> +    description:
> +      The cell is the device ID of the GPIO device (VIRTIO_ID_GPIO) as per
> +      dt-bindings/virtio/virtio_ids.h.
> +    const: 41
> +    $ref: /schemas/virtio/mmio.yaml#/properties/reg
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - reg
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/virtio/virtio_ids.h>
> +
> +    virtio@3000 {
> +        compatible = "virtio,mmio";
> +        reg = <0x3000 0x100>;
> +        interrupts = <41>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        gpio-virtio@0 {
> +            reg = <VIRTIO_ID_GPIO>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;

Similar to I2C, all this can just be added to the parent node.

Rob
