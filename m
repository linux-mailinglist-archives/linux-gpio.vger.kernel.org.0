Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02C345651E
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 11:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbfFZJGv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 05:06:51 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]:33384 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727133AbfFZJGu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 05:06:50 -0400
Received: by mail-wr1-f42.google.com with SMTP id n9so1814038wru.0
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2019 02:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ilVEeuyiLJqEM//7LRcyaeEvGW66sRMbkqNNEOmiSkI=;
        b=cwwWP69NVx6TY/Gz7Z5p/lOUqhwSvirq/vUFxmAFk6SolV3fKhmbczvggqjW5Mlk3A
         pDSxzCm/JDvZOz1aoNw1hlKwtY+LoadFpo84hRAKUUFzkK6cUwfWKJJMFJV9AYtbzWCr
         /KJsASkXrd6fkobkgaqua+oCVzf5D5X0pyHOpksG9HOx40Gg4BLd/oZQ7RM0r/mjWd6L
         B7GDAvIbXTTDRJi6PQI8gLJDWi1eUBjM7aQTRV9fPVaijB8D8Bo/oNMaOpXO8yR3P8J7
         gDWR309Auoj3m0VarJzHvrCdAdsnrv0hV+7Qj8GrjPkvyrWiJ8LTzyR94NiLZsMrIiGk
         HuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ilVEeuyiLJqEM//7LRcyaeEvGW66sRMbkqNNEOmiSkI=;
        b=Xz7+il/zJ13t32/bP7HeuEbPliE5iPmKXay8ls8SAtgOz+XzYg5VuzjT8w3Z8jB4sq
         d80hGX6NpLqXx6JJa6NnMG4+uSzBp7lCapWTTqyRymsecGv4XSGtlQzD5Zco5nKCOPZ3
         RAlh/T5j8usHN0XuftHRSPVHuu9bzoLtb+SkYV6Ph+fLwVUo5t/+ZlyS/fqwCMusM3U/
         q6KrMx+3LBGw8e9GOEOpQ0GHPuTJdcDl4MsagtpWTKx4OFPdXR9PEROFYLVjuwVvGQaU
         ys40dYmyBSf8jnE/uLr+3aWIZtrb1+hDRQM/gwbiK91QXfpD77iHoSlswSFyPuWW8Ehd
         OQow==
X-Gm-Message-State: APjAAAXzRsWJPv+eOdnQle/FZNgwztKRHSm82y9TGJ0DrRgS9wIAGi+u
        0KLCA30QzPFl+/Rk+F7u/BLe2Q==
X-Google-Smtp-Source: APXvYqzb1BGQn5vh83E/EV9iV7LTP4OmIHphpQesTpBpBMUvyLfTVQWwspLS+svQzdCN9waUUwRJIQ==
X-Received: by 2002:a5d:518f:: with SMTP id k15mr2642212wrv.321.1561540008423;
        Wed, 26 Jun 2019 02:06:48 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o6sm1925797wmc.46.2019.06.26.02.06.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 26 Jun 2019 02:06:47 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v2 11/14] arm64: dts: meson-g12a: add cpus OPP table
Date:   Wed, 26 Jun 2019 11:06:29 +0200
Message-Id: <20190626090632.7540-12-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626090632.7540-1-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the OPP table taken from the vendor u200 and u211 DTS.

The Amlogic G12A SoC seems to available in 3 types :
- low-speed: up to 1,8GHz
- mid-speed: up to 1,908GHz
- high-speed: up to 2.1GHz

And the S905X2 opp voltages are slightly higher than the S905D2
OPP voltages for the low-speed table.

This adds the conservative OPP table with the S905X2 higher voltages
and the maximum low-speed OPP frequency.

The values were tested to be stable on an Amlogic U200 Reference Board,
SeiRobotics SEI510 and X96 Max Set-Top-Boxes running the arm64 cpuburn
at [1] and cycling between all the possible cpufreq translations and
checking the final frequency using the clock-measurer, script at [2].

[1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
[2] https://gist.github.com/superna9999/d4de964dbc0f84b7d527e1df2ddea25f

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 60 +++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index ac15967bb7fa..733a9d46fc4b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -48,6 +48,66 @@
 			compatible = "cache";
 		};
 	};
+
+	cpu_opp_table: opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-250000000 {
+			opp-hz = /bits/ 64 <250000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-667000000 {
+			opp-hz = /bits/ 64 <666666666>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-1398000000 {
+			opp-hz = /bits/ 64 <1398000000>;
+			opp-microvolt = <761000>;
+		};
+
+		opp-1512000000 {
+			opp-hz = /bits/ 64 <1512000000>;
+			opp-microvolt = <791000>;
+		};
+
+		opp-1608000000 {
+			opp-hz = /bits/ 64 <1608000000>;
+			opp-microvolt = <831000>;
+		};
+
+		opp-1704000000 {
+			opp-hz = /bits/ 64 <1704000000>;
+			opp-microvolt = <861000>;
+		};
+
+		opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <981000>;
+		};
+	};
 };
 
 &sd_emmc_a {
-- 
2.21.0

