Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0488B767FD5
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jul 2023 15:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbjG2N5q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jul 2023 09:57:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbjG2N5q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jul 2023 09:57:46 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E771730
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jul 2023 06:57:44 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7653bd3ff2fso278181785a.3
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jul 2023 06:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1690639063; x=1691243863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7LyyG1iya0TK3hzn1sz1vz2ztnTw5rxQOjlg3OWMh8Q=;
        b=o0dNC+o/0b42oJq5tleuplcjRU8ahwiiWvtp5gjH8R63pJIip7sgzuZcf9WgdL4LOl
         2Z1z6bbhlzT5e5dHUkdZH1n62Rta5CgEySVb5PLAfbz+XNXnrwvSrWXWdtn+gcWqAMdz
         Nk/mU1FhIQlRd70oI7dhBNDRn82NwMqxNz3CQR8E4BDta9egTLqTggp1aqAtlEohzH/s
         x0KuUZxQ4JMlr8zU5A0awwNFKWopm1XtfUNNuaPKam4BHKF7QnIqDLEAefl76/mCh/7N
         M38mNHqnJEgKL68isMyg+hJbZRFc4VFoUcF1NDk6a7pDJeC/42EtdJRWIjh+xtc4dkiB
         ziOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690639063; x=1691243863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7LyyG1iya0TK3hzn1sz1vz2ztnTw5rxQOjlg3OWMh8Q=;
        b=LhIUZvlyCJ4wPs4BA8j9MrV/6hckXlfNchZIsoY0G0m6qngYJ0b7BbK3nmNWF6ePOI
         HFQ9t34czcz7srPxUEFS0je6Lh4MwXZM6thHKB9519kp2aPmyfNbGnUPg0hb4gad8YEU
         F29t9LClGIYX8E8lX7eZoLPcwAZZ9dJIzFv4tLNF2Sexl/WhMHaAqKJy2A6mrZHZeluI
         CrbEo6GNxY3sLa/trkf8oN7Med1m1vS2dQgNW9K538k98AnZ3CPgBYc+0FcKX8DgHgSa
         oJxvOa4daixqyp9+CYQCsnt73PRWXb+sPJ78LqfxwSQ5qHW5aClIT9LL0HYwm9zGbsi2
         TWAg==
X-Gm-Message-State: ABy/qLbcg0D5E9DP6n5B08vg3EnZWCTBKVymbJI4Mm8B8oM7jDy32x6/
        3PS3UJoeayYqqc/BUWzPnwbeZK6j5KaJWlbMF2iPCg==
X-Google-Smtp-Source: APBJJlF5udWugLl33v35fF1l7AB8fZGzw+fysS2LDauWn+63T/yM+sPz0xL5WM0AhAl7atTVDj2FDywVLd4R0rOavDc=
X-Received: by 2002:a05:620a:1787:b0:765:22d4:b267 with SMTP id
 ay7-20020a05620a178700b0076522d4b267mr6627987qkb.52.1690639063696; Sat, 29
 Jul 2023 06:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230727095432.82591-1-okan.sahin@analog.com> <20230727095432.82591-2-okan.sahin@analog.com>
In-Reply-To: <20230727095432.82591-2-okan.sahin@analog.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 29 Jul 2023 15:57:32 +0200
Message-ID: <CAMRc=MeLaadEVM1UBaGSJ=cUcJ=ub7_kOc=97t37+oU6+RMuhA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: gpio: ds4520: Add ADI DS4520
To:     Okan Sahin <okan.sahin@analog.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 27, 2023 at 11:55=E2=80=AFAM Okan Sahin <okan.sahin@analog.com>=
 wrote:
>
> Add ADI DS4520 devicetree document.
>
> Signed-off-by: Okan Sahin <okan.sahin@analog.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/gpio/adi,ds4520-gpio.yaml        | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/adi,ds4520-gpi=
o.yaml
>
> diff --git a/Documentation/devicetree/bindings/gpio/adi,ds4520-gpio.yaml =
b/Documentation/devicetree/bindings/gpio/adi,ds4520-gpio.yaml
> new file mode 100644
> index 000000000000..25b3198c4d3e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/adi,ds4520-gpio.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/adi,ds4520-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: DS4520 I2C GPIO expander
> +
> +maintainers:
> +  - Okan Sahin <okan.sahin@analog.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ds4520-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  ngpios:
> +    minimum: 1
> +    maximum: 9
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - ngpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        gpio@50 {
> +            compatible =3D "adi,ds4520-gpio";
> +            reg =3D <0x50>;
> +            ngpios =3D <9>;
> +            gpio-controller;
> +            #gpio-cells =3D <2>;
> +        };
> +    };
> --
> 2.30.2
>

Applied this and the driver, thanks!

Bart
