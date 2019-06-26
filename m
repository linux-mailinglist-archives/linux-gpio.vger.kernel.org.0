Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C56D156538
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 11:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbfFZJHS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 05:07:18 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45]:42541 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727140AbfFZJGw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 05:06:52 -0400
Received: by mail-wr1-f45.google.com with SMTP id x17so1763584wrl.9
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2019 02:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N2giQ2yIsAWn8MusPqgS1CP/DkqViRRuAeJS4LgppK4=;
        b=DXSZ+VO0OEC6jKtn+s80RNGXITCcDwHwpLndzhr+8/KJniKqMGcmDjaqxbUJjooJGg
         F93CGu/xmItuu5qshmofSmPhYhdz+Xg27J6AaPOmcfkQ5jwdz38oQ1J53U2paFI6LBjh
         ZFTAa0oUmX7iJqvSrOiDK8oXod/fF3aumKEhRhZgq3vnY+JI5+vAHf0MU1rsn3a4hmv6
         WhX+cqC7EmxBY/EwU+TSTEcQJBbQ0KNLr7t3hNd8M6AfS1rqEuOJL1NDetJemg5hlmQP
         13pM9OArLIhYk/rg36EuouDxealfUL6WRZbinROyxqCmyjPP7fjEtcIsJoN1DVUfbcwJ
         Ua2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N2giQ2yIsAWn8MusPqgS1CP/DkqViRRuAeJS4LgppK4=;
        b=XJpovlLHusBe2+I6g3LgX2vkDABB2PoXV9bQegjE2+KN//1CLkd9IAOZWqt3OhrqSj
         BQZQuCOkmfOfvWc50iSatXYcG6fnOgKeTjmsSLaC6TvD0sNMeEHXdUN6wsUQefZ7zfrz
         wD4cY5BxZcggahUUZMZ3+WvlpYbNLjZHMJwVM10t1HaHce2saK9X7ANNlNhhyn14RcPS
         RYVHLBMG2Wb/UNEg/9FGUFopk/KRGhFYPWBBlXMveWS4FGWVGsXUy7Eo0bCYzbckw9he
         MA2Cbrn7yrJyEEtgMy+geZmVmrV8nWk6X5+yy5f6iGaGlnIcPCYH5NSFf0nBQ4B6GYT1
         7ZRg==
X-Gm-Message-State: APjAAAUzgloPmmCEektCyxXObC3olqhJlPVmXTKNo4ytmn5fGalrFwTT
        7irTDfZVsHejZjXrcNnkRoUVwA==
X-Google-Smtp-Source: APXvYqz4hNZI6MaHjKVesPZ/4zgZ1NEbidAbDtUEDcFlcGeFBwbA5LHEybYag7mNYd9FG0MHg+dHJA==
X-Received: by 2002:adf:f503:: with SMTP id q3mr2722506wro.43.1561540009429;
        Wed, 26 Jun 2019 02:06:49 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o6sm1925797wmc.46.2019.06.26.02.06.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 26 Jun 2019 02:06:48 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v2 12/14] arm64: dts: meson-g12a: enable DVFS on G12A boards
Date:   Wed, 26 Jun 2019 11:06:30 +0200
Message-Id: <20190626090632.7540-13-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626090632.7540-1-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Enable DVFS for the U200, SEI520 and X96-Max Amlogic G12A based board
by setting the clock, OPP and supply for each CPU cores.

The CPU cluster power supply can achieve 0.73V to 1.01V using a PWM
output clocked at 800KHz with an inverse duty-cycle.

DVFS has been tested by running the arm64 cpuburn at [1] and cycling
between all the possible cpufreq translations and checking the final
frequency using the clock-measurer, script at [2].

