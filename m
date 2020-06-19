Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 839E02019D1
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2020 19:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731600AbgFSRyh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Jun 2020 13:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731445AbgFSRyg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jun 2020 13:54:36 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7B0EC06174E
        for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2020 10:54:35 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id s1so12524633ljo.0
        for <linux-gpio@vger.kernel.org>; Fri, 19 Jun 2020 10:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:references:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LtdXAlu47wyWf4vxXj+jp7xPrK3QijfjtnczPQlueO0=;
        b=GNpLO4HZKTC4YqSMmEzbk/RJt9ckyq3PgYrKdPRAv+CByjKGlE29K+luI2g3BvtS6V
         LQtXZupFHrxqnaQx/kkADdiNtzHGWZk2fADdzzNDw29qDkE3EdY2gOZ+2dyGBti5GJNE
         Y7PbxewVZUUPmUq7f/ghs/FEeyDMPG2N7CHWPmS0p+lEn6USlNB8476oNJ2k7twi3VIE
         00yVYJ6DGdLAxMwgQ1/ZhJA4dSjYniapSW5A5KUSdU/6wOjfW4qQESdUepJha/9DQpQE
         pZzs37w4XakexgDTexKOh2VvEyzKY9gmXBljdnX9/Q6OXKDJLm+4+z1D/tVhpe2adQWg
         uT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=LtdXAlu47wyWf4vxXj+jp7xPrK3QijfjtnczPQlueO0=;
        b=h+/BiX+zzi2TWfwwAl09jfSWLlyD+g3uuSblb9Jv3n7rNDR3PjhcQSG0GTeg7MOKo8
         etoacgEadMEpD90RDvtG91kY6u8jqNdQYfcoUqvuOMvA+r+AoCJy2qjCcFR8vxNoh+rz
         gHWMsRgXDv8/SM9NvJgRoehtt3FgxU3DAaFA7+DV99020xGWvDCbRvhogvMLKCx+Nhfw
         oVXZcHsNcYeT7U0VxEwVx0Vk4sS7PgzmuKjFObi+RG+Fbpi0OEhV6vx2p1NU80UXIvFa
         q0XWUoXb1NSY0plPT27nVRNh3sGQM4FYTtJSi1jkuIbA1CmTBVi2p8tv2QWNnvgT4o3Q
         thEw==
X-Gm-Message-State: AOAM531BRH447V6bcHrUiJ2o/hlWVPQDBvpGp/jOTY/XhmGqlmmrtGBq
        AwSx52xYtWwA21CsZRYPJ4nXxQFFMiY=
X-Google-Smtp-Source: ABdhPJzX8vTlKzbr4Uo1H644IY61Ap3uE5v5Cba+I3vvKu/jdR5vq0jWtC6acJJ6A2+8r5y5BmvE6g==
X-Received: by 2002:a2e:6a05:: with SMTP id f5mr2487019ljc.272.1592589274122;
        Fri, 19 Jun 2020 10:54:34 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:441c:ac8f:7564:6e7d:9e36:7ded])
        by smtp.gmail.com with ESMTPSA id n10sm1512799lfb.82.2020.06.19.10.54.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jun 2020 10:54:33 -0700 (PDT)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a77970: add RPC pins, groups, and
 functions
To:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org
References: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <3982785f-4fca-96f9-2b6a-a0d1828cb0ad@cogentembedded.com>
Date:   Fri, 19 Jun 2020 20:54:32 +0300
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

Add the RPC pins/groups/functions to the R8A77970 PFC driver.
They can be used if an Octal-SPI flash or HyperFlash is connected.

Based on the patch by Dmitry Shifrin <dmitry.shifrin@cogentembedded.com>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
The patch is against the 'sh-pfc' branch of Geert's 'renesas-drivers.git' repo.

Changes in version 2:
- fixed up the initializer for rpc_ctrl_mux[];
- added Geert's tag.

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
+	QSPI0_SSL_MARK, QSPI1_SSL_MARK,
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
