Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23C218E4C3
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2019 08:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729796AbfHOGHd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Aug 2019 02:07:33 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46415 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbfHOGHd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Aug 2019 02:07:33 -0400
Received: by mail-pg1-f194.google.com with SMTP id m3so270746pgv.13
        for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2019 23:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nbRwOXKFE5eNws370RDclsbMmRDAT//9YPbiestE4wY=;
        b=fHZf9rFi4VtCsvNnlPfpJU5CPwx0kwigmDhl8xEjJO35UUyrzL2YW/yFsJQM0gWBh0
         ZDfNDOGR7gBPz3s55URjfWVMpWU4LW4qtnw8bUPowVARninQAoZAXbNXUoj1oYWqFqZc
         wmmveYzzU9+iuM/AoH0XjYrO+leCe/5+Bfx0Eh2ux5iMCr+18bvc7SSxDPxYYAF2rTuc
         2AntRLN7LnRJlXz1etFemwFZr+CyHAp8PUNDPuXoEgd1bXhOHcyFkW7RRoGdOTV7Ne1M
         rY7jUeq2MZt18TDWJqbiz724gQuK2d4TCZKGQqqGWeSS0y9KGEqOGTgB2pnzcs8ssv5B
         DUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nbRwOXKFE5eNws370RDclsbMmRDAT//9YPbiestE4wY=;
        b=Wye+swWciwYu1U7CBbBBmp9i2yCYvoTP1QSsEKCDI51XxylHpnUCXbc+IXRX1lpWHI
         rQdSdbdj6MxVXjfcmr7GY6Vjzp3aWdgHu14hFR0d3yF7j8VNZLF8Z167Fecs/IR6dZjZ
         XIByUiMkyS4NxCKk0HzAAbpLEEn8ecsZGc+2s3lw+QGXCMKDw5SRKM2DFGVHn/Te0Xk0
         pzZZqvVBXOTF+Bksz/d+FnAYJNievFhCMhlt15Hi4ZWUQYE7xV52DJ/z26lugnPOo+jt
         LHhX7WQsD0oCIPyY0ISXV23xTnhizOkrmNqPwJHts/j15SJxMYv7iuwTUSBs/EezhPMF
         f6zw==
X-Gm-Message-State: APjAAAUpVc3jz5XT10siu1N/Jqrpue4uW3Pb+0T0ZpPqQUvCufFqTX+I
        bdVHY17h2x3/BVEK7UwOVF8=
X-Google-Smtp-Source: APXvYqwLBY2ssKw0AGZ1KHz50LA6yvlcIAp8rgJGJ4bXPVBr6cKJvtCFsO3ksoIC+G2zfvbfYXb+CA==
X-Received: by 2002:a63:5945:: with SMTP id j5mr2276566pgm.452.1565849252354;
        Wed, 14 Aug 2019 23:07:32 -0700 (PDT)
Received: from localhost.localdomain ([110.225.3.176])
        by smtp.gmail.com with ESMTPSA id p4sm92648pjr.14.2019.08.14.23.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2019 23:07:31 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     khilman@baylibre.com, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] pinctrl: meson: meson: Add of_node_put() before return
Date:   Thu, 15 Aug 2019 11:37:18 +0530
Message-Id: <20190815060718.3286-1-nishkadg.linux@gmail.com>
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
 drivers/pinctrl/meson/pinctrl-meson.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 596786926209..8bba9d053d9f 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -651,6 +651,7 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
 			continue;
 		if (gpio_np) {
 			dev_err(pc->dev, "multiple gpio nodes\n");
+			of_node_put(np);
 			return -EINVAL;
 		}
 		gpio_np = np;
-- 
2.19.1

