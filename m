Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2E1C45D0B4
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 00:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352309AbhKXXIK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Nov 2021 18:08:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350651AbhKXXIH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Nov 2021 18:08:07 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BA49C061574;
        Wed, 24 Nov 2021 15:04:57 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id i63so8665855lji.3;
        Wed, 24 Nov 2021 15:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t5U1SyZfZoNpGvHsTDHh7UaG3kdZXZO+eWrR/VnLjrk=;
        b=lCDNG9jpw+/etEW6mwyL4EzIUojTEv+dOGBBzgrrZB2DbGynnUmiV83vYs5DXdOUIy
         T5U80pnSUEq1tYgeHhySOJZe7lTdOEj71TkP+XU3JZK8uTbcAy3HA4J51Oe0v7CJQg1w
         7ywe+qhLGu6Ze6qA+cJB5S9SMYxjOFe1acreWzja7KvbjJHa05DDdtOMYJpTXov2Hll+
         oQ7/6Oa8qR1rLuIS8OiBFazPtbjgWp5QMhSfIiHeqS9wvIqR5EQ7i/3cf8D+n5hCy87W
         /u7Oes8iQC2Fev+B+L/taTDoJxcYYfQ/++RqdOEYi+4uDnvwNHEyki25aSrP/x2exnot
         F2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t5U1SyZfZoNpGvHsTDHh7UaG3kdZXZO+eWrR/VnLjrk=;
        b=QO+SW/F+GpMedL600PcfDCxU41O4k+BGV1c3zTcpkEzF6vknYOiYD30mzn88K/7C/u
         IbEbYdLovAeCVAtSZPNIhNXc4+gMquacH9PPZoYeM+ScVTTp8Ye0vSaEN7mZJxnvCH7E
         dmSJudWKquWOPfyBPkczPytp8zc7T8oesZsDO5ATlM1bvVR3U3EWo6mWq7mnXZzBLIG2
         fz0b806RQF6PJHY/voO1JoE86sop4IqbjlftwpwQUSS8/7kNOQuByGrMfRVdYIqmsSrg
         6+lSKm7x7rFUyDfhscT88mfGMngVB0Z24Vdq91qF7k5ZxR0jOl2lKJBIk0uPIiKcZtHR
         pi2A==
X-Gm-Message-State: AOAM530+mq6d25lgMevWCsySlCc3aOlcomzgewy/HSvwsBZQCCn0Pj1/
        MvhXMLD8S9fzJbXFgmjKATc=
X-Google-Smtp-Source: ABdhPJx6vDIEcyUtB+GGU0RO2j8UW/qmW6qWgbrVozwXJdnq6GLsQfLFu/fmFeWwCylyo3vB3wo+Ww==
X-Received: by 2002:a2e:904b:: with SMTP id n11mr19791007ljg.120.1637795095369;
        Wed, 24 Nov 2021 15:04:55 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id t15sm106243lfp.181.2021.11.24.15.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 15:04:55 -0800 (PST)
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
Subject: [PATCH V2 2/6] dt-bindings: pinctrl: brcm,ns-pinmux: extend example
Date:   Thu, 25 Nov 2021 00:04:35 +0100
Message-Id: <20211124230439.17531-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211124230439.17531-1-zajec5@gmail.com>
References: <20211124230439.17531-1-zajec5@gmail.com>
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
V2: Update "pins" to match new binding
---
 .../bindings/pinctrl/brcm,ns-pinmux.yaml      | 24 ++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
index 8d1e5b1cdd5f..e5816a10938c 100644
--- a/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
@@ -74,7 +74,7 @@ required:
   - reg
   - reg-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -83,6 +83,28 @@ examples:
         reg = <0x1800c1c0 0x24>;
         reg-names = "cru_gpio_control";
 
+        pins {
+            i2c_scl {
+                number = <4>;
+            };
+
+            i2c_sda {
+                number = <5>;
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

