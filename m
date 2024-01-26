Return-Path: <linux-gpio+bounces-2590-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 091DF83D8A0
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 11:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82ADF1F286A6
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 10:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051DA1759D;
	Fri, 26 Jan 2024 10:56:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EAE13AEC
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jan 2024 10:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706266614; cv=none; b=KMJzsRbCZ/taj7VfnYnC79Rr0JrIaj71eWKaA+fiCM8suHkH6CDCu7kjG4RknMhJgwCuQh5QqlSvKsKbH3D7YrsLbmznCbUa3v1Dshmnotobqw3xkZEluX6421asT6gEcSq1xK9Y4tH5gQgxKLicR8CJ6wAPTXUgcVDGd/x7nww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706266614; c=relaxed/simple;
	bh=S9uNb1486bXuO0lyh9Sbc5MvVlj1Y88BYoD1E8Gl858=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EAlLOENl45s9jxN3o9k6bSGwhSJX+4MAwTF+tivUvhvnqRVWXRemR0cYQVdTSHnv7a1kqT6mSZlHvDTblnlUuR139qLF549fJBPbk3sXn1RuV3WQmivxLXmgR4l8z4Z4XVQ6ctZOTPJ24aZcAGxfKi6EmB/Bxnk/hcu6qcYH/jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:8d64:ae04:ce87:de06])
	by baptiste.telenet-ops.be with bizsmtp
	id fNwn2B00D1AdMdB01NwnkL; Fri, 26 Jan 2024 11:56:47 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJsL-00GWgi-0k;
	Fri, 26 Jan 2024 11:56:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJh0-00G5TW-8r;
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
Subject: [PATCH 10/14] pinctrl: renesas: r8a779h0: Add MSIOF pins, groups, functions
Date: Fri, 26 Jan 2024 11:44:08 +0100
Message-Id: <cbfc61f0c02e9dbeec0ea689e10bdd5ebf5bf1e3.1706264667.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706264667.git.geert+renesas@glider.be>
References: <cover.1706264667.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Cong Dang <cong.dang.xn@renesas.com>

Add pins, groups and functions for the Clock-Synchronized Serial
Interfaces with FIFO (MSIOF) on the Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Drop MSIOF5 A/B, as they are no longer documented in the R-Car V4M
    Series Hardaware User’s Manual Rev.0.51.
---
 drivers/pinctrl/renesas/pfc-r8a779h0.c | 367 +++++++++++++++++++++++++
 1 file changed, 367 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779h0.c b/drivers/pinctrl/renesas/pfc-r8a779h0.c
index 8e04f4ce36e3d804..f623362c85beca4f 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779h0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779h0.c
@@ -1642,6 +1642,270 @@ static const unsigned int mmc_ds_mux[] = {
 	MMC_DS_MARK,
 };
 
