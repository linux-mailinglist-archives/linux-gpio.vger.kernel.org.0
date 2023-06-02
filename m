Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E12A7720790
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jun 2023 18:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235938AbjFBQaN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jun 2023 12:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236853AbjFBQaB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jun 2023 12:30:01 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2796DB6
        for <linux-gpio@vger.kernel.org>; Fri,  2 Jun 2023 09:29:58 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-437daacde18so666907137.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jun 2023 09:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685723397; x=1688315397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUj/reU4gtl1TD5ldkLIbpYKV/wBXh/0iWaz6yALX2g=;
        b=2bbzUTW7LNx/X4yOPT6cAyNUsgp7kK85ebN4wD/b6mvrJVpcQSFbAdsiV2GGaBa8U5
         lpF51YE5p/1+6T1xRGPC7psj+zwCWrPJdgyeYpNjItaApRnF5YsrT0CXnhlNEYtvpsFX
         1+KoqO9pbzts1FVfrWSjzAPLC1O/COfVXP1Irq8Ek3xtnKfC4z6qEkwqO3OL1b8cs/9g
         2KsCpzzYENF5ClcSAvyKGVhurWO32EVLlIbU6nCHvAolTuDO88oYrLeJN+Vpkj2Qofmf
         Bf43Epi9McEVKthpAip9j1OBDLgmcukqHVld7Gin/H1ExpT8y5TmY9KS8V5ToLIdn79Z
         KzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685723397; x=1688315397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dUj/reU4gtl1TD5ldkLIbpYKV/wBXh/0iWaz6yALX2g=;
        b=alaLNCTzZSoRfA1ydVCtPXpJeQpLrZEWVH84YQruG+IuYj+UetcwZ3dMs47rwW4+7y
         AkbeROnxAsDFEb6ir5pNnpKhnVzQengasAyrGFZoIeTxiqtGteAfJFLoO/QebHVgIH90
         Vvzy50jj55gEW71DowiRCOcOmLfdgIQYHNQI6zjfZPMeCV2N033qTd7fdNCF+BBe7hDw
         w+686PARCK7AhKLusZLKTUiU5YXQzr1t5TlKm/SRP8vGeB7giOBhojUBXozNGaNSxJlk
         lFJnWC+J35s1oUcqam8pa3fufhHmDklDaRNknBDXkMSa/mAImE8ZEaonpCmvOlpX7Vp6
         WbDw==
X-Gm-Message-State: AC+VfDwFAu+30USA7lt1DzEYnPCfmiF2Ax1IxMJhacYNFhUIwLBFqSsL
        lAbXUptnlkRs2J/FjY0tIisfbUWi8O606d3NKokQhw==
X-Google-Smtp-Source: ACHHUZ7N12SQn2J+mGLuDAeUw2sMFrpsDnqKC0vLssKYswIRZe+K2P++HNPMq6f8yRwrp+acLISfGgSGbMW4VD85KqU=
X-Received: by 2002:a05:6102:11e2:b0:438:ac6e:750d with SMTP id
 e2-20020a05610211e200b00438ac6e750dmr6377622vsg.21.1685723397209; Fri, 02 Jun
 2023 09:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230406093344.917259-1-alexander.stein@ew.tq-group.com> <20230406093344.917259-2-alexander.stein@ew.tq-group.com>
In-Reply-To: <20230406093344.917259-2-alexander.stein@ew.tq-group.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 2 Jun 2023 18:29:46 +0200
Message-ID: <CAMRc=MdzzN2oEjFHre3WO7aF0_OsamS5NDR0uW18Fcsn=PWHCg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: gpio: Add gpio-delay binding document
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 6, 2023 at 11:33=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> This adds bindings for a GPIO enable/disable delay driver.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes since RFC v2:
> * Remove 'input' prefix for GPIOs
> * Add minItems/maxItems for GPIOs
> * Adjust example
> * Added Linus' A-b
>
>  .../devicetree/bindings/gpio/gpio-delay.yaml  | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-delay.yam=
l
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-delay.yaml b/Doc=
umentation/devicetree/bindings/gpio/gpio-delay.yaml
> new file mode 100644
> index 000000000000..7c16a4e1a768
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-delay.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO delay controller
> +
> +maintainers:
> +  - Alexander Stein <linux@ew.tq-group.com>
> +
> +description: |
> +  This binding describes an electrical setup where setting an GPIO outpu=
t
> +  is delayed by some external setup, e.g. RC curcuit.
> +
> +  +----------+                    +-----------+
> +  |          |             VCC_B  |           |
> +  |          |              |     |           |
> +  |          | VCC_A        _     |           |
> +  |  GPIO    |             | | R  |  Consumer |
> +  |controller|        ___  |_|    |           |
> +  |          |       |   |  |     |           |
> +  |      [IOx|-------|   |--+-----|-----+     |
> +  |          |       |___|  |     |   input   |
> +  |          |              |     |           |
> +  +----------+             --- C  +-----------+
> +                           ---
> +                            |
> +                            -
> +                           GND
> +
> +  If the input on the consumer is controlled by an open-drain signal
> +  attached to an RC curcuit the ramp-up delay is not under control
> +  of the GPIO controller.
> +
> +properties:
> +  compatible:
> +    const: gpio-delay
> +
> +  "#gpio-cells":
> +    description: |
> +      Specifies the pin, ramp-up and ramp-down delays. The
> +      delays are specified in microseconds.
> +    const: 3
> +
> +  gpios:
> +    description: Array of GPIOs which output signal change is delayed
> +    minItems: 1
> +    maxItems: 32
> +
> +  gpio-controller: true
> +
> +  gpio-line-names:
> +    minItems: 1
> +    maxItems: 32
> +
> +required:
> +  - compatible
> +  - "#gpio-cells"
> +  - gpio-controller
> +  - gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    enable_delay: enable-delay {
> +        compatible =3D "gpio-delay";
> +        #gpio-cells =3D <3>;
> +        gpio-controller;
> +        gpios =3D <&gpio0 3 GPIO_ACTIVE_LOW>,
> +                <&gpio3 1 GPIO_ACTIVE_HIGH>;
> +    };
> +
> +    consumer {
> +        enable-gpios =3D <&enable_delay 0 130000 30000>;
> +    };
> --
> 2.34.1
>

Applied, thanks!

Bart
