Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B78E1145E6
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2019 18:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729931AbfLER1h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Dec 2019 12:27:37 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36765 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729450AbfLER1h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Dec 2019 12:27:37 -0500
Received: by mail-ot1-f68.google.com with SMTP id i4so3314508otr.3;
        Thu, 05 Dec 2019 09:27:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Beu9Ho0H5ERuGsbF7ZjrVG0ZON0A+E7tAAYEYAdqCyk=;
        b=kgQMyMAQ+/Xhw0YG+MKF3GlD/ZPlJETN3HkW8ILdKDDrstaFW0p+oKcMYBInR/wVwo
         6t6jhkMGsLEBUF/vk4pHApZ9nf4H6OA1ZyFBsXc3Fy20BMGS0ffXxzRN8S6PfTpeCtJE
         Jg89mU+Hf3r7OC+erP56WYN8bQyXFFve+0zZOEKA91SruiAgdS0QWkzaqPMM2RqDJ5uT
         ChuVpGt29hsgPEq8jyoStoqZZZoNwiK9J4fUetu9Eb6X2K+HLj5eAQTdUuExObIhJVAD
         zQHRe1DVsPyG6TycwWriYnECugVu5JGbLOKImOLNkXvUM5hu8Hov19k2GHF2MGjS8/RK
         +t4Q==
X-Gm-Message-State: APjAAAVNt7bFmUQ50T8rrn89b1cpif3WscLb6zXjLpd5V4OP3hnKr205
        06ol544HWn0b9hfYgZjnWg==
X-Google-Smtp-Source: APXvYqxb1R7cDem9EDJctkKteK+d2GKVLOTXRE+1a0UnGmCMVMgu/gG/KmmksWOK1FE9rpvhpmjXHA==
X-Received: by 2002:a05:6830:1e61:: with SMTP id m1mr7623640otr.68.1575566856033;
        Thu, 05 Dec 2019 09:27:36 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n25sm3724656oic.6.2019.12.05.09.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 09:27:35 -0800 (PST)
Date:   Thu, 5 Dec 2019 11:27:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yash Shah <yash.shah@sifive.com>
Cc:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "maz@kernel.org" <maz@kernel.org>,
        "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
        "atish.patra@wdc.com" <atish.patra@wdc.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sachin Ghadi <sachin.ghadi@sifive.com>
Subject: Re: [PATCH v3 4/6] gpio: sifive: Add DT documentation for SiFive GPIO
Message-ID: <20191205172734.GA18142@bogus>
References: <1574661437-28486-1-git-send-email-yash.shah@sifive.com>
 <1574661437-28486-5-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1574661437-28486-5-git-send-email-yash.shah@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 25, 2019 at 05:58:03AM +0000, Yash Shah wrote:
> DT json-schema for GPIO controller added.
> 
> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> [Atish: Compatible string update]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  .../devicetree/bindings/gpio/gpio-sifive.yaml      | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-sifive.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-sifive.yaml b/Documentation/devicetree/bindings/gpio/gpio-sifive.yaml
> new file mode 100644
> index 0000000..49214bb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-sifive.yaml

sifive,gpio.yaml would be the more standard naming.

> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings: (GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-sifive.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive GPIO controller
> +
> +maintainers:
> +  - Yash Shah <yash.shah@sifive.com>
> +  - Paul Walmsley <paul.walmsley@sifive.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: sifive,fu540-c000-gpio
> +      - const: sifive,gpio0
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description:
> +      interrupt mapping one per GPIO. Maximum 16 GPIOs.

What's the minimum? If not 16, you need 'minItems'.

> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names: true

Need to define the strings. Or drop because you don't need it when 
there's only 1.

> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - clocks
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +      #include <dt-bindings/clock/sifive-fu540-prci.h>
> +      gpio@10060000 {
> +        compatible = "sifive,fu540-c000-gpio", "sifive,gpio0";
> +        interrupt-parent = <&plic>;
> +        interrupts = <7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22>;
> +        reg = <0x0 0x10060000 0x0 0x1000>;
> +        clocks = <&tlclk PRCI_CLK_TLCLK>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +      };
> +
> +...
> -- 
> 2.7.4
> 
