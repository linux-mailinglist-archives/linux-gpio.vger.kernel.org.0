Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E544593095
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Aug 2022 16:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242927AbiHOOTm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Aug 2022 10:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242957AbiHOOTj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Aug 2022 10:19:39 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F28C623178
        for <linux-gpio@vger.kernel.org>; Mon, 15 Aug 2022 07:19:34 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id j8so13765025ejx.9
        for <linux-gpio@vger.kernel.org>; Mon, 15 Aug 2022 07:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=YW8ABPf/215GSIFEByKqUFJs4dfu3nls1yMtjrpB9go=;
        b=Z0AA1aLQ23/cnJ7Ra1BgVtNHDuiElu6oDDJjXWgesxJzN/p4Bbs4EAohOoNu4kviVd
         hC6BRzGt0NrQCKmxht/v4blAbRE3C1Yay3YcjnEfNcqd5dRJnKNLeO+s2fQ04vU3dNvA
         arV4l/FleHNlt/RstCWvVj8yOy6qHZjMjb3591MgCfELpHKhPIyQ/OBxNbwDWj7kPWGg
         7Ps7siNzkVLIGiLIKT+IfP1NznCWU9FEFaAKI4Ot5wNdY8lW3PNEG7hPFLXp6KiTec0y
         GLU+g6U3F3Ndsv3PAnBgWHG4A0J9guzW0pwRJZJKRYpijwPh9/B5ESEir3qQq4u9Cf+o
         +ByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=YW8ABPf/215GSIFEByKqUFJs4dfu3nls1yMtjrpB9go=;
        b=GExuETMVap7yjsHxZF6+kquYCDnZI6gmoVHWivwy404U5xkKKPSnq0cLkbCKkiWklV
         MLv2clgSCScssZcC5fuL9HrXGMUAWPGwIMjlRfMVcCGQt3gWWyJ2FHB5iiXj4Td0EWEn
         zlwqK0xNG/+02z810H5MG2Xw5Aa6gKfmhQZHkZIOZie6HU9agtN/dv3Krxopi7VEl4Rq
         tr6RFUNat3d7cqEDQWCAv8O2nt0/FzK2jLEQOnMVq5R/6LYpchltwfhhSPAT3AGuC+5c
         dFpkDV13TGlXo15ueSqtNLYXt6Ie8a3gulkMV90MEb6c04FyMHUba7bynThPuf3OIlnw
         eQjg==
X-Gm-Message-State: ACgBeo3zrMqIx7XhAwkTR326k4JbOFyWl56EwtD2QvJ1mCizROelKkuI
        HBCCD8UJ5BNqMloROGFJeXklWcqbB+oOdFhvNlfX/g==
X-Google-Smtp-Source: AA6agR4TOQbykH0dt6Xzdglf8JvHWhaqhIM4GQ42RTEvfF5PwcZjDi8YQKkpFLxLDhhwNAbH0K9o1yVBDbNkkbYOsRE=
X-Received: by 2002:a17:906:9bc9:b0:730:6595:dfc8 with SMTP id
 de9-20020a1709069bc900b007306595dfc8mr10139549ejc.286.1660573173549; Mon, 15
 Aug 2022 07:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220727164251.385683-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220727164251.385683-1-krzysztof.kozlowski@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 15 Aug 2022 16:19:22 +0200
Message-ID: <CAMRc=Mf7hfT1kdpGW0XyNM1CjaGDoVv0+Gx=d9ksjcRnNEnUPQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: fairchild,74hc595: use spi-peripheral-props.yaml
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 27, 2022 at 6:43 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Instead of listing directly properties typical for SPI peripherals,
> reference the spi-peripheral-props.yaml schema.  This allows using all
> properties typical for SPI-connected devices, even these which device
> bindings author did not tried yet.
>
> Remove the spi-* properties which now come via spi-peripheral-props.yaml
> schema, except for the cases when device schema adds some constraints
> like maximum frequency.
>
> While changing additionalProperties->unevaluatedProperties, put it in
> typical place, just before example DTS.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Technically, this depends on [1] merged to SPI tree, if we want to
> preserve existing behavior of not allowing SPI CPHA and CPOL in each of
> schemas in this patch.
>
> If this patch comes independently via different tree, the SPI CPHA and
> CPOL will be allowed for brief period of time, before [1] is merged.
> This will not have negative impact, just DT schema checks will be
> loosened for that period.
>
> [1] https://lore.kernel.org/all/20220722191539.90641-2-krzysztof.kozlowski@linaro.org/
> ---
>  .../devicetree/bindings/gpio/fairchild,74hc595.yaml        | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> index a99e7842ca17..c0ad70e66f76 100644
> --- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> +++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> @@ -33,8 +33,6 @@ properties:
>      description: GPIO connected to the OE (Output Enable) pin.
>      maxItems: 1
>
> -  spi-max-frequency: true
> -
>  patternProperties:
>    "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
>      type: object
> @@ -59,7 +57,10 @@ required:
>    - '#gpio-cells'
>    - registers-number
>
> -additionalProperties: false
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +unevaluatedProperties: false
>
>  examples:
>    - |
> --
> 2.34.1
>

Applied, thanks!

Bart
