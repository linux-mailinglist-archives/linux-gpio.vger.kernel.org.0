Return-Path: <linux-gpio+bounces-36880-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QF78Mnx0BmrpjwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36880-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 03:18:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAA454852D
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 03:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F724302E962
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 01:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830FC368263;
	Fri, 15 May 2026 01:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MxHnnIoT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC3D367F44;
	Fri, 15 May 2026 01:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778807893; cv=none; b=tixCh293x6L9nDHVo+IDUsHJt3hA5RnrdOlOObiAWNDmqWk9Sb0HstoY7AkdQuOumXOnqzRW0wV1EG5biu/NGp3c/UV80gBf06JQyB+eAm6y2hMyAmmFmdZY3D/BZZk69ihwBwoTriCOwNnQki97sH840lQjkbDZYifIsr7M4Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778807893; c=relaxed/simple;
	bh=bbbJf4NKXFDJVvgJ/R5HuskZSTsJYRkTdOzsMan+RjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=szTsbWEaipzW6xWhqyTZJbzrpQxQW+oKKqULDftNf2cqHfEB6t3c2qVQ06mh6gbSm47nSgYP6Q7hVrPQ3fiatqToe4fKpjv55x532mqz0+8P0l4grHMvd/0VyTDsDp2cPq1/UhOvOzgoBFeTMGIx63Oy0cFwiFeV+nqmvMG+w9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MxHnnIoT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F170DC2BD05;
	Fri, 15 May 2026 01:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778807893;
	bh=bbbJf4NKXFDJVvgJ/R5HuskZSTsJYRkTdOzsMan+RjE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MxHnnIoTjfSNp9EhXrOmqiq7i/MqIxc6ujubq/mFDecOpzB/H2pCahbEpmHsuw1tl
	 lJtlCdqnrjtIn1KDIWBOMKBNdRDmKfICkhDjvmyHRgEFC5xTHcyA9mRUJqNl8qOF8s
	 qzd1qCG0aev/EGWOJTB/MxxNBkP+SRwZI131s0Exi6HStMcikdytSn3aN6dqydcRSN
	 cgkhr9pyXBdXdnEtlvXjyBS6FsRdIrOtg/p4/yZjDm22dATJVvAW6XxLUE9Rybi6Z1
	 krUteUKaBGyg50GbivKQd8IM4oF85CkzQTl+T5N2t1M06zKk1xK731Qop6i3+6sqT4
	 545/5khmCCwFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E673DCD4F42;
	Fri, 15 May 2026 01:18:12 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Fri, 15 May 2026 09:18:01 +0800
