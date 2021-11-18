Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFC40455C90
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 14:22:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbhKRNZO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 08:25:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbhKRNZO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 08:25:14 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC843C061766;
        Thu, 18 Nov 2021 05:22:13 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id bi37so25938765lfb.5;
        Thu, 18 Nov 2021 05:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=174CEl5sUThS8tOml+wwTF/Xr+vsAMlJVHCu3hrfWMg=;
        b=PlSGCIn3Lzoi2xf6WxHIplkWynAv/3TsAempQK46oBAwSGCp9mMqkGoORe2MhB6Q7m
         884mF/Opi0ZG7Kn06pJkaQi4kA02+7Xc9FdmaT/F7OffXHsQat2hclMMFYb2bhYgImHK
         AtQs7sDG6g8Vg1rLyxr8ZYTgJsZ1E9HW58ppmwqehX73kv6scBSR4l9zTDyX9me8nos8
         NHO0Mbr9lpk3spl0Zw8W/iMA96wcagDyt3FMRnn7VyIHgHKDzfdOPDR+GfAfclMoB56S
         13YbHa8NE1TvQ6fUMznbOBA2s6nILAcC25gztIM0W2y6ggNBq4FbESWUx+E1osNTsOwe
         LSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=174CEl5sUThS8tOml+wwTF/Xr+vsAMlJVHCu3hrfWMg=;
        b=w64sONfByZ27VzSRlMBlBGjE5ZxwSjleimY0Df4CIL+yZ+EtXzf/fXkt7Vg5y3rrf2
         tzf8sQxfrF3TP7apZwclNfGrbBO/NWXVSSN7oIzOh4E7fTwjRLoZjlIJX8E3x5wLANsA
         vmbdKF2NlOceZCAqnOK13hBTr29pMeT1GLPcUsl3OiW7YXQ/i/zcDEcnQpZHevfDYCMK
         RDDtcth3qlVaci4e/VVFugmByq6ixh3gMz+2qSrwASUDIalU/J4lMvhjlstDdyA13iWk
         G18OExUXFdGEtqXl8KDRLAJphAEYHVU7r8zxyurF/B8+cfH4SphocoSULxtaOtnzz36y
         Ps0g==
X-Gm-Message-State: AOAM533D8N3IFBxn0/UltIRoTrnTEsEHRTRF4ytxQmAe4drs3hRc7s9r
        DRQOpOJlYQeQZgTL6SexaM8=
X-Google-Smtp-Source: ABdhPJzLm7sgYuOh76sg+B7vGcs0Z3hKYVU4Di3/rKQySXcGgtRcqPpGnE0RYpQQ+zXyPhnEyRnfpQ==
X-Received: by 2002:a05:6512:3216:: with SMTP id d22mr25088204lfe.604.1637241732260;
        Thu, 18 Nov 2021 05:22:12 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id bp36sm356550lfb.0.2021.11.18.05.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 05:22:11 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/5] dt-bindings: pinctrl: brcm,ns-pinmux: extend example
Date:   Thu, 18 Nov 2021 14:21:49 +0100
Message-Id: <20211118132152.15722-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211118132152.15722-1-zajec5@gmail.com>
References: <20211118132152.15722-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

pinctrl bindings allow specifying pins, groups & functions now. Put some
entries in binding example to help writing DTS files.

Specify pins, groups & functions in the example.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/pinctrl/brcm,ns-pinmux.yaml      | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
index 8d1e5b1cdd5f..154119981ad9 100644
--- a/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
@@ -74,7 +74,7 @@ required:
   - reg
   - reg-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -83,6 +83,33 @@ examples:
         reg = <0x1800c1c0 0x24>;
         reg-names = "cru_gpio_control";
 
+        pins {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            pin@4 {
+                reg = <4>;
+                label = "i2c_scl";
+            };
+
+            pin@5 {
+                reg = <5>;
+                label = "i2c_sda";
+            };
+        };
+
+        groups {
+            i2c_grp: i2c_grp {
+                pins = <4 5>;
+            };
+        };
+
+        functions {
+            i2c {
+                groups = <&i2c_grp>;
+            };
+        };
+
         spi-pins {
             function = "spi";
             groups = "spi_grp";
-- 
2.31.1

