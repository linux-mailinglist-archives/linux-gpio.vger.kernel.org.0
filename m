Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15554D90BA
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2019 14:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392964AbfJPMYK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Oct 2019 08:24:10 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45253 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389929AbfJPMYK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2019 08:24:10 -0400
Received: by mail-pf1-f194.google.com with SMTP id y72so14610294pfb.12
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2019 05:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=+fIVE2pqXmvNZ/h0ex8fYRWmPI+5xqtJhNd7JnIp4Rk=;
        b=g39jQVS3/y2/L2bPcgUT8Ogw4rk818hl8LlOcKmLQGWA9XCH6oFwV0a11Tqs0lt7ck
         s4WU7AcLAQVvOyf9MRKvxHA0mmj3YGBtFlB+wPVk3DUD+Wlq0N1sMfjlxuecrkCUB2S4
         I452QXv/LtVz8EUg1vcHnydzKtDbUeQiuEsODeVx69bTKBW2tKmtXyTuohkYF3z5FnFZ
         dmYymMahDcypHUaIRwWF7/kmsJleA3e8x70vvWsqJCBrbayIB5mrPa5AReLfta+xMi0Q
         ZRm2QttGLBcM63uraVxmlB7XcTUrgt/WxIDKgaXKHnq+JkulYv46sDIn3JB6dyNSdlmm
         D13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+fIVE2pqXmvNZ/h0ex8fYRWmPI+5xqtJhNd7JnIp4Rk=;
        b=PY6QwZb6VFi8MIPoaopDRozZczjEFnCnoEe6dvf/0Ws9qpYzoRUeAqTI7sO0t6D5ya
         Ph5cMViEI95U7W1+C8EX3+NPzV7S12t18vXn9aXpde8r0kfnbufTtct3tiZyDYKKjNvl
         Wc9o/1tW2Q2VRjmC9/E9j06V97UNClGXYDzSKXWKXj37UmAhZfh5FHsg4JLm0Rss1Tnj
         7oQBIXM9ekLxD+bz8nJEIc+EkQb3wMHcbh/8JVFcgLV3NOSob6k7xesXLnYhe82qKFXZ
         JffjfHD70dHSoE/seKK8xBmKBH5PmSShCGHXOYc5yQmDADgkBc+HBKoW9dQ2HaWKUGge
         3GFQ==
X-Gm-Message-State: APjAAAWD+jM7kdzNJE8oTjakHpov5KANoRETOMflEMtzlGRIZ4v/J7pg
        Y2w7NYuFpDY/2zcVJBz7NsB9lQ==
X-Google-Smtp-Source: APXvYqzib7Kn+CRx+uLgJTVhY2qANiGUtg4vErwZ7XsOctkw86hqyDWYPRetUezFrynAd9JNmWbIaA==
X-Received: by 2002:aa7:874f:: with SMTP id g15mr21423802pfo.175.1571228649323;
        Wed, 16 Oct 2019 05:24:09 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id k31sm4026903pjb.14.2019.10.16.05.24.06
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 16 Oct 2019 05:24:08 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     linus.walleij@linaro.org
Cc:     orsonzhai@gmail.com, zhang.lyra@gmail.com, baolin.wang@linaro.org,
        bruce.chen@unisoc.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: sprd: Add CM4 sleep mode support
Date:   Wed, 16 Oct 2019 20:23:39 +0800
Message-Id: <8ae52263b0625c416461821c457e6789b67170b6.1571228451.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bruce Chen <bruce.chen@unisoc.com>

For the new Spreadtrum pin controller, it expands 6bits to describe the
pin sleep mode with adding one CM4_SLEEP mode, which means the pin sleep
related configuration will be loaded automatically by hardware when the
CM4 system goes into deep sleep mode.

Signed-off-by: Bruce Chen <bruce.chen@unisoc.com>
Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/pinctrl/sprd/pinctrl-sprd.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
index 8869843..157712ab 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
@@ -41,7 +41,8 @@
 #define PUBCP_SLEEP_MODE		BIT(14)
 #define TGLDSP_SLEEP_MODE		BIT(15)
 #define AGDSP_SLEEP_MODE		BIT(16)
-#define SLEEP_MODE_MASK			GENMASK(3, 0)
+#define CM4_SLEEP_MODE			BIT(17)
+#define SLEEP_MODE_MASK			GENMASK(5, 0)
 #define SLEEP_MODE_SHIFT		13
 
 #define SLEEP_INPUT			BIT(1)
@@ -81,6 +82,7 @@ enum pin_sleep_mode {
 	PUBCP_SLEEP = BIT(1),
 	TGLDSP_SLEEP = BIT(2),
 	AGDSP_SLEEP = BIT(3),
+	CM4_SLEEP = BIT(4),
 };
 
 enum pin_func_sel {
@@ -616,6 +618,8 @@ static int sprd_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin_id,
 					val |= TGLDSP_SLEEP_MODE;
 				if (arg & AGDSP_SLEEP)
 					val |= AGDSP_SLEEP_MODE;
+				if (arg & CM4_SLEEP)
+					val |= CM4_SLEEP_MODE;
 
 				mask = SLEEP_MODE_MASK;
 				shift = SLEEP_MODE_SHIFT;
-- 
1.7.9.5

