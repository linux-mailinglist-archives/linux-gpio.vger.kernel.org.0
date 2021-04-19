Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1219A363AFC
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Apr 2021 07:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbhDSFW2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Apr 2021 01:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbhDSFW2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Apr 2021 01:22:28 -0400
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 740F1C06174A
        for <linux-gpio@vger.kernel.org>; Sun, 18 Apr 2021 22:21:59 -0700 (PDT)
Received: by mail-pf1-x449.google.com with SMTP id x9-20020a056a000bc9b02902599e77f7afso3036919pfu.3
        for <linux-gpio@vger.kernel.org>; Sun, 18 Apr 2021 22:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=1jlzay7NrHhIzm+rkAGcTage5tjUJRiEa0qA/fxcnjY=;
        b=Pphg5mXOZuX6oJxCRM8EBukui/4NuJxx07jOJDaZz1oq1vh72/E4kIv/Afhn6yyAcR
         EfMdqJvIT67EtmxeEPcppHNgvSaIQPOIWJEKuAvixPXl6NcyUGtSYF2ZOumOjk2NKp7e
         /gPLjB7hfPzcBXywKFCqzY+pgCwsh4yuzTFPt4gBvldEG0jf2Eg5ZjUF4azjaFlsZbtQ
         xqnx/wTz86t8j22AGehRmp06JWUlH0D8OubZVltZ2Jq+ZUyDzdm9SsUffrads5P6bSb7
         zJbv6Ewjm3nbOqwseOVLNuIztevd8+pl8nABP/jwcrxuT2ucfO4javgEgVWTw29tqmMx
         YWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=1jlzay7NrHhIzm+rkAGcTage5tjUJRiEa0qA/fxcnjY=;
        b=SLA4Y9kVv+xIcCXfLG6PB1bowrce4VVd0dEHQI4iNWlE8xDzz+7gmS/mHyuLhC5VLN
         xgqNC/FCBsKKAaz4+enDIWMbHQSgouYiuFSVBiI+t76GcyYb3jr9ObXCV1WiRwZ9wHa8
         3gBznlvlSeHL/x7TgOBuTlxLz0JxxPcYb2uCsDJiKzEwzZQxX+PH1El4k02boaAgwykY
         XAXevT+T/JIu70K5aLPPfRZi5gIqoVtLj7zlUZbF0hQ6d5Z4w1z9l18t0oVr89lx9apQ
         Enl349qZiyzZf0bw36OvqsTnhjHJ30m8/3BH8/U0LqIQZHYQ1hve/w7j9RZC/MkzwRko
         AuqA==
X-Gm-Message-State: AOAM533p8AK2g6/hKqo+dG0q7ADaIx5WGs57MQVlYrFFJGaQaT9XuBvd
        yNdu360rks9I5U8aKW7leSf4bhmRFc/c
X-Google-Smtp-Source: ABdhPJzi09lEATgb9ztaNjHZI+V7lwptJqTFm+vZoxp1DMfaZ2W5dklVTK8P6wG5Z0mHX0ArfOEsBq9To+nA
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:b01e:e82b:cf1:a8ce])
 (user=tzungbi job=sendgmr) by 2002:a17:90a:e2d7:: with SMTP id
 fr23mr22096275pjb.29.1618809718810; Sun, 18 Apr 2021 22:21:58 -0700 (PDT)
Date:   Mon, 19 Apr 2021 13:21:36 +0800
Message-Id: <20210419052136.2475373-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
Subject: [RESEND PATCH] pinctrl: mediatek: use spin lock in mtk_rmw
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     sean.wang@kernel.org, linus.walleij@linaro.org,
        matthias.bgg@gmail.com, zhiyong.tao@mediatek.com,
        broonie@kernel.org
Cc:     linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
        tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Commit 42a46434e9b1 ("pinctrl: add lock in mtk_rmw function.") uses
mutex lock in mtk_rmw.  However the function is possible called from
atomic context.

For example call trace:
  mutex_lock+0x28/0x64
  mtk_rmw+0x38/0x80
  mtk_hw_set_value+0x100/0x138
  mtk_gpio_set+0x48/0x58
  gpiod_set_raw_value_commit+0xf4/0x110
  gpiod_set_value_nocheck+0x4c/0x80
  gpiod_set_value+0x4c/0x6c
  max98357a_daiops_trigger+0x8c/0x9c
  soc_pcm_trigger+0x5c/0x10c

The max98357a_daiops_trigger() could run in either atomic or non-atomic
context.  As a result, dmesg shows some similar messages: "BUG: sleeping
function called from invalid context at kernel/locking/mutex.c:254".

Uses spin lock in mtk_rmw instead.

Fixes: 42a46434e9b1 ("pinctrl: add lock in mtk_rmw function.")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c         | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 4 ++--
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h | 2 +-
 drivers/pinctrl/mediatek/pinctrl-paris.c         | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index f77921957f15..3a4a23c40a71 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -619,7 +619,7 @@ int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 
 	hw->nbase = hw->soc->nbase_names;
 
-	mutex_init(&hw->lock);
+	spin_lock_init(&hw->lock);
 
 	/* Copy from internal struct mtk_pin_desc to register to the core */
 	pins = devm_kmalloc_array(&pdev->dev, hw->soc->npins, sizeof(*pins),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index fcf7c3eeee4a..9ffe01a8ceca 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -58,14 +58,14 @@ void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set)
 {
 	u32 val;
 
-	mutex_lock(&pctl->lock);
+	spin_lock(&pctl->lock);
 
 	val = mtk_r32(pctl, i, reg);
 	val &= ~mask;
 	val |= set;
 	mtk_w32(pctl, i, reg, val);
 
-	mutex_unlock(&pctl->lock);
+	spin_unlock(&pctl->lock);
 }
 
 static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index 65eac708a3b3..13836bb188b7 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -252,7 +252,7 @@ struct mtk_pinctrl {
 	struct mtk_pinctrl_group	*groups;
 	const char          **grp_names;
 	/* lock pin's register resource to avoid multiple threads issue*/
-	struct mutex lock;
+	spinlock_t lock;
 };
 
 void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set);
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 48e823f6d293..85db2e4377f0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -970,7 +970,7 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 
 	hw->nbase = hw->soc->nbase_names;
 
-	mutex_init(&hw->lock);
+	spin_lock_init(&hw->lock);
 
 	err = mtk_pctrl_build_state(pdev);
 	if (err) {
-- 
2.31.1.368.gbe11c130af-goog

