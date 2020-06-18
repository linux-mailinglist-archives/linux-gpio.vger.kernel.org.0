Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76A271FFBFA
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2020 21:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729360AbgFRTq7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jun 2020 15:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727024AbgFRTq5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jun 2020 15:46:57 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F9E7C06174E
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2020 12:46:57 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id z9so8709416ljh.13
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2020 12:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:references:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=38NFAZrZCilaoP+G+R4y65FmBGQAZF14rWjlMMLwX38=;
        b=cTyALCVUOhQ/s/xvPr2QIfzYG38TpiwUcfJG8+SS+rV72GgdA2fJSHeFbwxGgV83V8
         E80uQUq3QhAUDAh8fSDltOVWKTxNde6bNz9l4gtuJu9BEAnl97tEGr3vFZH/sq57Pjfr
         u0K9NZrBZjDcJ0bPcsFGp6/HL3nBCTKbMXMM2E9dCYIai5pZvLt9Rer+p9TRZTwSdy41
         jRA2fQirhYOzNsgLkkiojGTm8kfhv8NU77g9puLzvvDmkWJihobubE41bYxH8wLZosrw
         Vaao4WRNXgPRRwp+mwU5ybZCi7S/RiZBHewi1CCZcezdRzZPC6QWWN3wNPjmxUroBeF8
         7jrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=38NFAZrZCilaoP+G+R4y65FmBGQAZF14rWjlMMLwX38=;
        b=ADqhV2Gu7RE46WoOeHXekmCykrdA9lICpWelgcRObzbKqcZE+RY8lRHH2/uavRZSxx
         E6es5ETmgddx/8yHzO9tT9MFZEm5cPDfPl0TzTpjpwEH3QopFaDmk5+CLnPbigC/cX7l
         qsgKviXqkp9vaxJAstyBewIOwLpYBmOckuRR+QWDj9Ktj8D9qHsZMADnZeOapqtKKbHK
         6zf8FdTLfLbNvuiLTGh3o5e3Mjh9InqDt2jtoIZLfgEGT38EAYs3dYjnodkb3VDYLJxp
         2mm7gGLbxV5YzTlbUE+XihHjmux7F62VNQODJHcffhm30qzNI+deluonna+1PuHeZxNb
         9sBw==
X-Gm-Message-State: AOAM533hDTH/taQsEWD7VWquOdkITDYDPHDXJf41uKqk9DoDI7gehAex
        4HzSX+ZQ90slhjMq+euEnua80A==
X-Google-Smtp-Source: ABdhPJwHqSYBwoRPYOMg13H7HJZ81iM9Fr7TFd2XkgYtPaJzzSqyZ3fgptHKR5CnDomkQRpryqC6Kg==
X-Received: by 2002:a2e:9141:: with SMTP id q1mr10152ljg.196.1592509615827;
        Thu, 18 Jun 2020 12:46:55 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:6f7:bb80:c069:9e2a:dc05:427f])
        by smtp.gmail.com with ESMTPSA id w20sm802578lji.7.2020.06.18.12.46.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jun 2020 12:46:55 -0700 (PDT)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a77970: add RPC pins, groups, and
 functions
To:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org
References: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <d3907b56-e346-f246-694e-6088d060bd27@cogentembedded.com>
Date:   Thu, 18 Jun 2020 22:46:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: pinctrl: sh-pfc: r8a77970: Add RPC pins, groups, and functions

Add the RPC pins/groups/functions to the R8A77970 PFC driver.
They can be used if an Octal-SPI flash or HyperFlash is connected.

Based on the patch by Dmitry Shifrin <dmitry.shifrin@cogentembedded.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'sh-pfc' branch of Geert's 'renesas-drivers.git' repo.

 drivers/pinctrl/sh-pfc/pfc-r8a77970.c |   76 ++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

Index: renesas-drivers/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
===================================================================
--- renesas-drivers.orig/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
+++ renesas-drivers/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
@@ -1416,6 +1416,64 @@ static const unsigned int qspi1_data4_mu
 	QSPI1_IO2_MARK, QSPI1_IO3_MARK
 };
 
