Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2491623AC
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 10:43:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgBRJnG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 04:43:06 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39414 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbgBRJnG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 04:43:06 -0500
Received: by mail-wr1-f68.google.com with SMTP id y11so23035316wrt.6
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2020 01:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1tGKCYnBEpjpoG5QSejrUPURgc2UVgvoiMB1koCeCZI=;
        b=GCaozWAzhz2rzE3xCPycDcZfcJEqLfqMgQo3eIz7yz4vHoD1VyK54/EwdkV5KLeIEs
         kbsuHvMVu4ZPMyBOJfO+Gc3z2MPajyZGfG7z0g4X5mpq+bevno2+vcVtdt1sAU46rzQG
         vxmGaHfYDiWmrah4zwJxta/GwJpkfZsn19u+lPFY0VlbXwTxu3IWmQkEwYAnhkVmorel
         pIyMeeAIHglpnFeJKWHwDXbWA3tuC07pSrYe8S9AzG23GnAzbqIOV2xnptCCJCKACjqu
         3RLJUvOs+Xqy3WpIfGaPRCUe+njTB2kYKCavPhHCML0TSt2PnFcFSjuUG5csSmQ0z6iy
         MkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1tGKCYnBEpjpoG5QSejrUPURgc2UVgvoiMB1koCeCZI=;
        b=VMK2IwG5aId1wyEiT3MiLd7yMIUnUj5D9Q75PUyeVnKpD9s6++RiEiplgY843p7kJu
         0GMkeTc013rdhR16fDNIdiaCw3LJFNRuAkDfJ4vQNKBE6bHvDfds98gA/dCt0ac/Nq+X
         nIFJDo9a1etzM2kQbiHqigzC292EyAOG2XZeosPVc4mS6GxcpWB5m/oTX774y/qpG5S/
         4M4ojUCl8wLlzgCcPNHBswqQfPhMZoyYiYBIJ3cbZfRhM3pkr7PYXZLyYFn5xAVBlgue
         jbwRhi1UDSMVWaFbNiWPAjs1iKxokQ2dYqHIKSlY1mIQMjOEJDaTtzesyB0JTfLiw2ZV
         Auyw==
X-Gm-Message-State: APjAAAULCo3THnfPSuwSNP4TEveCCUAqEJM4x5B6Z+LvZPHACrUm19e+
        uPpelVI5t/49lYAE2gP+PsIPlQ==
X-Google-Smtp-Source: APXvYqyaik2K3jmCriYAi/Btuue1NpMxh6Kl4mMKAIzp4/pL1q8QhpdD78hGoBibP9oQDkjFFVN9Pw==
X-Received: by 2002:a5d:4746:: with SMTP id o6mr1437713wrs.70.1582018984313;
        Tue, 18 Feb 2020 01:43:04 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-188-94.w2-15.abo.wanadoo.fr. [2.15.37.94])
        by smtp.gmail.com with ESMTPSA id s23sm5351095wra.15.2020.02.18.01.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 01:43:03 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 7/7] nvmem: add a newline for readability
Date:   Tue, 18 Feb 2020 10:42:34 +0100
Message-Id: <20200218094234.23896-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200218094234.23896-1-brgl@bgdev.pl>
References: <20200218094234.23896-1-brgl@bgdev.pl>
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
index 5e7d46eccaf6..ec955db4673c 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -346,6 +346,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	rval  = ida_simple_get(&nvmem_ida, 0, 0, GFP_KERNEL);
 	if (rval < 0)
 		goto err_free_nvmem;
+
 	if (config->wp_gpio)
 		nvmem->wp_gpio = gpiod_ref(config->wp_gpio);
 	else
-- 
2.25.0

