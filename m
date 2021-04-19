Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B47FC363E9A
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Apr 2021 11:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235270AbhDSJft (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Apr 2021 05:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238551AbhDSJft (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Apr 2021 05:35:49 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C94BAC06174A
        for <linux-gpio@vger.kernel.org>; Mon, 19 Apr 2021 02:35:19 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id v3-20020a05690204c3b02904e65b70792dso7197800ybs.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Apr 2021 02:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=8WNrhjLyGdyDWHM865ZCSJ0+zVt77fNMyFmGjFGrnl4=;
        b=CAEt3s53rOTQrQyMSGDziVgDrIyTUMOlQuNe0Tk+6QH1Nu046WxDAwSUeb9ImRFQGA
         gwnNZctQXHXthNf0nIiNzSkO1yyVNd7JyYGFcUiZSM9ode7MlEr2n0iXKxYwbcx+Pzh/
         XvMNKjhb+Xy5sy5L79ZtyNattUmxFOurOIWY/cOiNtuYyIlCXDo7f04rUtepM47IF0Mw
         PVSBmF+iSKx5R4XGmgTO3FgwzZkKtfzMhr1ftR4qXtZcwydVWlaKh9BOJWbQz6CuUEKD
         DfhH7sdV8GxzSOQXKWz58LIze6jme/Qq7B9mGDLtpkm/RKrg9sDrte+mRbFBS6BgT481
         Jt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=8WNrhjLyGdyDWHM865ZCSJ0+zVt77fNMyFmGjFGrnl4=;
        b=CdMZYO+Nr72cruJrciSVnb/u04iWWFsye9Ge6J4/qmYpzthHWL6DkSRjnjbDwmWBik
         oyDjngkRvhAaSzA7ixlSTqavkhaq10dkamS3i7T28hlVYfHOUW4JpQgqOGY+hZgqCOnn
         4k8Q9JCdROW5PEV5mq+wW2ZGRqSpCMkYF+Bk8rMm9EXAWIgYOc8jSYxVBB+4w/LZHn5l
         jHxWtaELxUMG3tWXEOU/ly9I8EtP6VpJXd01uva/R82cqHOsySculAtdjgpwlWY3okPC
         FvvqJqoP8NdPnhLNOT/SkqLUR1ZpRL5/g/yBJ1raZnH4Ym2LkrnB+v4NLWZnQcGXeHy0
         koYQ==
X-Gm-Message-State: AOAM530ObEsnYq69Nhd3EyyiBC1ydbxmKLmCSOomnOpT2iJcj8WIhfK0
        lFnh+Tj5fPxMSWkUiC6mhFfwJbxh/oQI
X-Google-Smtp-Source: ABdhPJzBRm7VdHEJmg0TVEqWdqGpo383048pfypHGJSkLrWN945dqM4Gi1tsqSwWKdDgxo8u869CRLRnuG9a
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:907f:7138:4a1f:7db])
 (user=tzungbi job=sendgmr) by 2002:a25:c754:: with SMTP id
 w81mr15258408ybe.492.1618824919014; Mon, 19 Apr 2021 02:35:19 -0700 (PDT)
Date:   Mon, 19 Apr 2021 17:34:49 +0800
Message-Id: <20210419093449.3125704-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
Subject: [PATCH v2] pinctrl: mediatek: use spin lock in mtk_rmw
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     broonie@kernel.org, sean.wang@kernel.org, linus.walleij@linaro.org,
        matthias.bgg@gmail.com, zhiyong.tao@mediatek.com
Cc:     alsa-devel@alsa-project.org, tzungbi@google.com,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, andy.shevchenko@gmail.com
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
  [snip]
  max98357a_daiops_trigger+0x8c/0x9c
  soc_pcm_trigger+0x5c/0x10c

The max98357a_daiops_trigger() could run in either atomic or non-atomic
context.  As a result, dmesg shows some similar messages: "BUG: sleeping
function called from invalid context at kernel/locking/mutex.c:254".

Uses spin lock in mtk_rmw instead.

Fixes: 42a46434e9b1 ("pinctrl: add lock in mtk_rmw function.")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---

Changes from v1[1]:
- Snip call trace.
- Use _irqsave and _irqrestore version of spin lock.

[1]: https://patchwork.ozlabs.org/project/linux-gpio/list/?series=239749

 drivers/pinctrl/mediatek/pinctrl-moore.c         | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 5 +++--
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h | 2 +-
 drivers/pinctrl/mediatek/pinctrl-paris.c         | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)

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
index fcf7c3eeee4a..fc79b3a7a188 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -57,15 +57,16 @@ static u32 mtk_r32(struct mtk_pinctrl *pctl, u8 i, u32 reg)
 void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set)
 {
 	u32 val;
+	unsigned long flags;
 
-	mutex_lock(&pctl->lock);
+	spin_lock_irqsave(&pctl->lock, flags);
 
 	val = mtk_r32(pctl, i, reg);
 	val &= ~mask;
 	val |= set;
 	mtk_w32(pctl, i, reg, val);
 
-	mutex_unlock(&pctl->lock);
+	spin_unlock_irqrestore(&pctl->lock, flags);
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

