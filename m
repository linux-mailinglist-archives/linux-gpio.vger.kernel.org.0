Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E84F32FAB8
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Mar 2021 13:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbhCFMvw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 6 Mar 2021 07:51:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230227AbhCFMvk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 6 Mar 2021 07:51:40 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A827C06174A;
        Sat,  6 Mar 2021 04:51:40 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id ga23-20020a17090b0397b02900c0b81bbcd4so608056pjb.0;
        Sat, 06 Mar 2021 04:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=GMqmR5RnBsh7jie/YN1lnXFMmTgGBFqTmdQGM4wGJig=;
        b=vcS5oJTiNdGDAa9IAmGM60n4ErR4webU9pziPfkSdcNkFRZ7IJaBgs2ct8P9+4MmGz
         dcrbwCYCiBKHII8WqQXlO9UBEE19BPhnpzr/+TxUd/EB/huyu1vvoAsKhpYObeaooXDr
         rvDuti9TwzQscMLep8JLxOsTDNBx6B8TAP6uR5epappaB4pj3Loj9MpqRvYW+l9A8Fwy
         pECpc725zAbV7Hb1CoBVIkCrHsaAXaROrrbJ8ZEo2lALHE/GfpzZDDRlyjorVmMl/2ZN
         Ps9bFDOoXdGDp8zZ4bSqqj7/ZCI5QbY2/abrlZ71J1XBxcEiSFa0B+BY7tJDXZ4Yif/U
         5IBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=GMqmR5RnBsh7jie/YN1lnXFMmTgGBFqTmdQGM4wGJig=;
        b=ezgKyXpfR3ook1AYJI+WRfMQF6G68BDZ87u+HiQpVY2Hb9XWLK+Mr/jA1kQRToeKfC
         Jh0i4xAR2GoIBwhyKr/Ii8T91zu+qlHkXMoO5KyaKFOzrj2SWuBBxM2+QYm9738QIG5G
         39DVSUsiFQgCK3pjYdVv+w3PnfxbY6hNbzqnRngIHVFI/eNx17B3iH4vUICoTZhBLTpZ
         kPcGZqh3CLnb641x8OumDE0sRZh87zi08a24r0XQM5DwUO22eV3b5Uk+9Da2Bax0S8ON
         NAvJ+iQJbx4yFiIzsFNBEuI1vCCTCQVWI7MbpquXJR6iJtXG1dZZAHRkL3WBVIz00jtz
         79Qg==
X-Gm-Message-State: AOAM5300IfxNYA4vyMAZ3Vnflqpq0zRaHSvCH69Fh8XHx8W7lhMlk5d6
        acXTfDAHFBgrzI0HEXLko8Y=
X-Google-Smtp-Source: ABdhPJz35H7kzMetYStuaa8FZUiHrMPVZ4WXzGKCF1Yf8fC+hEA36LuLtJbHdGYzgZMd1eBJG6LoOw==
X-Received: by 2002:a17:90a:5217:: with SMTP id v23mr15549888pjh.126.1615035099655;
        Sat, 06 Mar 2021 04:51:39 -0800 (PST)
Received: from localhost.localdomain ([45.135.186.79])
        by smtp.gmail.com with ESMTPSA id c24sm2083387pfi.193.2021.03.06.04.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 04:51:38 -0800 (PST)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
To:     linus.walleij@linaro.org, jrdr.linux@gmail.com,
        zhengyongjun3@huawei.com, grandmaster@al2klimov.de
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] pinctrl: ti: fix error return code of ti_iodelay_probe()
Date:   Sat,  6 Mar 2021 04:51:22 -0800
Message-Id: <20210306125122.15043-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When ti_iodelay_pinconf_init_dev() fails, no error return code of
ti_iodelay_probe() is assigned.
To fix this bug, ret is assigned with the return value of
ti_iodelay_pinconf_init_dev(), and then ret is checked.

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
index 60a67139ff0a..e5848269175a 100644
--- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
+++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
@@ -867,7 +867,8 @@ static int ti_iodelay_probe(struct platform_device *pdev)
 		goto exit_out;
 	}
 
-	if (ti_iodelay_pinconf_init_dev(iod))
+	ret = ti_iodelay_pinconf_init_dev(iod);
+	if (ret)
 		goto exit_out;
 
 	ret = ti_iodelay_alloc_pins(dev, iod, res->start);
-- 
2.17.1

