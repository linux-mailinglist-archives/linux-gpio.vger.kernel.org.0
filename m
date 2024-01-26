Return-Path: <linux-gpio+bounces-2592-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AB883D8A3
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 11:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30B4A28940F
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 10:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78BB5175BE;
	Fri, 26 Jan 2024 10:56:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E4913FEB
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jan 2024 10:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706266615; cv=none; b=SNrKUHqvzxkueP8efxpaujiYAPIyzfYg1ORxOhFI1kmTV81PSXNDlioZiB4M9JYegdmKJ1JixE9GrFJQmyrEI/bnGe7BYWrJdDt8nB5iqQSM4RTQ7VxbzXniXyhOjGK9GpzNsK0EBaY+wB6OV9QSjVmnnbLNlsldYfgKZ0gJbb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706266615; c=relaxed/simple;
	bh=51OReaq1oqkabAvd2XhcsbvEPbfoR5EQI8ADG5rYZeQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LlKFBcrWXjzELrUnAyQMacwXbW8aTkSwvuh6OIAWGve5LQ2gDcrSjqgtynVpy7sk0EgGTMx2o3FiQN86V079DmNsBOxLktUcjtS3Q0VTTLXDPdXYiy9NLOFm1yC/4ThaX9aKRqLO4UEDBXWltGrFVJbaR9vdGtu4aoNm2gpjbJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:8d64:ae04:ce87:de06])
	by baptiste.telenet-ops.be with bizsmtp
	id fNwn2B00g1AdMdB01Nwnka; Fri, 26 Jan 2024 11:56:48 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJsL-00GWhD-Gw;
	Fri, 26 Jan 2024 11:56:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJh0-00G5TC-5E;
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
Subject: [PATCH 06/14] pinctrl: renesas: r8a779h0: Add SCIF pins, groups, functions
Date: Fri, 26 Jan 2024 11:44:04 +0100
Message-Id: <4ad8127a54fb36044ae85db07ff30be05fa5d0f0.1706264667.git.geert+renesas@glider.be>
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

Add pins, groups and functions for the Serial Communication Interfaces
with FIFO (SCIF) on the Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779h0.c | 192 +++++++++++++++++++++++++
 1 file changed, 192 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779h0.c b/drivers/pinctrl/renesas/pfc-r8a779h0.c
index 323d4f60ddf72254..543beff4effe9f82 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779h0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779h0.c
@@ -1504,6 +1504,144 @@ static const unsigned int qspi1_data_mux[] = {
 	QSPI1_IO2_MARK, QSPI1_IO3_MARK
 };
 
+/* - SCIF0 ------------------------------------------------------------------ */
+static const unsigned int scif0_data_pins[] = {
+	/* RX0, TX0 */
+	RCAR_GP_PIN(1, 16), RCAR_GP_PIN(1, 12),
+};
+static const unsigned int scif0_data_mux[] = {
+	RX0_MARK, TX0_MARK,
+};
+static const unsigned int scif0_clk_pins[] = {
+	/* SCK0 */
+	RCAR_GP_PIN(1, 15),
+};
+static const unsigned int scif0_clk_mux[] = {
+	SCK0_MARK,
+};
+static const unsigned int scif0_ctrl_pins[] = {
+	/* RTS0_N, CTS0_N */
+	RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 13),
+};
+static const unsigned int scif0_ctrl_mux[] = {
+	RTS0_N_MARK, CTS0_N_MARK,
+};
+
+/* - SCIF1_A ------------------------------------------------------------------ */
+static const unsigned int scif1_data_a_pins[] = {
+	/* RX1_A, TX1_A */
+	RCAR_GP_PIN(0, 15), RCAR_GP_PIN(0, 14),
+};
+static const unsigned int scif1_data_a_mux[] = {
+	RX1_A_MARK, TX1_A_MARK,
+};
+static const unsigned int scif1_clk_a_pins[] = {
+	/* SCK1_A */
+	RCAR_GP_PIN(0, 18),
+};
+static const unsigned int scif1_clk_a_mux[] = {
+	SCK1_A_MARK,
+};
+static const unsigned int scif1_ctrl_a_pins[] = {
+	/* RTS1_N_A, CTS1_N_A */
+	RCAR_GP_PIN(0, 17), RCAR_GP_PIN(0, 16),
+};
+static const unsigned int scif1_ctrl_a_mux[] = {
+	RTS1_N_A_MARK, CTS1_N_A_MARK,
+};
+
+/* - SCIF1_B ------------------------------------------------------------------ */
+static const unsigned int scif1_data_b_pins[] = {
+	/* RX1_B, TX1_B */
+	RCAR_GP_PIN(1, 7), RCAR_GP_PIN(1, 6),
+};
+static const unsigned int scif1_data_b_mux[] = {
+	RX1_B_MARK, TX1_B_MARK,
+};
+static const unsigned int scif1_clk_b_pins[] = {
+	/* SCK1_B */
+	RCAR_GP_PIN(1, 10),
+};
+static const unsigned int scif1_clk_b_mux[] = {
+	SCK1_B_MARK,
+};
+static const unsigned int scif1_ctrl_b_pins[] = {
+	/* RTS1_N_B, CTS1_N_B */
+	RCAR_GP_PIN(1, 9), RCAR_GP_PIN(1, 8),
+};
+static const unsigned int scif1_ctrl_b_mux[] = {
+	RTS1_N_B_MARK, CTS1_N_B_MARK,
+};
+
+/* - SCIF3_A ------------------------------------------------------------------ */
+static const unsigned int scif3_data_a_pins[] = {
+	/* RX3_A, TX3_A */
+	RCAR_GP_PIN(1, 27), RCAR_GP_PIN(1, 28),
+};
+static const unsigned int scif3_data_a_mux[] = {
+	RX3_A_MARK, TX3_A_MARK,
+};
+static const unsigned int scif3_clk_a_pins[] = {
+	/* SCK3_A */
+	RCAR_GP_PIN(1, 24),
+};
+static const unsigned int scif3_clk_a_mux[] = {
+	SCK3_A_MARK,
+};
+static const unsigned int scif3_ctrl_a_pins[] = {
+	/* RTS3_N_A, CTS3_N_A */
+	RCAR_GP_PIN(1, 26), RCAR_GP_PIN(1, 25),
+};
+static const unsigned int scif3_ctrl_a_mux[] = {
+	RTS3_N_A_MARK, CTS3_N_A_MARK,
+};
+
+/* - SCIF3_B ------------------------------------------------------------------ */
+static const unsigned int scif3_data_b_pins[] = {
+	/* RX3_B, TX3_B */
+	RCAR_GP_PIN(1, 1), RCAR_GP_PIN(1, 0),
+};
+static const unsigned int scif3_data_b_mux[] = {
+	RX3_B_MARK, TX3_B_MARK,
+};
+static const unsigned int scif3_clk_b_pins[] = {
+	/* SCK3_B */
+	RCAR_GP_PIN(1, 4),
+};
+static const unsigned int scif3_clk_b_mux[] = {
+	SCK3_B_MARK,
+};
+static const unsigned int scif3_ctrl_b_pins[] = {
+	/* RTS3_N_B, CTS3_N_B */
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+};
+static const unsigned int scif3_ctrl_b_mux[] = {
+	RTS3_N_B_MARK, CTS3_N_B_MARK,
+};
+
+/* - SCIF4 ------------------------------------------------------------------ */
+static const unsigned int scif4_data_pins[] = {
+	/* RX4, TX4 */
+	RCAR_GP_PIN(4, 13), RCAR_GP_PIN(4, 12),
+};
+static const unsigned int scif4_data_mux[] = {
+	RX4_MARK, TX4_MARK,
+};
+static const unsigned int scif4_clk_pins[] = {
+	/* SCK4 */
+	RCAR_GP_PIN(4, 8),
+};
+static const unsigned int scif4_clk_mux[] = {
+	SCK4_MARK,
+};
+static const unsigned int scif4_ctrl_pins[] = {
+	/* RTS4_N, CTS4_N */
+	RCAR_GP_PIN(4, 10), RCAR_GP_PIN(4, 9),
+};
+static const unsigned int scif4_ctrl_mux[] = {
+	RTS4_N_MARK, CTS4_N_MARK,
+};
+
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb0_link),
 	SH_PFC_PIN_GROUP(avb0_magic),
