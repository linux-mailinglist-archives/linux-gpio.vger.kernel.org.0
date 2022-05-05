Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB7CA51C036
	for <lists+linux-gpio@lfdr.de>; Thu,  5 May 2022 15:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378897AbiEENJq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 May 2022 09:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378789AbiEENIr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 May 2022 09:08:47 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3857C56746
        for <linux-gpio@vger.kernel.org>; Thu,  5 May 2022 06:05:07 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id ks9so2193473ejb.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 May 2022 06:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sxVJoGvxoT/BfORhwUe0lF83tKeGUQ56jY7vzgfAHU4=;
        b=Y0K2T7eDDIErEPqMy8O6G47SIMuNV/FV2iBabtCwdZYCRksLJj+E+c7fbrSt9ZBBXD
         DaXJNvwCp8O95B7G3qBBBXd/ZY5LglYP8OcOlRsRkLkFbnOz5YGjf1+Kq+Cej6sf1PKz
         8jox3zcMMsB69mnVMtXKZEg+/RyB0rS4FojXfONdqL7k9Dw/I4yA/G/3RFFnSgWC8agR
         bsZsTNdQJo4ur+mN0mOVzXqc/pW10pVTqbvQpkdO4R2oawKCjQrPZ/LhQquGSb8INoG5
         zUIcx6Usp3yJ11Kt8LC8bG4AgtPbYUl5xx+MqNZTXX94AuUxIh18hRHgvcWzdek9DC0O
         2i3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sxVJoGvxoT/BfORhwUe0lF83tKeGUQ56jY7vzgfAHU4=;
        b=TiND4RlnoKEJWmcw9bW/5JNF0FM7BMsfdK7Ufq8rRCxhFdcdovv4rDoV3Ynx2mYvYd
         8/H0G4uzJhC4x1jKV13NdQdqST+xzkQBQ3ptBuEKSdfMxr4lBglp9Zn2d0K1XuW4l/V+
         8pNWXUWiJi7ImYPD7Eg5YMnLpbiA8Z0pQRqnGYbNoZK4mtJVM9sjg7aJkXeeU9dJb6Mk
         Giuy/WhabCWrfu0etcv58JAAfBp9i/MOJjL0UVSlSjHyW4t7wJxj+2nUtN2YaPwWVPbL
         rUTX5aJ0grYGks962k/oJUwW1yCx68cX8FPRgWCJKIUSGtRz426Tj4TtjUcpUWX8IJ0L
         3QgA==
X-Gm-Message-State: AOAM531//DtiDdE4cPJzZfOSrOalJ20uZO9VfsdC704c6JKOhizMjZ+p
        AXI3lrSVU4PmGEgLseoXgvDyyMMGgfTgrHhofT8S9Q==
X-Google-Smtp-Source: ABdhPJxyNkSLwouP3OR63NyFLRxUlmDS+dFIZZqJlV9mcUABNttg9TsG8+o4n8l4yoY3YgwsQa8BiV83N6jWTpdMxkc=
X-Received: by 2002:a17:907:3e28:b0:6f4:3900:78f8 with SMTP id
 hp40-20020a1709073e2800b006f4390078f8mr21714935ejc.736.1651755905797; Thu, 05
 May 2022 06:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1651497024.git.geert+renesas@glider.be> <5628a862688bd9d3b4f6c66cb338671211058641.1651497024.git.geert+renesas@glider.be>
In-Reply-To: <5628a862688bd9d3b4f6c66cb338671211058641.1651497024.git.geert+renesas@glider.be>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 5 May 2022 15:04:55 +0200
Message-ID: <CAMRc=MeQZ_T_AoHUO3qx7oW68UMC6HH9CaC041vYr7wQisqjHA@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: gpio: renesas,rcar-gpio: R-Car V3U is
 R-Car Gen4
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree <devicetree@vger.kernel.org>,
        dmaengine@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        iommu@lists.linux-foundation.org, linux-serial@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 2, 2022 at 3:35 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Despite the name, R-Car V3U is the first member of the R-Car Gen4
> family.  Hence move its compatible value to the R-Car Gen4 section.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
> index 0681a4790cd62e23..75e5da6a7cc04bbd 100644
> --- a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
> @@ -48,11 +48,9 @@ properties:
>                - renesas,gpio-r8a77995     # R-Car D3
>            - const: renesas,rcar-gen3-gpio # R-Car Gen3 or RZ/G2
>
> -      - items:
> -          - const: renesas,gpio-r8a779a0  # R-Car V3U
> -
>        - items:
>            - enum:
> +              - renesas,gpio-r8a779a0     # R-Car V3U
>                - renesas,gpio-r8a779f0     # R-Car S4-8
>            - const: renesas,rcar-gen4-gpio # R-Car Gen4
>
> --
> 2.25.1
>

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
