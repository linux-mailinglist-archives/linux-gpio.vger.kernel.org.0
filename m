Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 022E42F1FD0
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Jan 2021 20:50:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391011AbhAKTug (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 14:50:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389440AbhAKTug (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jan 2021 14:50:36 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77517C061794;
        Mon, 11 Jan 2021 11:49:56 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id u4so178761pjn.4;
        Mon, 11 Jan 2021 11:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=741uIlaM+L6ylxc+uAOdXhR3kYtdAb4UvuQ94fHQepo=;
        b=aP6A8sUWaXVFsDzILQMZ1aPTLFknhADj/0e2OOG6ryR+r22atiDU77YF2gRV5ndZUr
         qwotiHS5pMecv/S5J5t7225T5IH9hsBf4HszIasLHLeNMqL0E/q21brtorbBrvED0UtP
         PaCemmqtLPwUqynpWU2Y1DEo9qqUpOWcdT5KJTTAhh66Fqk4TrJEXf/uuaJ0VOF2Xcwb
         rnSwB9/U/hBnTGiUpVp28n2p1AjKExYngyKw+yJEr3dUH3xR5Je2X8CnYDQ0Ca/JShQE
         jBv0h6VuzNnCWU7lECznRJQLXBfXCfq8UylTJ5RrtVGsNe1c1KRfz7CQXByesKzDXzYU
         QDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=741uIlaM+L6ylxc+uAOdXhR3kYtdAb4UvuQ94fHQepo=;
        b=IUhd0CTv6725DXf9Si78MVGWj8lbBamSSaxZgPhPJWJmy+PJvTWQRzW3Zj3vNq9OAF
         XRvTEBpwgjrCkh0J1itx44Cqy/ETHDtV3+mjLAywIAOh2bcTKhArAEoJjJQP6WItj/6X
         4REDBW8szMgMce9zpMamjr14CuCF5LsR4aNOkZBcR/KpuyxLyWOQEVaGs0ZdYkxkCZ1j
         N9iQSFv1XmsIVE2SBufGfveO46vzMeA32i51oMY8wvWN68cufQbya7UIS2cE7M9I1dlo
         +IEBP8VnaJ+JbLB7z/RH7oCIoc6y3bOJf4auLbULCfCNiLZQOw0j/QIlyM6tOWucoAuE
         ROSw==
X-Gm-Message-State: AOAM533P+GUkTC/9ara9ZDaTDyW2MHO+/238uxGuzJ08RcHbzZepQrgv
        AiLHaD5uuzI1nG7KGFJsHGY=
X-Google-Smtp-Source: ABdhPJyfVK18/6yrrQ66nM2v8wGA4z6kjwfI8eTV8ur+CN039Vc3UYQZGBGlvS6aY5xntsYFXHXoAg==
X-Received: by 2002:a17:902:42:b029:da:e72b:fe9e with SMTP id 60-20020a1709020042b02900dae72bfe9emr882551pla.31.1610394595901;
        Mon, 11 Jan 2021 11:49:55 -0800 (PST)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.179.121.136])
        by smtp.gmail.com with ESMTPSA id f64sm420628pfb.146.2021.01.11.11.49.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2021 11:49:54 -0800 (PST)
From:   Souptick Joarder <jrdr.linux@gmail.com>
To:     linus.walleij@linaro.org, grandmaster@al2klimov.de,
        zhengyongjun3@huawei.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Souptick Joarder <jrdr.linux@gmail.com>
Subject: [PATCH] pinctrl: ti :iodelay: Fixed inconsistent indenting
Date:   Tue, 12 Jan 2021 01:19:45 +0530
Message-Id: <1610394585-4296-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Kernel test robot throws below warning ->

smatch warnings:
drivers/pinctrl/ti/pinctrl-ti-iodelay.c:708
ti_iodelay_pinconf_group_dbg_show() warn: inconsistent indenting

Fixed the inconsistent indenting.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
index ae91559..60a6713 100644
--- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
+++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
@@ -705,9 +705,8 @@ static void ti_iodelay_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 
 		cfg = &group->cfg[i];
 		regmap_read(iod->regmap, cfg->offset, &reg);
-			seq_printf(s, "\n\t0x%08x = 0x%08x (%3d, %3d)",
-				   cfg->offset, reg, cfg->a_delay,
-				   cfg->g_delay);
+		seq_printf(s, "\n\t0x%08x = 0x%08x (%3d, %3d)",
+			cfg->offset, reg, cfg->a_delay, cfg->g_delay);
 	}
 }
 #endif
-- 
1.9.1

