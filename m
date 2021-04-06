Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC463556F2
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Apr 2021 16:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233235AbhDFOqZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Apr 2021 10:46:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345304AbhDFOqW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Apr 2021 10:46:22 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A45B7C061756
        for <linux-gpio@vger.kernel.org>; Tue,  6 Apr 2021 07:46:13 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id b126so9430635ybg.19
        for <linux-gpio@vger.kernel.org>; Tue, 06 Apr 2021 07:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=K97dfDzOakTNCO8JzrPfznFhYT4VKiM9VzlN1DMwR60=;
        b=giIt6BWIWMwL+8oWHNwVESB6kfvJE2Hmau2LQVK/qOvPwuVEBKftkRZlFONM4nGfoF
         Hf/3c1QQXU1V6LSOxXw1m8k1LrR5PqMpXkizk0pt2yxTS2VNowkZ6SXdp7lnqTD3G36P
         DfFnoQCzXpXGqSfvu8nyoT3dfIcQVDUz7hkC9HBCD50BIfK6GTOyruWVW2MGRGtsKlqS
         +717WzuUfV63wlvhHPAOm1OQKLr9d8jar0vqcjCLaVwtoMvwR++xHQXqUD0eKiREtED1
         KH7HytuHx9+jM5UHZfehajQldXI3Ey5Jq8TyimnuZ2+Udhr92HChGO5d4JgRFXoTo73v
         cylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=K97dfDzOakTNCO8JzrPfznFhYT4VKiM9VzlN1DMwR60=;
        b=kaC8UFMErUEbFoxCx2aulaMJHhhzTFxQYb3BJjRNBA10Iy6LvYgutZLI2z2vf4IWK1
         wrrIPHDV98nzy65YT2w0miPCulcGpQumxTMlXq4+a5oVkVxGJcyKzNVLLzfIrUesOhEl
         y6PczejNjWYhnBiMVf97biaNvGRZmAY4/lTED2IIW2JWTuOEbHfiHs6rtP76SujO6vod
         zuly+crMz3TOePudVU8b3lQiu6nyDhS2/OPlKzaX4hxmmDZ3R0h5lvSlBhWI9s0GWu2V
         ptEkAumrLN6ojOtJZMkzM6JkVW9iAeVQith4h5bvoqIV9RbttF3vvIQbHkvrl46SpCfG
         Xy4w==
X-Gm-Message-State: AOAM530QsbvxtrgLlSQG7PDFuPFJCvBkhYBu/RAO/cBO82ILeqkG1PKy
        smQdaC8YU7AUy5x2U8xclcN5Ff6YkiO7
X-Google-Smtp-Source: ABdhPJxLBPH5IlbJAcEx+YiWk14ww+bmR7OEBrrGRnZpj3rZAnOKTtdeTjOnpEQ5A5YxHscwtF3PTCwuzler
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:9d56:89cb:f993:7b46])
 (user=tzungbi job=sendgmr) by 2002:a25:e90b:: with SMTP id
 n11mr38157321ybd.467.1617720372864; Tue, 06 Apr 2021 07:46:12 -0700 (PDT)
Date:   Tue,  6 Apr 2021 22:45:40 +0800
Message-Id: <20210406144540.3467756-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
Subject: [PATCH] pinctrl: mediatek: use spin lock in mtk_rmw
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     sean.wang@kernel.org, linus.walleij@linaro.org
Cc:     alsa-devel@alsa-project.org, tzungbi@google.com,
        matthias.bgg@gmail.com, zhiyong.tao@mediatek.com,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
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
2.31.0.208.g409f899ff0-goog

