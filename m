Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9C8B268322
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 05:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgINDgJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Sep 2020 23:36:09 -0400
Received: from inva021.nxp.com ([92.121.34.21]:56118 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725973AbgINDgH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 13 Sep 2020 23:36:07 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1322020084F;
        Mon, 14 Sep 2020 05:36:05 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 31B1B200342;
        Mon, 14 Sep 2020 05:35:54 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 008174030D;
        Mon, 14 Sep 2020 05:35:40 +0200 (CEST)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     linux@armlinux.org.uk, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
        will@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, oleksandr.suvorov@toradex.com,
        peng.fan@nxp.com, andreas@kemnade.info, hverkuil-cisco@xs4all.nl,
        olof@lixom.net, krzk@kernel.org, geert+renesas@glider.be,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aisheng.dong@nxp.com,
        lkundrak@v3.sk, joel@jms.id.au, bjorn.andersson@linaro.org,
        leoyang.li@nxp.com, vkoul@kernel.org, michael@walle.cc,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V2 RESEND 2/4] arm64: defconfig: Build in CONFIG_GPIO_MXC by default
Date:   Mon, 14 Sep 2020 11:29:05 +0800
Message-Id: <1600054147-29997-2-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600054147-29997-1-git-send-email-Anson.Huang@nxp.com>
References: <1600054147-29997-1-git-send-email-Anson.Huang@nxp.com>
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
index 63003ec..c8fca1a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -510,6 +510,7 @@ CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_PCA953X_IRQ=y
 CONFIG_GPIO_BD9571MWV=m
 CONFIG_GPIO_MAX77620=y
+CONFIG_GPIO_MXC=y
 CONFIG_POWER_AVS=y
 CONFIG_QCOM_CPR=y
 CONFIG_ROCKCHIP_IODOMAIN=y
-- 
2.7.4

