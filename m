Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 501FB1623A9
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 10:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbgBRJnE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 04:43:04 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33610 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbgBRJnE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 04:43:04 -0500
Received: by mail-wr1-f65.google.com with SMTP id u6so23116071wrt.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2020 01:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1chfOYLWL1h07j8wUUwG3K0SuI4vOWNOGcjnRZm7XZI=;
        b=RGFLRkCRmqX+afIPsopEE/e29GACfQzRZpbfWZIG1DkCAobJgVx5XURsjYGukrchHf
         sJIetooc/49e/zxdkClGKBy4xylInq1TqVx9mYy/vcsIILbAHIBZcpa9lKBdonfEdqNo
         jnLNJ+qSLyXsMfPoWTgzAnOKwfhFQOwNBIf5q4eg22nBmXmTIsTIMqQr4cBuaXk5jCyx
         rnuurIRFSVOPg/SexOwPbIyGBlFDvggJEQaMCsaKIozjUPmK21Cb5+h4uxO4IeM3BbVb
         1pgjWH8WpyQSAOVcLBpZSFErNEYG4ArBsfidjEYb7kKMgIT97sBAYQdvOypRsnTtDO+n
         owPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1chfOYLWL1h07j8wUUwG3K0SuI4vOWNOGcjnRZm7XZI=;
        b=e+eNg+5pmLY0Ro6VhkUFBb/QmIyxTYErSBrTiary+ylv3XHopCLv49U18MZPOoDnYV
         gGEpplK7a/7RE9iKCJQT3oyA8PDwk32UMXh+l8YsvSpvsKcWrjXRHExDsd0kZXz2t9Ge
         ZeMhRvnh5f5tcEs8XUtKXlUHiKg/6wCbsrxoPQItjprxwXO/oO1gg+kzkyU1mEb0TYmZ
         XFZ+YLQTga+NslqYGLDM8ry9rTfEFM73wlvHRbTBxC7vvaXLAvo7x/JBty+Wfz23zG7Y
         2G7eaKafviYDogg4EBAQmxOi/2n49OZd990Qr5PIRW/CGt77tCAEachrw688Mc7d3Y9Y
         usig==
X-Gm-Message-State: APjAAAWLcuqqL7pg0kKHfruRxmjDDMrJLyiZYBTLgToEbSwtFEgvCZHt
        Vr+oSWvKDmbcPQgOxahYlOmyhA==
X-Google-Smtp-Source: APXvYqxGt2GdkMwH8MGvQAzR0h/sReqzUomjbPgsQdTKANWVof2bTVtrIAOj5qwxx5BHGJ+5xAc2mQ==
X-Received: by 2002:adf:e2c5:: with SMTP id d5mr27562274wrj.165.1582018982007;
        Tue, 18 Feb 2020 01:43:02 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-188-94.w2-15.abo.wanadoo.fr. [2.15.37.94])
        by smtp.gmail.com with ESMTPSA id s23sm5351095wra.15.2020.02.18.01.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 01:43:01 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 5/7] nvmem: release the write-protect pin
Date:   Tue, 18 Feb 2020 10:42:32 +0100
Message-Id: <20200218094234.23896-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200218094234.23896-1-brgl@bgdev.pl>
References: <20200218094234.23896-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Khouloud Touil <ktouil@baylibre.com>

Put the write-protect GPIO descriptor in nvmem_release() and in the
error path in nvmem_register().

Fixes: 2a127da461a9 ("nvmem: add support for the write-protect pin")
Reported-by: geert@linux-m68k.org
Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
[Bartosz:
    - also put the gpio in error path in nvmem_register(),
    - tweak the commit message: the GPIO is not auto-released]
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index c4a6c044b020..e47152e9db34 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -72,6 +72,7 @@ static void nvmem_release(struct device *dev)
 	struct nvmem_device *nvmem = to_nvmem_device(dev);
 
 	ida_simple_remove(&nvmem_ida, nvmem->id);
+	gpiod_put(nvmem->wp_gpio);
 	kfree(nvmem);
 }
 
@@ -428,6 +429,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	device_del(&nvmem->dev);
 err_put_device:
 	put_device(&nvmem->dev);
+	gpiod_put(nvmem->wp_gpio);
 err_ida_remove:
 	ida_simple_remove(&nvmem_ida, nvmem->id);
 err_free_nvmem:
-- 
2.25.0

