Return-Path: <linux-gpio+bounces-1084-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DA4808192
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 08:09:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C897E1C21365
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Dec 2023 07:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7931E49F;
	Thu,  7 Dec 2023 07:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="PcFYmU2r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9443610DC
	for <linux-gpio@vger.kernel.org>; Wed,  6 Dec 2023 23:08:26 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-54c77e0835bso726149a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 06 Dec 2023 23:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1701932905; x=1702537705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBYF9QpO8SrhIdSFCDMv2cfVKm7GC7rzruG040ItQBw=;
        b=PcFYmU2r9sqap1N65jkwIrsaEFmXJ/h4EbdUxZVfAOkrnLfwKaa0/b7kN9a56b4DFj
         W3nYKIDnQ6NegWhM4s3L+/4orCiTyheRts6Y4dHD8/eut6W5qsTUjsRh/TynQHOn/iFv
         tw2yDpVj7qqjmev2vd0HpCK+BVn+RYrDX7DFkRd/9wb8TFssVG1NxCvpktTxlN/S1gyh
         6STUPc1I4+zBuxr2lIQnIUaLI2DwyhZ/i1A8WKXyeZWBCnhtFAeqkGDfGJLFJhv35h8O
         K6UoT2iY/hanCBW3aQGky/hIAc5WU/B+sdDlYcsPHU3QMDZH4x8KwfrzI5lJUa+Z9jyr
         nm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701932905; x=1702537705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBYF9QpO8SrhIdSFCDMv2cfVKm7GC7rzruG040ItQBw=;
        b=RsMWHPB525Gd2tHKXGj58PA3Tnmkdu1/s60dKfe0CgpidtfbMNpMlRDAhrk/V2eNrI
         8Pj1HzWF2lkt0aCYcKVQ7nzml2uXb/q5AYiJrFfwV8BVLZ2ULC61g5zpGDEEWv/zR4Wc
         Cv9Js/DYneXtjmUqo/KGWPNrh425k4m5MRcIyoHFEcZvOhWgRBwHHNt5fEW7OGMTZGiO
         srKU9cT9riQmqL3V+HPME8RSlDj2l34H8bDDj2vjJa8cXP7DNAwbInyIuhekgIaQlgFZ
         G1OGQoPwjG2zN75vjd9nkUs0vcwvdnIQ0wrV3ZiPy8fZOIOvLT/4FLcjINqQPW7d153+
         f3jg==
X-Gm-Message-State: AOJu0YzSUjZxM1TnS1qDQ4m4Z+N5gSZCKNRvzseLm8z6AE0FQmU1nwmx
	Dz9VMV86No3NzIXHt/8vyQ0ipA==
X-Google-Smtp-Source: AGHT+IHyWA46x9d/N0Itj6CxhWYpryaZpfLZ/5MUDx6RV9OPnuZqeWqpWuACNAJ8F70tFzh8Abi6Dg==
X-Received: by 2002:a05:6402:508:b0:54b:fe15:1e9e with SMTP id m8-20020a056402050800b0054bfe151e9emr1190179edv.30.1701932904921;
        Wed, 06 Dec 2023 23:08:24 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.22])
        by smtp.gmail.com with ESMTPSA id b41-20020a509f2c000000b0054cb88a353dsm420818edf.14.2023.12.06.23.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 23:08:24 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linus.walleij@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 09/11] arm64: renesas: r9a08g045: Add the Ethernet nodes
Date: Thu,  7 Dec 2023 09:06:58 +0200
Message-Id: <20231207070700.4156557-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231207070700.4156557-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add the Ethernet nodes available on RZ/G3S (R9A08G045).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- added phy-mode = "rgmii" and #address-cells, #size-cells for both
  Ethernet nodes
  
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 6c7b29b69d0e..aaab5739c134 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -149,6 +149,44 @@ sdhi2: mmc@11c20000 {
 			status = "disabled";
 		};
 
+		eth0: ethernet@11c30000 {
+			compatible = "renesas,r9a08g045-gbeth", "renesas,rzg2l-gbeth";
+			reg = <0 0x11c30000 0 0x10000>;
+			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mux", "fil", "arp_ns";
+			phy-mode = "rgmii";
+			clocks = <&cpg CPG_MOD R9A08G045_ETH0_CLK_AXI>,
+				 <&cpg CPG_MOD R9A08G045_ETH0_CLK_CHI>,
+				 <&cpg CPG_MOD R9A08G045_ETH0_REFCLK>;
+			clock-names = "axi", "chi", "refclk";
+			resets = <&cpg R9A08G045_ETH0_RST_HW_N>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		eth1: ethernet@11c40000 {
+			compatible = "renesas,r9a08g045-gbeth", "renesas,rzg2l-gbeth";
+			reg = <0 0x11c40000 0 0x10000>;
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mux", "fil", "arp_ns";
+			phy-mode = "rgmii";
+			clocks = <&cpg CPG_MOD R9A08G045_ETH1_CLK_AXI>,
+				 <&cpg CPG_MOD R9A08G045_ETH1_CLK_CHI>,
+				 <&cpg CPG_MOD R9A08G045_ETH1_REFCLK>;
+			clock-names = "axi", "chi", "refclk";
+			resets = <&cpg R9A08G045_ETH1_RST_HW_N>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@12400000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.39.2


