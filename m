Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 906274E18C2
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Mar 2022 22:57:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244271AbiCSV6n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 19 Mar 2022 17:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239515AbiCSV6m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 19 Mar 2022 17:58:42 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E69B3260C73
        for <linux-gpio@vger.kernel.org>; Sat, 19 Mar 2022 14:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=FtnBv3NwSYnAwC
        XCzYASJ4qK/5v+QADuDK1OAuRHufE=; b=E1IkDHUPe+tNp8Jf0X/rwKSC2CHzqu
        DKWcXCfAw0FQTbzj6wfaglRKgEywYWOQxaLhJ1XQZEn+FZHCQchPdKyOqqwfpZ+7
        vcaXp1TMoFIKLieprURpxTxVDDAyooZDAgIWkZVB3DU4J8CYDn4Mm4iOkBgi/7hs
        VpOqqew+ruRQs=
Received: (qmail 244822 invoked from network); 19 Mar 2022 22:57:17 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2022 22:57:17 +0100
X-UD-Smtp-Session: l3s3148p1@dLK6WJnaotwgAQnoAFEUAKkXZRZ8X9Wv
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-gpio@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2] pinctrl: renesas: allow up to 10 fields for drive_regs
Date:   Sat, 19 Mar 2022 22:57:05 +0100
Message-Id: <20220319215706.59519-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220319215706.59519-1-wsa+renesas@sang-engineering.com>
References: <20220319215706.59519-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Needed to support E3 drive regs.

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

