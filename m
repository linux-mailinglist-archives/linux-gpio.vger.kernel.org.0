Return-Path: <linux-gpio+bounces-10502-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D1A98839C
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 13:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AB811F243E3
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 11:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E6D18A949;
	Fri, 27 Sep 2024 11:58:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC93D18A928
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 11:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727438333; cv=none; b=YZPgYueJ+3uwmSlE+eTfu9vj8LO7pl/4bT5zikjrONljE0wapvUO4AiZLyman0X42PGZjghOV1EotqGVOB2wwQvnPAV6iA/Vkry+tzJErLUOdBRolSZHwCVXoAER8qWTl44hASFyJfW7izGnA4F9J9/W+siOKaQEQ7OrTtF30pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727438333; c=relaxed/simple;
	bh=jGfrihTMjOjtDU0xAXTW+0hESJNZ1uSL6quBcZx9ieQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gnDfjkeQ2nRNUX8yF/6FQqaBW74AAOnAR8yPG/hpMBEZFV+b+q1kJZqjy/KFNVSiefHQi9JajlDA2Rvexr841QopCXhg0I2f8tB4+sT9UGqgnu/TUyiQA1QuJcqJwwSmgUmPdwylxpHx0Z/Odw0OyLdlhDpwVDOtc7UQl8S1ggM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b47d:fd74:3975:15b7])
	by andre.telenet-ops.be with cmsmtp
	id HPyh2D00N3BfLyr01PyhEX; Fri, 27 Sep 2024 13:58:42 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1su9cJ-000fNw-Q0;
	Fri, 27 Sep 2024 13:58:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1su9cP-0089tB-A1;
	Fri, 27 Sep 2024 13:58:41 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: rcar-gen4: Switch PCIe to reset-gpios
Date: Fri, 27 Sep 2024 13:58:38 +0200
Message-Id: <853019acdfcdf05fcb46d8124157ef298da55188.1727438172.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 42694f9f6407a933 ("dt-bindings: PCI: add snps,dw-pcie.yaml")
deprecated the "reset-gpio" property in favor of "reset-gpios".
Hence replace the "reset-gpio" property by "reset-gpios" in PCIe device
nodes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.13.

 arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi   | 2 +-
 arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
index 4ed8d4c379066342..e03baefb6a98b070 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
@@ -171,7 +171,7 @@ &pcie0_clkref {
 };
 
 &pciec0 {
-	reset-gpio = <&gpio_exp_20 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio_exp_20 0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
index 3845b413bd24cd72..6dc968352c046129 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
@@ -302,7 +302,7 @@ &pcie0_clkref {
 };
 
 &pciec0 {
-	reset-gpio = <&io_expander_a 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&io_expander_a 0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
-- 
2.34.1


