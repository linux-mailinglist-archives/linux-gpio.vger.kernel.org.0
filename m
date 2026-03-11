Return-Path: <linux-gpio+bounces-33165-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECiQI2iIsWnkDAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33165-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 16:21:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F17C92665CE
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 16:21:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0E0730B0E6A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845813E0C58;
	Wed, 11 Mar 2026 15:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLhFdPXL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448933DF000;
	Wed, 11 Mar 2026 15:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242286; cv=none; b=JKKeNvKfwwsnIPkGUoX5x6K8u44m8TbQ02SM2MpiIgajQ8jFCT/sUZnz82Wiwk7gc6u9fOYEw2WLZ3GD846bCO+cTDIjDDk9zLyGXopYRnYJ/7WeG//6SsMA+5RQzh7H0ne8Lmw5HLc3oLMMrZSjgZRNnq71+a2wcDvNHpBhDZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242286; c=relaxed/simple;
	bh=QFQKvG6wuZUd+J9Son23jLOwSLcPv3+xcMNUHUMtEXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PPAOfLnz/yH15ywHmDub65GHIVU+/L3qKz90++c8bKOShUmxicMTyIIJUbDjNxyjKi6F/+FqLXSiKdtoaCfJukM3l/wL6WUtIg1U8kg442O/hdyanlN3+/gE0co23/BXpA/xs003AaijFEF5UnVDY+/zbp6nz6Mi2yxi4sz2VO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLhFdPXL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD03C2BCB1;
	Wed, 11 Mar 2026 15:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773242285;
	bh=QFQKvG6wuZUd+J9Son23jLOwSLcPv3+xcMNUHUMtEXk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mLhFdPXLrqNVJpN/HBgZbvZCQnIxfIpk3KxDT591xVKhKTXMCqg2f72a4b3+Ds9mD
	 Gr95IE4mNXFEmQ3xegSNC7Qnob5df99RW1nEsQr2Z+y/kAp2vvXwJgqLUBUPXyoGni
	 fnqZYJTuVTWRSO7QTnUC5rVAWkRRJFmjca3QblCd+Rv/lGKXaCbj4HN9YN7id7RZUi
	 T9FWyh/dU+7TXTU/pjaWI2aMhmYBAASlvb7TpBbkiqx3ZRyh71EqOkHDoBENlazr57
	 qz1vt2pSjMlSAxcdCPK/vzzCx7KU/ySfJeMUJFE9ZzwsuHEzMBMdVO8JPaefoG1DyG
	 D2V0jleDRtEyA==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 4/4] riscv: dts: microchip: update mpfs gpio interrupts to better match the SoC
Date: Wed, 11 Mar 2026 15:17:41 +0000
Message-ID: <20260311-skimming-pummel-6a3e2fc66a9f@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260311-tasting-friend-eae39148fb96@spud>
References: <20260311-tasting-friend-eae39148fb96@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=17716; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=xwk1zdF71lVmTy8iGPQj3jwwNAGZwVVQs/EcHopDb8s=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkb26f/4OW5m7MmhtMlMu5456HSaCOLkr6e9m/fXSekz P0esdSoo5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABNp3cbwPywhJjf2alL3BrvQ a7yH7kY8TQ2wVD5VPePjygCjUxs1WBgZ1m8X4e34elI7hHe/zoaGkEmWQRPXcKh91Tc4dKvhins kIwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33165-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F17C92665CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Conor Dooley <conor.dooley@microchip.com>

There are 3 GPIO controllers on this SoC, of which:
- GPIO controller 0 has 14 GPIOs
- GPIO controller 1 has 24 GPIOs
- GPIO controller 2 has 32 GPIOs

All GPIOs are capable of generating interrupts, for a total of 70.
There are only 41 IRQs available however, so a configurable mux is used
to ensure all GPIOs can be used for interrupt generation.
38 of the 41 interrupts are in what the documentation calls "direct
mode", as they provide an exclusive connection from a GPIO to the PLIC.
The 3 remaining interrupts are used to mux the interrupts which do not
have a exclusive connection, one for each GPIO controller.

The mux was overlooked when the bindings and driver were originally
written for the GPIO controllers on Polarfire SoC, and the interrupts
property in the GPIO nodes used to try and convey what the mapping was.
Instead, the mux should be a device in its own right, and the GPIO
controllers should be connected to it, rather than to the PLIC.
Now that a binding exists for that mux, fix the inaccurate description
of the interrupt controller hierarchy.

