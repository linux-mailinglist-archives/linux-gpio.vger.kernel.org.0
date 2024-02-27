Return-Path: <linux-gpio+bounces-3810-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B32D9869973
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Feb 2024 15:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3DC1B25A66
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Feb 2024 14:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0DE14A4DC;
	Tue, 27 Feb 2024 14:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CA5TOEJG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD171487D6;
	Tue, 27 Feb 2024 14:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709045744; cv=none; b=sTgHCgDWfvyA4e4H+TS+mOfawwUw7WJGKQ4SVrLJHEMlpNxBggSnE2RLvGT2Fs1b/sYHI5FybwTJWvypeb46egM5fOka5wMucAetvDT/CEJbSeQeTDT0PnxSrbbemAlnE+/m/goK9hxP6ElrAyCBxSOoe9/k2klNzLmOnw6AFyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709045744; c=relaxed/simple;
	bh=na5iUFUdCcxo/XeKMDsWD2m8gyrN1SLEJxFdOBZFpes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SnDZqUPda1asElFAd4oV/iI2HTKIe0N3ml8njD2w3/sXjoPj7NuSXleuKkETSF0bT0OsKrRUEIXs83Ff2m/C6Jmuq8ZG0KpQRwV18Acj+wEXYX5uOulirUaiS9ETKa4bOAQJLZEGD+Xyv/cjXHfk5iFAILUaocWg/LYSDnAduDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CA5TOEJG; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 627FB20002;
	Tue, 27 Feb 2024 14:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709045740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YnALdwStqz9eKISqFy6qQHCMwj31QlMpXRX8xAVY3EI=;
	b=CA5TOEJGwdunwWTZTWjVnvvQlRANwYYWeXzmQU9H6pkot6bVEJXg8BWt7wwvq+Lz/wI0Bp
	qNVE45M4wOrZQC3AMgfonszmOCCBS3r4k414ucDRW8CKejiHULFfq3zEuNFI0eUpA9ZMp4
	TV6bqv1bkdiKXr23oPaHrIW7RZmRA9RO1LNLOfMoFH0HHwY9WP8VrYFopTkZIkY9roE8F3
	vizvdk3MawZ3YeqthUcJCF/TvKTuifuwego8XSUG9O3hLDw37G2HZqLBAjJe0RZmbYtAns
	U6ywAkbwpjstvzfnt6TN2639uScwAVUkIAO1FkDeKNaINbM83eGOonCJfwLj+A==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Tue, 27 Feb 2024 15:55:28 +0100
Subject: [PATCH v8 07/10] MIPS: mobileye: eyeq5: add OLB syscon node
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240227-mbly-clk-v8-7-c57fbda7664a@bootlin.com>
References: <20240227-mbly-clk-v8-0-c57fbda7664a@bootlin.com>
In-Reply-To: <20240227-mbly-clk-v8-0-c57fbda7664a@bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: theo.lebrun@bootlin.com

The OLB ("Other Logic Block") is a syscon region hosting the clock,
reset and pin controllers. It contains registers such as I2C speed mode
that need to be accessible by other nodes.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq5.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
index 6cc5980e2fa1..e82d2a57f6da 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
@@ -100,6 +100,14 @@ uart2: serial@a00000 {
 			clock-names = "uartclk", "apb_pclk";
 		};
 
+		olb: system-controller@e00000 {
+			compatible = "mobileye,eyeq5-olb", "syscon", "simple-mfd";
+			reg = <0 0xe00000 0x0 0x400>;
+			ranges = <0x0 0x0 0xe00000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		gic: interrupt-controller@140000 {
 			compatible = "mti,gic";
 			reg = <0x0 0x140000 0x0 0x20000>;

-- 
2.44.0


