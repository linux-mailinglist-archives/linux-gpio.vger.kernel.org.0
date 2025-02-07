Return-Path: <linux-gpio+bounces-15570-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7494EA2CD66
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 21:03:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E92A188DBA4
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 20:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851631A071C;
	Fri,  7 Feb 2025 20:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rp/VaSFm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D41B187342;
	Fri,  7 Feb 2025 20:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738958569; cv=none; b=ZkrMuYFPhKZR8C9oBkdiQpeOj1ZHF0udZVPpCIZjrf7bHywJARGByCPnRj32zyKfkzlwiDTntkGvQgPxNpQKO9UOjf9AClM98LwuOuQX4qGYUDuPvB4+b4LpMx6MyVa0oF7BRtXxPf5TqievDA/ZfBa6wJ0ln8bjj6jZNyl1XU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738958569; c=relaxed/simple;
	bh=a75M/qs8ZXvX0FAciyiF5ufDSPvkueUM3usehyvDjGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rz2PShkybQ+txTmFiavKyJHky6m83Ie7br0VBR3e+UgovpW3oTlA7aN54NDmVBW7k6YYOxNjub+PxM4Fo5uAklE+OIKBR2teMzvPYEY0aBIsE+WSrOXAuSDZkM93ajjxJIhlmurMGFv5EqlLboa2nXsYk1m1+kVneix8txp/iBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rp/VaSFm; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5de38c3d2acso2977742a12.1;
        Fri, 07 Feb 2025 12:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738958566; x=1739563366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJwev4Fxf3z+5OKj+atj+GQTUclMhDYmuMqjnAAbhLg=;
        b=Rp/VaSFm/diYh0fM68WL4GqIw2JrY40mRKUI8euC6QGBMmIFspOoIsuSziSEUuso/j
         S2oZm+3OnIx+rVOxBzOnGSi/MiU5jacxkRZBP5t/xG8QDgQ1BOCD3jsdGXBcA3SoMo1G
         wgzO4BtKIE+2bTIjuMb6S9bCagZOGkrKTibx5L74u6Kzr7Mya/zByT/IdTgS9V1A6YCB
         IWYzNvLjVnarjksYowTURnacdXH7s2SAPPLtWfoI8iUtIR8oUZ7yibR4a9LJ+1Ko00xA
         kY0JxKHbeKuYEpdeov/eYwxEOAWR429pqd2SHLgw+W9ZylkNpKJCHlsT8UiW271mKF/W
         UaSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958566; x=1739563366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJwev4Fxf3z+5OKj+atj+GQTUclMhDYmuMqjnAAbhLg=;
        b=ZdymOAmE1goCmhQ4qsF78zZggj46Y0xtw83RlTw0DJwVfGIEydzRan/v+pfW3u62oa
         5f4WOQ0MQQwbzxppzJNWENMY8TxD6wTE+ub+Ji4IkEkYd04aJYbpSqJeWuJRYsgSmP+9
         kx9v3MCb7se/v+And9l6Qtj6gnqjCFOagcDuTspq2A64ttiQpLN1v+D2gyLRv2pzat53
         uFNHz4t0bVAU1peZcBNsTx9eeM/AUYmYaowFa5X87mDABDWDyYYCGdpZGAFVg69Q8fML
         MG0Pb4BlQKFM1IwU9a/sLzV49Upf5Stg/k8SV+O8NRGP+IWPD0GMeZJwv/Za/r4T2h+d
         /Fmw==
X-Forwarded-Encrypted: i=1; AJvYcCVHYHSsJRheoPZ2TIEIAcaZgTj6WUJaknOjP4XzdW35WIciHJBk1TEg+yD0OP3GFwkFTdXL8iB9Po4t@vger.kernel.org, AJvYcCWu9JAA+4EI1BavFyTBYS275/B2DfexbFeVeY9YFbKNHXIkEKZDz1xQ8lPB3WvJ2G5vHhnkKE7+WmgN3Z8w@vger.kernel.org
X-Gm-Message-State: AOJu0YzwY+fUopohFhS2ZHpn+oAIDywqL1qpOhwy/rw3TbOqdbMLqUii
	+AIiocb/QcVo4T+wPZQbjxpqjelTmzgbjSc33H+MbQxdS0W0EaWZD4nauw==
X-Gm-Gg: ASbGncvpCOt184qiz7Sc69o3es5l0tUk4YifWFjmnM0GUlxNjp+pUld31B+4SHb5cat
	PZAEfzjmDX9uZk9X0fKHr4nZa3UVV5WYxQcxeFCz1agFLusdCzYfzBPx2KLjd4tyLPwmGn3qZ5f
	NFQ0SJQ5wK382pYFvRnmNsDIBEZDzTxbC7kxU+bvTMkuM0xk7W5XQxrunRJsKIxx3XhTbEsP4ls
	qBOoa1+v07PkBYkW6LOkZ2NgLIOVEy1aBpTyQHCYrUInINpybJ7ZHu6tDWr1OSnYe0s+ZKdSPXj
	bZP0MQcqnTCcJuPa3PjxvcbC9B2W8ONicHyXTXKnk4SIm1Nz6fgCOD8f
