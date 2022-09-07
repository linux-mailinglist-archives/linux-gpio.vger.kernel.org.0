Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3F725B08BB
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Sep 2022 17:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbiIGPlM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Sep 2022 11:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiIGPlM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2022 11:41:12 -0400
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E8299C236;
        Wed,  7 Sep 2022 08:41:11 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id 92-20020a9d0be5000000b0063946111607so10526980oth.10;
        Wed, 07 Sep 2022 08:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=btKRTicmLvDCX1hJOEXkDhCFvp2y2mAwN4dxOJuI9Xs=;
        b=yt1fLBqyuOP0ssFIVk6Uaq81ttk/r/xucwmV8YtK55pJ2WSQMaEll49f9qw5fdpubm
         G1lj6E+HqV2wl5iQC7xSweZJUajZYpzZt6AFcrQA0l8oLNnQqdMlyhmhQp1GgI1EVpO0
         jPvH6M60wo86fCv8YeGbuxv0XnGSaJAoD+DjEIL3cKWQ+JL4wYAdfasgO3eQ33EVABoi
         4E2I0mSE8sNuB/mMaMAnnWAiX9byAb1mkXjkK8nJPpNl3KYQnCT6xwZxrn4As0Os+PIL
         UDKkNkdXx+SYJa5kQEHcMiQWxX9+ZAtBt7EKQKQlOQ1EKOKPjusqfHDOQyyXpAC32nns
         X8PQ==
X-Gm-Message-State: ACgBeo0XPHLG0ZGTFFBlrW91buK9QKjehjTcJjVW2PCP79Mb1sFYVXBh
        /bo7sLbQ8o3m0UWMUTdgTg==
X-Google-Smtp-Source: AA6agR4p0eaTsxXGe9aZXFV+W851SwM/FoDIIR/4L+/Kvd6bS7Rk3DlqEa0K4TyDOXVuPAnToLaI3w==
X-Received: by 2002:a9d:77c3:0:b0:637:36c1:475b with SMTP id w3-20020a9d77c3000000b0063736c1475bmr1673088otl.346.1662565270329;
        Wed, 07 Sep 2022 08:41:10 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l14-20020a4ac60e000000b00435ae9a836asm5174440ooq.15.2022.09.07.08.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 08:41:09 -0700 (PDT)
Received: (nullmailer pid 3502719 invoked by uid 1000);
        Wed, 07 Sep 2022 15:41:08 -0000
Date:   Wed, 7 Sep 2022 10:41:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 1/7] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
Message-ID: <20220907154108.GA3498574-robh@kernel.org>
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
 <E1oVYUD-005Cm5-3Z@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1oVYUD-005Cm5-3Z@rmk-PC.armlinux.org.uk>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 06, 2022 at 02:19:29PM +0100, Russell King (Oracle) wrote:
> Add a DT binding for the Apple Mac System Management Controller.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../devicetree/bindings/mfd/apple,smc.yaml    | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/apple,smc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> new file mode 100644
> index 000000000000..168f237c2962
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/apple,smc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple Mac System Management Controller
> +
> +maintainers:
> +  - Hector Martin <marcan@marcan.st>
> +
> +description:
> +  Apple Mac System Management Controller implements various functions
> +  such as GPIO, RTC, power, reboot.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,t6000-smc
> +          - apple,t8103-smc
> +          - apple,t8112-smc
> +      - const: apple,smc
> +
> +  reg:
> +    items:
> +      - description: SMC area
> +      - description: SRAM area
> +
> +  reg-names:
> +    items:
> +      - const: smc
> +      - const: sram
> +
> +  mboxes:
> +    maxItems: 1
> +    description:
> +      A phandle to the mailbox channel

That's every 'mboxes'. Drop generic descriptions on common properties.

> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - mboxes
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      smc@23e400000 {
> +        compatible = "apple,t8103-smc", "apple,smc";
> +        reg = <0x2 0x3e400000 0x0 0x4000>,
> +               <0x2 0x3fe00000 0x0 0x100000>;
> +        reg-names = "smc", "sram";
> +        mboxes = <&smc_mbox>;
> +      };
> +    };
> -- 
> 2.30.2
> 
> 