GPIO controllers 0 and 1 do not have all 32 possible GPIO lines, so
ngpios needs to be set to match the number of lines/interrupts.

The m100pfsevp has conflicting interrupt mappings for controllers 0 and
2, as they cannot both be using an interrupt in "direct mode" at the
same time, so the default replaces this impossible configuration.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../boot/dts/microchip/mpfs-beaglev-fire.dts  | 29 +++++++++++++
 .../boot/dts/microchip/mpfs-disco-kit.dts     | 43 +++++++++++++------
 .../dts/microchip/mpfs-icicle-kit-common.dtsi | 37 ++++++++++++----
 .../boot/dts/microchip/mpfs-m100pfsevp.dts    | 41 ++++++++++++------
 .../boot/dts/microchip/mpfs-polarberry.dts    | 29 +++++++++++++
 .../riscv/boot/dts/microchip/mpfs-sev-kit.dts | 37 ++++++++++++----
 .../riscv/boot/dts/microchip/mpfs-tysom-m.dts | 35 ++++++++++++---
 arch/riscv/boot/dts/microchip/mpfs.dtsi       | 37 ++++++++++++++--
 8 files changed, 237 insertions(+), 51 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts b/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
index f44ad8e6f4e49..0e1b0b8d394b9 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
@@ -164,6 +164,35 @@ imx219_0: endpoint {
 	};
 };
 
