Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0E71FD417
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 20:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbgFQSFt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jun 2020 14:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbgFQSFs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jun 2020 14:05:48 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A30C3C061755
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2020 11:05:48 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id k11so3444000ejr.9
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2020 11:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=yDJt73mw7weaay3nFZ2M3lWsQoLaL8FRFjLnlYqrKi0=;
        b=1pp7YrVnknNM8LvbhqviZfKRvt81ldvDhhGsjRDo3NxyU+iQtzVy5HnFYycmwRt3HZ
         8kXQwp6KqzKKCgAEuL7X4AaMYTUL5AzZimCdK2+ZkoarZQ2nb7sWmI8waAMh73e544Of
         8W4pFCivlUMvYydSxAexRpQ/u0omhoVZrom6sC8wqe/dPPd0dxgPnX/xRtAsMvzTWrSd
         cg0tCOjc0RVArkFtzbAnZE9mxuTdIsZcoYhWwmRkxPXqIfrpKd+DqtY5XeQ1KWxNct41
         NDB4ME9I5woyo8wnVcumDy9syS2m2y/JCFIKZLKUGf99feP4bI3cWv5/D8Aig4l5eZTi
         xgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=yDJt73mw7weaay3nFZ2M3lWsQoLaL8FRFjLnlYqrKi0=;
        b=KvsMWbwzmfpos7n3R6z7K98z/pi37UhUtTLd53ZXEuQkh4yIcF4YhPfaftBhT/c8hq
         IHVqlsoEPBz7buLcQQQeoRLcJJZtAHvwNRU7AqOhVfYb4NpzJg7n9+k4jvVez3wwiWK0
         k1EKfYZq5k4g01aRnunetE31hSr2XbM38p/Pz/nWEXl1vhGnMBkkkbRq0VTYlAUILAPp
         7Bi3ej05IF+wYp6gfuvd1AwiDJArrEyutVLBPMraGoEKv0srUgo5xy5jSsmU6xc0QfwQ
         L3fWAmow1Qyo7sJ+62gmYfmEXDSGXtMwRrmfH1N883JXOTqYlRpyke4A/AMJG3C36N+p
         Ueqw==
X-Gm-Message-State: AOAM5313JJY+6NsXkaoTPrP5E421dyzoLJukJNDQylBPpN33T8/gRkO0
        l/h+J2/LcTKLBQVyx6fGU561JQ==
X-Google-Smtp-Source: ABdhPJzMWK4g+FCDDXKT/NqpY8aSLOan2cBspKMr8Txzql3WBYoiuuE6IFAEwnRnzTYR8iJpw6uTrw==
X-Received: by 2002:a17:906:7ad7:: with SMTP id k23mr336797ejo.439.1592417147096;
        Wed, 17 Jun 2020 11:05:47 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id r6sm253016edq.44.2020.06.17.11.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 11:05:46 -0700 (PDT)
Date:   Wed, 17 Jun 2020 20:05:43 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     trivial@kernel.org, Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] pinctrl: single: fix function name in documentation
Message-ID: <20200617180543.GA4186054@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the correct the function name in the documentation for
"pcs_parse_one_pinctrl_entry()".

"smux_parse_one_pinctrl_entry()" appears to be an artifact from the
development of a prior patch series ("simple pinmux driver") which
transformed into pinctrl-single.

Fixes: 8b8b091bf07f ("pinctrl: Add one-register-per-pin type device tree based pinctrl driver")
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
v2:
- add trivial@kernel.org
- add Fixes: tag

 drivers/pinctrl/pinctrl-single.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index a9d511982780..02f677eb1d53 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -958,7 +958,7 @@ static int pcs_parse_pinconf(struct pcs_device *pcs, struct device_node *np,
 }
 
 /**
- * smux_parse_one_pinctrl_entry() - parses a device tree mux entry
+ * pcs_parse_one_pinctrl_entry() - parses a device tree mux entry
  * @pctldev: pin controller device
  * @pcs: pinctrl driver instance
  * @np: device node of the mux entry
-- 
2.25.1
