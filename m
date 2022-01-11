Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A21B48B3DD
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 18:29:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238643AbiAKR33 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 12:29:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbiAKR32 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jan 2022 12:29:28 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FAA8C06173F
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 09:29:28 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id m1so25701667lfq.4
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 09:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A/lqVOvGA++8W4hO5PDtAtBCM97Mb6RUpmetiApD52E=;
        b=AaHtecbG/2KMZF5v8kWYvTeXQIJrdb8nEsmXPAgBxgK74EtPQHqeHK1splOgYA/6li
         4M5pYtD7LShp+y3i2ujmDe0eunToiAFp+EKg+HCcUKsAUtP5XtNT5CtktN63azu7lQWJ
         bQJs41LI2IHCrJG63V4etA8EWJ6SsRY4UiafnXyCkSGcR9AITeu1jItCcYCSeAJuL5N1
         5Auxn9p5400CRA2C1mxEmIL8WdlZ6ba82uk40tjsgChoVeoGfG+Bo6RgaLf4L3fZkk8d
         gwtj8OOhviCMFa9gKp5vW9yd+6DEghk70wJI+a4ciHxZUA9NwjRsLiUyIpWIsQVUNCPG
         TBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A/lqVOvGA++8W4hO5PDtAtBCM97Mb6RUpmetiApD52E=;
        b=pwcoRS5iYqvj6TamlaN/sMPdvAGs5YDFiKyjxAcFxZRMTCtuTuOwmtez1XGUMfJHL4
         8/jy+8+LTXrYROAOUG5PTQbVyT/KnR9SILzf5Iu9amEWxfjqwYUV9HUcU3Mtde2j8gl4
         NlgKK3XmYCfh36hopMe93N3zDo4J+2bobAkALkvPJNdzXNcqZevJpwxqwigdT1N2YU5J
         ZWxcFrG1sPkTwS1xUiQOyvBzM7TjJOiaOHZK/RCo04aZfYTV/Oy8wgRicGkTsEACxjWl
         s8DV0nnttXgR3+XnYP4E/hHqofA4qkiWaEE6IBRav5BCnkWZopwX6nbIX8m04gLgL7vN
         wZzQ==
X-Gm-Message-State: AOAM530czgDxLmgBm4vb3qLiPhlZ4TQxVtGqdqhkxIQMXEIVdsxKPYhi
        7ySHAq1GxvzbyVS7SjRJheg=
X-Google-Smtp-Source: ABdhPJzMk5CSPawCB3UioCpCkvLH3GQf3Ul59fbjauQKxBFMwORWlw2pXzz07VApPZG/K6kJTXvqpg==
X-Received: by 2002:a2e:7819:: with SMTP id t25mr3578849ljc.455.1641922166605;
        Tue, 11 Jan 2022 09:29:26 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id f3sm107311lfg.52.2022.01.11.09.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:29:26 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
        linux-gpio@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 5.17 1/2] pinctrl: thunderbay: comment process of building functions a bit
Date:   Tue, 11 Jan 2022 18:29:18 +0100
Message-Id: <20220111172919.6567-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This should make code a bit easier to follow. While at it use some "for"
loops to simplify array iteration loops.

Ref: 5d0674999cc5 ("pinctrl: keembay: comment process of building functions a bit")
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/pinctrl/pinctrl-thunderbay.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-thunderbay.c b/drivers/pinctrl/pinctrl-thunderbay.c
index b5b47f4dd774..4756a23ca572 100644
--- a/drivers/pinctrl/pinctrl-thunderbay.c
+++ b/drivers/pinctrl/pinctrl-thunderbay.c
@@ -839,27 +839,30 @@ static int thunderbay_build_functions(struct thunderbay_pinctrl *tpc)
 	void *ptr;
 	int pin;
 
-	/* Total number of functions is unknown at this point. Allocate first. */
+	/*
+	 * Allocate maximum possible number of functions. Assume every pin
+	 * being part of 8 (hw maximum) globally unique muxes.
+	 */
 	tpc->nfuncs = 0;
 	thunderbay_funcs = kcalloc(tpc->soc->npins * 8,
 				   sizeof(*thunderbay_funcs), GFP_KERNEL);
 	if (!thunderbay_funcs)
 		return -ENOMEM;
 
-	/* Find total number of functions and each's properties */
+	/* Setup 1 function for each unique mux */
 	for (pin = 0; pin < tpc->soc->npins; pin++) {
 		const struct pinctrl_pin_desc *pin_info = thunderbay_pins + pin;
-		struct thunderbay_mux_desc *pin_mux = pin_info->drv_data;
+		struct thunderbay_mux_desc *pin_mux;
 
-		while (pin_mux->name) {
-			struct function_desc *func = thunderbay_funcs;
+		for (pin_mux = pin_info->drv_data; pin_mux->name; pin_mux++) {
+			struct function_desc *func;
 
-			while (func->name) {
+			/* Check if we already have function for this mux */
+			for (func = thunderbay_funcs; func->name; func++) {
 				if (!strcmp(pin_mux->name, func->name)) {
 					func->num_group_names++;
 					break;
 				}
-				func++;
 			}
 
 			if (!func->name) {
@@ -868,8 +871,6 @@ static int thunderbay_build_functions(struct thunderbay_pinctrl *tpc)
 				func->data = (int *)&pin_mux->mode;
 				tpc->nfuncs++;
 			}
-
-			pin_mux++;
 		}
 	}
 
-- 
2.31.1

