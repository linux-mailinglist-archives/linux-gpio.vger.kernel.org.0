Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21D2D268327
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 05:36:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbgINDgP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Sep 2020 23:36:15 -0400
Received: from inva020.nxp.com ([92.121.34.13]:60364 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725995AbgINDgO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 13 Sep 2020 23:36:14 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 079CD1A04D4;
        Mon, 14 Sep 2020 05:36:10 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 473031A01C9;
        Mon, 14 Sep 2020 05:35:59 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 5617440305;
        Mon, 14 Sep 2020 05:35:46 +0200 (CEST)
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
Subject: [PATCH V2 RESEND 4/4] ARM: multi_v7_defconfig: Build in CONFIG_GPIO_MXC by default
Date:   Mon, 14 Sep 2020 11:29:07 +0800
Message-Id: <1600054147-29997-4-git-send-email-Anson.Huang@nxp.com>
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
new patch.
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index bfaa38c..d2744ff 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -465,6 +465,7 @@ CONFIG_GPIO_PALMAS=y
 CONFIG_GPIO_TPS6586X=y
 CONFIG_GPIO_TPS65910=y
 CONFIG_GPIO_TWL4030=y
+CONFIG_GPIO_MXC=y
 CONFIG_POWER_AVS=y
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_POWER_RESET_AS3722=y
-- 
2.7.4

