Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FDEB228DC1
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 03:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731614AbgGVBuL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 21:50:11 -0400
Received: from inva021.nxp.com ([92.121.34.21]:55136 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731713AbgGVBuL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Jul 2020 21:50:11 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 65643200797;
        Wed, 22 Jul 2020 03:50:09 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 39776200795;
        Wed, 22 Jul 2020 03:49:56 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 483AA40319;
        Wed, 22 Jul 2020 09:31:07 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     linux@armlinux.org.uk, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
        will@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, peter.chen@nxp.com,
        oleksandr.suvorov@toradex.com, andreas@kemnade.info,
        peng.fan@nxp.com, hverkuil-cisco@xs4all.nl, olof@lixom.net,
        krzk@kernel.org, alexandre.torgue@st.com, patrice.chotard@st.com,
        arnd@arndb.de, m.szyprowski@samsung.com, joel@jms.id.au,
        lkundrak@v3.sk, christian.gmeiner@gmail.com,
        bjorn.andersson@linaro.org, leoyang.li@nxp.com,
        geert+renesas@glider.be, michael@walle.cc,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V2 2/4] arm64: defconfig: Build in CONFIG_GPIO_MXC by default
Date:   Wed, 22 Jul 2020 09:45:51 +0800
Message-Id: <1595382353-17486-2-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595382353-17486-1-git-send-email-Anson.Huang@nxp.com>
References: <1595382353-17486-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

i.MX GPIO is NOT default enabled now, so select CONFIG_GPIO_MXC
as built-in manually.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No change.
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 070c7e3..43b2bfd 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -500,6 +500,7 @@ CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_PCA953X_IRQ=y
 CONFIG_GPIO_BD9571MWV=m
 CONFIG_GPIO_MAX77620=y
+CONFIG_GPIO_MXC=y
 CONFIG_POWER_AVS=y
 CONFIG_QCOM_CPR=y
 CONFIG_ROCKCHIP_IODOMAIN=y
-- 
2.7.4

