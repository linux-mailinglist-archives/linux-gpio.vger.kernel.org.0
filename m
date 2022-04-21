Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FAB850AA3E
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Apr 2022 22:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245040AbiDUUpk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Apr 2022 16:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1392468AbiDUUpg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Apr 2022 16:45:36 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657774D60D
        for <linux-gpio@vger.kernel.org>; Thu, 21 Apr 2022 13:42:45 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id b26so5210729ybj.13
        for <linux-gpio@vger.kernel.org>; Thu, 21 Apr 2022 13:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1b/BKquYiwOKFwAeMh2hNCCGUogn86K0gaqOcP9rSF4=;
        b=CjZtID8rzyqb2HE8iu3Rq+8rwTq3zUZDZgqyOdy6/kE4rjSrc0uw41BybDBNIPKrE4
         QoSH6zhTTRGyc48UznXmQ5/fUSfoOFHFOCMF/g+kiQ2Yi8eCdFBwghbAoX+j0rcI9iSZ
         yGpfwif4BqCtStoMyZl7rrrVJeM5521z8zKK2jegBHRxZjPISs6U2q1gEt1bMfdrl852
         K0TuFyQq3pvIetISRRYJnL784OXeYs+TiCK7LkGTvePGsONlVrAOfvmEs5zz+YKmWHlC
         JKAM48qWyov4loqHnLJ56xwM6UCfzk4oHGb4BzsDPPRE/bHcvmG7NvZGJADn9hmwOjK1
         2esw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1b/BKquYiwOKFwAeMh2hNCCGUogn86K0gaqOcP9rSF4=;
        b=0BDr3db8f3oRjjVonOO/08/oyxGWv1iRJzu1upO2Cy+FAxmsISgNWBnrFKIWKxUpSL
         tPF2b7wtCmscLqJFqFJBK1sk1Sws/o/aWwDWAMjmYpOZc9nzxLlf0EGQGBS5axpZc1eS
         9CaR4HQqV9T7K0fZQCW6lrW07UvrfSKjirUQ94GZLX3hLhMmKOJ7iodqABKZHPusXG7P
         da1WY/FfXvIkkq7kpZ/RQZyCTFCTdb82YuqHiqALNEdgL/Zi5R+mq2PVsH5wwBimpo0X
         tNNJhnplMvfkZesclB42SI899fT7AaV1Txt7ogoytPXV7uuN8MUFXC6GX5cmsYt2rV2o
         8b8g==
X-Gm-Message-State: AOAM531rBNULT+uT21jJV+m/rPuNLEQLlRqxb8NCDDqZnnT6oOBwaYLI
        godnJ8T/KWZ0cCFRa3wGxgkEg/GlZj57g2A72csjNqOLgJU=
X-Google-Smtp-Source: ABdhPJzqdMV4NXfT0dm1w0jMpm6c09lLobEXVuimJSgXhcD/2XVRcL4YIEwQbKnb1VL+qltH9j3eNX8mRl8JGqKLIco=
X-Received: by 2002:a25:a12a:0:b0:644:e94e:5844 with SMTP id
 z39-20020a25a12a000000b00644e94e5844mr1519306ybh.492.1650573764641; Thu, 21
 Apr 2022 13:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220419071503.1596423-1-patrick.rudolph@9elements.com> <20220419071503.1596423-2-patrick.rudolph@9elements.com>
In-Reply-To: <20220419071503.1596423-2-patrick.rudolph@9elements.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Apr 2022 22:42:33 +0200
Message-ID: <CACRpkda+yScM20uibGXk3e0fQeG6OBBMQDqSDzNzU5OMPx3zWw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-binding: Add cypress,cy8c95x0 binding
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Patrick,

thanks for your patch!

On Tue, Apr 19, 2022 at 9:17 AM Patrick Rudolph
<patrick.rudolph@9elements.com> wrote:

> Added device tree binding documentation for
> Cypress CY8C95x0 I2C pin-controller.
>
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>

> +  '#gpio-cells':
> +    description:
> +      The first cell is the pin number and the second cell is used
> +      to specify optional parameters.
> +    const: 2

Maybe specify that the second cell uses the standard GPIO
parameters in <dt-bindings/gpio/gpio.h>?

The driver is quite elaborate, you can probably list which
parameters you support on this hardware even if the
driver don't even implement them yet: it's just a binding
after all.

> +  ngpios:
> +    minimum: 1
> +    maximum: 60

Why? Isn't it obvious from the compatible how many pins
the GPIO chip has? Then use that instead.
Write under the compatible as description: for each chip
how many gpios it has.

> +patternProperties:
> +  '-pins$':
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +    $ref: "/schemas/pinctrl/pincfg-node.yaml"

This is impressive. It's quite advanced to use the pin config props
for elaborate pin config control.

Yours,
LInus Walleij
