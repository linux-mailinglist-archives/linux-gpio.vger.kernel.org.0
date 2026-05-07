Return-Path: <linux-gpio+bounces-36343-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AB52KlRL/Gm2NwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36343-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 10:20:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E524E4AB1
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 10:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCB0C306FFC1
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 08:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F073437F74A;
	Thu,  7 May 2026 08:18:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547BF31F98C;
	Thu,  7 May 2026 08:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141895; cv=none; b=jWZ9a1P3yEcjmwTWBGF25osM71VqbStT6kiLRTr5JYVr1VGDEGxoi66DiAdnPfE3UXh98mWsfkoPiclsqgpwRtdBNm6JKI9nx72mV2+dxfQnVcL42EIx1jpRnD2QY1dhEX9vaehjt3zy4XWOL8elox6u0ifA5DRoEzzqOnQElFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141895; c=relaxed/simple;
	bh=OAfobsCoi/ZUK5Ppe1EQhmw0Gu6Uy0vOtLkIZ6UcaCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BbO7hy/Xas2fBG+Bzw6zGxEjqas/Qk44C81Rc8XrIh7lloUhIuY/TBKPnmjNYfYkOQnyyVEHXrlzWKVd5ZFwhfu7WHLcQ75BSMyMdjQs94lA06bYJKPH+BfEiogbcElJMpQ9ta9uGAF3pNKueiJA4uNCy5OFUQoLpNtEwLNBj74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.82])
	by APP-03 (Coremail) with SMTP id rQCowAC3m+KLSvxpI_pNEA--.42168S5;
	Thu, 07 May 2026 16:17:23 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH 03/12] riscv: dts: thead: add device tree node for MISC clock controller
Date: Thu,  7 May 2026 16:17:01 +0800
Message-ID: <20260507081710.4090814-4-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAC3m+KLSvxpI_pNEA--.42168S5
X-Coremail-Antispam: 1UD129KBjvJXoW7KFW7Zr45tFyDGr1fXF4ruFg_yoW8uF4xp3
	9xCrZ3AFs2qF4S93Waq3y0gr1xuas5CFWvqrnxCa48ArWagrWUXFW8GF93uFW8trW0vwsr
	ZFnYyr18ArnIy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVF
	xhVjvjDU0xZFpf9x0pRl_MsUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Rspamd-Queue-Id: 27E524E4AB1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36343-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[pengutronix.de,lists.infradead.org,vger.kernel.org,icenowy.me,gmail.com,disroot.org,iscas.ac.cn];
	NEURAL_HAM(-0.00)[-0.962];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

The MISC_SUBSYS clock controller on TH1520 SoC is a clock controller
mainly controlling USB-related clocks (which isn't utilized yet) and
MMC/SD controllers' AHB bus clocks.

Add the device tree node for it along with the missing bus clock
references for MMC/SD controllers.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 5e91dc1d2b9b7..c9930e63bbe93 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -366,8 +366,8 @@ emmc: mmc@ffe7080000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe7080000 0x0 0x10000>;
 			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk CLK_EMMC_SDIO>;
-			clock-names = "core";
+			clocks = <&clk CLK_EMMC_SDIO>, <&clk_misc CLK_EMMC>;
+			clock-names = "core", "bus";
 			status = "disabled";
 		};
 
@@ -375,8 +375,8 @@ sdio0: mmc@ffe7090000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe7090000 0x0 0x10000>;
 			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk CLK_EMMC_SDIO>;
-			clock-names = "core";
+			clocks = <&clk CLK_EMMC_SDIO>, <&clk_misc CLK_SDIO0>;
+			clock-names = "core", "bus";
 			status = "disabled";
 		};
 
@@ -384,8 +384,8 @@ sdio1: mmc@ffe70a0000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe70a0000 0x0 0x10000>;
 			interrupts = <71 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk CLK_EMMC_SDIO>;
-			clock-names = "core";
+			clocks = <&clk CLK_EMMC_SDIO>, <&clk_misc CLK_SDIO1>;
+			clock-names = "core", "bus";
 			status = "disabled";
 		};
 
@@ -533,6 +533,13 @@ rst_misc: reset-controller@ffec02c000 {
 			#reset-cells = <1>;
 		};
 
+		clk_misc: clock-controller@ffec02c100 {
+			compatible = "thead,th1520-clk-misc";
+			reg = <0xff 0xec02c100 0x0 0x100>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+
 		rst_vp: reset-controller@ffecc30000 {
 			compatible = "thead,th1520-reset-vp";
 			reg = <0xff 0xecc30000 0x0 0x14>;
-- 
2.52.0


