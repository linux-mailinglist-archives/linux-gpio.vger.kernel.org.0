Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF0145E24E
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 22:18:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357437AbhKYVVN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 16:21:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbhKYVTL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 16:19:11 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9127EC061785;
        Thu, 25 Nov 2021 13:15:07 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id 193so12907728qkh.10;
        Thu, 25 Nov 2021 13:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ydk5E0AUMZP3msFnqmvRmoHq6yWf+2tROGqOJqYlTaQ=;
        b=F0gF3VDSm7pE4dKVZX8qSU9zHT7w4QsKddKR0ccefqC702EfpFw6j+JTe2gSq1dlE/
         kHllhoDAE9189pqshE+n/b1fLdQoUyVu4DCgpFDpQsynoc7C8oaW1VRjZQI9jgzlzrgo
         /BQ9uLrxDBGrMAoTly1IGwAc3fu5W1srhHjHegn8/fO4dVj6lHuY7b/Isjemb+QYgwog
         g2WbWhijdHCazqGg/G19Bvb8bDEjQKkXvSqkyiW63JtMm4ijmQAE0S4CSYi3WB18vNNG
         J4reLj8heiGMpzKqolQo0hLlDiZf/ajtZCoqD66fDtlJzEabYsmR9Uao39MLw1Y9EvNa
         ct/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ydk5E0AUMZP3msFnqmvRmoHq6yWf+2tROGqOJqYlTaQ=;
        b=44FMxUiz3TISS/PPYZFUr/1T4RYHWC7lxrT5t94TIgsD0PSNGUWSGDOt6oiefVTyz2
         +ZVIYHZzInHOlZFZ75yXPMEMWKfsTaaNc1pS1OVvTdYWJdbuLRypIbvTcq4iQ17q4s8M
         AnwBiRQE59Cku3H59dDBD5vQROnpK1HKqtXVu46ZW3QImN7sAVRB5VxIOFCLp87fIo6N
         J3zG+ccS+GznFrRnSQRAo4tjfjVr2OgNtMQ6wwCu9D2udLZhisdeSvYC7tqE61+ZPJPS
         RpamS3gAJKF5U2jD2GVOhq2Ll6xhiKbu7Fv76+HqtpOv6cx8bFom4I8SnNlcODCzPZLS
         BX8Q==
X-Gm-Message-State: AOAM531ryri8AhIQJ+37BY5sIQTc7vLIlBxJZD3BbbjUmmVq3krEOeiP
        7GNB3UvypYKqW/hfzsY3PC8=
X-Google-Smtp-Source: ABdhPJyXOygJCkPcuw0sa/BVi11id4uMnZCU+DLV+8kp7MmLhOabQsj8Q6Kg9yx8bobfUak3xlcmgw==
X-Received: by 2002:a05:620a:191a:: with SMTP id bj26mr18475683qkb.37.1637874906775;
        Thu, 25 Nov 2021 13:15:06 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id j22sm2068175qko.68.2021.11.25.13.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 13:15:06 -0800 (PST)
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
Subject: [PATCH v3 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for i.MXRT series
Date:   Thu, 25 Nov 2021 16:14:41 -0500
Message-Id: <20211125211443.1150135-12-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Jesse Taube <mr.bossman075@gmail.com>

Add support for i.MXRT1050's sdhc.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1->V2:
* Nothing done
V2->V3:
* Rename imxrt to imxrt1050
* Remove BROKEN_AUTO_CMD23 and MAN_TUNING flags
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index 764ee1b761d9..55981b0f0b10 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -305,6 +305,9 @@ static struct esdhc_soc_data usdhc_imx7ulp_data = {
 			| ESDHC_FLAG_PMQOS | ESDHC_FLAG_HS400
 			| ESDHC_FLAG_STATE_LOST_IN_LPMODE,
 };
+static struct esdhc_soc_data usdhc_imxrt1050_data = {
+	.flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_HS200 | ESDHC_FLAG_ERR004536,
+};
 
 static struct esdhc_soc_data usdhc_imx8qxp_data = {
 	.flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_STD_TUNING
@@ -355,6 +358,7 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
 	{ .compatible = "fsl,imx7ulp-usdhc", .data = &usdhc_imx7ulp_data, },
 	{ .compatible = "fsl,imx8qxp-usdhc", .data = &usdhc_imx8qxp_data, },
 	{ .compatible = "fsl,imx8mm-usdhc", .data = &usdhc_imx8mm_data, },
+	{ .compatible = "fsl,imxrt1050-usdhc", .data = &usdhc_imxrt1050_data, },
 	{ .compatible = "nxp,s32g2-usdhc", .data = &usdhc_s32g2_data, },
 	{ /* sentinel */ }
 };
-- 
2.34.0