Subject: [PATCH 5/9] riscv: dts: ultrarisc: Add initial device tree for
 UltraRISC DP1000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260515-ultrarisc-pinctrl-v1-5-bf559589ea8a@ultrarisc.com>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778807890; l=25874;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=TnWbocLflgDfzfKXlLjVQf0dGw+ONyA7AHpdfXbMXbA=;
 b=BV+r5LeBu3elFFVgigOhuIzUH6Z0zDigCfx9AqrWW3iCmwwEIqesxh1XadqxgaAT3HT2m74A2
 CqyXC9RA20dCHxhYtt8Lde7u+sGEqKdOxOTcArGUbJ/EsD4vQtJMROK
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
Reply-To: wangjia@ultrarisc.com
X-Rspamd-Queue-Id: AEAA454852D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36880-lists,linux-gpio=lfdr.de,wangjia.ultrarisc.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[wangjia@ultrarisc.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Jia Wang <wangjia@ultrarisc.com>

Add the base device tree for the UltraRISC DP1000 SoC. It describes the
8×CP100 CPU cores and essential SoC peripherals including the interrupt
controller, pinctrl, GPIO, UART, SPI, I2C, PCIe, GMAC and the DMA
controller.

Link: https://lore.kernel.org/lkml/20260427-ultrarisc-pcie-v4-2-98935f6cdfb5@ultrarisc.com/
Link: https://lore.kernel.org/lkml/20260429-ultrarisc-serial-v7-3-e475cce9e274@ultrarisc.com/

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 MAINTAINERS                               |   1 +
 arch/riscv/boot/dts/ultrarisc/dp1000.dtsi | 851 ++++++++++++++++++++++++++++++
 2 files changed, 852 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index baaaa46b1a56..832e01898ae5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23087,6 +23087,7 @@ M:	Jia Wang <wangjia@ultrarisc.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/riscv/ultrarisc.yaml
+F:	arch/riscv/boot/dts/ultrarisc/
 
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi b/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi
new file mode 100644
index 000000000000..1aae53fc1a2b
--- /dev/null
+++ b/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi
@@ -0,0 +1,851 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
+ */
+
+/dts-v1/;
+
+/ {
+	compatible = "ultrarisc,dp1000";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <10000000>;
+
+		cpu0: cpu@0 {
+			compatible = "ultrarisc,cp100", "riscv";
+			reg = <0x0>;
+			device_type = "cpu";
+			riscv,isa = "rv64imafdcbh";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "h",
+					       "zba", "zbb", "zbc", "zbs", "zicntr",
+					       "zicsr", "zifencei", "zihpm", "ziccif",
+					       "ziccrse", "ziccamoa", "za64rs", "zicbom",
+					       "zicbop", "zicboz", "zkt", "svade",
+					       "ssccptr", "sstvecd", "sscounterenw",
+					       "shcounterenw", "shtvala", "shvstvecd",
+					       "shvsatpa", "svvptc";
+			mmu-type = "riscv,sv48";
+			clock-frequency = <2000000000>;
+			/* L1 I-cache and D-cache:
+			 * block-size 64B
+			 * 4-way set associative, size 64KB
+			 * per-core.
+			 */
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <0x10000>;
+			next-level-cache = <&l2_cache0>;
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <0x01>;
+			};
+
+			l2_cache0: l2-cache {
+				/* L2 cache:
+				 * cache-unified, block-size 64B
+				 * 8-way set associative, size 512KB
+				 * per-core.
+				 */
+				compatible = "cache";
+				cache-block-size = <64>;
+				cache-level = <2>;
+				cache-size = <0x80000>;
+				cache-sets = <1024>;
+				cache-unified;
+				next-level-cache = <&cluster0_l3>;
+			};
+		};
+
+		cpu1: cpu@1 {
+			compatible = "ultrarisc,cp100", "riscv";
+			reg = <0x1>;
+			device_type = "cpu";
+			riscv,isa = "rv64imafdcbh";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "h",
+					       "zba", "zbb", "zbc", "zbs", "zicntr",
+					       "zicsr", "zifencei", "zihpm", "ziccif",
+					       "ziccrse", "ziccamoa", "za64rs", "zicbom",
+					       "zicbop", "zicboz", "zkt", "svade",
+					       "ssccptr", "sstvecd", "sscounterenw",
+					       "shcounterenw", "shtvala", "shvstvecd",
+					       "shvsatpa", "svvptc";
+			mmu-type = "riscv,sv48";
+			clock-frequency = <2000000000>;
+			/* L1 I-cache and D-cache:
+			 * block-size 64B
+			 * 4-way set associative, size 64KB
+			 * per-core.
+			 */
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <0x10000>;
+			next-level-cache = <&l2_cache1>;
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu1_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <0x01>;
+			};
+
+			l2_cache1: l2-cache {
+				/* L2 cache:
+				 * cache-unified, block-size 64B
+				 * 8-way set associative, size 512KB
+				 * per-core.
+				 */
+				compatible = "cache";
+				cache-block-size = <64>;
+				cache-level = <2>;
+				cache-size = <0x80000>;
+				cache-sets = <1024>;
+				cache-unified;
+				next-level-cache = <&cluster0_l3>;
+			};
+		};
+
+		cpu2: cpu@2 {
+			compatible = "ultrarisc,cp100", "riscv";
+			reg = <0x2>;
+			device_type = "cpu";
+			riscv,isa = "rv64imafdcbh";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "h",
+					       "zba", "zbb", "zbc", "zbs", "zicntr",
+					       "zicsr", "zifencei", "zihpm", "ziccif",
+					       "ziccrse", "ziccamoa", "za64rs", "zicbom",
+					       "zicbop", "zicboz", "zkt", "svade",
+					       "ssccptr", "sstvecd", "sscounterenw",
+					       "shcounterenw", "shtvala", "shvstvecd",
+					       "shvsatpa", "svvptc";
+			mmu-type = "riscv,sv48";
+			clock-frequency = <2000000000>;
+			/* L1 I-cache and D-cache:
+			 * block-size 64B
+			 * 4-way set associative, size 64KB
+			 * per-core.
+			 */
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <0x10000>;
+			next-level-cache = <&l2_cache2>;
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu2_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <0x01>;
+			};
+
+			l2_cache2: l2-cache {
+				/* L2 cache:
+				 * cache-unified, block-size 64B
+				 * 8-way set associative, size 512KB
+				 * per-core.
+				 */
+				compatible = "cache";
+				cache-block-size = <64>;
+				cache-level = <2>;
+				cache-size = <0x80000>;
+				cache-sets = <1024>;
+				cache-unified;
+				next-level-cache = <&cluster0_l3>;
+			};
+		};
+
+		cpu3: cpu@3 {
+			compatible = "ultrarisc,cp100", "riscv";
+			reg = <0x3>;
+			device_type = "cpu";
+			riscv,isa = "rv64imafdcbh";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "h",
+					       "zba", "zbb", "zbc", "zbs", "zicntr",
+					       "zicsr", "zifencei", "zihpm", "ziccif",
+					       "ziccrse", "ziccamoa", "za64rs", "zicbom",
+					       "zicbop", "zicboz", "zkt", "svade",
+					       "ssccptr", "sstvecd", "sscounterenw",
+					       "shcounterenw", "shtvala", "shvstvecd",
+					       "shvsatpa", "svvptc";
+			mmu-type = "riscv,sv48";
+			clock-frequency = <2000000000>;
+			/* L1 I-cache and D-cache:
+			 * block-size 64B
+			 * 4-way set associative, size 64KB
+			 * per-core.
+			 */
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <0x10000>;
+			next-level-cache = <&l2_cache3>;
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu3_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <0x01>;
+			};
+
+			l2_cache3: l2-cache {
+				/* L2 cache:
+				 * cache-unified, block-size 64B
+				 * 8-way set associative, size 512KB
+				 * per-core.
+				 */
+				compatible = "cache";
+				cache-block-size = <64>;
+				cache-level = <2>;
+				cache-size = <0x80000>;
+				cache-sets = <1024>;
+				cache-unified;
+				next-level-cache = <&cluster0_l3>;
+			};
+		};
+
+		cpu4: cpu@4 {
+			compatible = "ultrarisc,cp100", "riscv";
+			reg = <0x10>;
+			device_type = "cpu";
+			riscv,isa = "rv64imafdcbh";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "h",
+					       "zba", "zbb", "zbc", "zbs", "zicntr",
+					       "zicsr", "zifencei", "zihpm", "ziccif",
+					       "ziccrse", "ziccamoa", "za64rs", "zicbom",
+					       "zicbop", "zicboz", "zkt", "svade",
+					       "ssccptr", "sstvecd", "sscounterenw",
+					       "shcounterenw", "shtvala", "shvstvecd",
+					       "shvsatpa", "svvptc";
+			mmu-type = "riscv,sv48";
+			clock-frequency = <2000000000>;
+			/* L1 I-cache and D-cache:
+			 * block-size 64B
+			 * 4-way set associative, size 64KB
+			 * per-core.
+			 */
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <0x10000>;
+			next-level-cache = <&l2_cache4>;
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu4_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <0x01>;
+			};
+
+			l2_cache4: l2-cache {
+				/* L2 cache:
+				 * cache-unified, block-size 64B
+				 * 8-way set associative, size 512KB
+				 * per-core.
+				 */
+				compatible = "cache";
+				cache-block-size = <64>;
+				cache-level = <2>;
+				cache-size = <0x80000>;
+				cache-sets = <1024>;
+				cache-unified;
+				next-level-cache = <&cluster1_l3>;
+			};
+		};
+		cpu5: cpu@5 {
+			compatible = "ultrarisc,cp100", "riscv";
+			reg = <0x11>;
+			device_type = "cpu";
+			riscv,isa = "rv64imafdcbh";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "h",
+					       "zba", "zbb", "zbc", "zbs", "zicntr",
+					       "zicsr", "zifencei", "zihpm", "ziccif",
+					       "ziccrse", "ziccamoa", "za64rs", "zicbom",
+					       "zicbop", "zicboz", "zkt", "svade",
+					       "ssccptr", "sstvecd", "sscounterenw",
+					       "shcounterenw", "shtvala", "shvstvecd",
+					       "shvsatpa", "svvptc";
+			mmu-type = "riscv,sv48";
+			clock-frequency = <2000000000>;
+			/* L1 I-cache and D-cache:
+			 * block-size 64B
+			 * 4-way set associative, size 64KB
+			 * per-core.
+			 */
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <0x10000>;
+			next-level-cache = <&l2_cache5>;
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu5_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <0x01>;
+			};
+
+			l2_cache5: l2-cache {
+				/* L2 cache:
+				 * cache-unified, block-size 64B
+				 * 8-way set associative, size 512KB
+				 * per-core.
+				 */
+				compatible = "cache";
+				cache-block-size = <64>;
+				cache-level = <2>;
+				cache-size = <0x80000>;
+				cache-sets = <1024>;
+				cache-unified;
+				next-level-cache = <&cluster1_l3>;
+			};
+		};
+		cpu6: cpu@6 {
+			compatible = "ultrarisc,cp100", "riscv";
+			reg = <0x12>;
+			device_type = "cpu";
+			riscv,isa = "rv64imafdcbh";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "h",
+					       "zba", "zbb", "zbc", "zbs", "zicntr",
+					       "zicsr", "zifencei", "zihpm", "ziccif",
+					       "ziccrse", "ziccamoa", "za64rs", "zicbom",
+					       "zicbop", "zicboz", "zkt", "svade",
+					       "ssccptr", "sstvecd", "sscounterenw",
+					       "shcounterenw", "shtvala", "shvstvecd",
+					       "shvsatpa", "svvptc";
+			mmu-type = "riscv,sv48";
+			clock-frequency = <2000000000>;
+			/* L1 I-cache and D-cache:
+			 * block-size 64B
+			 * 4-way set associative, size 64KB
+			 * per-core.
+			 */
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <0x10000>;
+			next-level-cache = <&l2_cache6>;
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu6_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <0x01>;
+			};
+
+			l2_cache6: l2-cache {
+				/* L2 cache:
+				 * cache-unified, block-size 64B
+				 * 8-way set associative, size 512KB
+				 * per-core.
+				 */
+				compatible = "cache";
+				cache-block-size = <64>;
+				cache-level = <2>;
+				cache-size = <0x80000>;
+				cache-sets = <1024>;
+				cache-unified;
+				next-level-cache = <&cluster1_l3>;
+			};
+		};
+
+		cpu7: cpu@7 {
+			compatible = "ultrarisc,cp100", "riscv";
+			reg = <0x13>;
+			device_type = "cpu";
+			riscv,isa = "rv64imafdcbh";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "h",
+					       "zba", "zbb", "zbc", "zbs", "zicntr",
+					       "zicsr", "zifencei", "zihpm", "ziccif",
+					       "ziccrse", "ziccamoa", "za64rs", "zicbom",
+					       "zicbop", "zicboz", "zkt", "svade",
+					       "ssccptr", "sstvecd", "sscounterenw",
+					       "shcounterenw", "shtvala", "shvstvecd",
+					       "shvsatpa", "svvptc";
+			mmu-type = "riscv,sv48";
+			clock-frequency = <2000000000>;
+			/* L1 I-cache and D-cache:
+			 * block-size 64B
+			 * 4-way set associative, size 64KB
+			 * per-core.
+			 */
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <0x10000>;
+			next-level-cache = <&l2_cache7>;
+			riscv,cbom-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu7_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <0x01>;
+			};
+
+			l2_cache7: l2-cache {
+				/* L2 cache:
+				 * cache-unified, block-size 64B
+				 * 8-way set associative, size 512KB
+				 * per-core.
+				 */
+				compatible = "cache";
+				cache-block-size = <64>;
+				cache-level = <2>;
+				cache-size = <0x80000>;
+				cache-sets = <1024>;
+				cache-unified;
+				next-level-cache = <&cluster1_l3>;
+			};
+		};
+
+		cpu-map {
+			cluster0: cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+
+			cluster1: cluster1 {
+				core0 {
+					cpu = <&cpu4>;
+				};
+
+				core1 {
+					cpu = <&cpu5>;
+				};
+
+				core2 {
+					cpu = <&cpu6>;
+				};
+
+				core3 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		cluster0_l3: l3-cache0 {
+			/* L3 cache:
+			 * cache-unified, block-size 64B
+			 * 16-way set associative, size 4MB
+			 * per-cluster.
+			 */
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <3>;
+			cache-size = <0x400000>;
+			cache-sets = <0x1000>;
+			cache-unified;
+			next-level-cache = <&l4_cache>;
+		};
+
+		cluster1_l3: l3-cache1 {
+			/* L3 cache:
+			 * cache-unified, block-size 64B
+			 * 16-way set associative, size 4MB
+			 * per-cluster.
+			 */
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <3>;
+			cache-size = <0x400000>;
+			cache-sets = <0x1000>;
+			cache-unified;
+			next-level-cache = <&l4_cache>;
+		};
+	};
+
+	clocks {
+		device_clk: device_clk {
+			compatible = "fixed-clock";
+			clock-frequency = <62500000>;
+			#clock-cells = <0>;
+		};
+
+		timer_clk: timer_clk {
+			compatible = "fixed-clock";
+			clock-frequency = <50000000>;
+			#clock-cells = <0>;
+		};
+
+		csr_clk: csr_clk {
+			compatible = "fixed-clock";
+			clock-frequency = <250000000>;
+			#clock-cells = <0>;
+		};
+	};
+
+	l4_cache: l4-cache {
+		/* L4 cache:
+		 * cache-unified, block-size 64B
+		 * 16-way set associative, size 16MB
+		 * shared by the SoC.
+		 */
+		compatible = "cache";
+		cache-block-size = <64>;
+		cache-level = <4>;
+		cache-size = <0x1000000>;
+		cache-sets = <0x4000>;
+		cache-unified;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x00 0x80000000 0x4 0x00000000>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <0x02>;
+		#size-cells = <0x02>;
+
+		clint: clint@8000000 {
+			compatible = "sifive,clint0", "riscv,clint0";
+			reg = <0x00 0x8000000 0x00 0x100000>;
+			interrupts-extended = <&cpu0_intc 0x03>, <&cpu0_intc 0x07>,
+					      <&cpu1_intc 0x03>, <&cpu1_intc 0x07>,
+					      <&cpu2_intc 0x03>, <&cpu2_intc 0x07>,
+					      <&cpu3_intc 0x03>, <&cpu3_intc 0x07>,
+					      <&cpu4_intc 0x03>, <&cpu4_intc 0x07>,
+					      <&cpu5_intc 0x03>, <&cpu5_intc 0x07>,
+					      <&cpu6_intc 0x03>, <&cpu6_intc 0x07>,
+					      <&cpu7_intc 0x03>, <&cpu7_intc 0x07>;
+		};
+
+		plic: plic@9000000 {
+			compatible = "ultrarisc,dp1000-plic", "ultrarisc,cp100-plic";
+			reg = <0x00 0x9000000 0x00 0x4000000>;
+			#interrupt-cells = <1>;
+			#address-cells = <0>;
+			interrupt-controller;
+			interrupts-extended = <&cpu0_intc 0xb>, <&cpu0_intc 0x9>, <&cpu0_intc 0xa>,
+					      <&cpu1_intc 0xb>, <&cpu1_intc 0x9>, <&cpu1_intc 0xa>,
+					      <&cpu2_intc 0xb>, <&cpu2_intc 0x9>, <&cpu2_intc 0xa>,
+					      <&cpu3_intc 0xb>, <&cpu3_intc 0x9>, <&cpu3_intc 0xa>,
+					      <&cpu4_intc 0xb>, <&cpu4_intc 0x9>, <&cpu4_intc 0xa>,
+					      <&cpu5_intc 0xb>, <&cpu5_intc 0x9>, <&cpu5_intc 0xa>,
+					      <&cpu6_intc 0xb>, <&cpu6_intc 0x9>, <&cpu6_intc 0xa>,
+					      <&cpu7_intc 0xb>, <&cpu7_intc 0x9>, <&cpu7_intc 0xa>;
+			riscv,ndev = <160>;
+		};
+
+		pmx0: pinmux@11081000 {
+			compatible = "ultrarisc,dp1000-pinctrl";
+			reg = <0x0 0x11081000  0x0 0x1000>;
+			#pinctrl-cells = <2>;
+		};
+
+		gpio: gpio@20200000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x0 0x20200000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-names = "bus", "db";
+			clocks = <&csr_clk>, <&device_clk>;
+
+			gpio_a: gpio-port@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <0>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <16>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupt-parent = <&plic>;
+				interrupts = <34>;
+				gpio-ranges = <&pmx0 0 0 16>;
+			};
+
+			gpio_b: gpio-port@1 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <1>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <8>;
+				gpio-ranges = <&pmx0 16 0 8>;
+			};
+
+			gpio_c: gpio-port@2 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <2>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <8>;
+				gpio-ranges = <&pmx0 24 0 8>;
+			};
+
+			gpio_d: gpio-port@3 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <3>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <8>;
+				gpio-ranges = <&pmx0 32 0 8>;
+			};
+		};
+
+		uart0: serial@20300000 {
+			compatible = "ultrarisc,dp1000-uart", "snps,dw-apb-uart";
+			reg = <0x00 0x20300000 0x00 0x10000>;
+			interrupt-parent = <&plic>;
+			interrupts = <17>;
+			clock-frequency = <62500000>;
+			reg-io-width = <0x04>;
+			reg-shift = <0x02>;
+		};
+
+		uart1: serial@20310000 {
+			compatible = "ultrarisc,dp1000-uart", "snps,dw-apb-uart";
+			reg = <0x00 0x20310000 0x00 0x10000>;
+			interrupt-parent = <&plic>;
+			interrupts = <18>;
+			clock-frequency = <62500000>;
+			reg-io-width = <0x04>;
+			reg-shift = <0x02>;
+		};
+
+		uart2: serial@20400000 {
+			compatible = "ultrarisc,dp1000-uart", "snps,dw-apb-uart";
+			reg = <0x00 0x20400000 0x00 0x10000>;
+			interrupt-parent = <&plic>;
+			interrupts = <25>;
+			clock-frequency = <62500000>;
+			reg-io-width = <0x04>;
+			reg-shift = <0x02>;
+		};
+
+		uart3: serial@20410000 {
+			compatible = "ultrarisc,dp1000-uart", "snps,dw-apb-uart";
+			reg = <0x00 0x20410000 0x00 0x10000>;
+			interrupt-parent = <&plic>;
+			interrupts = <26>;
+			clock-frequency = <62500000>;
+			reg-io-width = <0x04>;
+			reg-shift = <0x02>;
+		};
+
+		spi0: spi@20320000 {
+			compatible = "snps,dw-apb-ssi";
+			reg = <0x0 0x20320000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&device_clk>;
+			interrupt-parent = <&plic>;
+			interrupts = <19>;
+			num-cs = <3>;
+		};
+
+		spi1: spi@20420000 {
+			compatible = "snps,dw-apb-ssi";
+			reg = <0x0 0x20420000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&device_clk>;
+			interrupt-parent = <&plic>;
+			interrupts = <27>;
+			num-cs = <3>;
+		};
+
+		i2c0: i2c@20330000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x0 0x20330000 0x0 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <400000>;
+			clocks = <&device_clk>;
+			interrupt-parent = <&plic>;
+			interrupts = <20>;
+		};
+
+		i2c1: i2c@20340000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x0 0x20340000 0x0 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <400000>;
+			clocks = <&device_clk>;
+			interrupt-parent = <&plic>;
+			interrupts = <21>;
+		};
+
+		i2c2: i2c@20430000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x0 0x20430000 0x0 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <400000>;
+			clocks = <&device_clk>;
+			interrupt-parent = <&plic>;
+			interrupts = <28>;
+		};
+
+		i2c3: i2c@20440000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x0 0x20440000 0x0 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <400000>;
+			clocks = <&device_clk>;
+			interrupt-parent = <&plic>;
+			interrupts = <29>;
+		};
+
+		pcie_x16: pcie@21000000 {
+			compatible = "ultrarisc,dp1000-pcie";
+			reg = <0x0 0x21000000 0x0 0x01000000>,
+			      <0x0 0x4fff0000 0x0 0x00010000>;
+			reg-names = "dbi", "config";
+			ranges = <0x81000000  0x0 0x4fbf0000  0x0 0x4fbf0000  0x0 0x00400000>,
+				 <0x82000000  0x0 0x40000000  0x0 0x40000000  0x0 0x0fbf0000>,
+				 <0xc3000000 0x40 0x00000000 0x40 0x00000000  0xd 0x00000000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			device_type = "pci";
+			dma-coherent;
+			bus-range = <0x0 0xff>;
+			num-lanes = <16>;
+			interrupt-parent = <&plic>;
+			interrupts = <43>, <44>, <45>, <46>, <47>;
+			interrupt-names = "msi", "inta", "intb", "intc", "intd";
+			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map = <0x0 0x0 0x0 0x1 &plic 44>,
+					<0x0 0x0 0x0 0x2 &plic 45>,
+					<0x0 0x0 0x0 0x3 &plic 46>,
+					<0x0 0x0 0x0 0x4 &plic 47>;
+		};
+
+		pcie_x4a: pcie@23000000 {
+			compatible = "ultrarisc,dp1000-pcie";
+			reg = <0x0 0x23000000 0x0 0x01000000>,
+			      <0x0 0x6fff0000 0x0 0x00010000>;
+			reg-names = "dbi", "config";
+			ranges = <0x81000000  0x0 0x6fbf0000  0x0 0x6fbf0000  0x0 0x00400000>,
+				 <0x82000000  0x0 0x60000000  0x0 0x60000000  0x0 0x0fbf0000>,
+				 <0xc3000000 0x80 0x00000000 0x80 0x00000000  0xd 0x00000000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			device_type = "pci";
+			dma-coherent;
+			bus-range = <0x0 0xff>;
+			num-lanes = <4>;
+			interrupt-parent = <&plic>;
+			interrupts = <63>, <64>, <65>, <66>, <67>;
+			interrupt-names = "msi", "inta", "intb", "intc", "intd";
+			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map = <0x0 0x0 0x0 0x1 &plic 64>,
+					<0x0 0x0 0x0 0x2 &plic 65>,
+					<0x0 0x0 0x0 0x3 &plic 66>,
+					<0x0 0x0 0x0 0x4 &plic 67>;
+		};
+
+		pcie_x4b: pcie@24000000 {
+			compatible = "ultrarisc,dp1000-pcie";
+			reg = <0x0 0x24000000 0x0 0x01000000>,
+			      <0x0 0x7fff0000 0x0 0x00010000>;
+			reg-names = "dbi", "config";
+			ranges = <0x81000000  0x0 0x7fbf0000  0x0 0x7fbf0000 0x0 0x00400000>,
+				 <0x82000000  0x0 0x70000000  0x0 0x70000000 0x0 0x0fbf0000>,
+				 <0xc3000000 0xc0 0x00000000 0xc0 0x00000000 0xd 0x00000000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			device_type = "pci";
+			dma-coherent;
+			bus-range = <0x0 0xff>;
+			num-lanes = <4>;
+			interrupt-parent = <&plic>;
+			interrupts = <73>, <74>, <75>, <76>, <77>;
+			interrupt-names = "msi", "inta", "intb", "intc", "intd";
+			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map = <0x0 0x0 0x0 0x1 &plic 74>,
+					<0x0 0x0 0x0 0x2 &plic 75>,
+					<0x0 0x0 0x0 0x3 &plic 76>,
+					<0x0 0x0 0x0 0x4 &plic 77>;
+		};
+
+		ethernet: ethernet@38000000 {
+			compatible = "snps,dwmac", "snps,dwmac-5.10a";
+			reg = <0x00 0x38000000 0x00 0x1000000>;
+			clocks = <&csr_clk>;
+			clock-names = "stmmaceth";
+			interrupt-parent = <&plic>;
+			interrupts = <84>;
+			interrupt-names = "macirq";
+			local-mac-address = [ff ff ff ff ff ff];
+			max-speed = <1000>;
+			phy-mode = "rgmii-id";
+			snps,txpbl = <8>;
+			snps,rxpbl = <8>;
+		};
+
+		dmac: dma-controller@39000000 {
+			compatible = "snps,axi-dma-1.01a";
+			reg = <0x0 0x39000000 0x0 0x400>;
+			clocks = <&device_clk>, <&device_clk>;
+			clock-names = "core-clk", "cfgr-clk";
+			#dma-cells = <1>;
+			dma-channels = <8>;
+			interrupt-parent = <&plic>;
+			interrupts = <152>;
+			snps,dma-masters = <1>;
+			snps,data-width = <4>;
+			snps,block-size = <512 512 512 512 512 512 512 512>;
+			snps,priority = <0 1 2 3 4 5 6 7>;
+			snps,axi-max-burst-len = <256>;
+		};
+	};
+};

-- 
2.34.1



