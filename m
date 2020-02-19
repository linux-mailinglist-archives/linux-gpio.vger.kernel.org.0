Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2932E164039
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 10:22:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbgBSJWc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 04:22:32 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35039 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726750AbgBSJWb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Feb 2020 04:22:31 -0500
Received: by mail-wr1-f66.google.com with SMTP id w12so27298840wrt.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2020 01:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kseu72RlmoHjw0Ds52fvPmAht9fKcAm4Amcp4sUWzMQ=;
        b=HCU0L7yAvvvBNWJayyd7FYZeBYqdwM7Zf8WQ+NXdSnzvuO3j2rUxNdyyGCJkLFwhJN
         RJzLgIxfUeYzq8PjE1mPp1736eObAvyPM/SV9+m4UPeqCwIEJf7wuxFKmVNwXDY8QIn+
         rDuhD57rBSGAKQ2uF15NB9PmtVX/OYx+7SBrW4R1w8OtazouaNhGJhvWm34dhfei863G
         R49ia2NwPlIEzy5zwUSwPhHGkYWvvBsBCBH3kezDI0b2JdJ/UJz7yGvljfyUXKsoHX6C
         JNwRSpFQW2+0sFK67QK9EMSpMG2ius3kd2co7FlYju8N2KNbqjRNW7QzsMTJK69Dkqhk
         YI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kseu72RlmoHjw0Ds52fvPmAht9fKcAm4Amcp4sUWzMQ=;
        b=VTXEL3lIyAOcxZC6Lc3hMofXUKvdstJYgoeuswiT8+xqf1M1d6lLh1FVL09o0NzRXS
         WzdBPSJJT36giYJ+Y8v/jYaMxBYu/qc1Bw9REn627ovXcxPOhOBRdhKCO+6gHV6gPZZf
         t1SHBwW/96uRMd9yumTa1oh+OujDp82b3oVn4Gq1TOEYpDOtlxpgrzVLpuCz4QLkamou
         eBnDkMKSPKXHATqhRwSAm2jjrr8UaGpIIL/+lNKSLuOoF89oGlskiPuNePH+3ThryTfg
         vdXH3fvOE+qJyLISYkTJGmhHd/jBrlJQyany1XXXZ33BXSScsMz8CWsvuTFLTYFUNYKR
         rKDg==
X-Gm-Message-State: APjAAAUnt2ZvjV5UTyYkEOzMUes47HH8opd5zNKJv9kZtb/vmTidtC37
        9D19/pTVxkMMPlDsoLvlcHrk67iITmc=
X-Google-Smtp-Source: APXvYqz956puqcBVPbs9NYq+NZ78vLaaJccYXy+tQ4MMwlUCIqIZuO5pVR5NZzAU8Vap8m9jpsxeDA==
X-Received: by 2002:adf:f504:: with SMTP id q4mr33087616wro.28.1582104148131;
        Wed, 19 Feb 2020 01:22:28 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id s65sm2172296wmf.48.2020.02.19.01.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 01:22:27 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 6/7] nvmem: add a newline for readability
Date:   Wed, 19 Feb 2020 10:22:17 +0100
Message-Id: <20200219092218.18143-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219092218.18143-1-brgl@bgdev.pl>
References: <20200219092218.18143-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Visibly separate the GPIO request from the previous operation in the
code with a newline.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index bbdf2fe076b9..40fe5913c264 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -348,6 +348,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 		kfree(nvmem);
 		return ERR_PTR(rval);
 	}
+
 	if (config->wp_gpio)
 		nvmem->wp_gpio = gpiod_ref(config->wp_gpio);
 	else
-- 
2.25.0

