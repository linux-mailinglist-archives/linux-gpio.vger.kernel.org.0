Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F360659891
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Dec 2022 14:09:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiL3NJY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Dec 2022 08:09:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbiL3NJX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Dec 2022 08:09:23 -0500
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C785B1A235
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2022 05:09:21 -0800 (PST)
Received: by mail-vs1-xe31.google.com with SMTP id x65so7688382vsb.13
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2022 05:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E52pxg0Ieuxx94IUZMALcwMIHlB9oJ0ae6r7GhsPesE=;
        b=qOYzZ22PlOTxy5rz+2Jr6vOdX7lOUg0qaafPHrEjHG5f40E6RiScGPuGIEoUXr/2PH
         +oGvuptZsVJRju9ipSuVycuQ2W1ky3QRWi8zYzVx1KdMuC/JFOidxN1UJUimAjP1fsmn
         tm5Ny181bxJ6l/v6HbNscM306YS/OExwGnUmed+ZTlFqqct6x37nTtKHAO0ERc9MyPuo
         EVizILuGKO2iB6xrLdsaHGozVKQ+DAXtMH9IsOyRbgKGplHS4KROXebu2krcdX8gRcfe
         cFsAcKxLqZyiI1fpvuURw+3uSV1kv/KUBupXD4MMlFdCULnNBm1KUN2XFRlWZhdejD5I
         SUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E52pxg0Ieuxx94IUZMALcwMIHlB9oJ0ae6r7GhsPesE=;
        b=WJpV1eYWxCaepqIiwL+dp5zCnoCjIDBWNceaS4AjFVdRZ0dPGgTWtCJ+eJpo6Gorqm
         Zpm1ss5f2kTmd8Xgw3oYhFmtkezsBSST8FwwhZQW8LzaopVummfdEekrk7ByLtrGZMvB
         gtZms8pR9Gm/Ud7ezlF/m/43LDA9+tiNo886yOAwhRBcYXivBY+4Ox7QM9J+PbzazhBV
         W63qJyywNlvEsDUkTdeby0wCChirbj3r8q71eRPalAYPCHBknRfB2Caz3ELcPFgHKgOT
         Rj+lPO/hHGPvMepJ2KQ/BRjiU9zlL8FmlGsUBmf0u99GBxrf2hM53eW0WR+R47UbHwfB
         ufzg==
X-Gm-Message-State: AFqh2krLpoLaaPCW2brv5/l3wrfwtXOJcf1mhjIsHuA0fcLpZak4dFnV
        eDesz4wiBY149oG6ZIkvefMmKkc0BEIGG54NESLPHA==
X-Google-Smtp-Source: AMrXdXuiIsORfdwTU8aiPfidGRU10vfw7irJHhwQafIrscv2Z2093Jcg+5ApA5mnSo+X462x4xJnegGVTE5BWClrxZ0=
X-Received: by 2002:a05:6102:3d9f:b0:3c4:4918:80c with SMTP id
 h31-20020a0561023d9f00b003c44918080cmr2749753vsv.9.1672405760903; Fri, 30 Dec
 2022 05:09:20 -0800 (PST)
MIME-Version: 1.0
References: <20221209171629.3351420-1-robh@kernel.org>
In-Reply-To: <20221209171629.3351420-1-robh@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 30 Dec 2022 14:09:10 +0100
Message-ID: <CAMRc=MeVNcaGdZE-JUAA9EZDUwAn4yhicgHZHizEsugecWj+GA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: Convert Fujitsu MB86S7x GPIO to DT schema
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 9, 2022 at 6:16 PM Rob Herring <robh@kernel.org> wrote:
>
> Convert the Fujitsu MB86S7x GPIO binding to DT schema format.
>
> The "socionext,synquacer-gpio" compatible was not documented, but is
> compatible with "fujitsu,mb86s70-gpio" and is in use (in u-boot
> Synquacer dts).
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/gpio/fujitsu,mb86s70-gpio.txt    | 20 --------
>  .../bindings/gpio/fujitsu,mb86s70-gpio.yaml   | 50 +++++++++++++++++++
>  2 files changed, 50 insertions(+), 20 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/fujitsu,mb86s70-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/fujitsu,mb86s70-gpio.yaml
>
> diff --git a/Documentation/devicetree/bindings/gpio/fujitsu,mb86s70-gpio.txt b/Documentation/devicetree/bindings/gpio/fujitsu,mb86s70-gpio.txt
> deleted file mode 100644
> index bef353f370d8..000000000000
> --- a/Documentation/devicetree/bindings/gpio/fujitsu,mb86s70-gpio.txt
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Fujitsu MB86S7x GPIO Controller
> --------------------------------
> -
> -Required properties:
> -- compatible: Should be "fujitsu,mb86s70-gpio"
> -- reg: Base address and length of register space
> -- clocks: Specify the clock
> -- gpio-controller: Marks the device node as a gpio controller.
> -- #gpio-cells: Should be <2>. The first cell is the pin number and the
> -  second cell is used to specify optional parameters:
> -   - bit 0 specifies polarity (0 for normal, 1 for inverted).
> -
> -Examples:
> -       gpio0: gpio@31000000 {
> -               compatible = "fujitsu,mb86s70-gpio";
> -               reg = <0 0x31000000 0x10000>;
> -               gpio-controller;
> -               #gpio-cells = <2>;
> -               clocks = <&clk 0 2 1>;
> -       };
> diff --git a/Documentation/devicetree/bindings/gpio/fujitsu,mb86s70-gpio.yaml b/Documentation/devicetree/bindings/gpio/fujitsu,mb86s70-gpio.yaml
> new file mode 100644
> index 000000000000..d18d95285465
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/fujitsu,mb86s70-gpio.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/fujitsu,mb86s70-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Fujitsu MB86S7x GPIO Controller
> +
> +maintainers:
> +  - Jassi Brar <jaswinder.singh@linaro.org>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: socionext,synquacer-gpio
> +          - const: fujitsu,mb86s70-gpio
> +      - const: fujitsu,mb86s70-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-controller: true
> +  gpio-line-names: true
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#gpio-cells'
> +  - gpio-controller
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio@31000000 {
> +        compatible = "fujitsu,mb86s70-gpio";
> +        reg = <0x31000000 0x10000>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        clocks = <&clk 0 2 1>;
> +    };
> +...
> --
> 2.35.1
>

Applied, thanks!

Bart
