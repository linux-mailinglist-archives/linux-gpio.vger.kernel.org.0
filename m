Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 567742681C4
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 00:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbgIMWu0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Sep 2020 18:50:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgIMWuN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Sep 2020 18:50:13 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4BB7C06178B
        for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2020 15:50:11 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id z22so20531399ejl.7
        for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2020 15:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jCkqObLQ6XI/cM41eaYHVKIOntJotdMpMjm5ZTC8RoQ=;
        b=J6Lor6kkrx1LBJfAjZtlgpdUKKYWlck7lJlUbb0SSO+vOWUlMoO2P4YTFTfhf09Hb4
         tDj37UEilxmAnsrbMV4cOFaMGwNqn09aB68hQlCyVy/C4t+A2J9CtvkGeDxhWBMx9JUI
         Ntpn6Qw/QIJKrN6zScv+1HEtSYr/sm7uFxfDA7q4o6dlc8fFzyJ7LidX0/s1vPghhMug
         T+1peI892d9JzFFGOe+oiEDYfGLkj35F0RJoXGjefdZjP1MxdUjJBEiJ1S3GklsqbmSh
         BX0BWFOO2jXc7RAFjm0kHHmSKRSLXSzn5YETrxqD3uvtitRsJJM97Qzeq2xUT2e2lNTM
         /ZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jCkqObLQ6XI/cM41eaYHVKIOntJotdMpMjm5ZTC8RoQ=;
        b=ep2JvAV3H1q5Gdm+Cgwxl9yzBVRjaepK+uA1rCkxuz/gP2iJrhFwee9+9jY2sJP7CW
         4jY+wgE7H40ol3DHt+SxpsLQG8BqDuvY1Rj4Zn+0rsfje5lM/9yRj4CTIUbF6ojAf9Ur
         Qu5yn2nVtrClTwh3JpvhpotjVorQXvHqnUfCukLmKySACvAW8NPVClUs4x5zXt6BuH0f
         wA1CCcxg7PPsQrJJe88ust9xJHuJIxd14eRnSEE6vOgeGPDZH1uT0oFOZFLS31D3pmlh
         geDEQEQSukpNd4xZQvXYof5jbhtyRPcb6jwmOvP7IZrK+oqw7GG5yjq7vdr29ttpUKM9
         axQA==
X-Gm-Message-State: AOAM531ikQtyLTxYr/9YKWTLXtozzTaOJQxxiQ3X5Zen0pMaiuEPcnRh
        2lhdYuUcu1scWTKFKZ3/+kCyZw==
X-Google-Smtp-Source: ABdhPJycv3oM6/mxGcVmlcdaPFp/A1PlmqJxqSgM3DkeRXQ57TuHJDm1Xo9uuEhbDu0Bv1VVqWI7oQ==
X-Received: by 2002:a17:906:3913:: with SMTP id f19mr12528258eje.83.1600037410320;
        Sun, 13 Sep 2020 15:50:10 -0700 (PDT)
Received: from localhost.localdomain ([2604:a880:400:d0::26:8001])
        by smtp.gmail.com with ESMTPSA id hk14sm6171147ejb.88.2020.09.13.15.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 15:50:09 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     linux-arm-kernel@lists.infradead.org,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org, bcousson@baylibre.com,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Trent Piepho <tpiepho@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH] pinctrl: single: fix debug output when #pinctrl-cells = 3
Date:   Mon, 14 Sep 2020 00:47:46 +0200
Message-Id: <20200913224746.2048603-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The debug output in pcs_parse_one_pinctrl_entry() needs to be updated
to print the correct pinctrl register value when #pinctrl-cells is 3.

Fixes: a13395418888 ("pinctrl: single: parse #pinctrl-cells = 2")
Reported-by: Trent Piepho <tpiepho@gmail.com>
Link: https://lore.kernel.org/linux-omap/3139716.CMS8C0sQ7x@zen.local/
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 drivers/pinctrl/pinctrl-single.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 5cbf0e55087c..f3cd7e296712 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1033,7 +1033,7 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 		}
 
 		dev_dbg(pcs->dev, "%pOFn index: 0x%x value: 0x%x\n",
-			pinctrl_spec.np, offset, pinctrl_spec.args[1]);
+			pinctrl_spec.np, offset, vals[found].val);
 
 		pin = pcs_get_pin_by_offset(pcs, offset);
 		if (pin < 0) {
-- 
2.25.1

