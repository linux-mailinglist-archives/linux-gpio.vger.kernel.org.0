Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 674225B79F
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2019 11:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728513AbfGAJNz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Jul 2019 05:13:55 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]:35999 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728428AbfGAJNZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jul 2019 05:13:25 -0400
Received: by mail-wr1-f41.google.com with SMTP id n4so12933206wrs.3
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jul 2019 02:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ilVEeuyiLJqEM//7LRcyaeEvGW66sRMbkqNNEOmiSkI=;
        b=o4L9YZI4tirHAWoEPlRw2Wu8JfyvxaIcAG41fQgsQnQuu/MRiDTmbBRd2WwQI0lTMO
         2EbfBJktCWM1c8YziYL//jsayWaNiqNfnlsEQBWs+ar1gmJ3faCTTRQER4NoHKZ0VAYG
         iDBXVeUUbTFdI+sM1nU9ywFdWBk81nG3uqMfGy/QfLa10tET1aPMcNGB106uZkIYcAHz
         bTYrgbgF08lACA/XI4EFiEhkuDWTFg8SI1cgoqnc3N2fJJqSdz1qgwVAtB63IwjYy5p9
         7kjToRe9mLpK+7ezTc5njCXjRZfmV/oh+bVCUGdGaoyU7A/lE+dDQyxDTEd59Y5TMnW4
         g4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ilVEeuyiLJqEM//7LRcyaeEvGW66sRMbkqNNEOmiSkI=;
        b=tbxU+a+ADrUmYtfzzcJreh5AutP9PhfMvXDlyLxIvMzvCUg4K/GlU+wKHNktDHc7l4
         t2fTJNcJcJQdm9klC6fTucV9VxCbr3p5pUnV+COxgqPbZxs1qMXlof2JUbnji2Yz0lsr
         /qNYUPG2B+Payl/ThI4WWdXFevBthk4gom9Et+UD3npBqa9gau1Rb0fURvQ/8DuZQR2h
         zR4VlOTh39QHAUlW7cmChgpjCpPT14yHtnPxU4oV0OkNkfhxHDGobebfbqamyy8awVpe
         Kmw1ZpxAdZxoeFcvVxk/BlA2zKG/+VrEqHA64dgPpfN9bIT44Dvj3s0nZdkjPxO9eQ1W
         W4hQ==
X-Gm-Message-State: APjAAAWLEkzPlzs9DpaxPsTTrOAx3AJdNPEN/feo5mwV5yFJBZlbGCve
        rATv56ap178uzI6KE8Oi7JcEnQ==
X-Google-Smtp-Source: APXvYqxpEi241eMf9Uet7rcLU8HyQtNZPpgJjWPMlLqvr3ED55RqUQtQ1LLomYcRVppfIgf4uAhC3Q==
X-Received: by 2002:a5d:4acf:: with SMTP id y15mr12097174wrs.208.1561972402370;
        Mon, 01 Jul 2019 02:13:22 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id i16sm6305659wrm.37.2019.07.01.02.13.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 01 Jul 2019 02:13:21 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v3 11/14] arm64: dts: meson-g12a: add cpus OPP table
Date:   Mon,  1 Jul 2019 11:12:55 +0200
Message-Id: <20190701091258.3870-12-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701091258.3870-1-narmstrong@baylibre.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com>
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

