Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C6F977B3C1
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Aug 2023 10:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233567AbjHNIRK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Aug 2023 04:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234469AbjHNIQx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Aug 2023 04:16:53 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 577171700
        for <linux-gpio@vger.kernel.org>; Mon, 14 Aug 2023 01:16:49 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-31965c94001so1794875f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Aug 2023 01:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692001008; x=1692605808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlU+UgpZzYjQ8Qz1hoTyGS42vPJJFIQhlwcsmTQ11ZM=;
        b=iR+j4Dv9IHNAb88IVySZm6blLB7iji64jctzL/eDo6QOp5qOXdnDHXiNttZGisIYmo
         +ubPqjCsYmshg8VBioiRRZeWg6GJz3mArwo3tCKPnXItubknzkq2tXwMMylRgEfMExVp
         WQhArAVCDG+KVm3bWeDXFt8KQNXjrhIstKycxI++Qr22/o6SQrIMyUrjvDMWT1edz0Qw
         XGL76CYDUHFTxY49E5GnEaDlNG18sqMOK/bHHs2Xdkq4u+/LjUMTInCoF3Iv0iLXJgf1
         tHAydFlh21ltnV3Q9XWNjnfF9AFmqQxJS7s7Vyi0PP4sznFr8vPjcVGElv6NRuqSNE0e
         TR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692001008; x=1692605808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QlU+UgpZzYjQ8Qz1hoTyGS42vPJJFIQhlwcsmTQ11ZM=;
        b=ALVTyULDy5OqOiFIgFirX2UJpjg1tC4BgL3uDRC8WF3XLY+ml7siuOfJpnhlgyr2HE
         tuoqFmOsNxXq1bg3zZeBD1iodKYVy/XlxCWEsaeNHIMjXYyen97tB/c+lJ47kxe0xaC6
         b+FgW/2psmttGa3c3muMi0gBfX4hssuECRcAEug+P6g6scUFC0rjKBIZ9FEJx33d5wJ2
         8dwME17auXzgex7y0vSPtdYeRfX2VSt9xBbGyogl0nPU0ZslYM4XyqJbLcum4SXMLCRZ
         t8vIF/HsPdDPPACvwegNBFWIxN1YKzq2LI3PM/wMb1IFyxH9D73qd7ZDKWdnAsqBXtL/
         4+sg==
X-Gm-Message-State: AOJu0YwtGGEpK1t+SdYXCcP1ebvv/wZpvw0D6U7WXp1thTgkwbUHcSSo
        9rO4FNZsLtpvB/ApeWXJjHedFg==
X-Google-Smtp-Source: AGHT+IHX78yALUC6TfJmxHpY/Vzhc04B2FmIM8L6KyavO81tCgZNWUIAM6mwnod39AFqlqblIjWoLg==
X-Received: by 2002:adf:fe4b:0:b0:319:7b6f:4a5d with SMTP id m11-20020adffe4b000000b003197b6f4a5dmr754091wrs.52.1692001007768;
        Mon, 14 Aug 2023 01:16:47 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id k1-20020a5d4281000000b00317a29af4b2sm13542994wrq.68.2023.08.14.01.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 01:16:47 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 14 Aug 2023 10:16:38 +0200
Subject: [PATCH v3 2/3] dt-bindings: pinctrl: oxnas,pinctrl: remove
 obsolete bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230814-topic-oxnas-upstream-remove-v3-2-04a0c5cdda52@linaro.org>
