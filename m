Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E47A21EEFA3
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2020 04:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbgFECwP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jun 2020 22:52:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbgFECwP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2020 22:52:15 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 473C9C08C5C0;
        Thu,  4 Jun 2020 19:52:14 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id c8so8697059iob.6;
        Thu, 04 Jun 2020 19:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=a9/BhDYNHe+rJFbOUG8VhW/tYR8LSfIiYbqfLja5GMo=;
        b=OtREKoQiRzE3FsJBBPwfIZQwQnIDLTp1UToGEPSYpO/94D+3/LsNX6r8RsrlvZf7pc
         EWP3mmFpAei4+SD/MfkcNXL+1xV1VZkSHvXH0EGq+Gip2v00QI+NniTYNLkzgAwN3PG8
         L0fYd8SLnOmaNU/+5naOGaNb+KoogzkOuvnCidLze61OiBxyi/kv9sD6CY5pflzzg0UI
         x1guuQY1wIy0PEG46dkcOnw2QihWXCa1lXS9QH2AsTXzdGZHB1I56b8d1kvQZPJCjjl9
         gcX/KuWmgaY8klqICXx2lAmwdBQNlayH0R2+FOpuNu0IATNfmkspwGKBn/7Dw2OO38Vf
         uwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=a9/BhDYNHe+rJFbOUG8VhW/tYR8LSfIiYbqfLja5GMo=;
        b=QNAmYpIWZPssCISnsaN0xRKYCE/M+yhq/uVgCx3m7pCe+1l5al3bWwtojT5BLV0hB0
         PZLvbmXZ1HH0VGBhn41OpCGkWMimPPijBsSPgacAezF2Dij6YD/NDxzVqxbORfJva6IO
         2nLMU8Ui0AGngvV/dDE8iXy0DJVxobFVhUWIYvlO/QXts9QJGYXIAVeHa6oPwJQx8y5i
         W1kRJSWkUNCACAbHXfnBGmLyKWhQzOcWghvBxzmwlYVh45xA/bMtR5fJBMpY4p02XQIf
         MNqP5Ib5BNkuUAMjWx6d9ZQcO+mOTWgLJ/PrMavRWcCVbqqooFSWyjnECfVo2bRXlHdq
         F4nA==
X-Gm-Message-State: AOAM533fEFogIqQYb6t+pcRQALW7Qi3c4H8HFwmli482JcsnAIXrjOgL
        RwK7Q7uO/62tZ72JhVn75XM=
X-Google-Smtp-Source: ABdhPJx/TrPQqYnd7PBwGQiPNNhc8iu4CnLHribpvWJ/qWXwLT0rRs2RzHLfrbnswv3QXIX7xB42dQ==
X-Received: by 2002:a02:b704:: with SMTP id g4mr3855393jam.138.1591325533547;
        Thu, 04 Jun 2020 19:52:13 -0700 (PDT)
Received: from cs-u-kase.dtc.umn.edu (cs-u-kase.cs.umn.edu. [160.94.64.2])
        by smtp.googlemail.com with ESMTPSA id p11sm738898ioo.26.2020.06.04.19.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 19:52:13 -0700 (PDT)
From:   Navid Emamdoost <navid.emamdoost@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        patches@opensource.cirrus.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     emamd001@umn.edu, wu000273@umn.edu, kjlu@umn.edu, smccaman@umn.edu,
        Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: [PATCH] gpio: arizona: handle pm_runtime_get_sync failure case
Date:   Thu,  4 Jun 2020 21:52:07 -0500
Message-Id: <20200605025207.65719-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Calling pm_runtime_get_sync increments the counter even in case of
failure, causing incorrect ref count. Call pm_runtime_put if
pm_runtime_get_sync fails.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/gpio/gpio-arizona.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index 5640efe5e750..7520a13b4c7c 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -106,6 +106,7 @@ static int arizona_gpio_direction_out(struct gpio_chip *chip,
 		ret = pm_runtime_get_sync(chip->parent);
 		if (ret < 0) {
 			dev_err(chip->parent, "Failed to resume: %d\n", ret);
+			pm_runtime_put(chip->parent);
 			return ret;
 		}
 	}
-- 
2.17.1

