Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A02280B92
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Aug 2019 18:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbfHDQCQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Aug 2019 12:02:16 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43476 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfHDQCQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Aug 2019 12:02:16 -0400
Received: by mail-pf1-f194.google.com with SMTP id i189so38352822pfg.10;
        Sun, 04 Aug 2019 09:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LeGjYEzEnNd+LP7E7X1hGpTj7PNVozz8mf2RHENRFPs=;
        b=LQytGn6C2tlkbNTMXkKZ2UyVakSPWDuBvnr2zYpndh4VptsQvTykzeffX86XeALTgk
         u8V7q4xuIO4nY1eainybsqRRCkUU9UZlaffx/Mex4LR1mcNDxNllViZbEwkZoTaK522W
         wNmbSEB1xFONhovQ+m5fvb60LMQaLRZo0Rr3nclUoBwKBFLotbBQx8P+D4Hk6VSSomcf
         uAFJYT+MpMD/OhRYnG2IH5A9GbIq8Y8dH6GuknoM6u4uPRzsp2pZ8WQGQtUqzKdk/t6M
         QjVvRlovZa8Le8dedeV0qILbbCFLc6E1OaiO2i3+6DMhS2WVshgPVhzxMovkkd/M6ZvF
         JLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LeGjYEzEnNd+LP7E7X1hGpTj7PNVozz8mf2RHENRFPs=;
        b=PD5ynfU3IeMCj/tcRyvhTb9wGKy0ykxbNom1SsdQFKS2pz0xQ/9GUnC1OssuKIy8AO
         TAqOgOneBGyjqbG1rdO3xfBqODftMx7+z2AU8XlDuF1GtJWzX1SaPOq/P6rbur2NEyMl
         LZJ95bK/e0H1QnnIqzeQKRaB+5wjAghpKSva2CxWe7CprM6RBhC6tBwHt2uU3fnklnG2
         ae202rmIoFISV59CiUJuLhHh6Nn7fhlsj7Lt67L2XDNBX4dy7PzRTnHOgAZyIHik/ZqI
         OUBlHmRtJ5nb7ObNT4+zhYvAICTUqmrgxPRiZS1L0N21aQmctyFqrBjlVGArMLEHvPej
         RG6g==
X-Gm-Message-State: APjAAAU/+YMUgkq4aat4D+01ctaT63gYI5eBtiZGpUjC+3lSrpn5gKwX
        FTznCG53W10qI1chrJ/o4fg=
X-Google-Smtp-Source: APXvYqyW3HshrRKiqWhhL7Xm0gBHnBObsgshWMul17uZfpv0UekHsFJKsZHv4yQsC3HGKCgiksvnzA==
X-Received: by 2002:a63:89c2:: with SMTP id v185mr27001405pgd.241.1564934535868;
        Sun, 04 Aug 2019 09:02:15 -0700 (PDT)
Received: from localhost.localdomain ([122.163.105.8])
        by smtp.gmail.com with ESMTPSA id v22sm80865042pgk.69.2019.08.04.09.02.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 09:02:15 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, tomasz.figa@gmail.com, krzk@kernel.org,
        s.nawrocki@samsung.com, kgene@kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] pinctrl: samsung: exynos: Add of_node_put() before return
Date:   Sun,  4 Aug 2019 21:32:00 +0530
Message-Id: <20190804160200.5139-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Each iteration of for_each_child_of_node puts the previous node, but in
the case of a return from the middle of the loop, there is no put, thus
causing a memory leak. Hence add an of_node_put before the return.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index ebc27b06718c..e7f4cbad2c92 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -486,8 +486,10 @@ int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 		if (match) {
 			irq_chip = kmemdup(match->data,
 				sizeof(*irq_chip), GFP_KERNEL);
-			if (!irq_chip)
+			if (!irq_chip) {
+				of_node_put(np);
 				return -ENOMEM;
+			}
 			wkup_np = np;
 			break;
 		}
-- 
2.19.1

