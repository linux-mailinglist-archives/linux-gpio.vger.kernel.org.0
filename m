Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 275F9367125
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Apr 2021 19:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244589AbhDURSD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Apr 2021 13:18:03 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:39472 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241450AbhDURSC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Apr 2021 13:18:02 -0400
Received: by mail-ot1-f51.google.com with SMTP id 65-20020a9d03470000b02902808b4aec6dso34841023otv.6;
        Wed, 21 Apr 2021 10:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=umiFi6mJQdxI9V+Aqs5JZ8mJxihX+du8ce5wuPbDkY0=;
        b=Sio7as+rg47zLyQfJ92L0hvnTieG76ZehyQ1E89dbhLuHrR5G7We6q/bTsc507BT7i
         IKQUAaz4YGr5twQ9OYW35pX7Ok7svA5JTf2Y4CE+YrJ3J6fJX9VCcoRj/89fh/+M4mqg
         HbmjAjScV4+iG9CrFYOBrnNsUfCNR1I1IeB9SapGEI9sf2OGwXFvT/3JDTz6WsSw7ld5
         +byqGdYt7zdhwta8+yIh4PY4VjLz6IbiYgN0kSGJk1/onbg4sIPG52nF+kyUUQgRl6Ch
         4z0nNHcL1fNxzbJ4AFp1JOi0pow84eQE7PseVUxoVTUb7mBGdOFTnZJK/onXFBC7tpf7
         HLPg==
X-Gm-Message-State: AOAM533yTuwj0UNuDY11fPJXccODOam/vYfdjuKC5Yo4fx9hS/B33U94
        fQjnkN+QUPLID7xYbCL5Sg==
X-Google-Smtp-Source: ABdhPJyPaZ9Y/Q0Fe+A0TB+bfULJ1ZUsfhstApOyfvKTDiZp2AYxhlxXQbo9uU283LJS7T4Q2fgAxw==
X-Received: by 2002:a9d:b87:: with SMTP id 7mr23585936oth.107.1619025449041;
        Wed, 21 Apr 2021 10:17:29 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d25sm1710otp.72.2021.04.21.10.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 10:17:28 -0700 (PDT)
Received: (nullmailer pid 1316190 invoked by uid 1000);
        Wed, 21 Apr 2021 17:17:27 -0000
Date:   Wed, 21 Apr 2021 12:17:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: gpio: Add devicetree binding for IDT
 79RC3243x GPIO controller
Message-ID: <20210421171727.GA1310436@robh.at.kernel.org>
References: <20210421162026.41978-1-tsbogend@alpha.franken.de>
 <20210421162026.41978-2-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421162026.41978-2-tsbogend@alpha.franken.de>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 21, 2021 at 06:20:26PM +0200, Thomas Bogendoerfer wrote:
> Add YAML devicetree binding for IDT 79RC3243x GPIO controller
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  .../bindings/gpio/gpio-idt3243x.yaml          | 73 +++++++++++++++++++

Use compatible string for filename.

>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-idt3243x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-idt3243x.yaml b/Documentation/devicetree/bindings/gpio/gpio-idt3243x.yaml
> new file mode 100644
> index 000000000000..346a57ef8298
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-idt3243x.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-idt3243x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: IDT 79RC32434x GPIO controller
> +
> +maintainers:
> +  - Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> +
> +properties:
> +  compatible:
> +    const: idt,3243x-gpio

What's the 'x'? Generally, we don't do wildcards for compatible strings.

> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: gpio
> +      - const: pic
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  ngpios:
> +    description:
> +      Number of available gpios in a bank.

That's every 'ngpios'. Drop.

> +    minimum: 1
> +    maximum: 32
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - ngpios
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio0: interrupt-controller@50000 {

gpio@...

As generally it's primarily a GPIO controller and secondarily an 
interrupt controller.

> +        compatible = "idt,3243x-gpio";
> +        reg = <0x50000 0x14>, <0x38030 0x0c>;
> +        reg-names = "gpio", "pic";
> +
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +
> +        interrupt-parent = <&cpuintc>;
> +        interrupts = <6>;
> +
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +
> +        ngpios = <14>;
> +    };
> -- 
> 2.29.2
> 
