Return-Path: <linux-gpio+bounces-2597-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C27C83D8B0
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 11:57:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B00101F22896
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 10:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D81134B4;
	Fri, 26 Jan 2024 10:56:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F76D14005
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jan 2024 10:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706266615; cv=none; b=MU/0FiJ/W7a7zJ3yvk0JK1UkC+5qpQAbgoNX77UcbKf2CpTMf+oVmh2yweJfKPF5kXulQXwDAOO6VUIwoJY6CaLaJ8SXZ2NAJOeFQ8QcIcfFpXotlK5hXWzHJDT6in1iWlYzvSUEt14PDmYlQkjz4r4kLg5eAmXP8xRdMY+cZJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706266615; c=relaxed/simple;
	bh=B255vhPhlqUmPWIyPCeK/kQPbij3zSMbrOPzlrlZjrs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uOt4P6hK2Gn7IhRMleBDcHArHcHirgUi9oRNIikv8asbJRQrgrbLC3mLczAh5e/yP8veyfqhuDRQGeJLJIExa7W7lRElr6FGCvJP36hqQFRE3LJ8CkY9GwcTD3wuiecTtcL++mF0vQEIhfsrcuLzHOo3H0t7HXIHg/xmYlQpCiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:8d64:ae04:ce87:de06])
	by laurent.telenet-ops.be with bizsmtp
	id fNwo2B0011AdMdB01NwoKr; Fri, 26 Jan 2024 11:56:48 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJsL-00GWhL-Ou;
	Fri, 26 Jan 2024 11:56:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJh0-00G5T2-3Z;
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
Subject: [PATCH 04/14] pinctrl: renesas: r8a779h0: Add SD/MMC pins, groups, functions
Date: Fri, 26 Jan 2024 11:44:02 +0100
Message-Id: <c4c06f5be8ffeb32c48993c138f89c8f463751f4.1706264667.git.geert+renesas@glider.be>
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

Add pins, groups and functions for the SD Card/MMC Interface on the
Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779h0.c | 63 ++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779h0.c b/drivers/pinctrl/renesas/pfc-r8a779h0.c
index 61d72e0222bcbe95..e3d44a56576c9357 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779h0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779h0.c
@@ -1425,6 +1425,49 @@ static const unsigned int avb2_avtp_match_mux[] = {
 	AVB2_AVTP_MATCH_MARK,
 };
 
+/* - MMC -------------------------------------------------------------------- */
+static const unsigned int mmc_data_pins[] = {
+	/* MMC_SD_D[0:3], MMC_D[4:7] */
+	RCAR_GP_PIN(3, 1), RCAR_GP_PIN(3, 0),
+	RCAR_GP_PIN(3, 2), RCAR_GP_PIN(3, 5),
+	RCAR_GP_PIN(3, 7), RCAR_GP_PIN(3, 6),
+	RCAR_GP_PIN(3, 9), RCAR_GP_PIN(3, 8),
+};
+static const unsigned int mmc_data_mux[] = {
+	MMC_SD_D0_MARK, MMC_SD_D1_MARK,
+	MMC_SD_D2_MARK, MMC_SD_D3_MARK,
+	MMC_D4_MARK, MMC_D5_MARK,
+	MMC_D6_MARK, MMC_D7_MARK,
+};
+static const unsigned int mmc_ctrl_pins[] = {
+	/* MMC_SD_CLK, MMC_SD_CMD */
+	RCAR_GP_PIN(3, 3), RCAR_GP_PIN(3, 10),
+};
+static const unsigned int mmc_ctrl_mux[] = {
+	MMC_SD_CLK_MARK, MMC_SD_CMD_MARK,
+};
+static const unsigned int mmc_cd_pins[] = {
+	/* SD_CD */
+	RCAR_GP_PIN(3, 11),
+};
+static const unsigned int mmc_cd_mux[] = {
+	SD_CD_MARK,
+};
+static const unsigned int mmc_wp_pins[] = {
+	/* SD_WP */
+	RCAR_GP_PIN(3, 12),
+};
+static const unsigned int mmc_wp_mux[] = {
+	SD_WP_MARK,
+};
+static const unsigned int mmc_ds_pins[] = {
+	/* MMC_DS */
+	RCAR_GP_PIN(3, 4),
+};
+static const unsigned int mmc_ds_mux[] = {
+	MMC_DS_MARK,
+};
+
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb0_link),
 	SH_PFC_PIN_GROUP(avb0_magic),
@@ -1455,6 +1498,14 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb2_avtp_pps),
 	SH_PFC_PIN_GROUP(avb2_avtp_capture),
 	SH_PFC_PIN_GROUP(avb2_avtp_match),
+
+	BUS_DATA_PIN_GROUP(mmc_data, 1),
+	BUS_DATA_PIN_GROUP(mmc_data, 4),
+	BUS_DATA_PIN_GROUP(mmc_data, 8),
+	SH_PFC_PIN_GROUP(mmc_ctrl),
+	SH_PFC_PIN_GROUP(mmc_cd),
+	SH_PFC_PIN_GROUP(mmc_wp),
+	SH_PFC_PIN_GROUP(mmc_ds),
 };
 
 static const char * const avb0_groups[] = {
@@ -1493,10 +1544,22 @@ static const char * const avb2_groups[] = {
 	"avb2_avtp_match",
 };
 
+static const char * const mmc_groups[] = {
+	"mmc_data1",
+	"mmc_data4",
+	"mmc_data8",
+	"mmc_ctrl",
+	"mmc_cd",
+	"mmc_wp",
+	"mmc_ds",
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb0),
 	SH_PFC_FUNCTION(avb1),
 	SH_PFC_FUNCTION(avb2),
+
+	SH_PFC_FUNCTION(mmc),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
2.34.1


