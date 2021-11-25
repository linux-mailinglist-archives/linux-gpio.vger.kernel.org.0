Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A731E45E23E
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 22:18:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357386AbhKYVVF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 16:21:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356953AbhKYVTE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 16:19:04 -0500
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84475C0613FF;
        Thu, 25 Nov 2021 13:15:03 -0800 (PST)
Received: by mail-qv1-xf34.google.com with SMTP id a24so5600923qvb.5;
        Thu, 25 Nov 2021 13:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0JRLJYcXhrRDBJKcmXD2oBmy6Smq5NLEEE+jpKeaTQI=;
        b=ayiajLyqzIPTbCHpYFE1SobpZRGlIBCDMQZ6RoHtdG5Pd37d8/IekvcM7HUxV7bHn1
         23kogyCN9TYxZRAHGs1OE+0jKmUjrOLcUYCTTjRHhRmanvW5v3ucCjr6aegauJmInzV8
         qlockAnccpJdiziY/WBnvjlI4vK2SZV7+3o5oCGstD5L6orPrD8ewS2srHYNi/nKwyVn
         5rPQBKSwvginPTpL6GdyJfjOYi9+q8sIjMwIjPZOwTF1/22IKg0S0SVuVpK2rc645775
         DTNzNgj4TRJTr5RhKK1W0gPaRY2Nldix/TWKGdVpMXH+BUzVTSmrBYzAi6X8/2dLLgNj
         sBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0JRLJYcXhrRDBJKcmXD2oBmy6Smq5NLEEE+jpKeaTQI=;
        b=S0XQOAoJcCjmo52dxCXiz/+ALrw/b1PEGjbbMU/r7N3syP3TstNuEeqrWiro0YBj61
         yzmwEn8X1nIpdfvd5lbrS2i0FyPPNBOA4XL5pMmds+d5An3gtXFl0VBFIV4P9IKZMO8c
         0kGVWB8CINEcGByRgssc6xflIHecnjGfBQxLEgqpXAFKHzkzUJzpDdoItNSvOAW7n3HG
         IjWzMCSCuAELQ36Sy6Npmzlmf3CizUJku/sl921YHzEIpTIKRgcwThkvXwd7/x8aKEJN
         xO2MGAeRnppFK0hJF2/G+933LeL5FCnUrrXzWLaORfhjApN64Xp106FcnCJFEYCqkFCq
         M9qA==
X-Gm-Message-State: AOAM530rsnhx5yp8IZyvidE+RBdDEXe9sssmrdK5sZIoaDJMsxyQZPl3
        GshqtUSQdzu5GYJ1jpuXeLU=
X-Google-Smtp-Source: ABdhPJymL+1A7frhrmMGWXzMvIs4AYDhLZD6/fPrF5GhvkDZOAMnhWK/bEqQTwFmsCUrgBjVxw1cjg==
X-Received: by 2002:a05:6214:27c6:: with SMTP id ge6mr9473113qvb.103.1637874902745;
        Thu, 25 Nov 2021 13:15:02 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id j22sm2068175qko.68.2021.11.25.13.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 13:15:01 -0800 (PST)
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
        nobuhiro1.iwamatsu@toshiba.co.jp, Mr.Bossman075@gmail.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>
Subject: [PATCH v3 09/13] tty: serial: fsl_lpuart: add i.MXRT support
Date:   Thu, 25 Nov 2021 16:14:39 -0500
Message-Id: <20211125211443.1150135-10-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Jesse Taube <mr.bossman075@gmail.com>

Add support for i.MXRT1050's uart.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1->V2:
* Nothing done
V2->V3:
* Rename imxrt to imxrt1050
---
 drivers/tty/serial/fsl_lpuart.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index b1e7190ae483..884bc4e70d70 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -247,6 +247,7 @@ enum lpuart_type {
 	LS1028A_LPUART,
 	IMX7ULP_LPUART,
 	IMX8QXP_LPUART,
+	IMXRT1050_LPUART,
 };
 
 struct lpuart_port {
@@ -310,6 +311,11 @@ static struct lpuart_soc_data imx8qxp_data = {
 	.iotype = UPIO_MEM32,
 	.reg_off = IMX_REG_OFF,
 };
+static struct lpuart_soc_data imxrt1050_data = {
+	.devtype = IMXRT1050_LPUART,
+	.iotype = UPIO_MEM32,
+	.reg_off = IMX_REG_OFF,
+};
 
 static const struct of_device_id lpuart_dt_ids[] = {
 	{ .compatible = "fsl,vf610-lpuart",	.data = &vf_data, },
@@ -317,6 +323,7 @@ static const struct of_device_id lpuart_dt_ids[] = {
 	{ .compatible = "fsl,ls1028a-lpuart",	.data = &ls1028a_data, },
 	{ .compatible = "fsl,imx7ulp-lpuart",	.data = &imx7ulp_data, },
 	{ .compatible = "fsl,imx8qxp-lpuart",	.data = &imx8qxp_data, },
+	{ .compatible = "fsl,imxrt1050-lpuart",	.data = &imxrt1050_data},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, lpuart_dt_ids);
@@ -2625,6 +2632,7 @@ OF_EARLYCON_DECLARE(lpuart, "fsl,vf610-lpuart", lpuart_early_console_setup);
 OF_EARLYCON_DECLARE(lpuart32, "fsl,ls1021a-lpuart", lpuart32_early_console_setup);
 OF_EARLYCON_DECLARE(lpuart32, "fsl,ls1028a-lpuart", ls1028a_early_console_setup);
 OF_EARLYCON_DECLARE(lpuart32, "fsl,imx7ulp-lpuart", lpuart32_imx_early_console_setup);
+OF_EARLYCON_DECLARE(lpuart32, "fsl,imxrt1050-lpuart", lpuart32_imx_early_console_setup);
 EARLYCON_DECLARE(lpuart, lpuart_early_console_setup);
 EARLYCON_DECLARE(lpuart32, lpuart32_early_console_setup);
 
-- 
2.34.0

