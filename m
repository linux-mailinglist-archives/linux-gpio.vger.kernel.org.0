Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A44EB19BE61
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2020 11:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387493AbgDBJJB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Apr 2020 05:09:01 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37948 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387477AbgDBJJB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Apr 2020 05:09:01 -0400
Received: by mail-wm1-f66.google.com with SMTP id f6so2749297wmj.3
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2020 02:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=StLW4oQA2WaIFFPJqSGzSymR2wGzT0o0QxMbZtBUVlk=;
        b=d9IdAHDZyEa62Jw04B77sMtjVPdNa9vpnb4vpYZxhWIYq3dd19MZtHfhDJtpigL4Aj
         0lTur6dAWq/vA3A5LzqOa9PCxYDSfcgoOkQ6DWrnhT5CaZYbzaafQ8ZoQbQNGHpl76zV
         XdHZQ8zGRGZ+Z3o3PL6fL2THK4+JKFeqY5SU8bghIVTLvB3g9cmdzfEyq9RRWGaV6dJ2
         VEZfIrAeawGjRpsXFkAB73r0sX5WcZCC+0TEvToep7FMLtZST9mL/X86o8YOYDXZ4W+W
         1f85fZry1d2bPj9tCUGgWKkaHEm4rXwC7YcOD5qTMp3O6lqbC0rkUzV6tlLY+zduzxLD
         rygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=StLW4oQA2WaIFFPJqSGzSymR2wGzT0o0QxMbZtBUVlk=;
        b=OIrXgO26aDg0eXQSR1eWKAnSLscAYnDLNOw49eeI6pIBWxwQpxPjwROuxJeB98l+eX
         kPPWGDbEgf1Pt0VeJBINaTWJJdtrOj6UOGKUT72WIxRNT8/+CCShvdHuroXngBogjki0
         Q+1l9n47NKXXYJFGqR7/99XNsyizwRGlB0YZUdwyTyqPNOVofS/9/H5VCO3dwvaoCt/W
         e1I6RePw3FAHHYfD9x/IzIoFsXqlNb0tpUT7Tg9QBKt/Mpi1NAz86eE8bvOs2M0V516Q
         wUJqRPfhzUQ/Ek+c+pVDkb50tEadOtR9jTs6rdVZX8QPHNx/zrA76GkGDKviH27UcDJb
         XLZw==
X-Gm-Message-State: AGi0PuaEVMkRZhYvF9rlkN4Uuj8g7+pDxwWDhGyeG63YZx4hH/WzSVXa
        4McH1VBCxKYgGp9NkTf1ZZwvdA==
X-Google-Smtp-Source: APiQypL8UW6cTm5VP6BFVGzslvteA1w9m7t8nZrQqPskNcZ68K6UnXvkCjIsdFXA8Xk1zJTdxJLHMw==
X-Received: by 2002:a1c:6605:: with SMTP id a5mr2512660wmc.32.1585818539513;
        Thu, 02 Apr 2020 02:08:59 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id h2sm6150372wmb.16.2020.04.02.02.08.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 02 Apr 2020 02:08:58 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     linus.walleij@linaro.org, mripard@kernel.org, wens@csie.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] pinctrl: sunxi: handle probe defferal
Date:   Thu,  2 Apr 2020 09:08:52 +0000
Message-Id: <1585818532-23051-1-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When checking the logs on my sun8i-a33-olinuxino I saw:
sun8i-a23-r-pinctrl 1f02c00.pinctrl: Reset controller missing
but this driver was working after.
This message is just here because the reset controller was still not probed.
So don't say anything if the return code say to wait.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun8i-a23-r.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-a23-r.c b/drivers/pinctrl/sunxi/pinctrl-sun8i-a23-r.c
index 8a08c4afc6a8..9e5b61449999 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun8i-a23-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-a23-r.c
@@ -103,8 +103,11 @@ static int sun8i_a23_r_pinctrl_probe(struct platform_device *pdev)
 
 	rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(rstc)) {
-		dev_err(&pdev->dev, "Reset controller missing\n");
-		return PTR_ERR(rstc);
+		ret = PTR_ERR(rstc);
+		if (ret == -EPROBE_DEFER)
+			return ret;
+		dev_err(&pdev->dev, "Reset controller missing err=%d\n", ret);
+		return ret;
 	}
 
 	ret = reset_control_deassert(rstc);
-- 
2.24.1