+/* - RPC -------------------------------------------------------------------- */
+static const unsigned int rpc_clk1_pins[] = {
+	/* Octal-SPI flash: C/SCLK */
+	RCAR_GP_PIN(5, 0),
+};
+static const unsigned int rpc_clk1_mux[] = {
+	QSPI0_SPCLK_MARK,
+};
+static const unsigned int rpc_clk2_pins[] = {
+	/* HyperFlash: CK, CK# */
+	RCAR_GP_PIN(5, 0), RCAR_GP_PIN(5, 6),
+};
+static const unsigned int rpc_clk2_mux[] = {
+	QSPI0_SPCLK_MARK, QSPI1_SPCLK_MARK,
+};
+static const unsigned int rpc_ctrl_pins[] = {
+	/* Octal-SPI flash: S#/CS, DQS */
+	/* HyperFlash: CS#, RDS */
+	RCAR_GP_PIN(5, 5), RCAR_GP_PIN(5, 11),
+};
+static const unsigned int rpc_ctrl_mux[] = {
+	QSPI0_SPCLK_MARK, QSPI0_SSL_MARK,
+};
+static const unsigned int rpc_data_pins[] = {
+	/* DQ[0:7] */
+	RCAR_GP_PIN(5, 1), RCAR_GP_PIN(5, 2),
+	RCAR_GP_PIN(5, 3), RCAR_GP_PIN(5, 4),
+	RCAR_GP_PIN(5, 7), RCAR_GP_PIN(5, 8),
+	RCAR_GP_PIN(5, 9), RCAR_GP_PIN(5, 10),
+};
+static const unsigned int rpc_data_mux[] = {
+	QSPI0_MOSI_IO0_MARK, QSPI0_MISO_IO1_MARK,
+	QSPI0_IO2_MARK, QSPI0_IO3_MARK,
+	QSPI1_MOSI_IO0_MARK, QSPI1_MISO_IO1_MARK,
+	QSPI1_IO2_MARK, QSPI1_IO3_MARK,
+};
+static const unsigned int rpc_reset_pins[] = {
+	/* RPC_RESET# */
+	RCAR_GP_PIN(5, 12),
+};
+static const unsigned int rpc_reset_mux[] = {
+	RPC_RESET_N_MARK,
+};
+static const unsigned int rpc_int_pins[] = {
+	/* RPC_INT# */
+	RCAR_GP_PIN(5, 14),
+};
+static const unsigned int rpc_int_mux[] = {
+	RPC_INT_N_MARK,
+};
+static const unsigned int rpc_wp_pins[] = {
+	/* RPC_WP# */
+	RCAR_GP_PIN(5, 13),
+};
+static const unsigned int rpc_wp_mux[] = {
+	RPC_WP_N_MARK,
+};
+
 /* - SCIF Clock ------------------------------------------------------------- */
 static const unsigned int scif_clk_a_pins[] = {
 	/* SCIF_CLK */
@@ -1750,6 +1808,13 @@ static const struct sh_pfc_pin_group pin
 	SH_PFC_PIN_GROUP(qspi1_ctrl),
 	SH_PFC_PIN_GROUP(qspi1_data2),
 	SH_PFC_PIN_GROUP(qspi1_data4),
+	SH_PFC_PIN_GROUP(rpc_clk1),
+	SH_PFC_PIN_GROUP(rpc_clk2),
+	SH_PFC_PIN_GROUP(rpc_ctrl),
+	SH_PFC_PIN_GROUP(rpc_data),
+	SH_PFC_PIN_GROUP(rpc_reset),
+	SH_PFC_PIN_GROUP(rpc_int),
+	SH_PFC_PIN_GROUP(rpc_wp),
 	SH_PFC_PIN_GROUP(scif_clk_a),
 	SH_PFC_PIN_GROUP(scif_clk_b),
 	SH_PFC_PIN_GROUP(scif0_data),
@@ -1954,6 +2019,16 @@ static const char * const qspi1_groups[]
 	"qspi1_data4",
 };
 
+static const char * const rpc_groups[] = {
+	"rpc_clk1",
+	"rpc_clk2",
+	"rpc_ctrl",
+	"rpc_data",
+	"rpc_reset",
+	"rpc_int",
+	"rpc_wp",
+};
+
 static const char * const scif_clk_groups[] = {
 	"scif_clk_a",
 	"scif_clk_b",
@@ -2039,6 +2114,7 @@ static const struct sh_pfc_function pinm
 	SH_PFC_FUNCTION(pwm4),
 	SH_PFC_FUNCTION(qspi0),
 	SH_PFC_FUNCTION(qspi1),
+	SH_PFC_FUNCTION(rpc),
 	SH_PFC_FUNCTION(scif_clk),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
