Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C17C4F5D5C
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Apr 2022 14:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232197AbiDFMKj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Apr 2022 08:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbiDFMKa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Apr 2022 08:10:30 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D9F491544A2;
        Wed,  6 Apr 2022 00:53:37 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,239,1643641200"; 
   d="scan'208";a="115880851"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Apr 2022 16:53:37 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A2A75400F941;
        Wed,  6 Apr 2022 16:53:35 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] pinctrl: renesas: Kconfig: Select PINCTRL_RZG2L if ARCH_RZG2L is enabled
Date:   Wed,  6 Apr 2022 08:53:18 +0100
Message-Id: <20220406075318.14385-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GPIO (PINCTRL) block is identical on Renesas RZ/G2L, RZ/G2UL and RZ/V2L
SoC's, so instead of selecting PINCTRL_RZG2L config for each SoC select
PINCTRL_RZG2L config option if ARCH_RZG2L is enabled. The ARCH_RZG2L
config option is already selected by ARCH_R9A07G043, ARCH_R9A07G044 and
ARCH_R9A07G054.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/Kconfig b/drivers/pinctrl/renesas/Kconfig
index 6b38720c56e3..217c8ca9896a 100644
--- a/drivers/pinctrl/renesas/Kconfig
+++ b/drivers/pinctrl/renesas/Kconfig
@@ -38,8 +38,7 @@ config PINCTRL_RENESAS
 	select PINCTRL_PFC_R8A77995 if ARCH_R8A77995
 	select PINCTRL_PFC_R8A779A0 if ARCH_R8A779A0
 	select PINCTRL_PFC_R8A779F0 if ARCH_R8A779F0
-	select PINCTRL_RZG2L if ARCH_R9A07G044
-	select PINCTRL_RZG2L if ARCH_R9A07G054
+	select PINCTRL_RZG2L if ARCH_RZG2L
 	select PINCTRL_PFC_SH7203 if CPU_SUBTYPE_SH7203
 	select PINCTRL_PFC_SH7264 if CPU_SUBTYPE_SH7264
 	select PINCTRL_PFC_SH7269 if CPU_SUBTYPE_SH7269
-- 
2.17.1

