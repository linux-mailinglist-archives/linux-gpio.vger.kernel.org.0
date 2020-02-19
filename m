Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D37A3164036
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 10:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgBSJWa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 04:22:30 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39889 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbgBSJWa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Feb 2020 04:22:30 -0500
Received: by mail-wr1-f67.google.com with SMTP id y11so27271249wrt.6
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2020 01:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g0YN6Dlne6z0vjZ0AH0dVdxzG7WmpNUk7na6P2hSR2w=;
        b=XcDpl37IaZTVGtMzIhMPsae7KfOm2tGEuA06XO9f7RtlBm+xGAkPWX4C+VswT5xPVY
         K5m54PneLMGJmaAEgRjC/pgbqTaCcxCkoxJXuRJAAx22sBw9KkG3BKFQl9RuV3tsYRr5
         6RMNIZjNGEG8OEEdo1GAzVxS7t/Z+cd73eGztjShyrPpREx2AAi3cMgYoEHQCasAGsoG
         5Ttja22i9R6PV/tb6Hw8/gHvrNXNQ4j1FWxAD3/Gs6CpxeOCUmhQ39slplmQ/xSBQEf7
         F1v0IQrBQ7lrPdgbNI1srG0mWr8Agcp4Zyzm5GUyTe/6PcKT4hZCVCQ64HGO/TpJT2xG
         FOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g0YN6Dlne6z0vjZ0AH0dVdxzG7WmpNUk7na6P2hSR2w=;
        b=OxaJDCFc0BNSp5lmuMN0FDVPSnaobOSqBb6zUWtvv2S91EOgy3UocWhLVylBBIV1RD
         TzR4Be/Pln1Fh9iDB/6endJ0NbaGM6dBDaedUpjhXxZmskEPHGoKk+DLKHz3/FfXsyqQ
         YTZDMd21CbriuMLRggfpZefZS1vSdWYgvbF/AKFMz/fKeZnTA0ioA1DVUE04evPTfrSb
         GgIBFweBRr0BdMcdm2cjLwJowB8a1DZ5YCbM4DXLjxo6lWuvyle2icj9uUW00OLH41Hg
         BC3Oqs4ojZ4IfdvzdU463OqZu7ZU4OHER8q50uL9BB95RC7DACDt57dFL94SYMSJILr1
         ZHmA==
X-Gm-Message-State: APjAAAW6VYzmRBNMkKxnw1dCui8EQ7c0pZwQYvRzrhi1OfFbf9dAxOmH
        NLeghKaGCP3Uo2+DpU6lzfHTAg==
X-Google-Smtp-Source: APXvYqyGU7t/zxEI5K0ATkkBR81u9/X9uwrAb6dbyH/1hfmcdNGOu2ab0YCI1XpX8B+sHXVxBbl5Rg==
X-Received: by 2002:a05:6000:10c:: with SMTP id o12mr35333852wrx.106.1582104146936;
        Wed, 19 Feb 2020 01:22:26 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id s65sm2172296wmf.48.2020.02.19.01.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 01:22:26 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 5/7] nvmem: remove a stray newline in nvmem_register()
Date:   Wed, 19 Feb 2020 10:22:16 +0100
Message-Id: <20200219092218.18143-6-brgl@bgdev.pl>
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

Two newlines are unnecessary - remove one.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index c718ed7859e8..bbdf2fe076b9 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -359,7 +359,6 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 		return ERR_PTR(rval);
 	}
 
-
 	kref_init(&nvmem->refcnt);
 	INIT_LIST_HEAD(&nvmem->cells);
 
-- 
2.25.0

