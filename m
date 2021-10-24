Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA6A2438A4F
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 17:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbhJXPoN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 11:44:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232532AbhJXPng (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 11:43:36 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E5E7C061224;
        Sun, 24 Oct 2021 08:40:53 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id i1so8148849qtr.6;
        Sun, 24 Oct 2021 08:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fG7/U26JTr2Go8waG37i/rnBfZKJjV/c/9+8XoMI6dY=;
        b=Nq+do2nPPMzN5qL2FehSoU59KbwnTZaV4tDSRuu7xgPg612txv/xyobFSEZEYrv5XB
         I/yKStecPVuyJSP94SsOnV8xmNV6avy3mBbdQ4Lqo9iha8loWGek8cIMXn1AeoroHU6q
         VgTVI51VvVk5m02iq2FpYQL+WBtvKm0c/QYNj2ML44pYbwGpIRU1o75Ia3uRwYYAyy3R
         IFI8A4SFAxR8Ai2iCVQ9r+dkz/Nijxt+4bqQ/t/KSS62Xppyu73H78r/5TmBbI2ahjsy
         zLV4qE+eWpb8Ssuu7iLUNiT33P145h/t4KZLOY6LIGVrQ1t2ukzoj9TDYpt7IEW3up/C
         7UTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fG7/U26JTr2Go8waG37i/rnBfZKJjV/c/9+8XoMI6dY=;
        b=3ZuUXdJOFGS1WAU5KYNcR4h/ezA1zVMIxSmwiyMSfFCywWdPNNphCBUkY3+sh/FKVG
         kEjxPQmdR5VorkCL3OFGDbmKA3Rp3vu3in+pMOigLBSqEhsQitp96n0zKxyZvuQR0C7s
         MGLPT8s5DmJ7Y69AWjE1Ka3s+G3svHRuSWR5W8pTnxNkStL54+JQTk1G11XLjT8WMz1r
         ehMgiIE0brOHpEQxTou6Hr1Mw+B2L8CGl5TDovG0tR/elD/IgLH1ErIjkwEDc0CrRGHD
         d2mt1RqRmJmvD+Of5EPircXxPSsY2bQ2al/frLMyb+Gyzu0Ak7uGeOBun/MUlV8PedYq
         OsWQ==
X-Gm-Message-State: AOAM533F2t0Utq55/0DDsP28yreea6DQa7i5XQB7heZ+C4mqqW+ylRsZ
        JlEAAaG+vGX4hnCSJ4NluOM=
X-Google-Smtp-Source: ABdhPJwRmqhGlfNx6aKDhywa9RXPVYJjtt/UNCf6mMnXbQveLNJSk4xkLkdH6NUK1YIaVi843OT8ig==
X-Received: by 2002:a05:622a:1a8c:: with SMTP id s12mr12121146qtc.303.1635090052549;
        Sun, 24 Oct 2021 08:40:52 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id x9sm7291731qtw.84.2021.10.24.08.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 08:40:52 -0700 (PDT)
From:   Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To:     linux-imx@nxp.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
        stefan@agner.ch, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
        adrian.hunter@intel.com, jirislaby@kernel.org,
        giulio.benetti@benettiengineering.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, leonard.crestez@nxp.com,
        b20788@freescale.com, Mr.Bossman075@gmail.com, fugang.duan@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH 09/13] tty: serial: fsl_lpuart: add i.MXRT support
Date:   Sun, 24 Oct 2021 11:40:23 -0400
Message-Id: <20211024154027.1479261-10-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for i.MXRT1050's uart.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 drivers/tty/serial/fsl_lpuart.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index b1e7190ae483..1db083905d75 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -247,6 +247,7 @@ enum lpuart_type {
 	LS1028A_LPUART,
 	IMX7ULP_LPUART,
 	IMX8QXP_LPUART,
+	IMXRT_LPUART,
 };
 
 struct lpuart_port {
@@ -310,6 +311,11 @@ static struct lpuart_soc_data imx8qxp_data = {
 	.iotype = UPIO_MEM32,
 	.reg_off = IMX_REG_OFF,
 };
+static struct lpuart_soc_data imxrt_data = {
+	.devtype = IMXRT_LPUART,
+	.iotype = UPIO_MEM32,
+	.reg_off = IMX_REG_OFF,
+};
 
 static const struct of_device_id lpuart_dt_ids[] = {
 	{ .compatible = "fsl,vf610-lpuart",	.data = &vf_data, },
@@ -317,6 +323,7 @@ static const struct of_device_id lpuart_dt_ids[] = {
 	{ .compatible = "fsl,ls1028a-lpuart",	.data = &ls1028a_data, },
 	{ .compatible = "fsl,imx7ulp-lpuart",	.data = &imx7ulp_data, },
 	{ .compatible = "fsl,imx8qxp-lpuart",	.data = &imx8qxp_data, },
+	{ .compatible = "fsl,imxrt-lpuart",	.data = &imxrt_data},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, lpuart_dt_ids);
@@ -2625,6 +2632,7 @@ OF_EARLYCON_DECLARE(lpuart, "fsl,vf610-lpuart", lpuart_early_console_setup);
 OF_EARLYCON_DECLARE(lpuart32, "fsl,ls1021a-lpuart", lpuart32_early_console_setup);
 OF_EARLYCON_DECLARE(lpuart32, "fsl,ls1028a-lpuart", ls1028a_early_console_setup);
 OF_EARLYCON_DECLARE(lpuart32, "fsl,imx7ulp-lpuart", lpuart32_imx_early_console_setup);
+OF_EARLYCON_DECLARE(lpuart32, "fsl,imxrt-lpuart", lpuart32_imx_early_console_setup);
 EARLYCON_DECLARE(lpuart, lpuart_early_console_setup);
 EARLYCON_DECLARE(lpuart32, lpuart32_early_console_setup);
 
-- 
2.33.0

