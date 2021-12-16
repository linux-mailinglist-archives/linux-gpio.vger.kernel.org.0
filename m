Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF2F47788B
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 17:22:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233360AbhLPQWR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Dec 2021 11:22:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239495AbhLPQWQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Dec 2021 11:22:16 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ACA3C061574
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 08:22:16 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id bt1so8043750lfb.13
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 08:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eh4pCHYG63YtXHQZCJTnWwo2iBYp9kjwNNdMHaucw5Q=;
        b=fPLe2/u42DDLMx0iB16nZYh9AfEYpFp4s0rh8zfujdC2CePA9JZTqXTRWa04yVyTxW
         HscHKgsLTAHi8xckF3aDAKxM4dEOFzP6cDlrhDF9cZpoq8jBCIpy5dWwQCrn7TI4XRog
         7E7+914InnilU9q5yc/iYZApYbFTd8iCdymmJrawOAgbNulgzEtKL3ufm4Gz2rlCnQ7z
         zImCdFy9uRPTxnUxN2zp8wLBHIL/sSK0GLHcusj5qkD1XECIg7ceApYU6/Uceo7PvW7Z
         TbUy0lzy/PT5Zx+dRPgw2PmECGCabB1UTyE2po+MQag46KmtjpfZEl5xzPqPSj6aOQcW
         vPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eh4pCHYG63YtXHQZCJTnWwo2iBYp9kjwNNdMHaucw5Q=;
        b=O3xUryt8d98zbivTc0YwtrO32Qs4EU7vBpnpboAfPObiTgI9mP1mqORgJvKznggpfd
         DU/1CP1aUta18lBQiL41TICbvQ5pTglUb/ec5scHDPuX7lSht/c/R+Yonk0OROXRWCyS
         GwIZbMDNwdHdqyN08WpAu2JYctw+FzXklgrTLQrbwUoV1nznV4IMsxF25VmWqL+KQUno
         +PhMYYsTIK0Ozf293W3t9aEpyDSikH51q9SOp3dnzlGCCsnfHcqF+xiqzu62LcGk37bb
         PzF7ba4JMAeGI8vhbiycrsUBKZ0uhDVjEh7gXKZXUDyrwxrkgimNvfQKeLEBk6Bhl+RU
         U8Eg==
X-Gm-Message-State: AOAM531IDq1g6zh3xe+PzSICFkMoljS61hG3oSNevYhhjTM6accDNw29
        Kjn0kh0AtjmDfIJS5Rs3ULg=
X-Google-Smtp-Source: ABdhPJxMjbzMoRUBrzIg94c1Lw32sycpZUKjsGYCnfQFZX3Qb970kRzwEpOc8A2H2v43VveauqE8LQ==
X-Received: by 2002:a05:6512:3a91:: with SMTP id q17mr14672499lfu.425.1639671734417;
        Thu, 16 Dec 2021 08:22:14 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id s13sm938623lfg.126.2021.12.16.08.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 08:22:14 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 2/4] pinctrl: keembay: comment process of building functions a bit
Date:   Thu, 16 Dec 2021 17:22:04 +0100
Message-Id: <20211216162206.8027-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216162206.8027-1-zajec5@gmail.com>
References: <20211216162206.8027-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This should make code a bit easier to follow. While at it use some "for"
loops to simplify array iteration loops.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/pinctrl/pinctrl-keembay.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 2bce563d5b8b..9a602abad8df 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1617,37 +1617,38 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 	struct function_desc *keembay_funcs, *new_funcs;
 	int i;
 
-	/* Allocate total number of functions */
+	/*
+	 * Allocate maximum possible number of functions. Assume every pin
+	 * being part of 8 (hw maximum) globally unique muxes.
+	 */
 	kpc->nfuncs = 0;
 	keembay_funcs = kcalloc(kpc->npins * 8, sizeof(*keembay_funcs), GFP_KERNEL);
 	if (!keembay_funcs)
 		return -ENOMEM;
 
-	/* Find total number of functions and each's properties */
+	/* Setup 1 function for each unique mux */
 	for (i = 0; i < kpc->npins; i++) {
 		const struct pinctrl_pin_desc *pdesc = keembay_pins + i;
-		struct keembay_mux_desc *mux = pdesc->drv_data;
+		struct keembay_mux_desc *mux;
 
-		while (mux->name) {
-			struct function_desc *fdesc = keembay_funcs;
+		for (mux = pdesc->drv_data; mux->name; mux++) {
+			struct function_desc *fdesc;
 
-			while (fdesc->name) {
+			/* Check if we already have function for this mux */
+			for (fdesc = keembay_funcs; fdesc->name; fdesc++) {
 				if (!strcmp(mux->name, fdesc->name)) {
 					fdesc->num_group_names++;
 					break;
 				}
-
-				fdesc++;
 			}
 
+			/* Setup new function for this mux we didn't see before */
 			if (!fdesc->name) {
 				fdesc->name = mux->name;
 				fdesc->num_group_names = 1;
 				fdesc->data = &mux->mode;
 				kpc->nfuncs++;
 			}
-
-			mux++;
 		}
 	}
 
-- 
2.31.1