[1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
[2] https://gist.github.com/superna9999/d4de964dbc0f84b7d527e1df2ddea25f

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-sei510.dts    | 55 +++++++++++++++++++
 .../boot/dts/amlogic/meson-g12a-u200.dts      | 55 +++++++++++++++++++
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 52 ++++++++++++++++++
 3 files changed, 162 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index bd26b35102ff..be45437c51e1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -129,6 +129,25 @@
 		enable-active-high;
 	};
 
+	vddcpu: regulator-vddcpu {
+		/*
+		 * SY8120B1ABC DC/DC Regulator.
+		 */
+		compatible = "pwm-regulator";
+
+		regulator-name = "VDDCPU";
+		regulator-min-microvolt = <721000>;
+		regulator-max-microvolt = <1022000>;
+
+		vin-supply = <&dc_in>;
+
+		pwms = <&pwm_AO_cd 1 1250 0>;
+		pwm-dutycycle-range = <100 0>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	vddio_ao1v8: regulator-vddio_ao1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_AO1V8";
@@ -297,6 +316,34 @@
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu1 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu2 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu3 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
 &cvbs_vdac_port {
 	cvbs_vdac_out: endpoint {
 		remote-endpoint = <&cvbs_connector_in>;
@@ -339,6 +386,14 @@
 	pinctrl-names = "default";
 };
 
+&pwm_AO_cd {
+	pinctrl-0 = <&pwm_ao_d_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&xtal>;
+	clock-names = "clkin1";
+	status = "okay";
+};
+
 &pwm_ef {
 	status = "okay";
 	pinctrl-0 = <&pwm_e_pins>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index 332a4b27174b..b6bd96ee394a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -136,6 +136,25 @@
 		regulator-always-on;
 	};
 
+	vddcpu: regulator-vddcpu {
+		/*
+		 * MP8756GD Regulator.
+		 */
+		compatible = "pwm-regulator";
+
+		regulator-name = "VDDCPU";
+		regulator-min-microvolt = <721000>;
+		regulator-max-microvolt = <1022000>;
+
+		vin-supply = <&main_12v>;
+
+		pwms = <&pwm_AO_cd 1 1250 0>;
+		pwm-dutycycle-range = <100 0>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	sound {
 		compatible = "amlogic,axg-sound-card";
 		model = "G12A-U200";
@@ -305,6 +324,34 @@
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu1 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu2 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu3 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
 &cvbs_vdac_port {
 	cvbs_vdac_out: endpoint {
 		remote-endpoint = <&cvbs_connector_in>;
@@ -369,6 +416,14 @@
 	pinctrl-names = "default";
 };
 
+&pwm_AO_cd {
+	pinctrl-0 = <&pwm_ao_d_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&xtal>;
+	clock-names = "clkin1";
+	status = "okay";
+};
+
 /* SD card */
 &sd_emmc_b {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index d37868d21114..099ccf67547e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -132,6 +132,22 @@
 		regulator-always-on;
 	};
 
+	vddcpu: regulator-vddcpu {
+		compatible = "pwm-regulator";
+
+		regulator-name = "VDDCPU";
+		regulator-min-microvolt = <721000>;
+		regulator-max-microvolt = <1022000>;
+
+		vin-supply = <&dc_in>;
+
+		pwms = <&pwm_AO_cd 1 1250 0>;
+		pwm-dutycycle-range = <100 0>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	sound {
 		compatible = "amlogic,axg-sound-card";
 		model = "G12A-X96-MAX";
@@ -242,6 +258,34 @@
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu1 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu2 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu3 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
 &cvbs_vdac_port {
 	cvbs_vdac_out: endpoint {
 		remote-endpoint = <&cvbs_connector_in>;
@@ -279,6 +323,14 @@
 	pinctrl-names = "default";
 };
 
+&pwm_AO_cd {
+	pinctrl-0 = <&pwm_ao_d_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&xtal>;
+	clock-names = "clkin1";
+	status = "okay";
+};
+
 &ext_mdio {
 	external_phy: ethernet-phy@0 {
 		/* Realtek RTL8211F (0x001cc916) */
-- 
2.21.0

