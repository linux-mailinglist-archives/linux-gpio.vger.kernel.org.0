Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 930A374A8B
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jul 2019 11:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390868AbfGYJ4x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Jul 2019 05:56:53 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38799 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390848AbfGYJ4w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jul 2019 05:56:52 -0400
Received: by mail-pl1-f196.google.com with SMTP id az7so23199608plb.5
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jul 2019 02:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=wGIOx2ZODgRgyhhgae8GNFfwXxuLnbwMBvSKjL+qA8U=;
        b=Dg8+eY6sEeX4Svfxq3ZXeCAVFwUSOvLkr2TZslK6hNH9VYkcyJFgk2U7Bb/EhInHst
         2HasqGVvHwaBOJ7tyZw4POF7h+pTlFidhFdxxMwXZUGV//dP8TgYaUt72RJGLgw79AbA
         /eeXLcz/8U8fgo/BkmWee/JRAOt931a7OJOE4X70Bt6pKU4v3dz4njo2bMujfbd5xPHU
         fNMlFYDC5CjGg5sI29HjWYXLlJa36VtEGHhsXXkqKrJ2N/z4KDMy5en9fe8RxHoIpHuM
         fB2KSlGOQjcpdle8iYfFOYWJKt6ML6GaxA3AfpgLZUdiVaULtwVCZLjlbx5IDYJw7o5X
         Nnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=wGIOx2ZODgRgyhhgae8GNFfwXxuLnbwMBvSKjL+qA8U=;
        b=n3lxMOheMCt0LhW07StVPikAnDwrWTafWTxIZmhgMrI14EGbeBRj26akGFwKxDLjIo
         VU3ParRwux8Zg5eOdc6g1ERf35nuHanr33SshLDW2MtOyxYR1ORlDGlbqiK+utV8vfQ1
         rSjfreruRqajeQz0ZmQIW7O/PeiLF5n308MbWRZO/vzKUo+w/0jF9v+EFV8gIFjwzDxV
         5Cn8gQbccrbaeS6oewVm002ftSqjyShZjCYTcln2Oh/7t3ZhitNoXGpGaTSAV4mFYfQr
         2n5o7mzTl06PlcrqM4N+giaeL0mLHIwLXHaxdOq/ZX9SWGei6Lnw1WL8LYwIe/s/h7Tc
         4DlA==
X-Gm-Message-State: APjAAAUAqTm4nN1ptQv0j0T1mGUzVxqNx1SH1nQYg24OtLz6tYtnXURb
        LMS1KLtqi8VUr1XCwfoMcnn+zg==
X-Google-Smtp-Source: APXvYqwBj9/c/LAM6Cz2TVyKyofKrk5bExYMC9nZViMSUk4acnHikg0z3qLrEI5x29+w17fR9KjyVA==
X-Received: by 2002:a17:902:2ec5:: with SMTP id r63mr89047089plb.21.1564048611409;
        Thu, 25 Jul 2019 02:56:51 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id l26sm44006103pgb.90.2019.07.25.02.56.48
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 25 Jul 2019 02:56:51 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     linus.walleij@linaro.org, orsonzhai@gmail.com, zhang.lyra@gmail.com
Cc:     baolin.wang@linaro.org, vincent.guittot@linaro.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: sprd: Combine the condition of MISC_PIN and COMMON_PIN
Date:   Thu, 25 Jul 2019 17:56:31 +0800
Message-Id: <17af5e761e0515d288a7ea4078ac9aa4a82a7a4e.1564048446.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <ff410d312ed0047b5a36e5113daf7df78bcf1aa8.1564048446.git.baolin.wang@linaro.org>
References: <ff410d312ed0047b5a36e5113daf7df78bcf1aa8.1564048446.git.baolin.wang@linaro.org>
In-Reply-To: <ff410d312ed0047b5a36e5113daf7df78bcf1aa8.1564048446.git.baolin.wang@linaro.org>
References: <ff410d312ed0047b5a36e5113daf7df78bcf1aa8.1564048446.git.baolin.wang@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since the follow-up pin design on Spreadtrum platform has some changes,
some configuration of MISC_PIN moved to COMMON_PIN. To support current
pin design and keep backward compatibility, we should combine the
condition of MISC_PIN and COMMON_PIN to configure an individual pin.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/pinctrl/sprd/pinctrl-sprd.c |   19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
index a32e809..5d40bab 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
@@ -454,7 +454,7 @@ static int sprd_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin_id,
 	if (pin->type == GLOBAL_CTRL_PIN &&
 	    param == SPRD_PIN_CONFIG_CONTROL) {
 		arg = reg;
-	} else if (pin->type == COMMON_PIN) {
+	} else if (pin->type == COMMON_PIN || pin->type == MISC_PIN) {
 		switch (param) {
 		case SPRD_PIN_CONFIG_SLEEP_MODE:
 			arg = (reg >> SLEEP_MODE_SHIFT) & SLEEP_MODE_MASK;
@@ -465,14 +465,6 @@ static int sprd_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin_id,
 		case PIN_CONFIG_OUTPUT:
 			arg = reg & SLEEP_OUTPUT_MASK;
 			break;
-		case PIN_CONFIG_SLEEP_HARDWARE_STATE:
-			arg = 0;
-			break;
-		default:
-			return -ENOTSUPP;
-		}
-	} else if (pin->type == MISC_PIN) {
-		switch (param) {
 		case PIN_CONFIG_DRIVE_STRENGTH:
 			arg = (reg >> DRIVE_STRENGTH_SHIFT) &
 				DRIVE_STRENGTH_MASK;
@@ -606,7 +598,7 @@ static int sprd_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin_id,
 		if (pin->type == GLOBAL_CTRL_PIN &&
 		    param == SPRD_PIN_CONFIG_CONTROL) {
 			val = arg;
-		} else if (pin->type == COMMON_PIN) {
+		} else if (pin->type == COMMON_PIN || pin->type == MISC_PIN) {
 			switch (param) {
 			case SPRD_PIN_CONFIG_SLEEP_MODE:
 				if (arg & AP_SLEEP)
@@ -639,13 +631,6 @@ static int sprd_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin_id,
 					shift = SLEEP_OUTPUT_SHIFT;
 				}
 				break;
-			case PIN_CONFIG_SLEEP_HARDWARE_STATE:
-				continue;
-			default:
-				return -ENOTSUPP;
-			}
-		} else if (pin->type == MISC_PIN) {
-			switch (param) {
 			case PIN_CONFIG_DRIVE_STRENGTH:
 				if (arg < 2 || arg > 60)
 					return -EINVAL;
-- 
1.7.9.5

