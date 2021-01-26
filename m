Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE1093040EB
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 15:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390928AbhAZOv7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 09:51:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391288AbhAZOvQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 09:51:16 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93350C061D73
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 06:50:35 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id e18so1718545lja.12
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 06:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b6f1LvYnA5FB026vF4qzvowPNXCZxvMKvprMD5ct7zk=;
        b=DNO3emq0sg1yGJui5VGqWLdncnYiEqU0KPFmhDvnstsqjSeS7b8hvHznoqrQHY+XSr
         yZp/SYsBIjadcn9HN+QuFWFQtWsyu8QXadKPwo2wWhh3EtE7QkWGLm269oRP1LAYUu/S
         Pwd/tIzVJlBBKAvh7Wu8OJS9Bu/UTTvDjd8WYtR9e/7gU/WVqkoXlmpAZhXwmrpSM/dK
         f3XvrmFRNm3LpSVViZxKaVGoH0VBTgXmG+3G5HIOdZbbRSeIPWrunBhGoxDepef4MOHU
         T6N8Hy9dW6yzemGneJyghsQpfUlfUVAbUNwJilajVJaish2yyW3GaG9LqAarEdgCmD5C
         cWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b6f1LvYnA5FB026vF4qzvowPNXCZxvMKvprMD5ct7zk=;
        b=a85mw4DQRzfXvRN50PxM36/AyA1CVgxjQ++m7z03bdLGuRIC1xcMfVs52npobtv6Vc
         8SALI1khSU1/qkcRoeBsLDFjpIhw8+zAOczf0EOubqClTyqNnR503CZS6CG21/BgEQmu
         8NR9VpDQLHX3bruJ3TFKIjGRhKgM1inbZDqHwUEKGi40KRVO73cXi2KlF7dombrjiMW7
         0E0d0+aUYv+blf8Te10Dhh2Ux+E8RrbB41XIWgObnx1JeA1ijJstRObhkcw+HSIMp+hJ
         CYtrYTEvmR/at2Z8BClq3fS42VkyM0BsWkDromc4yhz22CYcJDVnKTdQScXfGm3n9c36
         2jOw==
X-Gm-Message-State: AOAM533l35HvOO7J0B48rcV0ZY9wy/5/bdsScRuBC4O4vjmWzElxT1tf
        oUhHQy1t8/sa6zuPDrb7zoZBGsnbkonLUAxcD8whdw==
X-Google-Smtp-Source: ABdhPJzrFkum4g7iaOZRLr9RsdK0/FQdTk4i3qqWYXYLKw/VBZRQbPjTjiU3XlNLJirttc3OXQuYiQBwIXWegbs4fN4=
X-Received: by 2002:a2e:8746:: with SMTP id q6mr3098828ljj.326.1611672634129;
 Tue, 26 Jan 2021 06:50:34 -0800 (PST)
MIME-Version: 1.0
References: <20210125182153.212998-1-angelogioacchino.delregno@somainline.org> <20210125182153.212998-2-angelogioacchino.delregno@somainline.org>
In-Reply-To: <20210125182153.212998-2-angelogioacchino.delregno@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jan 2021 15:50:23 +0100
Message-ID: <CACRpkdYeDw68MhBBWnLhd-1PKg9MkzP1FO_cijjvq-2fPBSQ-g@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: Add bindings for Awinic AW9523/AW9523B
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 25, 2021 at 7:21 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:

> Add bindings for the Awinic AW9523/AW9523B I2C GPIO Expander driver.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
(...)
> +  '#interrupt-cells':
> +    description:
> +      Specifies the PIN numbers and Flags, as defined in defined in
> +      include/dt-bindings/interrupt-controller/irq.h
> +    const: 2

Not really. Expand this to at least say in the description that the interrupt
must be IRQ_TYPE_EDGE_BOTH.

Preferably we should enforce it with the schema but I don't know if
that is possible in any easy way.

> +examples:
> +  # Example configuration to drive pins for a keyboard matrix
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        aw9523: gpio-expander@58 {
> +                compatible = "awinic,aw9523-pinctrl";
> +                reg = <0x58>;
> +                interrupt-parent = <&tlmm>;
> +                interrupts = <50 IRQ_TYPE_EDGE_FALLING>;
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +                gpio-ranges = <&tlmm 0 0 16>;
> +                interrupt-controller;
> +                #interrupt-cells = <2>;
> +                reset-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
> +
> +                keyboard-matrix-col-pins {
> +                        pins = "gpio8", "gpio9", "gpio10", "gpio11",
> +                               "gpio12", "gpio13", "gpio14", "gpio15";
> +                        function = "gpio";
> +                        input-disable;
> +                        output-low;
> +                };
> +
> +                keyboard-matrix-row-pins {
> +                        pins = "gpio0", "gpio1", "gpio2", "gpio3",
> +                               "gpio4", "gpio5", "gpio6", "gpio7";
> +                        function = "gpio";
> +                        bias-pull-up;
> +                        drive-open-drain;
> +                        input-enable;
> +                };
> +        };
> +    };

This is fine, but what about adding an example consumer using
<&aw9523 0 IRQ_TYPE_EDGE_BOTH>?

Yours,
Linus Walleij
