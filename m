Return-Path: <linux-gpio+bounces-26602-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D986BA04F9
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 17:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B88CC2A282A
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 15:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5080319873;
	Thu, 25 Sep 2025 15:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HS+8Us55"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397BD31159C
	for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 15:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813475; cv=none; b=Svw+bjTsnKoonoRrG1pAm9uUFkHqQkbbPzo4b/gPOfmOq2jqvMKYiADi42fjEg8HVRDhkwHW7nQDoYULOXtv4elCpe9WW3XC9SaeEtuXevEbq7ykKgQ1fIbCYbB8GkIe5Wm4SlRxI/BnzjoRXPKlKiG9iDEMYzyq0T/YiQg/b10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813475; c=relaxed/simple;
	bh=iiHfTmqTpfmKU38rkhczSgtC8/xhyV+ts8JmJCC3QqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aZh0zhlEtulTVa5qHfxFMZmjhi5N7kIiUUwzSWjUVwoSSt4bouNTH0oCfWGDRYHsgYpqioSf8JmOYRXMfiZmrfe6G5ByH3DvUibJV5IjQMkcApcO8atHI2SWcTgSsBQwp85g+UNXbxchw+0R3se6DnsayGAm6t+3TXILRqLOosU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HS+8Us55; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-579d7104c37so1453488e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2025 08:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813468; x=1759418268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihAxrvGeeqbDGS2s2nWoaKnfeN+9tvG68aYZNvqbzNU=;
        b=HS+8Us55YUrl1SpKCLgXLcg4nv83bV1Un1pNSEJd5981Ifvski/CNWikYAHWDua7WM
         XA60yIae3ORvMM3xXL+SI07nmqt/RO/jKWZZ8RRhXRRu3qrXEVvnSWiiuOyV8jTeX86z
         84CHMk/EIQNupoaklXuqxkw+dpmxhKjMDARl0Y9zItX1Ib4FgbD2X+OrejzrPbrVXxQn
         Xgdy81l0UcdpQNBwFyCepB2F0EoLfcZYGaePYdMLkQA46bYX9KxSxdG54hQrKcy0Sz55
         oBooCuHg4bcjkYXjEQrenkg+me11NLw0FNc4Fw1qoDdoA6a4UG+20vxxhWn1rhSHvnmC
         4LTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813468; x=1759418268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihAxrvGeeqbDGS2s2nWoaKnfeN+9tvG68aYZNvqbzNU=;
        b=O/ZBJU80S37dYAVdj4EjL6kbtg5wfX0KtWG/ZTQQPJsWnIwhlq8XlfLOQHbrBDxpOY
         r9TIRPSmVU3+oInIYu36m3zh5JLxK1r8Yfz1DwUXLoGM0FqzQng0HVFQoZHh9eBlwLRI
         wCbQ9B5NpYn30Y/e70rlQlClpHvoq8IzGteXbHuLmcEfKP0UF1AkYXNcaivHbazKibFN
         aY91HrpiULqodUf0qzqeGpV2YdC6kvIBzYRt5bVB1eQaQp0dCF6zDZvuErF8izxTMKUs
         vWCqTOwqy3gwXb5T0pt6i8GFLRcE8CFV35uA5tq7a9UaqbgJHxLHyiYx6x3GWL3d0uCM
         qkIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOhMVsVcknyyBF+IkJzVc+hmzfGsr47RjwCw150nwI3bEAHdZ9eD093K8za40oZPDx1R2farIHSG3T@vger.kernel.org
X-Gm-Message-State: AOJu0YxleT8AxRnKxZ83yKkTcr8OH1E8q/QCRtKwu4eupQSseJ9UPj/d
	bMxtXl3u0niYNyOvU/majeNvIXBmjwLPzA5aOsXfpKe/is/MXD6ynL5L
X-Gm-Gg: ASbGncveMJf680K6WHRZc5NqYaX4yHgEGifW/pr2cgmWMg1CNSrc8io8GFGrGAdu57h
	Sj4Jv8HjYa+GbUdwtipxuqT4NcxQhghUD6JICr2yROnZtHYMOnU6Q8jOOBXf4Psy2DiBdk0ZYgc
	M2No+0+PvxGcwb4DmFKyWcH9240EC3YJGWToQJtNZrsELcO68xCQ385VtjqVUIzQraZFGZkHHLt
	gN23IrVMVzqCtf7H8uzzprRhuJzo+Q35201yjYTTSPckdZ5CLPTPd8+CIB4p0Tdvk5ZcGj6oXvC
	BU96nSakIPTty51aN6lE5MivKbkQGi3u/RM5aarW30tDUP8s3KGuq4L0BpfctHgL3FLkFa7jwen
	AcaAec6vVa7vujg==
X-Google-Smtp-Source: AGHT+IEgIvTgxxL5WIN2ZRYvGEcMitZUM+cSp6l2oZhWq93Lx+b6iM39RU57IOUk08HihxonasaaBg==
X-Received: by 2002:a05:6512:6193:b0:577:35c5:9a41 with SMTP id 2adb3069b0e04-582d3ba0826mr1107436e87.53.1758813468072;
        Thu, 25 Sep 2025 08:17:48 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:47 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 21/22] ARM: tegra: add CSI nodes for Tegra20 and Tegra30
Date: Thu, 25 Sep 2025 18:16:47 +0300
Message-ID: <20250925151648.79510-22-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CSI node to Tegra20 and Tegra30 device trees.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra20.dtsi | 19 ++++++++++++++++++-
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 24 ++++++++++++++++++++++--
 2 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi b/arch/arm/boot/dts/nvidia/tegra20.dtsi
index 6ae07b316c8a..5cdbf1246cf8 100644
--- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
@@ -64,7 +64,7 @@ mpe@54040000 {
 
 		vi@54080000 {
 			compatible = "nvidia,tegra20-vi";
-			reg = <0x54080000 0x00040000>;
+			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA20_CLK_VI>;
 			resets = <&tegra_car 20>;
@@ -72,6 +72,23 @@ vi@54080000 {
 			power-domains = <&pd_venc>;
 			operating-points-v2 = <&vi_dvfs_opp_table>;
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi: csi@800 {
+				compatible = "nvidia,tegra20-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA20_CLK_CSI>;
+				power-domains = <&pd_venc>;
+				#nvidia,mipi-calibrate-cells = <1>;
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		epp@540c0000 {
diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index 20b3248d4d2f..be752a245a55 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -150,8 +150,8 @@ mpe@54040000 {
 		};
 
 		vi@54080000 {
-			compatible = "nvidia,tegra30-vi";
-			reg = <0x54080000 0x00040000>;
+			compatible = "nvidia,tegra30-vi", "nvidia,tegra20-vi";
+			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_VI>;
 			resets = <&tegra_car 20>;
@@ -162,6 +162,26 @@ vi@54080000 {
 			iommus = <&mc TEGRA_SWGROUP_VI>;
 
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi: csi@800 {
+				compatible = "nvidia,tegra30-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA30_CLK_CSI>,
+					 <&tegra_car TEGRA30_CLK_CSIA_PAD>,
+					 <&tegra_car TEGRA30_CLK_CSIB_PAD>;
+				clock-names = "csi", "csia-pad", "csib-pad";
+				power-domains = <&pd_venc>;
+				#nvidia,mipi-calibrate-cells = <1>;
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		epp@540c0000 {
-- 
2.48.1


