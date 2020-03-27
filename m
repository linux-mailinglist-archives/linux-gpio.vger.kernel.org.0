Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 654311955E7
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 12:03:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbgC0LDk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 07:03:40 -0400
Received: from inva021.nxp.com ([92.121.34.21]:54320 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726901AbgC0LDk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 27 Mar 2020 07:03:40 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6F43F200D58;
        Fri, 27 Mar 2020 12:03:38 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 56A17200D57;
        Fri, 27 Mar 2020 12:03:24 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 93FBC40294;
        Fri, 27 Mar 2020 19:03:10 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux@roeck-us.net,
        gregkh@linuxfoundation.org, peng.fan@nxp.com, fugang.duan@nxp.com,
        krzk@kernel.org, bjorn.andersson@linaro.org, leoyang.li@nxp.com,
        olof@lixom.net, dinguyen@kernel.org, geert+renesas@glider.be,
        marcin.juszkiewicz@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH 3/3] arm64: defconfig: Enable CONFIG_PINCTRL_IMX8DXL by default
Date:   Fri, 27 Mar 2020 18:55:59 +0800
Message-Id: <1585306559-13973-3-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585306559-13973-1-git-send-email-Anson.Huang@nxp.com>
References: <1585306559-13973-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Enable CONFIG_PINCTRL_IMX8DXL by default to support i.MX8DXL
pinctrl driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index ac87184..04a5aec 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -449,6 +449,7 @@ CONFIG_PINCTRL_IMX8MN=y
 CONFIG_PINCTRL_IMX8MP=y
 CONFIG_PINCTRL_IMX8MQ=y
 CONFIG_PINCTRL_IMX8QXP=y
+CONFIG_PINCTRL_IMX8DXL=y
 CONFIG_PINCTRL_IPQ8074=y
 CONFIG_PINCTRL_IPQ6018=y
 CONFIG_PINCTRL_MSM8916=y
-- 
2.7.4

