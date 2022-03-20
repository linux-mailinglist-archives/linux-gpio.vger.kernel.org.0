Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF3F4E1AD7
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Mar 2022 10:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243096AbiCTJ1O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 20 Mar 2022 05:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243135AbiCTJ1L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Mar 2022 05:27:11 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 820CB3F338
        for <linux-gpio@vger.kernel.org>; Sun, 20 Mar 2022 02:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=b7ijZZZwtRzxO7
        n6kp5r+RKLP/N56zH/wHWn0zfmhh4=; b=uxmVzY+U7b1BGwWhdX5wf9Z5YkqADU
        EQLr9avVKXqtXYPM99TDaBQ5m3ZRDg8HwpST8TEMj4GF5YRm+zhYpoV+7rBYeLuj
        G1ONDXP4lF783EY9KQGCxNBaAI2vdbz2dqsKFS9JLPvGHJ2DXxXN5Z8YKapfmPaJ
        LiejnE40QoeJk=
Received: (qmail 413092 invoked from network); 20 Mar 2022 10:25:46 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Mar 2022 10:25:46 +0100
X-UD-Smtp-Session: l3s3148p1@6ZT39qLaALggAQnoAFbkANnMMFqLOUjD
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-gpio@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 1/2] pinctrl: renesas: allow up to 10 fields for drive_regs
Date:   Sun, 20 Mar 2022 10:25:41 +0100
Message-Id: <20220320092542.2308-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220320092542.2308-1-wsa+renesas@sang-engineering.com>
References: <20220320092542.2308-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Needed to support E3 and G2E drive regs.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/pinctrl/renesas/sh_pfc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index 2479b4fb9cf9..86cdcb292e23 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -181,7 +181,7 @@ struct pinmux_drive_reg_field {
 
 struct pinmux_drive_reg {
 	u32 reg;
-	const struct pinmux_drive_reg_field fields[8];
+	const struct pinmux_drive_reg_field fields[10];
 };
 
 #define PINMUX_DRIVE_REG(name, r) \
-- 
2.30.2

