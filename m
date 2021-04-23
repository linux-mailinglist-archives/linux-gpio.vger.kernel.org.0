Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF073698B3
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Apr 2021 19:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbhDWRyf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Apr 2021 13:54:35 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:45823 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhDWRyf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Apr 2021 13:54:35 -0400
Received: by mail-ot1-f44.google.com with SMTP id f75-20020a9d03d10000b0290280def9ab76so40904558otf.12;
        Fri, 23 Apr 2021 10:53:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dUihWGLPf24yxWIoNrNxjcFI5se2ZTXka2u5coVRttU=;
        b=Phsh3EwFC9jfuWkVt91iwy0InJFMX+o0zTBnaXoBLe/uyMM+CSLRCc4dBlm5fZmFvS
         mFfoemATGf8HKJWPdT7OJ1tcYxf3xsoFxv42vQ/dp71wd7QQPI/O4Idj3cK+IBHuVqeG
         QQn6GZpS+UInjEPdSiCMTTwafZ9qAepzgd9GyIegz6OADmJz9+sWnmC4tMXmFj68600k
         ClIOcKcdfPjT01sYwGWriUNI0fmX/0Afmx7bPPa2TcXOJ/LiBUy34JOv02BW86oqE5yJ
         64SJdee3QQj9JqKi0dyjPoGcpweSu5Eev/0+tvBMuCcMGq4AemoOcVuFVEmXLP/C8Fi7
         Lczw==
X-Gm-Message-State: AOAM533aq5BNNNXypycaXfQ6UYK1b1WayPYFp05vq3hZjoLw1LXXfzzo
        pmWNmwhvP2iU9q2dre6lDA==
X-Google-Smtp-Source: ABdhPJy6aIH+uZU6isJc2iw74GcumjNIiTMQJnCm75cP0jIpgE8jq+EmhSDwmopZOb51REdy0pyAGw==
X-Received: by 2002:a05:6830:1ad8:: with SMTP id r24mr4294433otc.183.1619200438018;
        Fri, 23 Apr 2021 10:53:58 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c21sm1363930ooa.48.2021.04.23.10.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 10:53:57 -0700 (PDT)
Received: (nullmailer pid 1331799 invoked by uid 1000);
        Fri, 23 Apr 2021 17:53:56 -0000
Date:   Fri, 23 Apr 2021 12:53:56 -0500
From:   Rob Herring <robh@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: gpio: Add devicetree binding for IDT
 79RC32434 GPIO controller
Message-ID: <20210423175356.GA1329842@robh.at.kernel.org>
References: <20210422152055.85544-1-tsbogend@alpha.franken.de>
 <20210422152055.85544-2-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422152055.85544-2-tsbogend@alpha.franken.de>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 22, 2021 at 05:20:54PM +0200, Thomas Bogendoerfer wrote:
> Add YAML devicetree binding for IDT 79RC32434 GPIO controller
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
> Changes in v3:
>  - renamed to idt,32434-gpio
>  - drop ngpio description
>  - use gpio0: gpio@50004 in example
> 
>  .../devicetree/bindings/gpio/idt,32434.yaml   | 71 +++++++++++++++++++

Not quite: idt,32434-gpio.yaml

>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/idt,32434.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/idt,32434.yaml b/Documentation/devicetree/bindings/gpio/idt,32434.yaml
> new file mode 100644
> index 000000000000..bdbbe01855e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/idt,32434.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/idt,32434.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: IDT 79RC32434 GPIO controller
> +
> +maintainers:
> +  - Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> +
> +properties:
> +  compatible:
> +    const: idt,32434-gpio
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
> +    gpio0: gpio@50004 {
> +        compatible = "idt,32434-gpio";
> +        reg = <0x50004 0x10>, <0x38030 0x0c>;
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
