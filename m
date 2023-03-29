Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06D056CD567
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Mar 2023 10:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbjC2IzP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Mar 2023 04:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbjC2IzD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Mar 2023 04:55:03 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7351A3C20
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2023 01:55:00 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id d17so14827589wrb.11
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2023 01:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680080099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CgOmy+BLPLEddIB43+A5Yvfipk4ArtxV/+MDGYvcCLA=;
        b=s6ibz8YJKPnK8PU2PuDAmTE9SEfIy0d6/gT4UqkHlVhnX6ZNrWzpj1EKjnHkxQ1bRu
         8YY4aZ/HPgkLbTvisv/BwWqKl8NQWsQeuHDU2cNLH+pKyOlJI9bGqfw5/3gveuIb9RZy
         V9EZaw7itVIYp5eZVvhKuGX5113ZfDIsZkRZEzQysIvmtQ4R8Nt6KRoZ70YToXmCPf+a
         3wczup2C+sxc229fIAV4nbkGMjpoMB+qyOLR1vtZGfGp6Oi44rwo5s21Tc+io+sxGPiL
         5hIa0u3XEzI8k+8uRuJ4B2kvPYsPv02T9mWtM7n2EcbtN8iyudQrnl/4VvfUKUsNH+mh
         /T7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680080099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CgOmy+BLPLEddIB43+A5Yvfipk4ArtxV/+MDGYvcCLA=;
        b=QcNV7cIKyUffcBYm2q9Xp+atle3XUSoN4VV16i3aiCHcvGXj7sWCUGPyGaswffOtf1
         tgu73SQq8vcdbN0jnIs4gVLFECA2KrS9u49DJQhWqpz3wrZtJAL1zhlLZJBimkq1AOMs
         vQI0IZQqarVyvYgS1SqJ0l2NZ7Y/7pLU0lzE4TyFUmvl553LzsyUCf9Hu0Bju0RET1dh
         4cI6IfsYYUksT8bciyGpmcHiTPqFjAHqCuD6ny8wUgncIoagOVQw8bTgfb+iPi4nmfQv
         UJC3tuRZFiETdTUyKzn3hU5iCGB6B8TmzlOcDua+2CxaIRpv2A2HiV4bqu29AJf42vEv
         a8oA==
X-Gm-Message-State: AAQBX9eW9w2cP52vz8VY7obgiwsrHsnceeiB8mPNNyEUINYG0IGt0Hth
        0gr6kKDZXFRBQ1tNUnnXd+OMzg==
X-Google-Smtp-Source: AKy350ZroUjVxdSMQACq3zm1JGb8yEx8JUYN6yBNNoZlF3983Am9k7VcnPo9sL9HKQqKG2yZUXLSQA==
X-Received: by 2002:adf:e443:0:b0:2c7:6bb:fb7a with SMTP id t3-20020adfe443000000b002c706bbfb7amr15406921wrm.54.1680080099000;
        Wed, 29 Mar 2023 01:54:59 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f9-20020adff989000000b002cea392f000sm29571964wrr.69.2023.03.29.01.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:54:58 -0700 (PDT)
From:   amergnat@baylibre.com
Date:   Wed, 29 Mar 2023 10:54:26 +0200
Subject: [PATCH v3 05/17] arm64: dts: mediatek: add mt6357 device-tree
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v3-5-0003e80e0095@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8658; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=cjlFe/L6NnXNP1tz2P+XiSRqqudSy8JlvvArqvoZcmI=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkI/zcZEuXWEttTyCiFRzQRY2KLQj4sWnWNnwsmyHf
 /AhzCE2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCP83AAKCRArRkmdfjHURSRAEA
 Cc0rki0JFyGuTv5j0D3E8MbBtEJFMzpEXh6dUx9nKS4/LUvGY9Q+pEhPUhqzciKlhCowg/suZQjdyz
 9ZFTcgJDbAPYJ5NutMM9QxAaKdsaJmIn240hvi0rAZyk08w2THbQbi/8HuUFc1Xnr70Mt6MYZDl48/
 rOywCHaUQDr0ihvTTZTkfnVh9IeHFjFBpVJob8/PiptrLM0srI7XgUFqd8he0JGcYNO2wFfWTukPvc
 wQ/GJfrlkbSkQxOJaJ7kplbKH+eIXlJmYskSTx4j12sGKHrogTvAY7flPVhzoUrmRyQ+jaFjoyQckE
 zns0TmSvTyQsVH+nx88auOotYiMVN1tcMbsivSsI+7xCRy1POKvckdoK89xrGVxEdb3xuhUrj/IQoc
 JaMGAJJSXc9T7hWmyUOrluNXGqnHuoCBYsFl0gjHWDLYHkRf8vA3yWAyhG0lOIM269CqaOAofLuFhR
 KEupyD10fAQ6m4NKxdgk0ZfqJoHzSzrDVzfIPhm1CatQuXRM8V6gluL/xNTMWEmBwxRn+4C9huVGHN
 cMZv5hBfZ+By22N4Y/xeT9lxKjqxoRqxW6SP7gIK+s6gfuQWvdj9nZcft6Nm2SKPqjMT00tUx6WULb
 yR8/f6Rq6AVEj2SM/fiuPt1SM+1nfBjGAMI6sA6LxQsRXC77GNkmTHJfD5Ag==
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

From: Fabien Parent <fparent@baylibre.com>

This new device-tree add the regulators, rtc and keys support
for the MT6357 PMIC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6357.dtsi | 282 +++++++++++++++++++++++++++++++
 1 file changed, 282 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6357.dtsi b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
