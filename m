Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F89D324F2
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Jun 2019 23:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbfFBVRU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 2 Jun 2019 17:17:20 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36294 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbfFBVRU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 2 Jun 2019 17:17:20 -0400
Received: by mail-wr1-f66.google.com with SMTP id n4so6928172wrs.3
        for <linux-gpio@vger.kernel.org>; Sun, 02 Jun 2019 14:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zbOcW/AX8g6Uplo9DmPYLzcLovEjPdEfL5JHhcvrFxE=;
        b=CyFZj5T4aWJVLhDeX0SsEWt23SkkA+lV6Gt8i4jCVRjHnjb+TYJBa/70svxwGEuxng
         BFGcB/+xRgQPfvLOnzSfL2I9mOJkcq1oLshwZQQgy/D7omzVcG9NuZrk95Kee89SR45z
         wRPTF3AFdqdwdSQLHtUcrvgVKp5vGE6RmklIj2iqKvzNNsxfm99TvL4rkGQ1ujCySXFJ
         Rg3IgkkgtBjLh7/QC18ZMQ2IwG8Phzkg04ILqi5+HMq+kxMFfbyLt9l+p1dQXj8yZ8RJ
         +aQQ0AW8Aa6hvsdx3rogk7RNkqPlQxFaBkTKmb7y0zasLhzo/lYRqnfa82E6KTG8MIZv
         pIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zbOcW/AX8g6Uplo9DmPYLzcLovEjPdEfL5JHhcvrFxE=;
        b=fy8d3tN0urZ86AiIi/BZpIlmtY0EKtbUPiQu0za/qYNdtLbcA9pHbb/d6CaVMy+1fD
         J5ChFo4/d8eotLliUzagCRTrKk3cj3xsTO2Inq3EmqSKcGwYTpTctQ7/hZ2JJfRAs3Jn
         4Ky60JT/2Z1jWnup5gxyQCRNePF1GfofQHSP136x0MXd+QWzG8IpSnB/Erh1GMHf0bES
         vO9e5EOUkp24FiI3bjMAHY+R+LGwIGhYWfYBzAfHomVO014eI7f9//e38pjaJDI4nq9c
         U2bDXxe8uJ6VFF0ixaHZFNMPoBeNeOBsOvLOOAEoPwgtZKSCuzPnv4HEXiJcg9/lOm7I
         idDg==
X-Gm-Message-State: APjAAAUjcPj56C+tVlpHb/G617X4bCEorNUyjDsxB4/3gavAMMFEEGFM
        hgCmHdAfqJN7LfWd9dXQX+x/7zGEZNw=
X-Google-Smtp-Source: APXvYqzr2fyBDfsMzyDr/H7eD7T6Uab3yKBayazP9zF3o6pdSxZ3Tg91mDjoAjT9fIL9bXrDxBXT/Q==
X-Received: by 2002:a5d:4e4d:: with SMTP id r13mr1935778wrt.295.1559510238834;
        Sun, 02 Jun 2019 14:17:18 -0700 (PDT)
Received: from localhost.localdomain (catv-89-135-96-219.catv.broadband.hu. [89.135.96.219])
        by smtp.gmail.com with ESMTPSA id r4sm8332137wrv.34.2019.06.02.14.17.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 02 Jun 2019 14:17:18 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: u300: Fix SPDX tags
Date:   Sun,  2 Jun 2019 23:17:16 +0200
Message-Id: <20190602211716.2623-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some files were missing the appropriate SPDX tags so
fixed it up.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-coh901.c | 2 +-
 drivers/pinctrl/pinctrl-u300.c   | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-coh901.c b/drivers/pinctrl/pinctrl-coh901.c
index 63035181dfde..d10704cc9318 100644
--- a/drivers/pinctrl/pinctrl-coh901.c
+++ b/drivers/pinctrl/pinctrl-coh901.c
@@ -1,8 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * U300 GPIO module.
  *
  * Copyright (C) 2007-2012 ST-Ericsson AB
- * License terms: GNU General Public License (GPL) version 2
  * COH 901 571/3 - Used in DB3210 (U365 2.0) and DB3350 (U335 1.0)
  * Author: Linus Walleij <linus.walleij@linaro.org>
  * Author: Jonas Aaberg <jonas.aberg@stericsson.com>
diff --git a/drivers/pinctrl/pinctrl-u300.c b/drivers/pinctrl/pinctrl-u300.c
index 2b1a61dba224..6d59e3f836df 100644
--- a/drivers/pinctrl/pinctrl-u300.c
+++ b/drivers/pinctrl/pinctrl-u300.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Driver for the U300 pin controller
  *
-- 
2.20.1

