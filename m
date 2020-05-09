Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9901CC070
	for <lists+linux-gpio@lfdr.de>; Sat,  9 May 2020 12:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbgEIKk3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 May 2020 06:40:29 -0400
Received: from inva021.nxp.com ([92.121.34.21]:44440 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728204AbgEIKk2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 9 May 2020 06:40:28 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8B50E200331;
        Sat,  9 May 2020 12:40:26 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1DD4520032C;
        Sat,  9 May 2020 12:40:23 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 75F4C402DB;
        Sat,  9 May 2020 18:40:18 +0800 (SGT)
From:   Hui Song <hui.song_1@nxp.com>
To:     jagdish.gediya@nxp.com, priyanka.jain@nxp.com,
        pramod.kumar_1@nxp.com
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        "hui.song" <hui.song_1@nxp.com>
Subject: [PATCH v1 3/3] dm: armv8: gpio: include <asm/arch/gpio.h> for fsl-layerscape
Date:   Sat,  9 May 2020 18:35:37 +0800
Message-Id: <20200509103537.22865-3-hui.song_1@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200509103537.22865-1-hui.song_1@nxp.com>
References: <20200509103537.22865-1-hui.song_1@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: "hui.song" <hui.song_1@nxp.com>

Enable the gpio feature on fsl-layerscape platform.

Signed-off-by: hui.song <hui.song_1@nxp.com>
---
 arch/arm/include/asm/gpio.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm/include/asm/gpio.h b/arch/arm/include/asm/gpio.h
index 333e407b66..7715a01706 100644
--- a/arch/arm/include/asm/gpio.h
+++ b/arch/arm/include/asm/gpio.h
@@ -1,12 +1,8 @@
 #if !defined(CONFIG_ARCH_UNIPHIER) && !defined(CONFIG_ARCH_STI) && \
 	!defined(CONFIG_ARCH_K3) && !defined(CONFIG_ARCH_BCM68360) && \
 	!defined(CONFIG_ARCH_BCM6858) && !defined(CONFIG_ARCH_BCM63158) && \
-	!defined(CONFIG_ARCH_ROCKCHIP) && !defined(CONFIG_ARCH_LX2160A) && \
-	!defined(CONFIG_ARCH_LS1028A) && !defined(CONFIG_ARCH_LS2080A) && \
-	!defined(CONFIG_ARCH_LS1088A) && !defined(CONFIG_ARCH_ASPEED) && \
-	!defined(CONFIG_ARCH_LS1012A) && !defined(CONFIG_ARCH_LS1043A) && \
-	!defined(CONFIG_ARCH_LS1046A) && !defined(CONFIG_ARCH_U8500) && \
-	!defined(CONFIG_CORTINA_PLATFORM)
+	!defined(CONFIG_ARCH_ROCKCHIP) && !defined(CONFIG_ARCH_ASPEED) && \
+	!defined(CONFIG_ARCH_U8500) && !defined(CONFIG_CORTINA_PLATFORM)
 #include <asm/arch/gpio.h>
 #endif
 #include <asm-generic/gpio.h>
-- 
2.17.1

