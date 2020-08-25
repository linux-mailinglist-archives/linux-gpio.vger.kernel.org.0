Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01B95251ADD
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Aug 2020 16:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbgHYOdy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Aug 2020 10:33:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgHYOdw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Aug 2020 10:33:52 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BDEDC061574;
        Tue, 25 Aug 2020 07:33:52 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id w14so10946719eds.0;
        Tue, 25 Aug 2020 07:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=snlphi07wh4k/ZlUaJslE4TyIoIQObGzwbf9XX6F2gE=;
        b=Yib2xjtHWS6lTKiBsjvnNXsReEzjfZVtw8/EwFP8xLdicuKIdlC/bBKg51YNgybwiZ
         syolwh8bHUh28zU7K8ODoZAFomyP3u17/yLPZOwUBlNv6oPyLQky89ooypA/2nDysCDd
         yxOQxQhut8w/LCblVhcjoCA/vC6NW31bkXhS/x7cQr73x3nUfeGSK1Loh4y8P0wzAQZw
         +owTO9Gz2EDGvv2yuzvGrned4KI1Q/NMIJNn7XjFykpUMHD6Ed6K/Lj+Jd73e05drfdz
         k31ptJ0uEbhqzXJZfuxD1iAHd/IbDvqO2TuHy+rrr9/UNFIHXn17p61ukV5ZaqmV69gr
         P9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=snlphi07wh4k/ZlUaJslE4TyIoIQObGzwbf9XX6F2gE=;
        b=kxFJRaNbzb1JKQ5Ind2LeGRJgpfdk+XytoavQn545faIE4qgIAq/Lz5/gkLop0rqx0
         DfUeUK5/4/mQChSGiQM7HRtjYmQ2L9fg09XP3UW/oJa4Qg9WR5pzQ8IeeuCJ4CpO7TN1
         OEF1QrZpbO3FGN35QldnU9wUVYFpmBc0WkpyiDau3YKzNARe5e11phZLxqTXgCd38kdJ
         aDBzxCxGks/eIXV3NKQqL+AIs6R1JOxbxueX6h/OfjldVHkV8gpOpikT9RU8kY2/MbX0
         pQiofsO5nnBO00fF124bfdzKjUVoY+YUtj1sK10yUF+LpLZqdtUbxRVsmLvNY2eyoUjd
         cPbQ==
X-Gm-Message-State: AOAM530bAPlIWojgAc8RxVNm38TndxCdkjsjPPIkW8phw9gjIX5PyNga
        awF84+xClM1nLF6Eg9LfWxx2XnwF+V32dw==
X-Google-Smtp-Source: ABdhPJyfghb40Q8ooZbR6quRhSY6a6ZQ//NX+dONJTpgexPkUM/sSNuxGH4myzLN5FSZLK3iTdspSA==
X-Received: by 2002:a05:6402:54c:: with SMTP id i12mr10337471edx.358.1598366030722;
        Tue, 25 Aug 2020 07:33:50 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f22sm12891703edt.91.2020.08.25.07.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 07:33:49 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        John Stultz <john.stultz@linaro.org>
Subject: [PATCH] pinctrl: devicetree: Keep deferring even on timeout
Date:   Tue, 25 Aug 2020 16:33:48 +0200
Message-Id: <20200825143348.1358679-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

driver_deferred_probe_check_state() may return -ETIMEDOUT instead of
-EPROBE_DEFER after all built-in drivers have been probed. This can
cause issues for built-in drivers that depend on resources provided by
loadable modules.

One such case happens on Tegra where I2C controllers are used during
early boot to set up the system PMIC, so the I2C driver needs to be a
built-in driver. At the same time, some instances of the I2C controller
depend on the DPAUX hardware for pinmuxing. Since the DPAUX is handled
by the display driver, which is usually not built-in, the pin control
states will not become available until after the root filesystem has
been mounted and the display driver loaded from it.

Fixes: bec6c0ecb243 ("pinctrl: Remove use of driver_deferred_probe_check_state_continue()")
Suggested-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pinctrl/devicetree.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index 5eff8c296552..3fb238714718 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -130,9 +130,8 @@ static int dt_to_map_one_config(struct pinctrl *p,
 		if (!np_pctldev || of_node_is_root(np_pctldev)) {
 			of_node_put(np_pctldev);
 			ret = driver_deferred_probe_check_state(p->dev);
-			/* keep deferring if modules are enabled unless we've timed out */
-			if (IS_ENABLED(CONFIG_MODULES) && !allow_default &&
-			    (ret == -ENODEV))
+			/* keep deferring if modules are enabled */
+			if (IS_ENABLED(CONFIG_MODULES) && !allow_default && ret < 0)
 				ret = -EPROBE_DEFER;
 			return ret;
 		}
-- 
2.28.0