@@ -1549,6 +1687,25 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(qspi1_ctrl),
 	BUS_DATA_PIN_GROUP(qspi1_data, 2),
 	BUS_DATA_PIN_GROUP(qspi1_data, 4),
+
+	SH_PFC_PIN_GROUP(scif0_data),
+	SH_PFC_PIN_GROUP(scif0_clk),
+	SH_PFC_PIN_GROUP(scif0_ctrl),
+	SH_PFC_PIN_GROUP(scif1_data_a),
+	SH_PFC_PIN_GROUP(scif1_clk_a),
+	SH_PFC_PIN_GROUP(scif1_ctrl_a),
+	SH_PFC_PIN_GROUP(scif1_data_b),
+	SH_PFC_PIN_GROUP(scif1_clk_b),
+	SH_PFC_PIN_GROUP(scif1_ctrl_b),
+	SH_PFC_PIN_GROUP(scif3_data_a),
+	SH_PFC_PIN_GROUP(scif3_clk_a),
+	SH_PFC_PIN_GROUP(scif3_ctrl_a),
+	SH_PFC_PIN_GROUP(scif3_data_b),
+	SH_PFC_PIN_GROUP(scif3_clk_b),
+	SH_PFC_PIN_GROUP(scif3_ctrl_b),
+	SH_PFC_PIN_GROUP(scif4_data),
+	SH_PFC_PIN_GROUP(scif4_clk),
+	SH_PFC_PIN_GROUP(scif4_ctrl),
 };
 
 static const char * const avb0_groups[] = {
@@ -1609,6 +1766,36 @@ static const char * const qspi1_groups[] = {
 	"qspi1_data4",
 };
 
+static const char * const scif0_groups[] = {
+	"scif0_data",
+	"scif0_clk",
+	"scif0_ctrl",
+};
+
+static const char * const scif1_groups[] = {
+	"scif1_data_a",
+	"scif1_clk_a",
+	"scif1_ctrl_a",
+	"scif1_data_b",
+	"scif1_clk_b",
+	"scif1_ctrl_b",
+};
+
+static const char * const scif3_groups[] = {
+	"scif3_data_a",
+	"scif3_clk_a",
+	"scif3_ctrl_a",
+	"scif3_data_b",
+	"scif3_clk_b",
+	"scif3_ctrl_b",
+};
+
+static const char * const scif4_groups[] = {
+	"scif4_data",
+	"scif4_clk",
+	"scif4_ctrl",
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb0),
 	SH_PFC_FUNCTION(avb1),
@@ -1618,6 +1805,11 @@ static const struct sh_pfc_function pinmux_functions[] = {
 
 	SH_PFC_FUNCTION(qspi0),
 	SH_PFC_FUNCTION(qspi1),
+
+	SH_PFC_FUNCTION(scif0),
+	SH_PFC_FUNCTION(scif1),
+	SH_PFC_FUNCTION(scif3),
+	SH_PFC_FUNCTION(scif4),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
2.34.1


