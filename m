Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CABB26D275C
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Mar 2023 19:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232871AbjCaR4e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Mar 2023 13:56:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232690AbjCaR4O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Mar 2023 13:56:14 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC25323B4F
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 10:55:47 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id o32so13367089wms.1
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 10:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680285346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPFA2+mMpDkEnrSlP6Q1vK8FCaXq/JFd8egtENDoR5o=;
        b=PeOy+YqWRdWuBi74fAolky6lPCSbPq5CGvkKafeVzIijgexYqfcC4jlqoGmlZXHr1d
         T7PE+4vJ8td9t0DsFWLq6+vjmaOJD94VL+DMX4rQ/oXUt7rH5nLf7hirZzgWiLCj7U/O
         lcphRaOW7zLm0Tm4a6qpk/bwwhde53Orl1vRYx86N79DPACxTA1Hf4Yun8tfZOwkUjMY
         HdeH1k8x5RK900pUFF92ju57C3IFhc98WLDOz2I7sfCO4YeU5zkRU3WVWKZJEX1sfcQP
         uU0WqTnpwcJy4kOgxShJHw+PE3IpSOlhYJA7HlFL0hlW4GX/5CcFtwxE3VmJmTY7KxDt
         EDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680285346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPFA2+mMpDkEnrSlP6Q1vK8FCaXq/JFd8egtENDoR5o=;
        b=r5a12tMXUUs8NvY+Va2dDbhATPe4D3aCPPwuUlLrfwLxcFXQ4QKyVZ4n9jbSLJmD72
         jGZUunkYjNhl9t9mWO5fKVOWmw9tsYHExs44pNvgKtLeFdCimKngaeN0sm32C71zvFoa
         LjUobZXljVkb7ltL553KzfgZyfq5TOj8pEINTgW8AL4EFBBFgBze5qchHspAsr2NRXj0
         2ZLyVhTLioyVfWZmupgsb3QK/RVbMRgmW8TDRBX9Ft31SXOSNcIYOnKD3ON6d4oS2n0G
         JhWc8G2PsclXkh3dhS8SUYV59U8BpNXfCEvyXAdkXcNOGk/R0NdsStDb562OLqNiYcIB
         /CGQ==
X-Gm-Message-State: AAQBX9fnA0bmIOvUG7KYwcUV+w/bKjPMGwGiVHs8e6BCjEHOgiuSuosQ
        XQhr7w8u2FRDFFGEzK1gXgjRdg==
X-Google-Smtp-Source: AKy350bERDcWLKoptbYeuvyrpWrSHbI62YbY+lV7H01t+idK9b2TtfFveujbdv9Vr4utJsS+E9H8+A==
X-Received: by 2002:a05:600c:3781:b0:3f0:310c:e3ce with SMTP id o1-20020a05600c378100b003f0310ce3cemr6446435wmr.17.1680285346109;
        Fri, 31 Mar 2023 10:55:46 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 1-20020a05600c22c100b003eeb1d6a470sm3370171wmg.13.2023.03.31.10.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 10:55:45 -0700 (PDT)
From:   amergnat@baylibre.com
Date:   Fri, 31 Mar 2023 19:54:55 +0200
Subject: [PATCH v4 11/11] arm64: dts: mediatek: Add CPU Idle support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v4-11-5cffe66a38c0@baylibre.com>
References: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wenbin Mei <wenbin.mei@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Alexandre Bailon <abailon@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2689; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=tqYiFkOeI53hFAvkAFcO4mPwzuf3UCWBDqz4THM6QQc=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkJx6Uy5vEJZm9bUg+FYoCchCrD4sVjDezKQl7fMQT
 LecctqGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCcelAAKCRArRkmdfjHURRDED/
 9+Yr4rVHhNd8gakQ//OkIJ/wXjZWbTofuNrE3H5YG5ObUUKOBK9aFY9V0GWTjBkNogyLJZ8d982MtP
 o5tkFPqD66DfoB7LIF5H9zTXLfUdD/yh9lIiAJZ7iqi8zzA8M0UFzQG+fjBGylGO69wOrQ/vzGW5ZI
 aGRx7RTc7aNlaBKHyU3j00jC3iBYpeZchgew/cHkwPneffi54UKk0mSaFom47kWOtSQqnR7Mnvvksq
 tPANt5ApRcCFmFUikG1cJvuPwlb5Gxp13Al52OI90suco2XFBEfr2pXBZRQLwxKUNIR1tJ0UDme7aX
 gyvSgREhOIOyAGmY8geGSGNgutQcDVKeuOdYgDsDSJGJTZ/t0dhsvHxH3RjNaqNjCnQs68UTqhyX6H
 1NxEyNoObSoOA6W6EmConT5n2bcNImo/08EXbiKXO43fMdrQ99L67ED9X83sN1Gma+v0S9Zt+R/0Ht
 2y0ub9fKjls6wvvXVR6kDAYL+HKPGxDEqwVH+I92r5DECxY3ciOv72hciSIDf+QvWvKgD8kTbc5yXk
 BupBBwE3NUiddw8UK/6Mawp/bvHZ1+yaBTfGMMGx7UM0M2obwafsOcNX2fOnncDHwiZ+Xe2AKaX+o4
 WuYt6zzj5cGUFPb1ndYjNN0rEFV/Lw+aR+86VOsHsZpKMyGJvQKHgSX0kHQA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Amjad Ouled-Ameur <aouledameur@baylibre.com>

MT8365 has 3 CPU Idle states:
- MCDI_CPU. (Multi-Core-Deep-Idle)
- MCDI_CLUSTER.
- DPIDLE. (Deep-Idle)

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index cfe0c67ad61f..413496c92069 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -128,6 +128,7 @@ cpu0: cpu@0 {
 			reg = <0x0>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_MCDI &CLUSTER_MCDI &CLUSTER_DPIDLE>;
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -147,6 +148,7 @@ cpu1: cpu@1 {
 			reg = <0x1>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_MCDI &CLUSTER_MCDI &CLUSTER_DPIDLE>;
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -166,6 +168,7 @@ cpu2: cpu@2 {
 			reg = <0x2>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_MCDI &CLUSTER_MCDI &CLUSTER_DPIDLE>;
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -185,6 +188,7 @@ cpu3: cpu@3 {
 			reg = <0x3>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_MCDI &CLUSTER_MCDI &CLUSTER_DPIDLE>;
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -198,6 +202,37 @@ cpu3: cpu@3 {
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
+		idle-states {
+			entry-method = "psci";
+
+			CPU_MCDI: cpu-mcdi {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x00010001>;
+				entry-latency-us = <300>;
+				exit-latency-us = <200>;
+				min-residency-us = <1000>;
+			};
+
+			CLUSTER_MCDI: cluster-mcdi {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x01010001>;
+				entry-latency-us = <350>;
+				exit-latency-us = <250>;
+				min-residency-us = <1200>;
+			};
+
+			CLUSTER_DPIDLE: cluster-dpidle {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x01010004>;
+				entry-latency-us = <300>;
+				exit-latency-us = <800>;
+				min-residency-us = <3300>;
+			};
+		};
+
 		l2: l2-cache {
 			compatible = "cache";
 			cache-level = <2>;

-- 
2.25.1

