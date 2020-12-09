Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055642D3B10
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 06:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727277AbgLIFv6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 00:51:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbgLIFv6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 00:51:58 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F919C0613CF;
        Tue,  8 Dec 2020 21:51:18 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id p6so362221plr.7;
        Tue, 08 Dec 2020 21:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=no0z2XnJFUeZiz2yRFvZ5SCLHTAMOawmuiv/AYMb2uk=;
        b=NJFBJJ1z0l/LKk9EZZSfROTYI87s0IDPfv+3x+8YaW/G0/OhN3m+OSNSdmjqXQRWRm
         3Ars1dBL2L1Js8LSGcttHVa7aNTkuAWGi+7W5M69vfFhwOiOrmWZb/ovEtS9SCHzeDv2
         cRcatIieDRRF+1P/GUlGawn82bBZeJ4m2Mu4Y1uTtDjuDpGi4ahiypXtRREp8IUZt0Dx
         6+sH9ys2Y1QBD8j09GRfwtyID/f6StH+XDK0ER68xWPfpqhtNZ9kjiTjp/y/EOvm2SYF
         OmDYwfh+oouCRj9Hd1R5jlsr3L/sIu1YRqUgKvFuo27eQU4LkiL8+pSwup1v/Ho1gSyx
         hcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=no0z2XnJFUeZiz2yRFvZ5SCLHTAMOawmuiv/AYMb2uk=;
        b=VZ3oc4dXZL2M0aTkFe+SASfhSL8U93390OKHU0hELQ0+mNdhu83Yi2j4jyxfrRZUe0
         Rn82reKUbz+4mPSWEM54hKTrSWFxOttSQ362HIBiJXZBEf3NcAzsh5R1z+nGB6zT4xB9
         U8sLGKkEJkSgHbk1pitubkYVzB79YtzMe1+dVpgKIXm0i7whq5oisrRCjy6MiIzrrOkP
         +8Cr8+OgqagS6RbDS35j/pAdkPngwm3xSDqN2UfcR+fGFxiVl/GMJr3N7zuZJBzWFUzY
         OO1E3Y0JDVXsl5boNxFbFRFNHo5UA/1RYoPi/5u8N8g2I3EOJh+wjL1SywiTJ+Hj16p3
         b8TA==
X-Gm-Message-State: AOAM530L3rjDlSB4lUSjC1au83T/Mk6yfgiwefZLG5bMZBmUnAkBRFuO
        7W9x3jZZ7rW+xSVGzYQx92o=
X-Google-Smtp-Source: ABdhPJxBcoqPRpuO93MFYyeWsfeNQFxNM3UFLiw09c+tQ16cUQNXfvFOT8kDaiCpVmSKDtuvIa2ViQ==
X-Received: by 2002:a17:902:a711:b029:da:f065:1315 with SMTP id w17-20020a170902a711b02900daf0651315mr645997plq.36.1607493077787;
        Tue, 08 Dec 2020 21:51:17 -0800 (PST)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id t7sm841312pgs.5.2020.12.08.21.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 21:51:17 -0800 (PST)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>
Subject: [PATCH] gpio: eic-sprd: break loop when getting NULL device resource
Date:   Wed,  9 Dec 2020 13:51:06 +0800
Message-Id: <20201209055106.840100-1-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Chunyan Zhang <chunyan.zhang@unisoc.com>

EIC controller have unfixed numbers of banks on different Spreadtrum SoCs,
and each bank has its own base address, the loop of getting there base
address in driver should break if the resource gotten via
platform_get_resource() is NULL already. The later ones would be all NULL
even if the loop continues.

Fixes: 25518e024e3a ("gpio: Add Spreadtrum EIC driver support")
Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
---
 drivers/gpio/gpio-eic-sprd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-eic-sprd.c b/drivers/gpio/gpio-eic-sprd.c
index ad61daf6c212..865ab2b34fdd 100644
--- a/drivers/gpio/gpio-eic-sprd.c
+++ b/drivers/gpio/gpio-eic-sprd.c
@@ -598,7 +598,7 @@ static int sprd_eic_probe(struct platform_device *pdev)
 		 */
 		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
 		if (!res)
-			continue;
+			break;
 
 		sprd_eic->base[i] = devm_ioremap_resource(&pdev->dev, res);
 		if (IS_ERR(sprd_eic->base[i]))
-- 
2.25.1

