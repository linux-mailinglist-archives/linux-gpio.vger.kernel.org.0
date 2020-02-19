Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F194164032
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 10:22:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgBSJW0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 04:22:26 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39631 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbgBSJWZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Feb 2020 04:22:25 -0500
Received: by mail-wm1-f68.google.com with SMTP id c84so5898204wme.4
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2020 01:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VfILqk1K8yoP2xSE2um+i6NreaS03PgUUyWkRYE/P00=;
        b=1QPvypsLACAl0jKeCmtjEj3e2Ud60KrFKki2VdyRd9aKZR++Bapjb+krH1SDvqTx54
         5+on0pPv6zN5z8LaCwouBhQGhcAjzenmy1vl+fr8txp2xR7h7Vuj3Mcfj1s8b0Mlzh3J
         /ClvcTFpd8Kj4jOfdzYUcNWSvADx+P5ah+s1D6fjMcu0e/s8aQjjL6VmVJ6NVxVvyxPd
         qz8mM8ubNRsok4mHN1a9DGr6852IkOgKSKU0LPBgm5cqkD77GWrOBLGzL7pPryBcJGdO
         xa0ldiLA8uMlR40F+mrK4ezl3fwKMM3weI/PV+a25ciVh7vcRIdjvHq8T+6H/Hq/vVzm
         507Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VfILqk1K8yoP2xSE2um+i6NreaS03PgUUyWkRYE/P00=;
        b=AUC8N8TLlyBhJaykis7mw00M461j3KymIDkDS8j9Nrfpe2DZXDRGNTehYCqcyaJfKp
         k7zB0sGU7RWWcaP5yxOLMY9R4IaIDyupPJlaoJxGgXxAreSNfqN0OQ/fkBVkwRmZOkMN
         Uo+nEcSFK/8kvy2uCbM+Ba1Chqdp3VZoSu9aomWTmHUJHwZx/iBjFQi7DE0azqZqeRzt
         wwSSB595TDi1QUp1LcMrYyxpkjyopFQB0ZYI/ndkt2N6fYdnkr5zAprOGOdxrkMr1PYh
         tZRCrqgTE3ToAuitQxuFiqx12LzFx2uvVaD3mWZ5CNmOlXAfwSkQ74onqUDJkyfJ7VR8
         +CnQ==
X-Gm-Message-State: APjAAAX3fh4k1x6BVuPHH0efxAl9jMLJ/dm8o03N9EjVK9tzLyTohKKz
        e/1sBBT+AZxTygDu3gK1dvhASA==
X-Google-Smtp-Source: APXvYqzGDi13DVhhCKSM4kQot9bTETdx4VEMmzdXo6DxTwM9QgizGw1gIkl9DpZI9RbueNtqQPnbsw==
X-Received: by 2002:a7b:c318:: with SMTP id k24mr9260090wmj.54.1582104142489;
        Wed, 19 Feb 2020 01:22:22 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id s65sm2172296wmf.48.2020.02.19.01.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 01:22:21 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 1/7] nvmem: fix memory leak in error path
Date:   Wed, 19 Feb 2020 10:22:12 +0100
Message-Id: <20200219092218.18143-2-brgl@bgdev.pl>
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

We need to free the ida mapping and nvmem struct if the write-protect
GPIO lookup fails.

Fixes: 2a127da461a9 ("nvmem: add support for the write-protect pin")
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index ef326f243f36..89974e40d250 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -352,8 +352,11 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	else
 		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
 						    GPIOD_OUT_HIGH);
-	if (IS_ERR(nvmem->wp_gpio))
-		return ERR_CAST(nvmem->wp_gpio);
+	if (IS_ERR(nvmem->wp_gpio)) {
+		ida_simple_remove(&nvmem_ida, nvmem->id);
+		kfree(nvmem);
+		return ERR_PTR(rval);
+	}
 
 
 	kref_init(&nvmem->refcnt);
-- 
2.25.0