+&irqmux {
+	interrupt-map = <0 &plic 13>, <1 &plic 14>, <2 &plic 15>,
+			<3 &plic 16>, <4 &plic 17>, <5 &plic 18>,
+			<6 &plic 19>, <7 &plic 20>, <8 &plic 21>,
+			<9 &plic 22>, <10 &plic 23>, <11 &plic 24>,
+			<12 &plic 25>, <13 &plic 26>,
+
+			<32 &plic 27>, <33 &plic 28>, <34 &plic 29>,
+			<35 &plic 30>, <36 &plic 31>, <37 &plic 32>,
+			<38 &plic 33>, <39 &plic 34>, <40 &plic 35>,
+			<41 &plic 36>, <42 &plic 37>, <43 &plic 38>,
+			<44 &plic 39>, <45 &plic 40>, <46 &plic 41>,
+			<47 &plic 42>, <48 &plic 43>, <49 &plic 44>,
+			<50 &plic 45>, <51 &plic 46>, <52 &plic 47>,
+			<53 &plic 48>, <54 &plic 49>, <55 &plic 50>,
+
+			<64 &plic 53>, <65 &plic 53>, <66 &plic 53>,
+			<67 &plic 53>, <68 &plic 53>, <69 &plic 53>,
+			<70 &plic 53>, <71 &plic 53>, <72 &plic 53>,
+			<73 &plic 53>, <74 &plic 53>, <75 &plic 53>,
+			<76 &plic 53>, <77 &plic 53>, <78 &plic 53>,
+			<79 &plic 53>, <80 &plic 53>, <81 &plic 53>,
+			<82 &plic 53>, <83 &plic 53>, <84 &plic 53>,
+			<85 &plic 53>, <86 &plic 53>, <87 &plic 53>,
+			<88 &plic 53>, <89 &plic 53>, <90 &plic 53>,
+			<91 &plic 53>, <92 &plic 53>, <93 &plic 53>,
+			<94 &plic 53>, <95 &plic 53>;
+};
+
 &mac0 {
 	status = "okay";
 	phy-mode = "sgmii";
diff --git a/arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts
index c068b9bb5bfdf..f769c9d5d7b47 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts
@@ -97,24 +97,10 @@ &core_pwm0 {
 };
 
 &gpio1 {
-	interrupts = <27>, <28>, <29>, <30>,
-		     <31>, <32>, <33>, <47>,
-		     <35>, <36>, <37>, <38>,
-		     <39>, <40>, <41>, <42>,
-		     <43>, <44>, <45>, <46>,
-		     <47>, <48>, <49>, <50>;
 	status = "okay";
 };
 
 &gpio2 {
-	interrupts = <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>;
 	status = "okay";
 };
 
@@ -130,6 +116,35 @@ &ihc {
 	status = "okay";
 };
 
+&irqmux {
+	interrupt-map = <0 &plic 13>, <1 &plic 14>, <2 &plic 15>,
+			<3 &plic 16>, <4 &plic 17>, <5 &plic 18>,
+			<6 &plic 19>, <7 &plic 20>, <8 &plic 21>,
+			<9 &plic 22>, <10 &plic 23>, <11 &plic 24>,
+			<12 &plic 25>, <13 &plic 26>,
+
+			<32 &plic 27>, <33 &plic 28>, <34 &plic 29>,
+			<35 &plic 30>, <36 &plic 31>, <37 &plic 32>,
+			<38 &plic 33>, <39 &plic 34>, <40 &plic 35>,
+			<41 &plic 36>, <42 &plic 37>, <43 &plic 38>,
+			<44 &plic 39>, <45 &plic 40>, <46 &plic 41>,
+			<47 &plic 42>, <48 &plic 43>, <49 &plic 44>,
+			<50 &plic 45>, <51 &plic 46>, <52 &plic 47>,
+			<53 &plic 48>, <54 &plic 49>, <55 &plic 50>,
+
+			<64 &plic 53>, <65 &plic 53>, <66 &plic 53>,
+			<67 &plic 53>, <68 &plic 53>, <69 &plic 53>,
+			<70 &plic 53>, <71 &plic 53>, <72 &plic 53>,
+			<73 &plic 53>, <74 &plic 53>, <75 &plic 53>,
+			<76 &plic 53>, <77 &plic 53>, <78 &plic 53>,
+			<79 &plic 53>, <80 &plic 53>, <81 &plic 53>,
+			<82 &plic 53>, <83 &plic 53>, <84 &plic 53>,
+			<85 &plic 53>, <86 &plic 53>, <87 &plic 53>,
+			<88 &plic 53>, <89 &plic 53>, <90 &plic 53>,
+			<91 &plic 53>, <92 &plic 53>, <93 &plic 53>,
+			<94 &plic 53>, <95 &plic 53>;
+};
+
 &mac0 {
 	phy-mode = "sgmii";
 	phy-handle = <&phy0>;
diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi
index e01a216e6c3a8..e25edc5f3b451 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi
@@ -77,14 +77,6 @@ &core_pwm0 {
 };
 
 &gpio2 {
-	interrupts = <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>;
 	status = "okay";
 };
 
@@ -136,6 +128,35 @@ &ihc {
 	status = "okay";
 };
 
+&irqmux {
+	interrupt-map = <0 &plic 13>, <1 &plic 14>, <2 &plic 15>,
+			<3 &plic 16>, <4 &plic 17>, <5 &plic 18>,
+			<6 &plic 19>, <7 &plic 20>, <8 &plic 21>,
+			<9 &plic 22>, <10 &plic 23>, <11 &plic 24>,
+			<12 &plic 25>, <13 &plic 26>,
+
+			<32 &plic 27>, <33 &plic 28>, <34 &plic 29>,
+			<35 &plic 30>, <36 &plic 31>, <37 &plic 32>,
+			<38 &plic 33>, <39 &plic 34>, <40 &plic 35>,
+			<41 &plic 36>, <42 &plic 37>, <43 &plic 38>,
+			<44 &plic 39>, <45 &plic 40>, <46 &plic 41>,
+			<47 &plic 42>, <48 &plic 43>, <49 &plic 44>,
+			<50 &plic 45>, <51 &plic 46>, <52 &plic 47>,
+			<53 &plic 48>, <54 &plic 49>, <55 &plic 50>,
+
+			<64 &plic 53>, <65 &plic 53>, <66 &plic 53>,
+			<67 &plic 53>, <68 &plic 53>, <69 &plic 53>,
+			<70 &plic 53>, <71 &plic 53>, <72 &plic 53>,
+			<73 &plic 53>, <74 &plic 53>, <75 &plic 53>,
+			<76 &plic 53>, <77 &plic 53>, <78 &plic 53>,
+			<79 &plic 53>, <80 &plic 53>, <81 &plic 53>,
+			<82 &plic 53>, <83 &plic 53>, <84 &plic 53>,
+			<85 &plic 53>, <86 &plic 53>, <87 &plic 53>,
+			<88 &plic 53>, <89 &plic 53>, <90 &plic 53>,
+			<91 &plic 53>, <92 &plic 53>, <93 &plic 53>,
+			<94 &plic 53>, <95 &plic 53>;
+};
+
 &mac0 {
 	phy-mode = "sgmii";
 	phy-handle = <&phy0>;
diff --git a/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts b/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts
index a8d623ee9fa4c..86234968df486 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts
@@ -52,11 +52,36 @@ &i2c1 {
 	status = "okay";
 };
 
+&irqmux {
+	interrupt-map = <0 &plic 13>, <1 &plic 14>, <2 &plic 15>,
+			<3 &plic 16>, <4 &plic 17>, <5 &plic 18>,
+			<6 &plic 19>, <7 &plic 20>, <8 &plic 21>,
+			<9 &plic 22>, <10 &plic 23>, <11 &plic 24>,
+			<12 &plic 25>, <13 &plic 26>,
+
+			<32 &plic 27>, <33 &plic 28>, <34 &plic 29>,
+			<35 &plic 30>, <36 &plic 31>, <37 &plic 32>,
+			<38 &plic 33>, <39 &plic 34>, <40 &plic 35>,
+			<41 &plic 36>, <42 &plic 37>, <43 &plic 38>,
+			<44 &plic 39>, <45 &plic 40>, <46 &plic 41>,
+			<47 &plic 42>, <48 &plic 43>, <49 &plic 44>,
+			<50 &plic 45>, <51 &plic 46>, <52 &plic 47>,
+			<53 &plic 48>, <54 &plic 49>, <55 &plic 50>,
+
+			<64 &plic 53>, <65 &plic 53>, <66 &plic 53>,
+			<67 &plic 53>, <68 &plic 53>, <69 &plic 53>,
+			<70 &plic 53>, <71 &plic 53>, <72 &plic 53>,
+			<73 &plic 53>, <74 &plic 53>, <75 &plic 53>,
+			<76 &plic 53>, <77 &plic 53>, <78 &plic 53>,
+			<79 &plic 53>, <80 &plic 53>, <81 &plic 53>,
+			<82 &plic 53>, <83 &plic 53>, <84 &plic 53>,
+			<85 &plic 53>, <86 &plic 53>, <87 &plic 53>,
+			<88 &plic 53>, <89 &plic 53>, <90 &plic 53>,
+			<91 &plic 53>, <92 &plic 53>, <93 &plic 53>,
+			<94 &plic 53>, <95 &plic 53>;
+};
+
 &gpio0 {
-	interrupts = <13>, <14>, <15>, <16>,
-		     <17>, <18>, <19>, <20>,
-		     <21>, <22>, <23>, <24>,
-		     <25>, <26>;
 	ngpios = <14>;
 	status = "okay";
 
@@ -75,14 +100,6 @@ mmc-sel-hog {
 };
 
 &gpio2 {
-	interrupts = <13>, <14>, <15>, <16>,
-		     <17>, <18>, <19>, <20>,
-		     <21>, <22>, <23>, <24>,
-		     <25>, <26>, <27>, <28>,
-		     <29>, <30>, <31>, <32>,
-		     <33>, <34>, <35>, <36>,
-		     <37>, <38>, <39>, <40>,
-		     <41>, <42>, <43>, <44>;
 	status = "okay";
 };
 
diff --git a/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
index ea0808ab10425..510d59153cd07 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
@@ -30,6 +30,35 @@ ddrc_cache_hi: memory@1000000000 {
 	};
 };
 
+&irqmux {
+	interrupt-map = <0 &plic 13>, <1 &plic 14>, <2 &plic 15>,
+			<3 &plic 16>, <4 &plic 17>, <5 &plic 18>,
+			<6 &plic 19>, <7 &plic 20>, <8 &plic 21>,
+			<9 &plic 22>, <10 &plic 23>, <11 &plic 24>,
+			<12 &plic 25>, <13 &plic 26>,
+
+			<32 &plic 27>, <33 &plic 28>, <34 &plic 29>,
+			<35 &plic 30>, <36 &plic 31>, <37 &plic 32>,
+			<38 &plic 33>, <39 &plic 34>, <40 &plic 35>,
+			<41 &plic 36>, <42 &plic 37>, <43 &plic 38>,
+			<44 &plic 39>, <45 &plic 40>, <46 &plic 41>,
+			<47 &plic 42>, <48 &plic 43>, <49 &plic 44>,
+			<50 &plic 45>, <51 &plic 46>, <52 &plic 47>,
+			<53 &plic 48>, <54 &plic 49>, <55 &plic 50>,
+
+			<64 &plic 53>, <65 &plic 53>, <66 &plic 53>,
+			<67 &plic 53>, <68 &plic 53>, <69 &plic 53>,
+			<70 &plic 53>, <71 &plic 53>, <72 &plic 53>,
+			<73 &plic 53>, <74 &plic 53>, <75 &plic 53>,
+			<76 &plic 53>, <77 &plic 53>, <78 &plic 53>,
+			<79 &plic 53>, <80 &plic 53>, <81 &plic 53>,
+			<82 &plic 53>, <83 &plic 53>, <84 &plic 53>,
+			<85 &plic 53>, <86 &plic 53>, <87 &plic 53>,
+			<88 &plic 53>, <89 &plic 53>, <90 &plic 53>,
+			<91 &plic 53>, <92 &plic 53>, <93 &plic 53>,
+			<94 &plic 53>, <95 &plic 53>;
+};
+
 /*
  * phy0 is connected to mac0, but the port itself is on the (optional) carrier
  * board.
diff --git a/arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts
index f9a8905794383..8f1908a105671 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts
@@ -56,15 +56,36 @@ &i2c0 {
 	status = "okay";
 };
 
+&irqmux {
+	interrupt-map = <0 &plic 13>, <1 &plic 14>, <2 &plic 15>,
+			<3 &plic 16>, <4 &plic 17>, <5 &plic 18>,
+			<6 &plic 19>, <7 &plic 20>, <8 &plic 21>,
+			<9 &plic 22>, <10 &plic 23>, <11 &plic 24>,
+			<12 &plic 25>, <13 &plic 26>,
+
+			<32 &plic 27>, <33 &plic 28>, <34 &plic 29>,
+			<35 &plic 30>, <36 &plic 31>, <37 &plic 32>,
+			<38 &plic 33>, <39 &plic 34>, <40 &plic 35>,
+			<41 &plic 36>, <42 &plic 37>, <43 &plic 38>,
+			<44 &plic 39>, <45 &plic 40>, <46 &plic 41>,
+			<47 &plic 42>, <48 &plic 43>, <49 &plic 44>,
+			<50 &plic 45>, <51 &plic 46>, <52 &plic 47>,
+			<53 &plic 48>, <54 &plic 49>, <55 &plic 50>,
+
+			<64 &plic 53>, <65 &plic 53>, <66 &plic 53>,
+			<67 &plic 53>, <68 &plic 53>, <69 &plic 53>,
+			<70 &plic 53>, <71 &plic 53>, <72 &plic 53>,
+			<73 &plic 53>, <74 &plic 53>, <75 &plic 53>,
+			<76 &plic 53>, <77 &plic 53>, <78 &plic 53>,
+			<79 &plic 53>, <80 &plic 53>, <81 &plic 53>,
+			<82 &plic 53>, <83 &plic 53>, <84 &plic 53>,
+			<85 &plic 53>, <86 &plic 53>, <87 &plic 53>,
+			<88 &plic 53>, <89 &plic 53>, <90 &plic 53>,
+			<91 &plic 53>, <92 &plic 53>, <93 &plic 53>,
+			<94 &plic 53>, <95 &plic 53>;
+};
+
 &gpio2 {
-	interrupts = <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>;
 	status = "okay";
 };
 
diff --git a/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts b/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
index d1120f5f2c015..bc15530a2979b 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
@@ -69,13 +69,36 @@ hwmon: hwmon@45 {
 	};
 };
 
+&irqmux {
+	interrupt-map = <0 &plic 13>, <1 &plic 14>, <2 &plic 15>,
+			<3 &plic 16>, <4 &plic 17>, <5 &plic 18>,
+			<6 &plic 19>, <7 &plic 20>, <8 &plic 21>,
+			<9 &plic 22>, <10 &plic 23>, <11 &plic 24>,
+			<12 &plic 25>, <13 &plic 26>,
+
+			<32 &plic 27>, <33 &plic 28>, <34 &plic 29>,
+			<35 &plic 30>, <36 &plic 31>, <37 &plic 32>,
+			<38 &plic 33>, <39 &plic 34>, <40 &plic 35>,
+			<41 &plic 36>, <42 &plic 37>, <43 &plic 38>,
+			<44 &plic 39>, <45 &plic 40>, <46 &plic 41>,
+			<47 &plic 42>, <48 &plic 43>, <49 &plic 44>,
+			<50 &plic 45>, <51 &plic 46>, <52 &plic 47>,
+			<53 &plic 48>, <54 &plic 49>, <55 &plic 50>,
+
+			<64 &plic 53>, <65 &plic 53>, <66 &plic 53>,
+			<67 &plic 53>, <68 &plic 53>, <69 &plic 53>,
+			<70 &plic 53>, <71 &plic 53>, <72 &plic 53>,
+			<73 &plic 53>, <74 &plic 53>, <75 &plic 53>,
+			<76 &plic 53>, <77 &plic 53>, <78 &plic 53>,
+			<79 &plic 53>, <80 &plic 53>, <81 &plic 53>,
+			<82 &plic 53>, <83 &plic 53>, <84 &plic 53>,
+			<85 &plic 53>, <86 &plic 53>, <87 &plic 53>,
+			<88 &plic 53>, <89 &plic 53>, <90 &plic 53>,
+			<91 &plic 53>, <92 &plic 53>, <93 &plic 53>,
+			<94 &plic 53>, <95 &plic 53>;
+};
+
 &gpio1 {
-	interrupts = <27>, <28>, <29>, <30>,
-		     <31>, <32>, <33>, <47>,
-		     <35>, <36>, <37>, <38>,
-		     <39>, <40>, <41>, <42>,
-		     <43>, <44>, <45>, <46>,
-		     <47>, <48>, <49>, <50>;
 	status = "okay";
 };
 
diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 5c2963e269b83..4f0d5bdee3da6 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -254,7 +254,17 @@ pdma: dma-controller@3000000 {
 		mss_top_sysreg: syscon@20002000 {
 			compatible = "microchip,mpfs-mss-top-sysreg", "syscon", "simple-mfd";
 			reg = <0x0 0x20002000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 			#reset-cells = <1>;
+
+			irqmux: interrupt-controller@54 {
+				compatible = "microchip,mpfs-irqmux";
+				reg = <0x54 0x4>;
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0x7f>;
+			};
 		};
 
 		sysreg_scb: syscon@20003000 {
@@ -471,36 +481,57 @@ mac1: ethernet@20112000 {
 		gpio0: gpio@20120000 {
 			compatible = "microchip,mpfs-gpio";
 			reg = <0x0 0x20120000 0x0 0x1000>;
-			interrupt-parent = <&plic>;
+			interrupt-parent = <&irqmux>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
+			interrupts = <0>, <1>, <2>, <3>,
+				     <4>, <5>, <6>, <7>,
+				     <8>, <9>, <10>, <11>,
+				     <12>, <13>;
 			clocks = <&clkcfg CLK_GPIO0>;
 			gpio-controller;
 			#gpio-cells = <2>;
+			ngpios = <14>;
 			status = "disabled";
 		};
 
 		gpio1: gpio@20121000 {
 			compatible = "microchip,mpfs-gpio";
 			reg = <0x0 0x20121000 0x0 0x1000>;
-			interrupt-parent = <&plic>;
+			interrupt-parent = <&irqmux>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
+			interrupts = <32>, <33>, <34>, <35>,
+				     <36>, <37>, <38>, <39>,
+				     <40>, <41>, <42>, <43>,
+				     <44>, <45>, <46>, <47>,
+				     <48>, <49>, <50>, <51>,
+				     <52>, <53>, <54>, <55>;
 			clocks = <&clkcfg CLK_GPIO1>;
 			gpio-controller;
 			#gpio-cells = <2>;
+			ngpios = <24>;
 			status = "disabled";
 		};
 
 		gpio2: gpio@20122000 {
 			compatible = "microchip,mpfs-gpio";
 			reg = <0x0 0x20122000 0x0 0x1000>;
-			interrupt-parent = <&plic>;
+			interrupt-parent = <&irqmux>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
+			interrupts = <64>, <65>, <66>, <67>,
+				     <68>, <69>, <70>, <71>,
+				     <72>, <73>, <74>, <75>,
+				     <76>, <77>, <78>, <79>,
+				     <80>, <81>, <82>, <83>,
+				     <84>, <85>, <86>, <87>,
+				     <88>, <89>, <90>, <91>,
+				     <92>, <93>, <94>, <95>;
 			clocks = <&clkcfg CLK_GPIO2>;
 			gpio-controller;
 			#gpio-cells = <2>;
+			ngpios = <32>;
 			status = "disabled";
 		};
 
-- 
2.51.0


