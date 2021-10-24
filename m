Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFCF2438A5F
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 17:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232177AbhJXPop (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 11:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232176AbhJXPoB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 11:44:01 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 876DBC0432C3;
        Sun, 24 Oct 2021 08:40:58 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id x123so9573749qke.7;
        Sun, 24 Oct 2021 08:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m7AY/039Zo+SJm52UkUHM4qnGfgD3YDnvZFqJ9CqE+I=;
        b=l0ybfp8Xz7UhYd4KhZAtki8ids+oNLK3rv9wyQnv56yvPLJY+SShX/YG2MtwRU8Iem
         KO+ywrb2oJAAoqbVLYT3eBeQMNB6zF2k2Sh1set7BHjMon7uMEcv4KQKj17SzsPgEvlk
         O32hQSZls0RKG3YuXps5DBm0yGz3jGXg4npbjfSOQp66ed8SBOZRDk0PERZxmAtEjENi
         5lWa0TMS24XEzYTrCYrFvQx5WDCgiwOazb6xW2pwar5nwSoMIE6PqhN6nr3yeJZEVQzE
         HcIAiI6LCxbCOvcbyOxr9xOVIkMYACOqxIFxQ2O6ee5N6znm7nvo7VmVT7cd3+a5ttEz
         7VvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m7AY/039Zo+SJm52UkUHM4qnGfgD3YDnvZFqJ9CqE+I=;
        b=s20YypCwP3Q8qHgP19YDdH3ae6M/rpTCOYakQ2XdH1Kph17756fYEVUdiIgV4W/9Au
         0Bpwf9ZUnJ3GSrah994qwR6nXrOdthFwTFvqdfsMOgBErSg3dz5d33TtR7mcHRwYUV0k
         tSf/4oGxq+EHDllviYdFP9VLXDv2OznKgnuMEpqu9vLZQmyEoNJQpJ3ccAlpmF5FWqrB
         XOP7MJ/YJOLEL+8dgKQejdlxR9ZPSvklU8a7ttFEXZNc/haGBr109e7/0/GHDBQXLlRP
         OU7mbXrZyIT0jQJOGwwmMjdADcA//iliDegEUBYhxjhYLiEa7B5k9H05EAJqHIaebuwW
         PhOA==
X-Gm-Message-State: AOAM532j+g/MAwFlmHi5IayMXdtu43ODhR31mBGID1rNMFoSroWwh2dE
        wvqkgLQP98nguCxySZOiaFs=
X-Google-Smtp-Source: ABdhPJy8xNszH11yizp1S2U6BFqMIm1GKFkIUDdizYRWliK/G7EWtcMvLalGsRme2xf/HAeY3O+lUw==
X-Received: by 2002:a37:8a44:: with SMTP id m65mr9408463qkd.72.1635090057740;
        Sun, 24 Oct 2021 08:40:57 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id x9sm7291731qtw.84.2021.10.24.08.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 08:40:57 -0700 (PDT)
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
Subject: [PATCH 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for i.MXRT series
Date:   Sun, 24 Oct 2021 11:40:25 -0400
Message-Id: <20211024154027.1479261-12-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for i.MXRT1050's sdhc.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index f18d169bc8ff..a112c3641560 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -295,6 +295,12 @@ static struct esdhc_soc_data usdhc_imx7ulp_data = {
 			| ESDHC_FLAG_PMQOS | ESDHC_FLAG_HS400
 			| ESDHC_FLAG_STATE_LOST_IN_LPMODE,
 };
+static struct esdhc_soc_data usdhc_imxrt_data = {
+	.flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_MAN_TUNING
+			| ESDHC_FLAG_HS200 | ESDHC_FLAG_ERR004536
+			| ESDHC_FLAG_BROKEN_AUTO_CMD23,
+};
+
 
 static struct esdhc_soc_data usdhc_imx8qxp_data = {
 	.flags = ESDHC_FLAG_USDHC | ESDHC_FLAG_STD_TUNING
@@ -347,6 +353,7 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
 	{ .compatible = "fsl,imx7ulp-usdhc", .data = &usdhc_imx7ulp_data, },
 	{ .compatible = "fsl,imx8qxp-usdhc", .data = &usdhc_imx8qxp_data, },
 	{ .compatible = "fsl,imx8mm-usdhc", .data = &usdhc_imx8mm_data, },
+	{ .compatible = "fsl,imxrt-usdhc", .data = &usdhc_imxrt_data, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, imx_esdhc_dt_ids);
-- 
2.33.0

