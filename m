Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C451F00F2
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2020 22:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728293AbgFEUXT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jun 2020 16:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727960AbgFEUXT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Jun 2020 16:23:19 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94DAAC08C5C2
        for <linux-gpio@vger.kernel.org>; Fri,  5 Jun 2020 13:23:17 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id y11so11634448ljm.9
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jun 2020 13:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:references:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fglDJbv4WT/WOqDPXxPvYSTgBc912Oo/UPWjfUOlos4=;
        b=sLc2pomPeZtn+c66L3Qd6FA+600PkDQWXefrnhFBPcnOt84rdWE3J2U3zKc0cSIDZM
         LTCzKTCEW8dMZxeRd+b8ll4uMg14UJiaOcVDy5P2LHPNA71FwZ/Xe5ql1vCsts1qUew1
         MvUR1rEe9II+9k7AHrpSoXF+bXQCn9fsMebxFYfp0Dzegqj3peFhWbMILc8PLPTgevJ2
         ulxR18oVSJNG/pY8lbMzdDkCa8OX5aALhMgiTZIDBhhY7WzijXkcyxCyVzszJD3rOlhj
         3h96HEbxWN8Jhyevdgp8jAWou9bIcfIo+QWoUXrFnYLflaSk6CeYvLfCzOJGIGZmH2nP
         SnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=fglDJbv4WT/WOqDPXxPvYSTgBc912Oo/UPWjfUOlos4=;
        b=LsxELKADGXfMxn2YEqUdyztJ8AQUebtPg7zL+wvSJayh4h+dM5QYrrygawNfVcy1UQ
         dse49GSmfBSXt/jrXNxnkAuVFriCD+ExOoXZwesCikG1/BNDOU1g0z+p/AnRsHURkOaR
         2EKo4UggC1e56NritPuYQWAWLOFKIet5JQ+vaDZTLArngiWEW6E3nKNvpb0bdtVk2J41
         EyX0SrPqVIVw1Ud3tCZcMCRFoDFOTd4uLlaPAoIXAkJxGA1g4hSLCA2hs/ccmJ13cEQs
         dbKHYzJJuTnKM43y1C+LkJisJbAoGOQUNcgHYAOxEll7Ixk/JddJKAlLdF6gA7W4VUwp
         8Cog==
X-Gm-Message-State: AOAM530TyVRLDFvRnUalIV+IgSyodmzYHdo+Q8gAwji2WMK7T/cTD70S
        9cgXgf7bYOLN2Lz22Z3BJlU8ag==
X-Google-Smtp-Source: ABdhPJznPhASsnX481aR5Frg7bIjIdwC7dRO4loOjH0SEAX5u6C7RS7NvkzwhBghjfCXg4Z+/+LOqw==
X-Received: by 2002:a2e:911:: with SMTP id 17mr5762171ljj.411.1591388595987;
        Fri, 05 Jun 2020 13:23:15 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:42cd:98a0:c9a9:131:7b2a:e2f8])
        by smtp.gmail.com with ESMTPSA id y3sm1168877ljk.39.2020.06.05.13.23.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jun 2020 13:23:15 -0700 (PDT)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a77980: add RPC pins, groups, and
 functions
To:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <fd089d37-95bb-4ec9-282f-e04d7e5195e4@cogentembedded.com>
Date:   Fri, 5 Jun 2020 23:23:14 +0300
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

Add the RPC pins/groups/functions to the R8A77980 PFC driver.
They can be used if an Octal-SPI flash or HyperFlash is connected.

Based on the patch by Dmitry Shifrin <dmitry.shifrin@cogentembedded.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'sh-pfc' branch of Geert's 'renesas-drivers.git' repo.

 drivers/pinctrl/sh-pfc/pfc-r8a77980.c |   76 ++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

Index: renesas-devel/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
===================================================================
--- renesas-devel.orig/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
+++ renesas-devel/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
@@ -1710,6 +1710,64 @@ static const unsigned int qspi1_data4_mu
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
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_pins[] = {
 	/* RX0, TX0 */
@@ -2126,6 +2184,13 @@ static const struct sh_pfc_pin_group pin
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
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
 	SH_PFC_PIN_GROUP(scif0_ctrl),
@@ -2362,6 +2427,16 @@ static const char * const qspi1_groups[]
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
 static const char * const scif0_groups[] = {
 	"scif0_data",
 	"scif0_clk",
@@ -2460,6 +2535,7 @@ static const struct sh_pfc_function pinm
 	SH_PFC_FUNCTION(pwm4),
 	SH_PFC_FUNCTION(qspi0),
 	SH_PFC_FUNCTION(qspi1),
+	SH_PFC_FUNCTION(rpc),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif3),
