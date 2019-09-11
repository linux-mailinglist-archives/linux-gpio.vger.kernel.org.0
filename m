Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 375C2AF747
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 09:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbfIKHwy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 03:52:54 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40412 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727213AbfIKHw2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 03:52:28 -0400
Received: by mail-pf1-f194.google.com with SMTP id x127so13140414pfb.7;
        Wed, 11 Sep 2019 00:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=65psbidcDO0CPIrkMyNPrHv3R58h3YXHwN4mI+2C5o4=;
        b=gousrssIPukQ29gCfHUWB/JlJvT3ZfwR9DvQ+acLhprClxxW12JQp3XblRh6dVkEr0
         d58eh5oTTF+bUcW2Fx9nPHXzWqSRH635X7LUNLYNMDLTFzZ/bCjEfkEM8ASgoTpTE/2Q
         Og+5qu6BYYKO0xkt6i2GC5s2av5Qooqs1L0eknjN8Wi8c5wHlVhH0opG5JtlkJOiyBHt
         3UgSXiRWNHIucg97NiaXHUqBP/ZppS0x5ob6XlwBcV1tvepryyMDFz6s4rgsYqbztH0D
         zdF67XMzIXLpIoabDv/RII70hePB8qrJy3GHoxaGwz8r1sDBZSRslKBpAtxlbFFaesdU
         CUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=65psbidcDO0CPIrkMyNPrHv3R58h3YXHwN4mI+2C5o4=;
        b=K05VaZ7UtO8HemtGI9n/o2mnLao9NHY2pMh9l4q5iC3x2LbNY5rxnTi4AqrI/LlZRl
         peXbYZwEqShojUOi8ynL9DPwJyrXlNBaJvYYZVlun2BWbGWeeqOWUiz+a0ZauoYt5UZ6
         MbnOxjHg+5FVv7AlYpVaYVWA07mKuVHXs960OBcQHJAsdiiUt5dA4XmNLREN4kwXykq9
         QipzrW07un85pzyBdkS76l48Uknt5dv35OWfzAW284UVL9gTnOJzplmFhVtTKzs6MLCs
         M5KA6WKeJETFPzeWGn2UIi7Ca8yvl9ptbyEvPRguiVla/+PA4bq0hl6b/V4ZKG32z624
         Rvfw==
X-Gm-Message-State: APjAAAUJkBTLrlL/aLcjawztgmWOU/R/SUdw+QwMwOkPAm+E0nYcr7Mr
        OjU2kC9tPKldjW5etSJ1qtpGEpB4RA4=
X-Google-Smtp-Source: APXvYqyLxG3qHNsE28JgaCm3PaY2gBvHPOH0XnvA43dLZtsleF60v1vMfX/a4i4rKt34mlqcl18JPA==
X-Received: by 2002:a17:90a:e292:: with SMTP id d18mr4093999pjz.100.1568188347317;
        Wed, 11 Sep 2019 00:52:27 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id u2sm8582445pgp.66.2019.09.11.00.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 00:52:26 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 06/11] drm/bridge: ti-tfp410: switch to using fwnode_gpiod_get_index()
Date:   Wed, 11 Sep 2019 00:52:10 -0700
Message-Id: <20190911075215.78047-7-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.162.g0b9fbb3734-goog
In-Reply-To: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Instead of fwnode_get_named_gpiod() that I plan to hide away, let's use
the new fwnode_gpiod_get_index() that mimics gpiod_get_index(), bit
works with arbitrary firmware node.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/gpu/drm/bridge/ti-tfp410.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 61cc2354ef1b..d9c9c9ebad2b 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -284,8 +284,8 @@ static int tfp410_get_connector_properties(struct tfp410 *dvi)
 	else
 		dvi->connector_type = DRM_MODE_CONNECTOR_DVID;
 
-	dvi->hpd = fwnode_get_named_gpiod(&connector_node->fwnode,
-					"hpd-gpios", 0, GPIOD_IN, "hpd");
+	dvi->hpd = fwnode_gpiod_get_index(&connector_node->fwnode,
+					  "hpd", 0, GPIOD_IN, "hpd");
 	if (IS_ERR(dvi->hpd)) {
 		ret = PTR_ERR(dvi->hpd);
 		dvi->hpd = NULL;
-- 
2.23.0.162.g0b9fbb3734-goog

