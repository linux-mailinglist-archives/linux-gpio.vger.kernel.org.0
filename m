Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE554A6DA2
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Feb 2022 10:17:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245397AbiBBJRK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Feb 2022 04:17:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245395AbiBBJRH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Feb 2022 04:17:07 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C819C06173D
        for <linux-gpio@vger.kernel.org>; Wed,  2 Feb 2022 01:17:07 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id p15so63272120ejc.7
        for <linux-gpio@vger.kernel.org>; Wed, 02 Feb 2022 01:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x9rntTeDhb6XRDh9/nW9Vd6mnOlOZBc9Iqn9gcca+t4=;
        b=BHT96a9j020XxUsQWDK20Qo2NUtO20lg55wm++jPoJnYThjUUezbh67CjJK7F0rhHM
         WMR0SlUFQ67HKnd5UAq3t8wQw0/IcfiDR64E3Bl3ek5iU+rwGtlsQZv4EhHS3HlLll70
         vz81NfQyhvIr/DEWlvNCdVHwVdrYwjwE9rJGuyve+JUZRxMWWVM4Ob6EneixpLbaAEL3
         mL8ezHkwZky0WbKNDvZRzGI3ZK6UaCQ70KIPB4ePlH3jMJWTS1GZycbEkrbm1j6fw1Um
         8sXv5bQxeCXb57VdMFBZNPF2Oeyyi4RN6dtQaE8SAPEe1FFoplZ5LDWHWcIAME4ULSu0
         Kj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x9rntTeDhb6XRDh9/nW9Vd6mnOlOZBc9Iqn9gcca+t4=;
        b=dJo4xx15nPCapmDTqWZVe7KCjrQzhZydNoz2XDJ1K5QQ5395tD3tjGB1SlCLqJk921
         6IlxnwJn5MSZwPJGYmUDVu+14cwnnSIW7pRamO13RylJ88+52HzzgpFgUSmmv9cvH/Wo
         Mxrfh/S9SYxOSGgeryTjIJThpOnJ2AFLVbT3I1B9XuWKKOsDcSIxdH01xQ8IocPGv1j0
         6xnZUumk9VKtj63UWj08yRbuhrhSy1MMDiw5QLs/G0ZdFrttXE78H6f9Axq8WGjGfNQn
         EI/4HcycE0Cj6Z1a6JJu3CWIxJacZ5WTgZlVC/xtAXs0aZlMtNSQ5wgwyBAKy6+w7PKm
         vqBA==
X-Gm-Message-State: AOAM531U90V/lOCRhaK+KH/fsaRp7WGp1JfYMe7okcl+RoZgEUN8KQQS
        eJjPZ0OLcsfPbwyi7br+pHvbBxYoOGgSFyOrKX/NRw==
X-Google-Smtp-Source: ABdhPJxO+YT7KVoH0Asl2I194MEaiGQV+55OzPqr2jrXyPvrkGNsigRcmzQHLC5k4+p9ZlceBbVedREV04aU+lGUj4w=
X-Received: by 2002:a17:907:6e1f:: with SMTP id sd31mr24802407ejc.286.1643793425982;
 Wed, 02 Feb 2022 01:17:05 -0800 (PST)
MIME-Version: 1.0
References: <20220130145116.88406-1-nbd@nbd.name> <20220130145116.88406-12-nbd@nbd.name>
In-Reply-To: <20220130145116.88406-12-nbd@nbd.name>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 2 Feb 2022 10:16:55 +0100
Message-ID: <CAMRc=McAvYmjvCU8-OA3Yb+YuXF7KaGC6E3RnFMN7eSUXiUz+Q@mail.gmail.com>
Subject: Re: [PATCH v9 11/13] dt-bindings: arm: airoha: Add binding for Airoha
 GPIO controller
To:     Felix Fietkau <nbd@nbd.name>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        John Crispin <john@phrozen.org>, soc@kernel.org,
        "moderated list:ARM/Mediatek SoC..." 
        <linux-mediatek@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jan 30, 2022 at 3:54 PM Felix Fietkau <nbd@nbd.name> wrote:
>
> From: John Crispin <john@phrozen.org>
>
> Airoha's GPIO controller on their ARM EN7523 SoCs consists of two banks of 32
> GPIOs
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>  .../bindings/gpio/airoha,en7523-gpio.yaml     | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.yaml
>
> diff --git a/Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.yaml b/Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.yaml
> new file mode 100644
> index 000000000000..66c00ec85731
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/airoha,en7523-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha EN7523 GPIO controller
> +
> +maintainers:
> +  - John Crispin <john@phrozen.org>
> +
> +description: |
> +  Airoha's GPIO controller on their ARM EN7523 SoCs consists of two banks of 32
> +  GPIOs.
> +
> +properties:
> +  $nodename:
> +    pattern: "^gpio@[0-9a-f]+$"
> +
> +  compatible:
> +    items:
> +      - const: airoha,en7523-gpio
> +
> +  reg:
> +    description: |
> +      The first tuple points to the input register.
> +      The second and third tuple point to the direction registers
> +      The fourth tuple points to the output register
> +    maxItems: 4
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio0: gpio@1fbf0200 {
> +        compatible = "airoha,en7523-gpio";
> +        reg = <0x1fbf0204 0x4>,
> +              <0x1fbf0200 0x4>,
> +              <0x1fbf0220 0x4>,
> +              <0x1fbf0214 0x4>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +    };
> +
> +    gpio1: gpio@1fbf0270 {
> +        compatible = "airoha,en7523-gpio";
> +        reg = <0x1fbf0270 0x4>,
> +              <0x1fbf0260 0x4>,
> +              <0x1fbf0264 0x4>,
> +              <0x1fbf0278 0x4>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +    };
> +
> +

I removed this unnecessary newline when applying.

> +...
> --
> 2.32.0 (Apple Git-132)
>

Queued for next, thanks!

Bart
