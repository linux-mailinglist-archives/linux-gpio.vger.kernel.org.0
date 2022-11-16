Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CEA462B66C
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 10:24:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232256AbiKPJYJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 04:24:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232170AbiKPJYG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 04:24:06 -0500
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C274D1CC
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 01:24:04 -0800 (PST)
Received: by mail-vk1-xa36.google.com with SMTP id t85so7943907vkb.7
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 01:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kxSHlL3QE/d3WINBYkzB0qUENJeNn/YQxVYehnbN/IE=;
        b=g1Oan0msaq7YQ8AMXarE0bGkNMBmtROPoKcWendPeNHCvqK9vZQI4k2ku+5fhFU2tu
         OW3OfHMdP1p1EWxAfz5pBdTkDl4NXNyNua4i6/6pOWBoLJGilZzQ0GUd3BPj+NP5rxP/
         Da0kkbzMU1sUtqK68EqlNRZ35Dt11Io94DTK4QZ4Uk0Ed7jsTz1aI7xD45UYNjbGvZUl
         qIP412qo9Dp2f+hUHkasjog2YlsrZpYEWdi6gcCbAM41PDA7jLJE4z6XCAm+J9VhmWsk
         5XEJI3guZerXxCONyaxzR811m9Vw6meLzbTJg5xjLvD2DmjjQQJQKvB8hFhxcswHDSny
         Bv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxSHlL3QE/d3WINBYkzB0qUENJeNn/YQxVYehnbN/IE=;
        b=K6duANCylKaBPIi1hM6qXbVhM4tfR3MVgVASDeL7gvX8Vaa5I2M2f62vXO4esenn7X
         1dJRsIItxyG30yPEVll7+z4ttme1NnCVFRjzrwVVFdHHbsf7fKJB4fErRGXyL+n5ODE9
         6w7xf7O6ydrJoWts7n/+cZ/Zx7n8n/Bcg06yVEY/Jy2xEQpKfJT26OiwRQ8cj3rcB6vT
         9bakSIMBXfjD7yIjyJ3KvWghzjYryWY1U9O5TSLwiG6vHjcBcX/0oOt2tgdWU6llQK/P
         AKWZTGFfUmD/xFAu+FbbruaVoC9zXB0TM/K9s1WBw+1puv49upXkeTaCln9UKUo3MC8F
         EtRg==
X-Gm-Message-State: ANoB5pkanouUq0npbFgTkwV9shvCZM/qaV1s/LmyJbyOxMEpbezT4xTw
        LFQ+0cxcu8h4rVT+GbNUa0t7KjRw5u0HTCFc//hyug==
X-Google-Smtp-Source: AA0mqf4cJ1NF5pfeen8iIHPT29zQwMT9cIR0yZEGeeHBpkttkon5Tyv9CKIJrFBswwDoBfR42Z9bSnmvb/04/q1usHM=
X-Received: by 2002:a05:6122:2209:b0:3b7:3aca:9868 with SMTP id
 bb9-20020a056122220900b003b73aca9868mr11925268vkb.33.1668590643870; Wed, 16
 Nov 2022 01:24:03 -0800 (PST)
MIME-Version: 1.0
References: <20221115231021.2389-1-nm@ti.com>
In-Reply-To: <20221115231021.2389-1-nm@ti.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 16 Nov 2022 10:23:53 +0100
Message-ID: <CAMRc=MfkVHtc9oywEnZe_+D1MZXTvm6mS19ZXkDKsk4NHbBUSQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: gpio-davinci: Increase maxItems in gpio-line-names
To:     Nishanth Menon <nm@ti.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Robert Nelson <robertcnelson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 16, 2022 at 12:10 AM Nishanth Menon <nm@ti.com> wrote:
>
> gpio-line-names really depends on ti,ngpios. However, the maximum value
> we have seen across the board is on K2G and da850 platforms where it can
> be upto 144.
>
> Link: https://lore.kernel.org/linux-arm-kernel/20221115200357.qa2rvw3clbz7unzq@symptom/T/#u
> Fixes: c830b87a761b ("dt-bindings: gpio: gpio-davinci: Convert to json-schema")
> Reported-by: Robert Nelson <robertcnelson@gmail.com>
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>
> I dont see a practical scheme to set the maxItems based on ti,ngpios,
> but deleting the maxItems was softening the check as well.
>
>  Documentation/devicetree/bindings/gpio/gpio-davinci.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
> index f32e09ef937c..10e56cf306db 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
> @@ -35,7 +35,7 @@ properties:
>    gpio-line-names:
>      description: strings describing the names of each gpio line.
>      minItems: 1
> -    maxItems: 100
> +    maxItems: 144
>
>    "#gpio-cells":
>      const: 2
> --
> 2.31.1
>

Applied, thanks!

Bart
