Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F73A3DE028
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Aug 2021 21:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbhHBTkm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 15:40:42 -0400
Received: from mail-il1-f174.google.com ([209.85.166.174]:44669 "EHLO
        mail-il1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhHBTkl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Aug 2021 15:40:41 -0400
Received: by mail-il1-f174.google.com with SMTP id i13so5599210ilm.11;
        Mon, 02 Aug 2021 12:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J8SamgvZjMzZn8SFG0WG31f9EjYNKG8kJLg4LvePeV4=;
        b=BVx9jLKQPeSXDseYxt1pONzMMAY+NrcK0BjsFUXJHAnmjQOYHqX7oM8ltzqBOiFy5h
         dqnjP6YuVbxV0nE6nn1Ee0pZHaa34j+vZiyaVn3tLQBkCT8rITfNlW6AGbxKZQwzCP9I
         e+wgcL6w2ckqHsHL90nlB15/mRzRLOY/LT5IP7sm2fvZhuDLTyD1boEol8lp4iV3r4pT
         9fcP3JSEfbNwdA+8+ICCBYYSx5RoMs+8TWjp4w4IqForVi07qm8+fh2WGLrmXbZhx/aq
         7ZtpBP2V5ttcTabelAsiEGS5MqeduQR5p4sLfFHouQjGzNoIHw6LmtmtDfSFnqYsH3r7
         KvUg==
X-Gm-Message-State: AOAM532zQE+ZIbSoUW8C06QBrCzpOWw48+5MMev7QttZQLkg6mNBxhJl
        0U8Cpyl/ZAGRz5KxeyPRCg==
X-Google-Smtp-Source: ABdhPJyPJE+Qj7qQn68NldmLQPEMe/MUrKp2yfQyf7zytJe8uOU6ZNPkulS1r9hRjNuLeHzyrwrO/Q==
X-Received: by 2002:a92:b108:: with SMTP id t8mr605095ilh.6.1627933231644;
        Mon, 02 Aug 2021 12:40:31 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id c8sm7708834ioa.51.2021.08.02.12.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 12:40:30 -0700 (PDT)
Received: (nullmailer pid 1475286 invoked by uid 1000);
        Mon, 02 Aug 2021 19:40:27 -0000
Date:   Mon, 2 Aug 2021 13:40:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Jason Wang <jasowang@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Jie Deng <jie.deng@intel.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH V4 3/5] dt-bindings: gpio: Add bindings for gpio-virtio
Message-ID: <YQhKKyPmOUE8z+US@robh.at.kernel.org>
References: <cover.1627362340.git.viresh.kumar@linaro.org>
 <acf7402ef4aabc0ad6295c32846f2bef1cd9b56a.1627362340.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acf7402ef4aabc0ad6295c32846f2bef1cd9b56a.1627362340.git.viresh.kumar@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 27, 2021 at 10:53:50AM +0530, Viresh Kumar wrote:
> This patch adds binding for virtio GPIO controller, it is based on
> virtio-device bindings.
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  .../devicetree/bindings/gpio/gpio-virtio.yaml | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml b/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
> new file mode 100644
> index 000000000000..601d85754577
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
> @@ -0,0 +1,59 @@
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
> +  - $ref: /schemas/virtio/virtio-device.yaml#
> +
> +description:
> +  Virtio GPIO controller, see /schemas/virtio/virtio-device.yaml for more
> +  details.
> +
> +properties:
> +  $nodename:
> +    const: gpio
> +
> +  compatible:
> +    const: virtio,device29
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

Humm, how does one implement interrupts without a parent interrupt? It 
uses the parent virtio,mmio interrupt?

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
> +        gpio {
> +            compatible = "virtio,device29";
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
> 
