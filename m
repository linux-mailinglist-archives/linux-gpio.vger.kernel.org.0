Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71BB01FF26E
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2020 14:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730078AbgFRMwB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jun 2020 08:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730020AbgFRMvx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jun 2020 08:51:53 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97348C06174E
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2020 05:51:53 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id y20so5529212wmi.2
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2020 05:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+0u89dpmgvQy4plYwwslEmSBiru+bR25mmVExT9ZnYw=;
        b=TiuuX/SdtqRxO1POZ1JiW5Hy2GFaKV93vyNQMVQOy5teZ9AgCJLGPSSnXyOmCDBEUz
         bs6Q6tC8Q8QCv/hVDRI53LLBfuHJ/0nBs/NAsvTv4lmXuJhKByZy1gzQS8bGO4fwryaA
         lHQYWy7p59e61ydNP0aYDMdjz2DklMtM/+9QBq7DYEpM9dsABml7vbZG10g//W1+YA1A
         CxneXxP6sZGKnfhQIs+3Ua56kKThzmDJwIyivVu20LsjbQG6TnR3my9Jq+fI4SAKbUjW
         C5XM251MVSf5ukXeYVaYERqX/D4WohOdPlT2zv+ly2ORU4yqREvY0CWUcgF+yV6Q1wgM
         jEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+0u89dpmgvQy4plYwwslEmSBiru+bR25mmVExT9ZnYw=;
        b=CwTMbrB1ec6zhRn9Ltx+Kw0lNwKqI6GY7YyI4mPAdVXi3kfnWlVPalI6ZuOsg+5DPr
         YSS2a3ghBeOFhPmVXg5OM5vxqYRrRBA8WD7rfTIBg7hsFbZC33EX7T+6XrnJ4mqainZR
         AiWWGANqk2lzdg5f2coL5W0YcB05F5ZuaTmarFGSYwgCGJe+b8QavK592EDjFBlgMdHS
         xnX0G/iClQQECg9LC0qxNLLWNXf8iFsk2zBNR7hLWdC5umzd7JqhFHFFVMEQ9FtuJa7L
         xxKTQohky8yyKlx2psyWemm9k2oOiDIYGinicag8DjUYk3Kl82BeRPVamZsaZln/ONhA
         KBog==
X-Gm-Message-State: AOAM5332WtgbQVlTYKTB6x80Igl/k/7E5RpyVm1AUiVRIl+35IHdF+0u
        BfCHd4NbbNi7A6HsLKAhGxc7LQ==
X-Google-Smtp-Source: ABdhPJzZfibMUZiL+eVz9fIQNUlgeCf8L/u/t5OdsJBEcZqoBou07CPY4UPJL2CC9XruVrC+oYqBvg==
X-Received: by 2002:a1c:ddc1:: with SMTP id u184mr3705202wmg.115.1592484712360;
        Thu, 18 Jun 2020 05:51:52 -0700 (PDT)
Received: from localhost.localdomain (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id v27sm3714151wrv.81.2020.06.18.05.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 05:51:51 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH 3/3] pinctrl: single: parse #pinctrl-cells = 2
Date:   Thu, 18 Jun 2020 14:50:57 +0200
Message-Id: <20200618125057.41252-4-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618125057.41252-1-drew@beagleboard.org>
References: <20200618125057.41252-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If "pinctrl-single,pins" has 3 arguments (offset, conf, mux) then
pcs_parse_one_pinctrl_entry() does an OR operation on to get the
value to store in the register.

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 drivers/pinctrl/pinctrl-single.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 02f677eb1d53..e6d1cf25782c 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1017,10 +1017,17 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 			break;
 		}
 
-		/* Index plus one value cell */
 		offset = pinctrl_spec.args[0];
 		vals[found].reg = pcs->base + offset;
-		vals[found].val = pinctrl_spec.args[1];
+
+		switch (pinctrl_spec.args_count) {
+		case 2:
+			vals[found].val = pinctrl_spec.args[1];
+			break;
+		case 3:
+			vals[found].val = (pinctrl_spec.args[1] | pinctrl_spec.args[2]);
+			break;
+		}
 
 		dev_dbg(pcs->dev, "%pOFn index: 0x%x value: 0x%x\n",
 			pinctrl_spec.np, offset, pinctrl_spec.args[1]);
-- 
2.25.1

