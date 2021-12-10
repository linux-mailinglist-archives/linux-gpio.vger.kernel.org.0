Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1785E470044
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 12:42:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233311AbhLJLqK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Dec 2021 06:46:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240667AbhLJLqK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Dec 2021 06:46:10 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2507DC061746;
        Fri, 10 Dec 2021 03:42:35 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id u22so13308543lju.7;
        Fri, 10 Dec 2021 03:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=//V7LaRZBttRLD6V/Smx8G2LPj0kKVQWcWYSEWdTtcI=;
        b=cMXzA1cYP92zn81NjewgKnGGHXV1yp8cQQC6vbCqffMDgfEWeIt392hkP/BNotRkOk
         r0Qso0jxc0Gwz6mRVSka+fUC7e0teuOE9ShNtkIeyPsaX7qq6sz2iX++SEa30modtjoY
         drXEhEXBDHA81/wdZKzqDLMMOuJcYZaarcT682uMMQhjWy7y4hjHaOtwauTrE4PquJ09
         Y688QO01pHj5f1CcMBIDP07ojjqYlxN91pjVpvP6i5yxswHOWVEHJhFBsUGkPRDmKz4v
         kfm094nF3FRX+MADW3NfkKkDUS927joi+kJpRGdh4D1/FChfwgjzXa/pawCrWFaCll+o
         Us3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=//V7LaRZBttRLD6V/Smx8G2LPj0kKVQWcWYSEWdTtcI=;
        b=QDQxzUp2hDg8U2zHP3ZUquu1CHWsdstTMijjgRNGIr5HzVyVwYHIa4aAPFBVcBlvuV
         ZLMLvsHR+4ncVDJV0Na3ihHsugQ3g5m6Q+MyUcIjXMd5IdNtZNVgHiF+zwkcjI/uWWkp
         eBBXRwyqUxsci1YTFWClwertH2oJlNAwqdNM2TUqWKAPnkn6lZod1L2xJiOraMrKQjFO
         Nfrqq8wVtavFmBwcw5Yd3fRCZC/82xYQ/7puMzvgrMdxDLwEAs5GGBBlkoABDR4gqki3
         TLMg4z68VdP+ihHyRbzGP+x30JLMKcRtAvI3mlC5E4WypTxFwqjVG2Kwd6OQx7yqGb5i
         TDDQ==
X-Gm-Message-State: AOAM532DVUPLq09T4JmPb6QzwJ+83LcDgRQOGa2x1lVV16yxeDL39Z0x
        TneYN3Kbf34fDcog2YaH030=
X-Google-Smtp-Source: ABdhPJzqPCllMxjacR3pU4hIxg/mEoZNtWjW9jIsBC2+9hvSwQmRbImI1zp9dUaYy1FAONw8vVAdDA==
X-Received: by 2002:a2e:9698:: with SMTP id q24mr12470865lji.246.1639136553447;
        Fri, 10 Dec 2021 03:42:33 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id j15sm289375lfe.157.2021.12.10.03.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 03:42:33 -0800 (PST)
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
Subject: [PATCH V3 2/2] dt-bindings: pinctrl: brcm,ns-pinmux: describe pins, groups & functions
Date:   Fri, 10 Dec 2021 12:42:22 +0100
Message-Id: <20211210114222.26581-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210114222.26581-1-zajec5@gmail.com>
References: <20211210114222.26581-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

Use and extend generic pinctrl binding to include info about pins,
groups & functions.

Northstar platform pins have numbers assigned to them (they are needed
for mux programming) so add a custom "number" property for that.

Extend example to provide a complete binding of a single / random
function.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/pinctrl/brcm,ns-pinmux.yaml      | 38 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
index 8d1e5b1cdd5f..82d3e52a2229 100644
--- a/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
@@ -30,6 +30,20 @@ properties:
   reg-names:
     const: cru_gpio_control
 
+  pins:
+    type: object
+
+    patternProperties:
+      "^.*$":
+        type: object
+
+        properties:
+          number:
+            description: Pin number
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+        unevaluatedProperties: false
+
 patternProperties:
   '-pins$':
     type: object
@@ -74,7 +88,7 @@ required:
   - reg
   - reg-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -83,6 +97,28 @@ examples:
         reg = <0x1800c1c0 0x24>;
         reg-names = "cru_gpio_control";
 
+        pins {
+            i2c_scl: i2c_scl {
+                number = <4>;
+            };
+
+            i2c_sda: i2c_sda {
+                number = <5>;
+            };
+        };
+
+        groups {
+            i2c_grp: i2c_grp {
+                pins = <&i2c_scl &i2c_sda>;
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

