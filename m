Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C706A3D5CAD
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jul 2021 17:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234550AbhGZOaq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jul 2021 10:30:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:60604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234423AbhGZOap (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 26 Jul 2021 10:30:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D54760249;
        Mon, 26 Jul 2021 15:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627312274;
        bh=m0IBU7F0RMvEHKFdn1xCumVtd6nSvGkByp5q73T7LeQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=D71+s960RDIL4onn7IlNz1/S9zSILriwTupltVwOU/VjAk9Ak3ImttKxWTB66Pa88
         xKumtgyZGhJVUM3L1FuMFa/lzsdxOOg6R5OFHIr3Mu2EJAE5KpoJz43NhRqnYCyu1e
         OdDIKiChAJ8jMkls3XDOfJxdUDG/FjE92k1bxRH0OXlp9N4ND/1GI7wb9lsAgo2KAJ
         x0lBEAxgkAlM/GySJpI0FjbEUQ7k3GB7z/+HdMAZkUlwuyXvcy9ng1tqzWrSfaDStR
         weXEkHs0ZcrAGl6Ei+ObVukHAxMHlKmoxRVB4ss1amrJOYVg1tObFVs5cqoay8g47Q
         XByMjjrWc3NdQ==
Received: by mail-ej1-f46.google.com with SMTP id gt31so16779495ejc.12;
        Mon, 26 Jul 2021 08:11:14 -0700 (PDT)
X-Gm-Message-State: AOAM531s7AvJ5oHeZ24wiXad8FivIAPyAZ+6M5rkeBNAZvEoT6rbqq4e
        2UoOj5hxeko0L2mnuxPkqTfDWza25ENImzDS2g==
X-Google-Smtp-Source: ABdhPJw040a5khoi+ktio5Acuzg5hfGThWYX1n2PYs6nq9crOr67MIKoPy+W3zT0TLDNlUN4taup1B0vvMXjcA6KByA=
X-Received: by 2002:a17:906:d287:: with SMTP id ay7mr1112894ejb.360.1627312273160;
 Mon, 26 Jul 2021 08:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627273794.git.viresh.kumar@linaro.org> <605b87ce93b9a528810a5857984bfe6b913d5e73.1627273794.git.viresh.kumar@linaro.org>
In-Reply-To: <605b87ce93b9a528810a5857984bfe6b913d5e73.1627273794.git.viresh.kumar@linaro.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 26 Jul 2021 09:11:01 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKbk+Y-QiyzRpeCVAQvSWMOn7j51t4uUMkEw61XX3-muQ@mail.gmail.com>
Message-ID: <CAL_JsqKbk+Y-QiyzRpeCVAQvSWMOn7j51t4uUMkEw61XX3-muQ@mail.gmail.com>
Subject: Re: [PATCH V3 3/5] dt-bindings: gpio: Add bindings for gpio-virtio
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

On Sun, Jul 25, 2021 at 10:52 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> This patch adds binding for virtio GPIO controller, it is based on
> virtio-device bindings.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  .../devicetree/bindings/gpio/gpio-virtio.yaml | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml b/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
> new file mode 100644
> index 000000000000..96108cfb7a08
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-virtio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Virtio GPIO controller
> +
> +maintainers:
> +  - Viresh Kumar <viresh.kumar@linaro.org>
> +
> +allOf:
> +  - $ref: /schemas/gpio/gpio.yaml#

You don't need to include this.

> +  - $ref: /schemas/virtio/virtio-device.yaml#
> +
> +description:
> +  Virtio GPIO controller, see /schemas/virtio/virtio-device.yaml for more
> +  details.
> +
> +properties:
> +  $nodename:
> +    pattern: '^gpio-virtio(-[a-z0-9]+)?$'
> +
> +  compatible:
> +    const: virtio,29
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
> +  - compatible
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    virtio@3000 {
> +        compatible = "virtio,mmio";
> +        reg = <0x3000 0x100>;
> +        interrupts = <41>;
> +
> +        gpio: gpio-virtio {
> +            compatible = "virtio,29";
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +        };
> +    };
> +
> +...
> --
> 2.31.1.272.g89b43f80a514
>
