Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B247B386CF7
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 00:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238224AbhEQWcc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 18:32:32 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:41900 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238052AbhEQWcc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 18:32:32 -0400
Received: by mail-oi1-f178.google.com with SMTP id c3so7927529oic.8;
        Mon, 17 May 2021 15:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=sFKNGNEQ4VFVCXqmElsYGXP7lxtAMHRJSrvTNQOM490=;
        b=DyB4BPHWMSSwGRDe3V581M9o7FQAfyxCyDH5+yl0M8RVdxkOir4HmRqvl4R+zQNzck
         t0bf76hAkAshzX+Wsy8sfBSZMZnMKs2lprzvJpSdjAESePd17girU8X+h5xgJfcxtUw/
         Qnd664cgANYio6fexJ1wvqBIxR/+daE11xVFeCaPMg0NZyoj1OX4HHw5o7+Sy69eQtN+
         Hj3y8mdg4A1F1Mij/44kj5WV2hgCr4gsDtDREyGh5i9112K6NwcZei82qosXrmt1IJEc
         Kr8Jtb+ryWmzC33T0wess2oGcmyLpxzoOdTuTM8sXqZkx5RvA6YAwAomZ3MUPgGXEGCy
         OMcg==
X-Gm-Message-State: AOAM530s5cAkHuiBkKgQyIqBJv6xmFdgEHu2puu8+I71Ut+mAUwYXMx2
        jbDJu9rz0k6Wv4DoYdA9pjiXhXRV6A==
X-Google-Smtp-Source: ABdhPJyTx0tTbvBWR12HGJ/Tfyg0uKPJqwr/U4h6fL7DPGpyeQRGomUIbg2fcZz8Eqjg/H3FO47HZg==
X-Received: by 2002:a54:4809:: with SMTP id j9mr1021877oij.14.1621290674837;
        Mon, 17 May 2021 15:31:14 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 19sm2964559oiy.11.2021.05.17.15.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 15:31:14 -0700 (PDT)
Received: (nullmailer pid 3326623 invoked by uid 1000);
        Mon, 17 May 2021 22:31:13 -0000
Date:   Mon, 17 May 2021 17:31:13 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: leds: Binding for RTL8231 scan matrix
Message-ID: <20210517223113.GA3302542@robh.at.kernel.org>
References: <cover.1620735871.git.sander@svanheule.net>
 <cb1910ab6ba0795666df1034b47221f8bac160f9.1620735871.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb1910ab6ba0795666df1034b47221f8bac160f9.1620735871.git.sander@svanheule.net>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 11, 2021 at 02:25:19PM +0200, Sander Vanheule wrote:
