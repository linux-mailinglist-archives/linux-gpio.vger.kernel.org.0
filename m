Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E70A430D36
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 02:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344794AbhJRBBf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Oct 2021 21:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344765AbhJRBBe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Oct 2021 21:01:34 -0400
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68AFDC06161C
        for <linux-gpio@vger.kernel.org>; Sun, 17 Oct 2021 17:59:24 -0700 (PDT)
Received: by mail-vk1-xa2b.google.com with SMTP id f126so7813411vke.3
        for <linux-gpio@vger.kernel.org>; Sun, 17 Oct 2021 17:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vIEFutEubHblD6m4CJ07+iaI+xTyTiVljq2Pxa5i1uU=;
        b=Pmn4LRMIU4UEbma6xeSAJmerc9eX9zSdd5VqjEjBgmVAnb+nxEiXXjJ3+n1fLQ2O7L
         hC/nvCB1f2f5aCVUHnUi5ZJ1KkAkeQ1tEiJQmng4fXBo6JOfbTLMq7kAmsl0RY/yKuh2
         lcgq2B+4khe/IaGMsh3bHGP5UZwZpOHhCvaOmhwbqBSlkkdyKjm5lD3yO/90p/DFdEi0
         8EdxZ1CaFeBuVBJzAiq70fRjDboNpXpWcYvvcUk7vHR8tPPHiwOOTgO07toB/SH3VTQL
         cMhWYROW9QZwYGFFa5aOQOskCbK78qCx9WMLnsXBX7kD7CbPV1jITkle7lmLuOsrB7ru
         j1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vIEFutEubHblD6m4CJ07+iaI+xTyTiVljq2Pxa5i1uU=;
        b=bn9Z08zK3lGCi5wGAxl8mp/sv/uXOJRxXPcLuOBI6cQtBJVBnKm6+TLUCD5qhYZy8c
         WK4XJnGShoy1Dq+MH8/69xVnz11RlD8MYi/xYyi4Ut9YVH0QVgyM0Hc+oMhJfL5cmb/Y
         bc16IdH/iU5QBrpa8FYxjmnjGzw0vnSNZy4OYgj9XToL9MZjU0UyppBEtmWfo7Lof2Ur
         L0g2kE2+P/R5+9wNybnB0P3ZvQdqPCrkgNmN3aQk88RTSed+irVez/7LqeCsnAkj6Rg5
         5ytiVfj1DhsuVcKzDm/pAaga5nwi9+lvn2FJ7b6yUJIcUpc5qpovujhJn4af4JkL7FtT
         O3xQ==
X-Gm-Message-State: AOAM533Wy2AO4eCw+rZAEmYFAIakoOsTDpm1kNfWzyxWkaiF6DGFrspp
        x2n2gEsP82zr193kyqHAD9Qp1FwqOeD/jPR/
X-Google-Smtp-Source: ABdhPJwKzz7rDBXY9rfZEkyHIB4hf6FojsEWsR/UOH/x9UdQ4/qeiykz/vuSOGcn8vVAJIZ0uCVP8g==
X-Received: by 2002:a1f:b44f:: with SMTP id d76mr22240117vkf.25.1634518763142;
        Sun, 17 Oct 2021 17:59:23 -0700 (PDT)
Received: from tresc043793.tre-sc.gov.br ([187.94.103.218])
        by smtp.gmail.com with ESMTPSA id f128sm2241992vsc.13.2021.10.17.17.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 17:59:22 -0700 (PDT)
From:   luizluca@gmail.com
To:     linux-gpio@vger.kernel.org
Cc:     luizluca@gmail.com, trivial@kernel.org,
        sergio.paracuellos@gmail.com
Subject: [PATCH] pinctrl: ralink: include 'ralink_regs.h' in 'pinctrl-mt7620.c'
Date:   Sun, 17 Oct 2021 21:59:15 -0300
Message-Id: <20211018005915.17601-1-luizluca@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Luiz Angelo Daros de Luca <luizluca@gmail.com>

mt7620.h, included by pinctrl-mt7620.c, mentions MT762X_SOC_MT7628AN
declared in ralink_regs.h.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/pinctrl/ralink/pinctrl-mt7620.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/ralink/pinctrl-mt7620.c b/drivers/pinctrl/ralink/pinctrl-mt7620.c
index 425d55a2ee19..6853b5b8b0fe 100644
--- a/drivers/pinctrl/ralink/pinctrl-mt7620.c
+++ b/drivers/pinctrl/ralink/pinctrl-mt7620.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <asm/mach-ralink/ralink_regs.h>
 #include <asm/mach-ralink/mt7620.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-- 
2.33.0

