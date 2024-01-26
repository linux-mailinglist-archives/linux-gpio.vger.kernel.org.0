Return-Path: <linux-gpio+bounces-2586-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E883A83D88D
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 11:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 278881C24EF7
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 10:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2F514281;
	Fri, 26 Jan 2024 10:56:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F9312E7D
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jan 2024 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706266611; cv=none; b=BwPosxw4aWH10ceR8GiXSrrUL6UVudbKVWuY+F/i73w1OSOgO0BMLs6G5aFNfAmpx38lF7ipQp0WjNtJQWT3E81LGh+G1OtNNbWj4m1ldE66qhwBwD5Fq0IMhN9llk0++gt/nsVchXvQj22uwU2xS2un4E95AcvK0lk3PUIUJWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706266611; c=relaxed/simple;
	bh=NNnm7gwM05r55sMIKuZN/1R3wYKohsfVsNI7Azt5PzQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TczZ7gyBt9JP6oyO3Ocdh4fPpx/OpBrNdvhnH+a8ZseuLTysgQv2FMgdGH5fY4buy+ciKUrav7tP0M2c6tA0RecELqGn9HT5g+4kb/NXmMY/sBKH7Rh38T+PIlBJkQEZYywAHRcy5oyArII7LqNZZzpoR5ETa5Jgpq7i6zjBsfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:8d64:ae04:ce87:de06])
	by xavier.telenet-ops.be with bizsmtp
	id fNwm2B00T1AdMdB01NwmSh; Fri, 26 Jan 2024 11:56:47 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJsK-00GWgW-EA;
	Fri, 26 Jan 2024 11:56:46 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJh0-00G5Tl-CG;
	Fri, 26 Jan 2024 11:44:14 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Cong Dang <cong.dang.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 13/14] pinctrl: renesas: r8a779h0: Add PCIe pins, groups, functions
Date: Fri, 26 Jan 2024 11:44:11 +0100
Message-Id: <d32909f5197fa2df0ca6bd6e5fda7cae8863101e.1706264667.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706264667.git.geert+renesas@glider.be>
References: <cover.1706264667.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Dang <cong.dang.xn@renesas.com>

Add pins, groups and functions for the PCIe Controller on the Renesas
R-Car V4M (R8A779H0) SoC.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779h0.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779h0.c b/drivers/pinctrl/renesas/pfc-r8a779h0.c
index 135628771807d459..715fb81a798d4b9b 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779h0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779h0.c
@@ -1951,6 +1951,16 @@ static const unsigned int msiof5_rxd_mux[] = {
 	MSIOF5_RXD_MARK,
 };
 
+/* - PCIE ------------------------------------------------------------------- */
+static const unsigned int pcie0_clkreq_n_pins[] = {
+	/* PCIE0_CLKREQ_N */
+	RCAR_GP_PIN(4, 21),
+};
+
+static const unsigned int pcie0_clkreq_n_mux[] = {
+	PCIE0_CLKREQ_N_MARK,
+};
+
 /* - PWM0_A ------------------------------------------------------------------- */
 static const unsigned int pwm0_a_pins[] = {
 	/* PWM0_A */
@@ -2421,6 +2431,8 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(msiof5_txd),
 	SH_PFC_PIN_GROUP(msiof5_rxd),
 
+	SH_PFC_PIN_GROUP(pcie0_clkreq_n),
+
 	SH_PFC_PIN_GROUP(pwm0_a),
 	SH_PFC_PIN_GROUP(pwm0_b),
 	SH_PFC_PIN_GROUP(pwm1_a),
@@ -2638,6 +2650,10 @@ static const char * const msiof5_groups[] = {
 	"msiof5_rxd",
 };
 
+static const char * const pcie_groups[] = {
+	"pcie0_clkreq_n",
+};
+
 static const char * const pwm0_groups[] = {
 	"pwm0_a",
 	"pwm0_b",
@@ -2756,6 +2772,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(msiof4),
 	SH_PFC_FUNCTION(msiof5),
 
+	SH_PFC_FUNCTION(pcie),
+
 	SH_PFC_FUNCTION(pwm0),
 	SH_PFC_FUNCTION(pwm1),
 	SH_PFC_FUNCTION(pwm2),
-- 
2.34.1


