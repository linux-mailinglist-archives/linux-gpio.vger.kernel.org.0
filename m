Return-Path: <linux-gpio+bounces-31349-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJ3hOBO+gGl3AgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31349-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Feb 2026 16:09:07 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CEFCDEC7
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Feb 2026 16:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9D9D313D772
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Feb 2026 14:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B03BA37B3ED;
	Mon,  2 Feb 2026 14:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SHzk4wbs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A868378803;
	Mon,  2 Feb 2026 14:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770044300; cv=none; b=BCwiaxvU+hLlcnoPTAhCsINxg5Om1udsXp9Nz441YCIuKYihthH/KQvfTd+IaX/JbelAd0oG67N0AiiG5TFpEiytLNeRpZK1tGOQsj9QbdyA9Xa5+EOdOXEsRpdjrplGGcJASkvFQOwb0gaqV6nUBtSiNgjTjjttmE+NTffNRRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770044300; c=relaxed/simple;
	bh=w8CT5nF4xuNQYgtEB/14jQDFCsAZe2Yvi9iEBlAn/4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rTCrSuQnEE8aehwMQRFh047JDT8DQ7YD0aMtqBjsRU0gBV8BsghpmYWm5hZmXQ2tjaul0Rsstx5UptU0WgSSqTt+WDoy2Hb5xKsmK7tCdLqsd2bkXSRYnp2va+n4MfrUF2HD8q4+8hrbchowZCq7GTpAAPYNsK/tDFkJCu7BV2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SHzk4wbs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C637C116C6;
	Mon,  2 Feb 2026 14:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770044300;
	bh=w8CT5nF4xuNQYgtEB/14jQDFCsAZe2Yvi9iEBlAn/4o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SHzk4wbscWkXQoaAwuSpZM6lT4H+y1BpHYlL8H2srXYCqJk05iz3knoiTqOYuPv7V
	 7edbIBPdPQrJgU9YTmSVQVjaBZ/CbSA76QXDq0zmetLaFDxa4urwRHNWnxNaod61+Z
	 jDiAtMUA5rwAOY6dLIuuj82EjNZgLVE/GwzTWVD0ljKXgAoV/WrMJZ3PZMOAkI3RUs
	 PN7XQ4Ew7bicr266l8bevB3vAlEadzou1A3SP4aOSbGfo0yjpvKqUuRtTNDrJrM+1H
	 TsJ9uBJhKlcLKK4UvfTmj0XoCd1fKJF+DN9gq+RNNye3Z67xgUFZw/uAJ9SL6+vqBm
	 Fy07BOHpqxR5g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 02 Feb 2026 15:57:37 +0100
Subject: [PATCH RFC 5/8] arm64: dts: qcom: Remove inexistent TCSR_CC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-topic-8750_tcsr-v1-5-cd7e6648c64f@oss.qualcomm.com>
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
In-Reply-To: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
 Melody Olvera <quic_molvera@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>, 
 Jishnu Prakash <quic_jprakash@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable+noautosel@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770044267; l=3098;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=wqBz3XZ7otCfDneRsMc+hVuBgRcuU5xR3d2hpgBDzfo=;
 b=+Goy1gGvRaC61VyZMpeKlsXAhXDhatyIKZtR1iz6TzVnSlKIRQlp7mE581WHyIBUgOE40REbo
 LUPXCL9gGbrAAvb1CoJAWV3R7JG1pEUASFwkc7tmIjU0UgEqBSwDumH
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31349-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,noautosel];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.152.158.80:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,f204008:email,f100000:email,88e3000:email,1d80000:email,1c06000:email,oss.qualcomm.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 65CEFCDEC7
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

On SM8750 specifically, the block which provides various reference
clocks does *NOT* live inside TCSR, but rather TLMM.

With the former now being able to properly expose them, switch over to
the proper source.

Now, the TCSR still exists as a block for various tunables and
switches, however the prior misuse resulted in its 8750-specifc
compatible being already in use. With it freed up, it is now free again
to be described properly.

Fixes: 068c3d3c83be ("arm64: dts: qcom: Add base SM8750 dtsi")
Cc: <stable+noautosel@kernel.org> # complex dependencies, no immediate gain
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index f56b1f889b85..0c034ba0517f 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2727,7 +2727,7 @@ usb_hsphy: phy@88e3000 {
 			compatible = "qcom,sm8750-m31-eusb2-phy";
 			reg = <0x0 0x88e3000 0x0 0x29c>;
 
-			clocks = <&tcsrcc TCSR_USB2_CLKREF_EN>;
+			clocks = <&tlmm TCSR_USB2_CLKREF_EN>;
 			clock-names = "ref";
 
 			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
@@ -2742,7 +2742,7 @@ usb_dp_qmpphy: phy@88e8000 {
 			reg = <0x0 0x088e8000 0x0 0x4000>;
 
 			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
-				 <&tcsrcc TCSR_USB3_CLKREF_EN>,
+				 <&tlmm TCSR_USB3_CLKREF_EN>,
 				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
 				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
 			clock-names = "aux",
@@ -3063,6 +3063,8 @@ tlmm: pinctrl@f100000 {
 			compatible = "qcom,sm8750-tlmm";
 			reg = <0x0 0x0f100000 0x0 0x102000>;
 
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 
 			gpio-controller;
@@ -3074,6 +3076,8 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 216>;
 			wakeup-parent = <&pdc>;
 
+			#clock-cells = <1>;
+
 			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio64", "gpio65";
@@ -3564,16 +3568,6 @@ data-pins {
 			};
 		};
 
-		tcsrcc: clock-controller@f204008 {
-			compatible = "qcom,sm8750-tcsr", "syscon";
-			reg = <0x0 0x0f204008 0x0 0x3004>;
-
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-		};
-
 		stm@10002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x10002000 0x0 0x1000>,
@@ -4818,7 +4812,7 @@ pcie0_phy: phy@1c06000 {
 
 			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
 				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
-				 <&tcsrcc TCSR_PCIE_0_CLKREF_EN>,
+				 <&tlmm TCSR_PCIE_0_CLKREF_EN>,
 				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
 				 <&gcc GCC_PCIE_0_PIPE_CLK>;
 			clock-names = "aux",
@@ -4849,7 +4843,7 @@ ufs_mem_phy: phy@1d80000 {
 
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
-				 <&tcsrcc TCSR_UFS_CLKREF_EN>;
+				 <&tlmm TCSR_UFS_CLKREF_EN>;
 
 			clock-names = "ref",
 				      "ref_aux",

-- 
2.52.0


