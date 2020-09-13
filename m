Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12B1C2681CC
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 01:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725949AbgIMXEI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Sep 2020 19:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbgIMXEG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Sep 2020 19:04:06 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 636ABC06174A
        for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2020 16:04:06 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id p9so20578060ejf.6
        for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2020 16:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9SldZtCk2q4nsXGS7xAt+YvKP+JMD0RBd/7nndQ7OzQ=;
        b=xGYPnpkOvjV2guhiQLfbAkzC/7YNuCzGUhPdX8zeH04ezPUD9aZl3fN1vWZJUU9+3H
         un9+d62uLxDQklFkXGKGBVt+aBq558OFOSEeL1mewIn/2ltoz8wrbRMNiq7Oz1VVGCkN
         l2NcUeZT64lVwLnJdoPdGrdfaxHSeQWIdKA3jn/Meo5aMBxpwLW3di+WhePRRbYj/zlg
         i+ivxcDQY9xCoZFM3maEt58qGAk4nFjRolpgCGRMOKkcsQrIazsISN15bJN/hWzH/4Kt
         9ZF+eDCI5fSFdKKwJGyPMne985PfgZi7D2R7hcsabYIrCf2PiUAZNlEvc4DlhX8HFBxr
         rawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9SldZtCk2q4nsXGS7xAt+YvKP+JMD0RBd/7nndQ7OzQ=;
        b=VjmNDvGoj6sk9JKMFnDuR6FS8KdJbH8VnorHXvXTPxpe6z5Q4hZtv1lDOZ1amCMe7i
         ZUgYKmvX36rY3Bx4wMYXijci47S7DWPO6M5GuQT2YEh56l6ZZ45ugt1yHkHelGVXgeG7
         qrW1MWnNTTammyyguK4KMu01zlyFB85p6XSBkM0EKZtYQwJ4lMTQgcnEM66oY1Lvw/yN
         4quv+3UjtbjqA47NjeP8ynMABFvlNxv3fnSeYmiF4SCqMhELPa6OiGESn000b24U+l0+
         heTG6ByK2BO5EtHEWCE515mvANN8O6aAAj36+VSVwDxZPCy15Iue1uHdDsU4npqKHBND
         LMaw==
X-Gm-Message-State: AOAM5331zBXnogKCgRlPE1CROEbYVMEKkqks9vjFukDn4gYeytyddhRl
        7og73xe1XTqygaJ5VPy0MdgBVQ==
X-Google-Smtp-Source: ABdhPJymLIzw6wH0ol290j3Ilni2SshdpfYbKIN/B8glAUUXu/TzNoFjW+VT/pdj29EtJ9S1cUY8jw==
X-Received: by 2002:a17:906:a207:: with SMTP id r7mr12092932ejy.32.1600038244812;
        Sun, 13 Sep 2020 16:04:04 -0700 (PDT)
Received: from localhost.localdomain ([2604:a880:400:d0::26:8001])
        by smtp.gmail.com with ESMTPSA id jo26sm6280761ejb.120.2020.09.13.16.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 16:04:03 -0700 (PDT)
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
Subject: [PATCH v2] pinctrl: single: fix debug output when #pinctrl-cells = 2
Date:   Mon, 14 Sep 2020 01:03:07 +0200
Message-Id: <20200913230306.2061645-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The debug output in pcs_parse_one_pinctrl_entry() needs to be updated
to print the correct pinctrl register value when #pinctrl-cells is 2.

Fixes: a13395418888 ("pinctrl: single: parse #pinctrl-cells = 2")
Reported-by: Trent Piepho <tpiepho@gmail.com>
Link: https://lore.kernel.org/linux-omap/3139716.CMS8C0sQ7x@zen.local/
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
v2 change:
this is a fix to my prior email where I referred to #pinctrl-cells = 3
which is incorrect.  pinctrl_spec.args_count is 3 but #pinctrl-cells = 2
https://lore.kernel.org/linux-omap/20200913224746.2048603-1-drew@beagleboard.org/

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