X-Google-Smtp-Source: AGHT+IHX4lfMlzlv5OA8u7aBJMGEpiOi82XrWRq/HaB89ahFtw4O+416ywv6cLMb2jQM6rAlHXcBPw==
X-Received: by 2002:a05:6402:43c3:b0:5de:45b5:bacc with SMTP id 4fb4d7f45d1cf-5de45b5baefmr5289882a12.20.1738958565331;
        Fri, 07 Feb 2025 12:02:45 -0800 (PST)
Received: from hex.my.domain (83.8.206.8.ipv4.supernova.orange.pl. [83.8.206.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de59f893ebsm256797a12.45.2025.02.07.12.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 12:02:45 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 07 Feb 2025 21:02:40 +0100
Subject: [PATCH 1/7] dt-bindings: pinctrl: Add bindings for BCM21664 pin
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-bcm21664-pinctrl-v1-1-e7cfac9b2d3b@gmail.com>
References: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com>
In-Reply-To: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Christian Daudt <bcm@fixthebug.org>, Sherman Yin <syin@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738958562; l=7969;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=a75M/qs8ZXvX0FAciyiF5ufDSPvkueUM3usehyvDjGY=;
 b=vXc/9nxnp7vj03AujliGm+pCo2L6SC2NLm7B8YRe4nVr7oIrTiKycvKDO78v/ojka7rNmtU8O
 in/1J65HoqnBFBOq0w9+/D0b0BeBnThKDcGeMJhxBRO+QvxcyliwHF6
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Add device tree bindings for the pin controller included in the
BCM21664 chip. The bindings are based off brcm,bcm11351-pinctrl.yaml;
both chips use the same driver, but have different pins, and the
BCM21664 has 6 alt modes instead of 4.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 .../bindings/pinctrl/brcm,bcm21664-pinctrl.yaml    | 169 +++++++++++++++++++++
 1 file changed, 169 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..233bea91b640ffa8480637d7304f661b7a4f5d79
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml
@@ -0,0 +1,169 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,bcm21664-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM21664 pin controller
+
+maintainers:
+  - Florian Fainelli <florian.fainelli@broadcom.com>
+  - Ray Jui <rjui@broadcom.com>
+  - Scott Branden <sbranden@broadcom.com>
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+properties:
+  compatible:
+    const: brcm,bcm21664-pinctrl
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '-grp[0-9]$':
+        type: object
+        unevaluatedProperties: false
+
+        properties:
+          pins:
+            description:
+              Specifies the name(s) of one or more pins to be configured by
+              this node.
+            items:
+              enum: [ adcsyn, batrm, bsc1clk, bsc1dat, camcs0, camcs1, clk32k,
+                      clk_cx8, dclk1, dclk4, dclkreq1, dclkreq4, dmic0clk,
+                      dmic0dq, dsi0te, gpio00, gpio01, gpio02, gpio03, gpio04,
+                      gpio05, gpio06, gpio07, gpio08, gpio09, gpio10, gpio11,
+                      gpio12, gpio13, gpio14, gpio15, gpio16, gpio17, gpio18,
+                      gpio19, gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
+                      gpio26, gpio27, gpio28, gpio32, gpio33, gpio34, gpio93,
+                      gpio94, gps_calreq, gps_hostreq, gps_pablank, gps_tmark,
+                      icusbdm, icusbdp, lcdcs0, lcdres, lcdscl, lcdsda, lcdte,
+                      mdmgpio00, mdmgpio01, mdmgpio02, mdmgpio03, mdmgpio04,
+                      mdmgpio05, mdmgpio06, mdmgpio07, mdmgpio08, mmc0ck,
+                      mmc0cmd, mmc0dat0, mmc0dat1, mmc0dat2, mmc0dat3, mmc0dat4,
+                      mmc0dat5, mmc0dat6, mmc0dat7, mmc0rst, mmc1ck, mmc1cmd,
+                      mmc1dat0, mmc1dat1, mmc1dat2, mmc1dat3, mmc1dat4,
+                      mmc1dat5, mmc1dat6, mmc1dat7, mmc1rst, pc1, pc2, pmbscclk,
+                      pmbscdat, pmuint, resetn, rfst2g_mtsloten3g,
+                      rtxdata2g_txdata3g1, rtxen2g_txdata3g2, rxdata3g0,
+                      rxdata3g1, rxdata3g2, sdck, sdcmd, sddat0, sddat1, sddat2,
+                      sddat3, simclk, simdat, simdet, simrst, spi0clk, spi0fss,
+                      spi0rxd, spi0txd, sri_c, sri_d, sri_e, sspck, sspdi,
+                      sspdo, sspsyn, stat1, stat2, swclktck, swdiotms, sysclken,
+                      tdi, tdo, testmode, traceclk, tracedt00, tracedt01,
+                      tracedt02, tracedt03, tracedt04, tracedt05, tracedt06,
+                      tracedt07, tracedt08, tracedt09, tracedt10, tracedt11,
+                      tracedt12, tracedt13, tracedt14, tracedt15, trstb,
+                      txdata3g0, ubctsn, ubrtsn, ubrx, ubtx ]
+
+          function:
+            description:
+              Specifies the pin mux selection.
+            enum: [ alt1, alt2, alt3, alt4, alt5, alt6 ]
+
+          slew-rate:
+            description: |
+              Meaning depends on configured pin mux:
+                bsc*clk/pmbscclk or bsc*dat/pmbscdat:
+                  0: Standard (100 kbps) & Fast (400 kbps) mode
+                  1: Highspeed (3.4 Mbps) mode
+                Otherwise:
+                  0: fast slew rate
+                  1: normal slew rate
+
+          bias-disable: true
+          bias-pull-up: true
+          input-disable: true
+          input-enable: true
+
+        required:
+          - pins
+
+        allOf:
+          - $ref: pincfg-node.yaml#
+
+          # Optional properties for standard pins
+          - if:
+              properties:
+                pins:
+                  contains:
+                    enum: [ adcsyn, batrm, camcs0, camcs1, clk32k, clk_cx8,
+                            dclk1, dclk4, dclkreq1, dclkreq4, dmic0clk, dmic0dq,
+                            dsi0te, gpio00, gpio01, gpio02, gpio03, gpio04,
+                            gpio05, gpio06, gpio07, gpio08, gpio09, gpio10,
+                            gpio11, gpio12, gpio13, gpio14, gpio15, gpio18,
+                            gpio19, gpio20, gpio21, gpio22, gpio23, gpio24,
+                            gpio25, gpio26, gpio27, gpio28, gpio32, gpio33,
+                            gpio34, gpio93, gpio94, gps_calreq, gps_hostreq,
+                            gps_pablank, gps_tmark, icusbdm, icusbdp, lcdcs0,
+                            lcdres, lcdscl, lcdsda, lcdte, mdmgpio00, mdmgpio01,
+                            mdmgpio02, mdmgpio03, mdmgpio04, mdmgpio05,
+                            mdmgpio06, mdmgpio07, mdmgpio08, mmc0ck, mmc0cmd,
+                            mmc0dat0, mmc0dat1, mmc0dat2, mmc0dat3, mmc0dat4,
+                            mmc0dat5, mmc0dat6, mmc0dat7, mmc0rst, mmc1ck,
+                            mmc1cmd, mmc1dat0, mmc1dat1, mmc1dat2, mmc1dat3,
+                            mmc1dat4, mmc1dat5, mmc1dat6, mmc1dat7, mmc1rst,
+                            pc1, pc2, pmuint, resetn, rfst2g_mtsloten3g,
+                            rtxdata2g_txdata3g1, rtxen2g_txdata3g2, rxdata3g0,
+                            rxdata3g1, rxdata3g2, sdck, sdcmd, sddat0, sddat1,
+                            sddat2, sddat3, simclk, simdat, simdet, simrst,
+                            spi0clk, spi0fss, spi0rxd, spi0txd, sri_c, sri_d,
+                            sri_e, sspck, sspdi, sspdo, sspsyn, stat1, stat2,
+                            swclktck, swdiotms, sysclken, tdi, tdo, testmode,
+                            traceclk, tracedt00, tracedt01, tracedt02,
+                            tracedt03, tracedt04, tracedt05, tracedt06,
+                            tracedt07, tracedt08, tracedt09, tracedt10,
+                            tracedt11, tracedt12, tracedt13, tracedt14,
+                            tracedt15, trstb, txdata3g0, ubctsn, ubrtsn, ubrx,
+                            ubtx ]
+            then:
+              properties:
+                drive-strength:
+                  enum: [ 2, 4, 6, 8, 10, 12, 14, 16 ]
+
+                bias-pull-down: true
+                input-schmitt-enable: true
+                input-schmitt-disable: true
+
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pinctrl@35004800 {
+      compatible = "brcm,bcm21664-pinctrl";
+      reg = <0x35004800 0x7f0>;
+
+      dev-a-active-pins {
+        /* group node defining 1 standard pin */
+        std-grp0 {
+          pins = "gpio00";
+          function = "alt1";
+          input-schmitt-enable;
+          bias-disable;
+          slew-rate = <1>;
+          drive-strength = <4>;
+        };
+
+        /* group node defining 2 I2C pins */
+        i2c-grp0 {
+          pins = "bsc1clk", "bsc1dat";
+          function = "alt2";
+          bias-pull-up = <720>;
+          input-enable;
+        };
+      };
+    };
+...

-- 
2.48.1