> Add a binding description for the Realtek RTL8231's LED support, which
> consists of up to 88 LEDs arranged in a number of scanning matrices.
> 
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> ---
>  .../bindings/leds/realtek,rtl8231-leds.yaml   | 159 ++++++++++++++++++
>  1 file changed, 159 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml b/Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
> new file mode 100644
> index 000000000000..aba2b55fb9c9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
> @@ -0,0 +1,159 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/realtek,rtl8231-leds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek RTL8231 LED scan matrix.
> +
> +maintainers:
> +  - Sander Vanheule <sander@svanheule.net>
> +
> +description: |
> +  The RTL8231 has support for driving a number of LED matrices, by scanning
> +  over the LEDs pins, alternatingly lighting different columns and/or rows.
> +
> +  In single color scan mode, 88 LEDs are supported. These are grouped into
> +  three output matrices:
> +    - Group A of 6×6 single color LEDs. Rows and columns are driven by GPIO
> +      pins 0-11.
> +               L0[n]    L1[n]    L2[n]    L0[n+6]  L1[n+6]  L2[n+6]
> +                |        |        |        |        |        |
> +       P0/P6  --<--------<--------<--------<--------<--------< (3)
> +                |        |        |        |        |        |
> +       P1/P7  --<--------<--------<--------<--------<--------< (4)
> +                |        |        |        |        |        |
> +       P2/P8  --<--------<--------<--------<--------<--------< (5)
> +                |        |        |        |        |        |
> +       P3/P9  --<--------<--------<--------<--------<--------< (6)
> +                |        |        |        |        |        |
> +       P4/P10 --<--------<--------<--------<--------<--------< (7)
> +                |        |        |        |        |        |
> +       P5/P11 --<--------<--------<--------<--------<--------< (8)
> +               (0)      (1)      (2)      (9)     (10)     (11)
> +    - Group B of 6×6 single color LEDs. Rows and columns are driven by GPIO
> +      pins 12-23.
> +               L0[n]    L1[n]    L2[n]    L0[n+6]  L1[n+6]  L2[n+6]
> +                |        |        |        |        |        |
> +      P12/P18 --<--------<--------<--------<--------<--------< (15)
> +                |        |        |        |        |        |
> +      P13/P19 --<--------<--------<--------<--------<--------< (16)
> +                |        |        |        |        |        |
> +      P14/P20 --<--------<--------<--------<--------<--------< (17)
> +                |        |        |        |        |        |
> +      P15/P21 --<--------<--------<--------<--------<--------< (18)
> +                |        |        |        |        |        |
> +      P16/P22 --<--------<--------<--------<--------<--------< (19)
> +                |        |        |        |        |        |
> +      P17/P23 --<--------<--------<--------<--------<--------< (20)
> +              (12)     (13)     (14)    (21)      (22)     (23)
> +    - Group C of 8 pairs of anti-parallel (or bi-color) LEDs. LED selection is
> +      provided by GPIO pins 24-27 and 29-32, polarity selection by GPIO 28.
> +               P24     P25  ...  P30     P31
> +                |       |         |       |
> +      LED POL --X-------X---/\/---X-------X (28)
> +              (24)    (25)  ... (31)    (32)
> +
> +  In bi-color scan mode, 72 LEDs are supported. These are grouped into four
> +  output matrices:
> +    - Group A of 12 pairs of anti-parallel LEDs. LED selection is provided
> +      by GPIO pins 0-11, polarity selection by GPIO 12.
> +    - Group B of 6 pairs of anti-parallel LEDs. LED selection is provided
> +      by GPIO pins 23-28, polarity selection by GPIO 21.
> +    - Group C of 6 pairs of anti-parallel LEDs. LED selection is provided
> +      by GPIO pins 29-34, polarity selection by GPIO 22.
> +    - Group of 4×6 single color LEDs. Rows are driven by GPIO pins 15-20,
> +      columns by GPIO pins 13-14 and 21-22 (shared with groups B and C).
> +          P[n]     P[n+6]   P[n+12]  P[n+18]
> +            |        |        |        |
> +       +0 --<--------<--------<--------< (15)
> +            |        |        |        |
> +       +1 --<--------<--------<--------< (16)
> +            |        |        |        |
> +       +2 --<--------<--------<--------< (17)
> +            |        |        |        |
> +       +3 --<--------<--------<--------< (18)
> +            |        |        |        |
> +       +4 --<--------<--------<--------< (19)
> +            |        |        |        |
> +       +6 --<--------<--------<--------< (20)
> +          (13)     (14)     (21)     (22)
> +
> +  This node must always be a child of a 'realtek,rtl8231' node.
> +
> +properties:
> +  $nodename:
> +    const: leds

led-controller

> +
> +  compatible:
> +    const: realtek,rtl8231-leds

How is this device controlled?

> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 0
> +
> +  realtek,led-scan-mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: |
> +      Specify the scanning mode the chip should run in. See general description
> +      for how the scanning matrices are wired up.
> +    enum: ["single-color", "bi-color"]
> +
> +patternProperties:
> +  "^led@[0-9]+,[0-2]$":
> +    description: |
> +      LEDs are addressed by their port index and led index. Ports 0-23 always
> +      support three LEDs. Additionally, but only when used in single color scan
> +      mode, ports 24-31 support two LEDs.

Normally unit-addresses are hex values.

> +    type: object
> +
> +    properties:
> +      reg:
> +        maxItems: 1

This should have more constraints:

reg:
  items: 
    - items:
        - description: port index
          maximum: 31
        - description: led index
          maximum: 2

> +
> +    allOf:
> +      - $ref: ../leds/common.yaml#
> +
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +  - realtek,led-scan-mode
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +    leds {
> +        compatible = "realtek,rtl8231-leds";
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +
> +        realtek,led-scan-mode = "single-color";
> +
> +        led@0,0 {
> +            reg = <0 0>;
> +            color = <LED_COLOR_ID_GREEN>;
> +            function = LED_FUNCTION_LAN;
> +            function-enumerator = <0>;
> +        };
> +
> +        led@0,1 {
> +            reg = <0 1>;
> +            color = <LED_COLOR_ID_AMBER>;
> +            function = LED_FUNCTION_LAN;
> +            function-enumerator = <0>;
> +        };
> +
> +        led@0,2 {
> +            reg = <0 2>;
> +            color = <LED_COLOR_ID_GREEN>;
> +            function = LED_FUNCTION_STATUS;
> +        };
> +    };
> -- 
> 2.31.1
> 
