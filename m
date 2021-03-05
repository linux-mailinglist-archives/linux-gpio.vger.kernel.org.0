Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06D5632F666
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Mar 2021 00:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbhCEXJu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Mar 2021 18:09:50 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:34410 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbhCEXJn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Mar 2021 18:09:43 -0500
Received: by mail-oi1-f181.google.com with SMTP id x78so4360909oix.1;
        Fri, 05 Mar 2021 15:09:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XrYODSIj7UXVI1uCbWVvuJ9MDvf1FusiVZYMMI3JkzE=;
        b=kQADzgzuKcDKX3ObVS78GFKs6D0iSkgpZX1kKyl1mdlGb6WFPXWp3I+G/u7/q5oG2p
         NubEgtoH9MQWkTUDinn+LZqfuI52PUnUgOzR5O7fI/awEwiSQ6i6VZK7ndSsxum/xWtv
         g4yNRw2iK/crQAmunk2UHtSYbqxw1zeFiyhtu3Pg9bqK7uzN61Kay4AtLxeNMo2GHHdh
         /DB6DeL0aM5niEH4zGSCcN29q/6+d+2ZBBkiAyN9QMBBgvJCrdVn+du4zmF77oB1mKEM
         4QzzkJJdvyv/HQ+6YyV4GyBdVQOBfJUh9A7wbJNthtlfXUYEYtGk4SMi7N1iLfRe1CQt
         c5xA==
X-Gm-Message-State: AOAM532FOqLr9/VPcHqupZYiLxhKMf4aj7BMU7g1rD93ZTU6fCW6cNG9
        O/IJshhWvOBrJm35sMkgzg==
X-Google-Smtp-Source: ABdhPJxEV9cNQ+u/FV083e8uupzMrx3E3n1YaYFtT8S202fGkWxSE3FlaHA0lY05b966tc3KmXUmRA==
X-Received: by 2002:aca:4587:: with SMTP id s129mr8889344oia.133.1614985782649;
        Fri, 05 Mar 2021 15:09:42 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r13sm853187oot.41.2021.03.05.15.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 15:09:41 -0800 (PST)
Received: (nullmailer pid 813032 invoked by uid 1000);
        Fri, 05 Mar 2021 23:09:40 -0000
Date:   Fri, 5 Mar 2021 17:09:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
        minyard@acm.org, joel@jms.id.au, lee.jones@linaro.org,
        avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        linus.walleij@linaro.org, chiawei_wang@aspeedtech.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 17/19] dt-bindings: ipmi: Add optional SerIRQ property to
 ASPEED KCS devices
Message-ID: <20210305230940.GA809870@robh.at.kernel.org>
References: <20210219142523.3464540-1-andrew@aj.id.au>
 <20210219142523.3464540-18-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210219142523.3464540-18-andrew@aj.id.au>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Feb 20, 2021 at 12:55:21AM +1030, Andrew Jeffery wrote:
> Allocating IO and IRQ resources to LPC devices is in-theory an operation
> for the host, however ASPEED don't appear to expose this capability
> outside the BMC (e.g. SuperIO). Instead, we are left with BMC-internal
> registers for managing these resources, so introduce a devicetree
> property for KCS devices to describe SerIRQ properties.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml      | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> index 1c1cc4265948..808475a2c2ca 100644
> --- a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> +++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> @@ -47,6 +47,18 @@ properties:
>        channels the status address is derived from the data address, but the
>        status address may be optionally provided.
>  
> +  aspeed,lpc-interrupts:
> +    $ref: "/schemas/types.yaml#/definitions/uint32-matrix"
> +    minItems: 1
> +    maxItems: 1
> +    description: |
> +      A 2-cell property expressing the LPC SerIRQ number and the interrupt
> +      level/sense encoding (specified in the standard fashion).

That would be uint32-array with 'maxItems: 2'.

> +
> +      Note that the generated interrupt is issued from the BMC to the host, and
> +      thus the target interrupt controller is not captured by the BMC's
> +      devicetree.
> +
>    kcs_chan:
>      deprecated: true
>      $ref: '/schemas/types.yaml#/definitions/uint32'
> @@ -84,9 +96,11 @@ allOf:
>  
>  examples:
>    - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
>      kcs3: kcs@24 {
>          compatible = "aspeed,ast2600-kcs-bmc";
>          reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
>          aspeed,lpc-io-reg = <0xca2>;
> +        aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
>          interrupts = <8>;
>      };
> -- 
> 2.27.0
> 
