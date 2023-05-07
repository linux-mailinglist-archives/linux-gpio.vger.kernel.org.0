Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C01126F9BD0
	for <lists+linux-gpio@lfdr.de>; Sun,  7 May 2023 23:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbjEGVT1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 May 2023 17:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231644AbjEGVT0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 May 2023 17:19:26 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 115DB11B73
        for <linux-gpio@vger.kernel.org>; Sun,  7 May 2023 14:19:24 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so4371953e87.3
        for <linux-gpio@vger.kernel.org>; Sun, 07 May 2023 14:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683494362; x=1686086362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwevgKM2xEEUV3PSktWUIPbGHR7oQ/3U2UMCdx8DSQw=;
        b=s0U+zU8aQqPN7MZYfmfTf7ia97xzp/vNrAFvrs+ppmfmgP3K9zLYYvuAWKWhKEPAu6
         1q4NiExKLniEtMhN93KP0TJGpIPG0pqwBBojEJrvuRIMQxxWCpXhzrWzS4zIzhy8mY5t
         U5jFWeg20HhB2N0RhkyS1T4WqTOodZtbPuXcnCpXoohlW0t3UcLmDeye3edPTYISperg
         bcU48JJRSmNFDoBnxG1uHVJvF95iiSCWNwyBFB62p/gsZLe8tEkfh8mVahz0kaWMwFkM
         SR1aR+4tIHK2MMhOGUV0ju3EOAmyf/qKayh6jmd6zbtfrLTZrxLKRgd4F7atNyx4S+YT
         36dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683494362; x=1686086362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HwevgKM2xEEUV3PSktWUIPbGHR7oQ/3U2UMCdx8DSQw=;
        b=HNKHQfmKxj/Jtiyo+Mc2xThVO19EHeH2Twb+e7xxIbNaUzIN2f0RjxeQPKuYuQum6C
         h8zGy4CGN6TwCedGcjanyWCJ+9gwkfcTP9eGDaBYRKRkANsMwD06tO1/pxdpdtlffF0D
         Ls3lOH9r1AXWPuApMWWRUEctQNP7fnd6dJcdoDjdSTs5aaFmFzpsyBk9Lt6Ykkr7pmtq
         jAxDDQ/bv4vEqrR8hyoMDVOnGoBtTfDIX2xf/3yA1dcbgL5xsM8xRrRQzBXiXYDDxDSD
         7Ov1+zRoPlzh8+lz+S6+iBSTL0O4By7MqUffZALMUlFyOjqSDMXjovfgTAo2Mz9ZI8AW
         HVXg==
X-Gm-Message-State: AC+VfDw48hx+kA+syYBSM9ncN4Fz1/nbUtjyzh4tDv2aq7FycplCnZFu
        H4nt+u+TF2fBQBsbwEXtp5eIww==
X-Google-Smtp-Source: ACHHUZ6ZmVkOzsWwDj+8CfTHL7QUXKzzOW6RwAWZoKAFr8SQTCmMN/kOl3Lxqsmd61vvFgbizYRcdA==
X-Received: by 2002:ac2:4310:0:b0:4ef:f017:e52 with SMTP id l16-20020ac24310000000b004eff0170e52mr2042177lfh.5.1683494362323;
        Sun, 07 May 2023 14:19:22 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id c27-20020ac244bb000000b004f195cc3918sm623424lfm.176.2023.05.07.14.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 14:19:21 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 07 May 2023 23:19:19 +0200
Subject: [PATCH v3 1/2] dt-bindings: gpio: Add STMPE YAML DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230426-stmpe-dt-bindings-v3-1-eac1d736e488@linaro.org>
References: <20230426-stmpe-dt-bindings-v3-0-eac1d736e488@linaro.org>
In-Reply-To: <20230426-stmpe-dt-bindings-v3-0-eac1d736e488@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Stefan Agner <stefan@agner.ch>, Marek Vasut <marex@denx.de>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds a schema for the STMPE GPIO that while it is used a
lot in the kernel tree is anyway missing its bindings.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Use a compact hog node schema backed by the standard hog
  schema.
ChangeLog v1->v2:
- New patch split off from the MFD patch.
---
 .../devicetree/bindings/gpio/st,stmpe-gpio.yaml    | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
new file mode 100644
index 000000000000..41aa82b8b3eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/st,stmpe-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectonics Port Expander (STMPE) GPIO Block
+
+description: STMicroelectronics Port Expander (STMPE) is a series of slow
+  bus controllers for various expanded peripherals such as GPIO, keypad,
+  touchscreen, ADC, PWM or rotator. It can contain one or several different
+  peripherals connected to SPI or I2C. These bindings pertain to the
+  GPIO portions of these expanders.
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+properties:
+  compatible:
+    const: st,stmpe-gpio
+
+  "#gpio-cells":
+    const: 2
+
+  "#interrupt-cells":
+    const: 2
+
+  gpio-controller: true
+
+  interrupt-controller: true
+
+  st,norequest-mask:
+    description: A bitmask of GPIO lines that cannot be requested because for
+      for example not being connected to anything on the system
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+patternProperties:
+  "^.+-hog(-[0-9]+)?$":
+    type: object
+
+    required:
+      - gpio-hog
+
+additionalProperties: false
+
+required:
+  - compatible
+  - "#gpio-cells"
+  - "#interrupt-cells"
+  - gpio-controller
+  - interrupt-controller

-- 
2.34.1