+/* - MSIOF0 ----------------------------------------------------------------- */
+static const unsigned int msiof0_clk_pins[] = {
+	/* MSIOF0_SCK */
+	RCAR_GP_PIN(1, 10),
+};
+static const unsigned int msiof0_clk_mux[] = {
+	MSIOF0_SCK_MARK,
+};
+static const unsigned int msiof0_sync_pins[] = {
+	/* MSIOF0_SYNC */
+	RCAR_GP_PIN(1, 8),
+};
+static const unsigned int msiof0_sync_mux[] = {
+	MSIOF0_SYNC_MARK,
+};
+static const unsigned int msiof0_ss1_pins[] = {
+	/* MSIOF0_SS1 */
+	RCAR_GP_PIN(1, 7),
+};
+static const unsigned int msiof0_ss1_mux[] = {
+	MSIOF0_SS1_MARK,
+};
+static const unsigned int msiof0_ss2_pins[] = {
+	/* MSIOF0_SS2 */
+	RCAR_GP_PIN(1, 6),
+};
+static const unsigned int msiof0_ss2_mux[] = {
+	MSIOF0_SS2_MARK,
+};
+static const unsigned int msiof0_txd_pins[] = {
+	/* MSIOF0_TXD */
+	RCAR_GP_PIN(1, 9),
+};
+static const unsigned int msiof0_txd_mux[] = {
+	MSIOF0_TXD_MARK,
+};
+static const unsigned int msiof0_rxd_pins[] = {
+	/* MSIOF0_RXD */
+	RCAR_GP_PIN(1, 11),
+};
+static const unsigned int msiof0_rxd_mux[] = {
+	MSIOF0_RXD_MARK,
+};
+
+/* - MSIOF1 ----------------------------------------------------------------- */
+static const unsigned int msiof1_clk_pins[] = {
+	/* MSIOF1_SCK */
+	RCAR_GP_PIN(1, 3),
+};
+static const unsigned int msiof1_clk_mux[] = {
+	MSIOF1_SCK_MARK,
+};
+static const unsigned int msiof1_sync_pins[] = {
+	/* MSIOF1_SYNC */
+	RCAR_GP_PIN(1, 2),
+};
+static const unsigned int msiof1_sync_mux[] = {
+	MSIOF1_SYNC_MARK,
+};
+static const unsigned int msiof1_ss1_pins[] = {
+	/* MSIOF1_SS1 */
+	RCAR_GP_PIN(1, 1),
+};
+static const unsigned int msiof1_ss1_mux[] = {
+	MSIOF1_SS1_MARK,
+};
+static const unsigned int msiof1_ss2_pins[] = {
+	/* MSIOF1_SS2 */
+	RCAR_GP_PIN(1, 0),
+};
+static const unsigned int msiof1_ss2_mux[] = {
+	MSIOF1_SS2_MARK,
+};
+static const unsigned int msiof1_txd_pins[] = {
+	/* MSIOF1_TXD */
+	RCAR_GP_PIN(1, 4),
+};
+static const unsigned int msiof1_txd_mux[] = {
+	MSIOF1_TXD_MARK,
+};
+static const unsigned int msiof1_rxd_pins[] = {
+	/* MSIOF1_RXD */
+	RCAR_GP_PIN(1, 5),
+};
+static const unsigned int msiof1_rxd_mux[] = {
+	MSIOF1_RXD_MARK,
+};
+
+/* - MSIOF2 ----------------------------------------------------------------- */
+static const unsigned int msiof2_clk_pins[] = {
+	/* MSIOF2_SCK */
+	RCAR_GP_PIN(0, 17),
+};
+static const unsigned int msiof2_clk_mux[] = {
+	MSIOF2_SCK_MARK,
+};
+static const unsigned int msiof2_sync_pins[] = {
+	/* MSIOF2_SYNC */
+	RCAR_GP_PIN(0, 15),
+};
+static const unsigned int msiof2_sync_mux[] = {
+	MSIOF2_SYNC_MARK,
+};
+static const unsigned int msiof2_ss1_pins[] = {
+	/* MSIOF2_SS1 */
+	RCAR_GP_PIN(0, 14),
+};
+static const unsigned int msiof2_ss1_mux[] = {
+	MSIOF2_SS1_MARK,
+};
+static const unsigned int msiof2_ss2_pins[] = {
+	/* MSIOF2_SS2 */
+	RCAR_GP_PIN(0, 13),
+};
+static const unsigned int msiof2_ss2_mux[] = {
+	MSIOF2_SS2_MARK,
+};
+static const unsigned int msiof2_txd_pins[] = {
+	/* MSIOF2_TXD */
+	RCAR_GP_PIN(0, 16),
+};
+static const unsigned int msiof2_txd_mux[] = {
+	MSIOF2_TXD_MARK,
+};
+static const unsigned int msiof2_rxd_pins[] = {
+	/* MSIOF2_RXD */
+	RCAR_GP_PIN(0, 18),
+};
+static const unsigned int msiof2_rxd_mux[] = {
+	MSIOF2_RXD_MARK,
+};
+
+/* - MSIOF3 ----------------------------------------------------------------- */
+static const unsigned int msiof3_clk_pins[] = {
+	/* MSIOF3_SCK */
+	RCAR_GP_PIN(0, 3),
+};
+static const unsigned int msiof3_clk_mux[] = {
+	MSIOF3_SCK_MARK,
+};
+static const unsigned int msiof3_sync_pins[] = {
+	/* MSIOF3_SYNC */
+	RCAR_GP_PIN(0, 6),
+};
+static const unsigned int msiof3_sync_mux[] = {
+	MSIOF3_SYNC_MARK,
+};
+static const unsigned int msiof3_ss1_pins[] = {
+	/* MSIOF3_SS1 */
+	RCAR_GP_PIN(0, 1),
+};
+static const unsigned int msiof3_ss1_mux[] = {
+	MSIOF3_SS1_MARK,
+};
+static const unsigned int msiof3_ss2_pins[] = {
+	/* MSIOF3_SS2 */
+	RCAR_GP_PIN(0, 2),
+};
+static const unsigned int msiof3_ss2_mux[] = {
+	MSIOF3_SS2_MARK,
+};
+static const unsigned int msiof3_txd_pins[] = {
+	/* MSIOF3_TXD */
+	RCAR_GP_PIN(0, 4),
+};
+static const unsigned int msiof3_txd_mux[] = {
+	MSIOF3_TXD_MARK,
+};
+static const unsigned int msiof3_rxd_pins[] = {
+	/* MSIOF3_RXD */
+	RCAR_GP_PIN(0, 5),
+};
+static const unsigned int msiof3_rxd_mux[] = {
+	MSIOF3_RXD_MARK,
+};
+
+/* - MSIOF4 ----------------------------------------------------------------- */
+static const unsigned int msiof4_clk_pins[] = {
+	/* MSIOF4_SCK */
+	RCAR_GP_PIN(1, 25),
+};
+static const unsigned int msiof4_clk_mux[] = {
+	MSIOF4_SCK_MARK,
+};
+static const unsigned int msiof4_sync_pins[] = {
+	/* MSIOF4_SYNC */
+	RCAR_GP_PIN(1, 28),
+};
+static const unsigned int msiof4_sync_mux[] = {
+	MSIOF4_SYNC_MARK,
+};
+static const unsigned int msiof4_ss1_pins[] = {
+	/* MSIOF4_SS1 */
+	RCAR_GP_PIN(1, 23),
+};
+static const unsigned int msiof4_ss1_mux[] = {
+	MSIOF4_SS1_MARK,
+};
+static const unsigned int msiof4_ss2_pins[] = {
+	/* MSIOF4_SS2 */
+	RCAR_GP_PIN(1, 24),
+};
+static const unsigned int msiof4_ss2_mux[] = {
+	MSIOF4_SS2_MARK,
+};
+static const unsigned int msiof4_txd_pins[] = {
+	/* MSIOF4_TXD */
+	RCAR_GP_PIN(1, 26),
+};
+static const unsigned int msiof4_txd_mux[] = {
+	MSIOF4_TXD_MARK,
+};
+static const unsigned int msiof4_rxd_pins[] = {
+	/* MSIOF4_RXD */
+	RCAR_GP_PIN(1, 27),
+};
+static const unsigned int msiof4_rxd_mux[] = {
+	MSIOF4_RXD_MARK,
+};
+
+/* - MSIOF5 ----------------------------------------------------------------- */
+static const unsigned int msiof5_clk_pins[] = {
+	/* MSIOF5_SCK */
+	RCAR_GP_PIN(0, 11),
+};
+static const unsigned int msiof5_clk_mux[] = {
+	MSIOF5_SCK_MARK,
+};
+static const unsigned int msiof5_sync_pins[] = {
+	/* MSIOF5_SYNC */
+	RCAR_GP_PIN(0, 9),
+};
+static const unsigned int msiof5_sync_mux[] = {
+	MSIOF5_SYNC_MARK,
+};
+static const unsigned int msiof5_ss1_pins[] = {
+	/* MSIOF5_SS1 */
+	RCAR_GP_PIN(0, 8),
+};
+static const unsigned int msiof5_ss1_mux[] = {
+	MSIOF5_SS1_MARK,
+};
+static const unsigned int msiof5_ss2_pins[] = {
+	/* MSIOF5_SS2 */
+	RCAR_GP_PIN(0, 7),
+};
+static const unsigned int msiof5_ss2_mux[] = {
+	MSIOF5_SS2_MARK,
+};
+static const unsigned int msiof5_txd_pins[] = {
+	/* MSIOF5_TXD */
+	RCAR_GP_PIN(0, 10),
+};
+static const unsigned int msiof5_txd_mux[] = {
+	MSIOF5_TXD_MARK,
+};
+static const unsigned int msiof5_rxd_pins[] = {
+	/* MSIOF5_RXD */
+	RCAR_GP_PIN(0, 12),
+};
+static const unsigned int msiof5_rxd_mux[] = {
+	MSIOF5_RXD_MARK,
+};
+
 /* - QSPI0 ------------------------------------------------------------------ */
 static const unsigned int qspi0_ctrl_pins[] = {
 	/* SPCLK, SSL */
@@ -1896,6 +2160,48 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(mmc_wp),
 	SH_PFC_PIN_GROUP(mmc_ds),
 
+	SH_PFC_PIN_GROUP(msiof0_clk),
+	SH_PFC_PIN_GROUP(msiof0_sync),
+	SH_PFC_PIN_GROUP(msiof0_ss1),
+	SH_PFC_PIN_GROUP(msiof0_ss2),
+	SH_PFC_PIN_GROUP(msiof0_txd),
+	SH_PFC_PIN_GROUP(msiof0_rxd),
+
+	SH_PFC_PIN_GROUP(msiof1_clk),
+	SH_PFC_PIN_GROUP(msiof1_sync),
+	SH_PFC_PIN_GROUP(msiof1_ss1),
+	SH_PFC_PIN_GROUP(msiof1_ss2),
+	SH_PFC_PIN_GROUP(msiof1_txd),
+	SH_PFC_PIN_GROUP(msiof1_rxd),
+
+	SH_PFC_PIN_GROUP(msiof2_clk),
+	SH_PFC_PIN_GROUP(msiof2_sync),
+	SH_PFC_PIN_GROUP(msiof2_ss1),
+	SH_PFC_PIN_GROUP(msiof2_ss2),
+	SH_PFC_PIN_GROUP(msiof2_txd),
+	SH_PFC_PIN_GROUP(msiof2_rxd),
+
+	SH_PFC_PIN_GROUP(msiof3_clk),
+	SH_PFC_PIN_GROUP(msiof3_sync),
+	SH_PFC_PIN_GROUP(msiof3_ss1),
+	SH_PFC_PIN_GROUP(msiof3_ss2),
+	SH_PFC_PIN_GROUP(msiof3_txd),
+	SH_PFC_PIN_GROUP(msiof3_rxd),
+
+	SH_PFC_PIN_GROUP(msiof4_clk),
+	SH_PFC_PIN_GROUP(msiof4_sync),
+	SH_PFC_PIN_GROUP(msiof4_ss1),
+	SH_PFC_PIN_GROUP(msiof4_ss2),
+	SH_PFC_PIN_GROUP(msiof4_txd),
+	SH_PFC_PIN_GROUP(msiof4_rxd),
+
+	SH_PFC_PIN_GROUP(msiof5_clk),
+	SH_PFC_PIN_GROUP(msiof5_sync),
+	SH_PFC_PIN_GROUP(msiof5_ss1),
+	SH_PFC_PIN_GROUP(msiof5_ss2),
+	SH_PFC_PIN_GROUP(msiof5_txd),
+	SH_PFC_PIN_GROUP(msiof5_rxd),
+
 	SH_PFC_PIN_GROUP(qspi0_ctrl),
 	BUS_DATA_PIN_GROUP(qspi0_data, 2),
 	BUS_DATA_PIN_GROUP(qspi0_data, 4),
@@ -2017,6 +2323,60 @@ static const char * const mmc_groups[] = {
 	"mmc_ds",
 };
 
+static const char * const msiof0_groups[] = {
+	"msiof0_clk",
+	"msiof0_sync",
+	"msiof0_ss1",
+	"msiof0_ss2",
+	"msiof0_txd",
+	"msiof0_rxd",
+};
+
+static const char * const msiof1_groups[] = {
+	"msiof1_clk",
+	"msiof1_sync",
+	"msiof1_ss1",
+	"msiof1_ss2",
+	"msiof1_txd",
+	"msiof1_rxd",
+};
+
+static const char * const msiof2_groups[] = {
+	"msiof2_clk",
+	"msiof2_sync",
+	"msiof2_ss1",
+	"msiof2_ss2",
+	"msiof2_txd",
+	"msiof2_rxd",
+};
+
+static const char * const msiof3_groups[] = {
+	"msiof3_clk",
+	"msiof3_sync",
+	"msiof3_ss1",
+	"msiof3_ss2",
+	"msiof3_txd",
+	"msiof3_rxd",
+};
+
+static const char * const msiof4_groups[] = {
+	"msiof4_clk",
+	"msiof4_sync",
+	"msiof4_ss1",
+	"msiof4_ss2",
+	"msiof4_txd",
+	"msiof4_rxd",
+};
+
+static const char * const msiof5_groups[] = {
+	"msiof5_clk",
+	"msiof5_sync",
+	"msiof5_ss1",
+	"msiof5_ss2",
+	"msiof5_txd",
+	"msiof5_rxd",
+};
+
 static const char * const qspi0_groups[] = {
 	"qspi0_ctrl",
 	"qspi0_data2",
@@ -2084,6 +2444,13 @@ static const struct sh_pfc_function pinmux_functions[] = {
 
 	SH_PFC_FUNCTION(mmc),
 
+	SH_PFC_FUNCTION(msiof0),
+	SH_PFC_FUNCTION(msiof1),
+	SH_PFC_FUNCTION(msiof2),
+	SH_PFC_FUNCTION(msiof3),
+	SH_PFC_FUNCTION(msiof4),
+	SH_PFC_FUNCTION(msiof5),
+
 	SH_PFC_FUNCTION(qspi0),
 	SH_PFC_FUNCTION(qspi1),
 
-- 
2.34.1