new file mode 100644
index 000000000000..3330a03c2f74
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
@@ -0,0 +1,282 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ * Copyright (c) 2023 BayLibre Inc.
+ */
+
+#include <dt-bindings/input/input.h>
+
+&pwrap {
+	mt6357_pmic: pmic {
+		compatible = "mediatek,mt6357";
+
+		regulators {
+			mt6357_vproc_reg: buck-vproc {
+				regulator-name = "vproc";
+				regulator-min-microvolt = <518750>;
+				regulator-max-microvolt = <1312500>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <220>;
+				regulator-always-on;
+			};
+
+			mt6357_vcore_reg: buck-vcore {
+				regulator-name = "vcore";
+				regulator-min-microvolt = <518750>;
+				regulator-max-microvolt = <1312500>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <220>;
+				regulator-always-on;
+			};
+
+			mt6357_vmodem_reg: buck-vmodem {
+				regulator-name = "vmodem";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1193750>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <220>;
+			};
+
+			mt6357_vs1_reg: buck-vs1 {
+				regulator-name = "vs1";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <2200000>;
+				regulator-ramp-delay = <12500>;
+				regulator-enable-ramp-delay = <220>;
+				regulator-always-on;
+			};
+
+			mt6357_vpa_reg: buck-vpa {
+				regulator-name = "vpa";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3650000>;
+				regulator-ramp-delay = <50000>;
+				regulator-enable-ramp-delay = <220>;
+			};
+
+			mt6357_vfe28_reg: ldo-vfe28 {
+				compatible = "regulator-fixed";
+				regulator-name = "vfe28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vxo22_reg: ldo-vxo22 {
+				regulator-name = "vxo22";
+				regulator-min-microvolt = <2200000>;
+				regulator-max-microvolt = <2400000>;
+				regulator-enable-ramp-delay = <110>;
+			};
+
+			mt6357_vrf18_reg: ldo-vrf18 {
+				compatible = "regulator-fixed";
+				regulator-name = "vrf18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <110>;
+			};
+
+			mt6357_vrf12_reg: ldo-vrf12 {
+				compatible = "regulator-fixed";
+				regulator-name = "vrf12";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-enable-ramp-delay = <110>;
+			};
+
+			mt6357_vefuse_reg: ldo-vefuse {
+				regulator-name = "vefuse";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vcn33_bt_reg: ldo-vcn33-bt {
+				regulator-name = "vcn33-bt";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3500000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vcn33_wifi_reg: ldo-vcn33-wifi {
+				regulator-name = "vcn33-wifi";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3500000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vcn28_reg: ldo-vcn28 {
+				compatible = "regulator-fixed";
+				regulator-name = "vcn28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vcn18_reg: ldo-vcn18 {
+				compatible = "regulator-fixed";
+				regulator-name = "vcn18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vcama_reg: ldo-vcama {
+				regulator-name = "vcama";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vcamd_reg: ldo-vcamd {
+				regulator-name = "vcamd";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vcamio_reg: ldo-vcamio18 {
+				compatible = "regulator-fixed";
+				regulator-name = "vcamio";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vldo28_reg: ldo-vldo28 {
+				regulator-name = "vldo28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vsram_others_reg: ldo-vsram-others {
+				regulator-name = "vsram-others";
+				regulator-min-microvolt = <518750>;
+				regulator-max-microvolt = <1312500>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <110>;
+				regulator-always-on;
+			};
+
+			mt6357_vsram_proc_reg: ldo-vsram-proc {
+				regulator-name = "vsram-proc";
+				regulator-min-microvolt = <518750>;
+				regulator-max-microvolt = <1312500>;
+				regulator-ramp-delay = <6250>;
+				regulator-enable-ramp-delay = <110>;
+				regulator-always-on;
+			};
+
+			mt6357_vaux18_reg: ldo-vaux18 {
+				compatible = "regulator-fixed";
+				regulator-name = "vaux18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vaud28_reg: ldo-vaud28 {
+				compatible = "regulator-fixed";
+				regulator-name = "vaud28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vio28_reg: ldo-vio28 {
+				compatible = "regulator-fixed";
+				regulator-name = "vio28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vio18_reg: ldo-vio18 {
+				compatible = "regulator-fixed";
+				regulator-name = "vio18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <264>;
+				regulator-always-on;
+			};
+
+			mt6357_vdram_reg: ldo-vdram {
+				regulator-name = "vdram";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-enable-ramp-delay = <3300>;
+			};
+
+			mt6357_vmc_reg: ldo-vmc {
+				regulator-name = "vmc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <44>;
+			};
+
+			mt6357_vmch_reg: ldo-vmch {
+				regulator-name = "vmch";
+				regulator-min-microvolt = <2900000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <44>;
+			};
+
+			mt6357_vemc_reg: ldo-vemc {
+				regulator-name = "vemc";
+				regulator-min-microvolt = <2900000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <44>;
+				regulator-always-on;
+			};
+
+			mt6357_vsim1_reg: ldo-vsim1 {
+				regulator-name = "vsim1";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <3100000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vsim2_reg: ldo-vsim2 {
+				regulator-name = "vsim2";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <3100000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+
+			mt6357_vibr_reg: ldo-vibr {
+				regulator-name = "vibr";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-enable-ramp-delay = <44>;
+			};
+
+			mt6357_vusb33_reg: ldo-vusb33 {
+				regulator-name = "vusb33";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3100000>;
+				regulator-enable-ramp-delay = <264>;
+			};
+		};
+
+		rtc {
+			compatible = "mediatek,mt6357-rtc";
+		};
+
+		keys {
+			compatible = "mediatek,mt6357-keys";
+
+			key-power {
+				linux,keycodes = <KEY_POWER>;
+				wakeup-source;
+			};
+
+			key-home {
+				linux,keycodes = <KEY_HOME>;
+				wakeup-source;
+			};
+
+		};
+	};
+};

-- 
2.25.1

