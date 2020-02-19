Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52D2616403F
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 10:22:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgBSJWr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 04:22:47 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43173 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbgBSJW2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Feb 2020 04:22:28 -0500
Received: by mail-wr1-f65.google.com with SMTP id r11so27252796wrq.10
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2020 01:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oxGRWgQyZaN66YaIn8IJWZO9FxN0tzHUnwFNQKByXPI=;
        b=iCGQ3bYjmnOtKoJ8pKeMvNLxscxSAGuVvttFcWq2ERZDxpGRRgO4kidvI0KcWv8nXA
         fx57kM/cJliaS+twGxTaw3zKJDBsfoYHa7l9U6aenq93u+5ev0oIhZNTK9Wbteug9wnL
         IjSYJt9mFbu6taLp+WVqE1ruW4cCVjEGbVkU2ZzMb2Fs/mQjVEEDydcRcdx/s5k7pRq5
         o27YxsJuK63V3PaWEeM0uy/k5V317m6z82zIwMC4P31TLDp5LbZ9idSRt334Ki2gNc7n
         fEq0R0ybgBcLWz1Z9CyQutYbY6F9wgeqlqqCZZpAmJOW99FDkgxWO4KK4pRuqmRm4Pzx
         gABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oxGRWgQyZaN66YaIn8IJWZO9FxN0tzHUnwFNQKByXPI=;
        b=ihHhV1+xXX3Ja6JueWcask1NJ8nEhIXQNt/S0PTbalNfp+aMXgGfSkrCgaAQOf2uUQ
         7a0RI/QPsJs6O6OSjfbjtaK5KWKO/xQ10DXZjO/WoT8etTNNGRoMg7JNgfDq5IQcZNoq
         u7U4P6qyWr3sZYIjrVQsEMTPtwwaDBT4w6b74E7BoS0CaZ7Z+WF8/9CNl0ktXDYBtRE5
         l0CsFnZsZiU9t7FbRpU8RBTqC79W2NRZ3CphrYWhQaODCJJ4+F4ejN7CzgYXkNEge/Lk
         6WVxY7mr12KFbaKBJ/lrJj+ENSsyY6ZMnoOZq4bpCrtEus+pdidSulNprfSXT2mrjV7b
         oj2w==
X-Gm-Message-State: APjAAAXoK6saZ9f3F/mQW5hQvU4LhUX8dZbWF5mBzuK3RL0tjDWxtFNU
        coTe+RlkAb87fYR/iBmV0CECs/xDhV8=
X-Google-Smtp-Source: APXvYqx1Po0CNLWh6Y6FSu7EmSWTjdBDdibTgs3GlSbpu8zQIsgCN4AFKouhXosuNsOi9axD96FpVg==
X-Received: by 2002:adf:f406:: with SMTP id g6mr35205849wro.189.1582104145872;
        Wed, 19 Feb 2020 01:22:25 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id s65sm2172296wmf.48.2020.02.19.01.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 01:22:25 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 4/7] nvmem: release the write-protect pin
Date:   Wed, 19 Feb 2020 10:22:15 +0100
Message-Id: <20200219092218.18143-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219092218.18143-1-brgl@bgdev.pl>
References: <20200219092218.18143-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Khouloud Touil <ktouil@baylibre.com>

Put the write-protect GPIO descriptor in nvmem_release() so that it can
be automatically released when the associated device's reference count
drops to 0.

Fixes: 2a127da461a9 ("nvmem: add support for the write-protect pin")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
[Bartosz: tweak the commit message]
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 4e6daaa2b0f6..c718ed7859e8 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -72,6 +72,7 @@ static void nvmem_release(struct device *dev)
 	struct nvmem_device *nvmem = to_nvmem_device(dev);
 
 	ida_simple_remove(&nvmem_ida, nvmem->id);
+	gpiod_put(nvmem->wp_gpio);
 	kfree(nvmem);
 }
 
-- 
2.25.0

