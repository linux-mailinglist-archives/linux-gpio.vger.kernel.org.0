Return-Path: <linux-gpio+bounces-23823-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 575E9B120D6
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 17:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 681BC171592
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 15:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B722EE979;
	Fri, 25 Jul 2025 15:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="T0uVsPW4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D10122D795;
	Fri, 25 Jul 2025 15:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753457193; cv=none; b=iV1AVtSKiVF9Byp72/AfjYmMjLuWFv7j599JJ6VQ/ee3Z5zFCQOD35nV4PTg0YqTH7AI8cLWgn6Gm+FckG6p21WSTzHR+WLZ2fUH9ndeZVBC65nIuFZgbJS1N5a7keQdhmWcFqcMecGoTohClYrEhOddjfdR8cek2ExU/+4RVeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753457193; c=relaxed/simple;
	bh=ihRJsZGUxJM1p30knUrcEe4oiR40c7ob80dkKu+CfEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VE2FyA7D8IUITZE0sMQOWNx33nC+lsiRff3C97TfV5ikpVCEGSQAWZxUkD5yBIiMK1YQFhc5EGBGTEbCJUaACGFetfQgnsvv+e4V1aISIKWqjDOwNMz61XmEn3B0lu9hWwfsKlnWQOCDzlY8v+CiZ26yb0Dcfoq5wd6GxjAi3+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=T0uVsPW4; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 969F8442AD;
	Fri, 25 Jul 2025 15:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753457188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xT+Y9zqqESB7APfaKivY2kPsEidZC+QbvEhv3rMkh3g=;
	b=T0uVsPW4PX144LvxqrZvvcbE4fZ/GNN+iEALBLP4Z9Px+GIpq0ktvBWzpKOpuzzDxer4Fj
	By8IK01TPP2bYaA9NJwqAkfnFXwNd1FQ6H5/2C89IMPEw6hT7tVJ3wBahplfMQdo0brkOF
	DGuVd5/sdHtQe0fOXKraJEP9aXjs4bbmYPKucKjHNViiMV2OvZtVBu4MiM+Oa1KLZTVkdp
	RoBr4R30Ar+W7moUAzmltP3Z6yw7qeh56l82R84kMTXQmjzBfE1igcm3+pQkDYCSHGja4D
	n1XqsAOKWR1ETeYa8fCKHDBtE4U7kOF9BR41jV2UEG5DFd30mK1RJiku2grOSw==
From: Herve Codina <herve.codina@bootlin.com>
To: Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 2/6] ARM: dts: r9a06g032: Add GPIO controllers
Date: Fri, 25 Jul 2025 17:26:11 +0200
Message-ID: <20250725152618.32886-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725152618.32886-1-herve.codina@bootlin.com>
References: <20250725152618.32886-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekfeekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehffeigfejueelueeuffelueefgfelhfejhfehieegudekteeiledttdfhffekffenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtohephhhorghnsehoshdrrghmphgvrhgvtghomhhpuhhtihhnghdrtghomhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehmrghgnhhushdruggrmhhmsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

