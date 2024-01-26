Return-Path: <linux-gpio+bounces-2593-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FA183D8A4
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 11:57:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B82C2891BE
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 10:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E65417732;
	Fri, 26 Jan 2024 10:56:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868F213AC9
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jan 2024 10:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706266615; cv=none; b=i7o02dgbL12iFJ6PSZBwJQtmtgmnpK3VoniALieKYcExzlK0uQMe7bL6QcdoO/AY56s9f6LpYk7R+5LoS/6WYP/qqiGrp6rPgAoBmVV41OuoFaUIfGy0R7Tf1S/Tj3OzA6PfqkYPezni5dnfXB8lxLr4hFLH4+3IbhosZJT9Gc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706266615; c=relaxed/simple;
	bh=J4efDnOtui+mSRBxSgEaofX3dYOuvCQ/NFFBKCYkj3g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l6QLbMDEUthNqpOQBCL+RuvkY8Lz1x6LJiQCNCqg+jWGzqmQ76O7MxhdfK0B//D3qFUyPEfN3zPd1vN5NLQq/d23kNEUcXEtNuQnFCHW5wsKRe6M4K9RYQXjx6hIts4H3dDslL500s7BhdOEnn/YjdCVQZvoqniaWyv1NfHRtLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:8d64:ae04:ce87:de06])
	by xavier.telenet-ops.be with bizsmtp
	id fNwn2B00g1AdMdB01NwnT5; Fri, 26 Jan 2024 11:56:47 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJsL-00GWh4-CX;
	Fri, 26 Jan 2024 11:56:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJh0-00G5TH-5w;
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
Subject: [PATCH 07/14] pinctrl: renesas: r8a779h0: Add SCIF_CLK pins, groups, functions
Date: Fri, 26 Jan 2024 11:44:05 +0100
Message-Id: <ee056d78d3a339bdbcca2cc5281f1fe01bbc3953.1706264667.git.geert+renesas@glider.be>
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

Add pins, groups and functions for the baud rate generation clock pins
(SCIF_CLK) on the Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Split off from HSCIF pins/groups/functions patch,
  - Change references to "HSCIF clocks" to "SCIF clocks",
  - Move SCIF clocks to preserve alphabetical sort order.
---
 drivers/pinctrl/renesas/pfc-r8a779h0.c | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779h0.c b/drivers/pinctrl/renesas/pfc-r8a779h0.c
index 543beff4effe9f82..c7c3e68ca77abf4a 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779h0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779h0.c
@@ -1642,6 +1642,23 @@ static const unsigned int scif4_ctrl_mux[] = {
 	RTS4_N_MARK, CTS4_N_MARK,
 };
 
+/* - SCIF Clock ------------------------------------------------------------- */
+static const unsigned int scif_clk_pins[] = {
+	/* SCIF_CLK */
+	RCAR_GP_PIN(1, 17),
+};
+static const unsigned int scif_clk_mux[] = {
+	SCIF_CLK_MARK,
+};
+
+static const unsigned int scif_clk2_pins[] = {
+	/* SCIF_CLK2 */
+	RCAR_GP_PIN(4, 11),
+};
+static const unsigned int scif_clk2_mux[] = {
+	SCIF_CLK2_MARK,
+};
+
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb0_link),
 	SH_PFC_PIN_GROUP(avb0_magic),
@@ -1706,6 +1723,8 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif4_data),
 	SH_PFC_PIN_GROUP(scif4_clk),
 	SH_PFC_PIN_GROUP(scif4_ctrl),
+	SH_PFC_PIN_GROUP(scif_clk),
+	SH_PFC_PIN_GROUP(scif_clk2),
 };
 
 static const char * const avb0_groups[] = {
@@ -1796,6 +1815,14 @@ static const char * const scif4_groups[] = {
 	"scif4_ctrl",
 };
 
+static const char * const scif_clk_groups[] = {
+	"scif_clk",
+};
+
+static const char * const scif_clk2_groups[] = {
+	"scif_clk2",
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb0),
 	SH_PFC_FUNCTION(avb1),
@@ -1810,6 +1837,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif3),
 	SH_PFC_FUNCTION(scif4),
+	SH_PFC_FUNCTION(scif_clk),
+	SH_PFC_FUNCTION(scif_clk2),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
2.34.1