References: <20230814-topic-oxnas-upstream-remove-v3-0-04a0c5cdda52@linaro.org>
In-Reply-To: <20230814-topic-oxnas-upstream-remove-v3-0-04a0c5cdda52@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Daniel Golle <daniel@makrotopia.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2520;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=lU0Rgil/ev1/BqzGapYknrWAekAzhIDCjFFvr/Tl7mg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBk2eLrougnqgseJ8fSlmQlnqFv6JZXdi8KV8xB/MqT
 WEbXIMSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZNni6wAKCRB33NvayMhJ0ckED/
 9+P/7v769IVBeyAtdWUeboLvTpXwBhrhbP46psTSwZNOuxKqSq/BGzPmFqIwuQIiyNcjvBww6jBcQi
 lHAkGQqKrnualw1SR522LGxIl7H8cBnD5uFPTU3Rn6xpFm5WfUpfSO2Pza9h/m6Zic60eNJYq+pDh6
 euN2M9DmPtrf9OCsR1NdnagOrvB8L9XwMKzpbOXPRJKItmpjz++VL3wwoWbdZi8yKNQgCx/mM3reeL
 kp2YJFl7v3qAbPDL2I5rTClrkk/uCAM0PyqPxz+nT4bL4zhV99HZ4OVagfzn8lnKoWCh7kmkt3EheF
 7OZtDDv3DrzL+3pydmWc0IlNwEQ505w5UA2UNPdvevYUx5ioOYxcQKFMH+Zbb4BobV662FDLkMNXOl
 D8cNSTcQzp9/yuS3wMm8mS+hCFJobInwUOYIySrkkGOjaHG8x3+cXTnVCZ7qxie6NvVBs2XOxOY5uB
 aWPI9mLr6jXNBnHF9wFx/xaV9s6VYTvrOZtx+ie20lGQzLAZDpi0HQtUq1iFOoSyvmg0kOqCDz9jhf
 kXLfF8Kb9z3NGD0PGV95z4vVbmKpGJTKS7ZLOEbRMI6/Fdk9LCDiumPV13NCPuozm6pOhM4imkjl8A
 hXudQv2fH0IVeUuarHYvpYTVa8Kq0QOoXfPb19S/bOHSBLNCuMxhVd6Ce7Ww==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Due to lack of maintenance and stall of development for a few years now,
and since no new features will ever be added upstream, remove the
OX810 and OX820 pinctrl bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/pinctrl/oxnas,pinctrl.txt  | 56 ----------------------
 1 file changed, 56 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt
deleted file mode 100644
index b1159434f593..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-* Oxford Semiconductor OXNAS SoC Family Pin Controller
-
-Please refer to pinctrl-bindings.txt, ../gpio/gpio.txt, and
-../interrupt-controller/interrupts.txt for generic information regarding
-pin controller, GPIO, and interrupt bindings.
-
-OXNAS 'pin configuration node' is a node of a group of pins which can be
-used for a specific device or function. This node represents configurations of
-pins, optional function, and optional mux related configuration.
-
-Required properties for pin controller node:
- - compatible: "oxsemi,ox810se-pinctrl" or "oxsemi,ox820-pinctrl"
- - oxsemi,sys-ctrl: a phandle to the system controller syscon node
-
-Required properties for pin configuration sub-nodes:
- - pins: List of pins to which the configuration applies.
-
-Optional properties for pin configuration sub-nodes:
-----------------------------------------------------
- - function: Mux function for the specified pins.
- - bias-pull-up: Enable weak pull-up.
-
-Example:
-
-pinctrl: pinctrl {
-	compatible = "oxsemi,ox810se-pinctrl";
-
-	/* Regmap for sys registers */
-	oxsemi,sys-ctrl = <&sys>;
-
-	pinctrl_uart2: pinctrl_uart2 {
-		uart2a {
-			pins = "gpio31";
-			function = "fct3";
-		};
-		uart2b {
-			pins = "gpio32";
-			function = "fct3";
-		};
-	};
-};
-
-uart2: serial@900000 {
-	compatible = "ns16550a";
-	reg = <0x900000 0x100000>;
-	clocks = <&sysclk>;
-	interrupts = <29>;
-	reg-shift = <0>;
-	fifo-size = <16>;
-	reg-io-width = <1>;
-	current-speed = <115200>;
-	no-loopback-test;
-	resets = <&reset 22>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart2>;
-};

-- 
2.34.1