Add GPIO controllers (Synosys DesignWare IPs) available in the
r9a06g032 (RZ/N1D) SoC.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 127 +++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 80ad1fdc77a0..7f71c01af409 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -499,6 +499,133 @@ gic: interrupt-controller@44101000 {
 				<GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		/*
+		 * The GPIO mapping to the corresponding pins is not obvious.
+		 * See the hardware documentation for details.
+		 */
+		gpio0: gpio@5000b000 {
+			compatible = "renesas,r9a06g032-gpio", "renesas,rzn1-gpio", "snps,dw-apb-gpio";
+			reg = <0x5000b000 0x80>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&sysctrl R9A06G032_HCLK_GPIO0>;
+			clock-names = "bus";
+			status = "disabled";
+
+			/* GPIO0a[0]      connected to pin  GPIO0      */
+			/* GPIO0a[1..2]   connected to pins GPIO3..4   */
+			/* GPIO0a[3..4]   connected to pins GPIO9..10  */
+			/* GPIO0a[5]      connected to pin  GPIO12     */
+			/* GPIO0a[6..7]   connected to pins GPIO15..16 */
+			/* GPIO0a[8..9]   connected to pins GPIO21..22 */
+			/* GPIO0a[10]     connected to pin  GPIO24     */
+			/* GPIO0a[11..12] connected to pins GPIO27..28 */
+			/* GPIO0a[13..14] connected to pins GPIO33..34 */
+			/* GPIO0a[15]     connected to pin  GPIO36     */
+			/* GPIO0a[16..17] connected to pins GPIO39..40 */
+			/* GPIO0a[18..19] connected to pins GPIO45..46 */
+			/* GPIO0a[20]     connected to pin  GPIO48     */
+			/* GPIO0a[21..22] connected to pins GPIO51..52 */
+			/* GPIO0a[23..24] connected to pins GPIO57..58 */
+			/* GPIO0a[25..31] connected to pins GPIO62..68 */
+			gpio0a: gpio@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				bank-name = "gpio0a";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				reg = <0>;
+			};
+
+			/* GPIO0b[0..1]   connected to pins GPIO1..2   */
+			/* GPIO0b[2..5]   connected to pins GPIO5..8   */
+			/* GPIO0b[6]      connected to pin  GPIO11     */
+			/* GPIO0b[7..8]   connected to pins GPIO13..14 */
+			/* GPIO0b[9..12]  connected to pins GPIO17..20 */
+			/* GPIO0b[13]     connected to pin  GPIO23     */
+			/* GPIO0b[14..15] connected to pins GPIO25..26 */
+			/* GPIO0b[16..19] connected to pins GPIO29..32 */
+			/* GPIO0b[20]     connected to pin  GPIO35     */
+			/* GPIO0b[21..22] connected to pins GPIO37..38 */
+			/* GPIO0b[23..26] connected to pins GPIO41..44 */
+			/* GPIO0b[27]     connected to pin  GPIO47     */
+			/* GPIO0b[28..29] connected to pins GPIO49..50 */
+			/* GPIO0b[30..31] connected to pins GPIO53..54 */
+			gpio0b: gpio@1 {
+				compatible = "snps,dw-apb-gpio-port";
+				bank-name = "gpio0b";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				reg = <1>;
+			};
+		};
+
+		gpio1: gpio@5000c000 {
+			compatible = "renesas,r9a06g032-gpio", "renesas,rzn1-gpio", "snps,dw-apb-gpio";
+			reg = <0x5000c000 0x80>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&sysctrl R9A06G032_HCLK_GPIO1>;
+			clock-names = "bus";
+			status = "disabled";
+
+			/* GPIO1a[0..4]  connected to pins GPIO69..73 */
+			/* GPIO1a[5..31] connected to pins GPIO95..121 */
+			gpio1a: gpio@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				bank-name = "gpio1a";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				reg = <0>;
+			};
+
+			/* GPIO1b[0..1]   connected to pins GPIO55..56 */
+			/* GPIO1b[2..4]   connected to pins GPIO59..61 */
+			/* GPIO1b[5..25]  connected to pins GPIO74..94 */
+			/* GPIO1b[26..31] connected to pins GPIO150..155 */
+			gpio1b: gpio@1 {
+				compatible = "snps,dw-apb-gpio-port";
+				bank-name = "gpio1b";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				reg = <1>;
+			};
+		};
+
+		gpio2: gpio@5000d000 {
+			compatible = "renesas,r9a06g032-gpio", "renesas,rzn1-gpio", "snps,dw-apb-gpio";
+			reg = <0x5000d000 0x80>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&sysctrl R9A06G032_HCLK_GPIO2>;
+			clock-names = "bus";
+			status = "disabled";
+
+			/* GPIO2a[0..27]  connected to pins GPIO122..149 */
+			/* GPIO2a[28..31] connected to pins GPIO156..159 */
+			gpio2a: gpio@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				bank-name = "gpio2a";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				reg = <0>;
+			};
+
+			/* GPIO2b[0..9] connected to pins GPIO160..169 */
+			gpio2b: gpio@1 {
+				compatible = "snps,dw-apb-gpio-port";
+				bank-name = "gpio2b";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <10>;
+				reg = <1>;
+			};
+		};
+
 		can0: can@52104000 {
 			compatible = "renesas,r9a06g032-sja1000", "renesas,rzn1-sja1000";
 			reg = <0x52104000 0x800>;
-- 
2.50.1


