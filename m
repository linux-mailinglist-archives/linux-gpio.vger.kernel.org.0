Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2D1165AFF
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 11:01:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbgBTKBv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 05:01:51 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37914 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727761AbgBTKBu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Feb 2020 05:01:50 -0500
Received: by mail-wm1-f68.google.com with SMTP id a9so1325931wmj.3
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2020 02:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rxg8wmjxreDjdCxMbMFlkmFGNPMJBkC8wL2SGMFmsIE=;
        b=pH5LbdRX0pwT9xeoJSpNRq+O/QWUaVVPyNAEsp7JEh2ZmbVS9HIiVO7xqgB7hpK72C
         9UtLbQH7NcgwIecn0DB6MrOL1lVxxugOXxir+Qpnd3xWhrndnPwYikNvJeyrQbln50Un
         cPBwE4YU989LwnzNRUyXP9yRWbqsS3/junhhamirZpZRuzI+j3FC6BrLFf0vo+rZ93fz
         ENfXtq8sloPkZ9zpgJc+uvopDxVNtCyqF2AbrmUUQKHg77jE8viA90V5BZu+UVJoUR26
         TFJnzmL//ktizHCoxk7F/BlMeiSDJt8lt4E9VGz29ugbHkeU/eL7IDmJ7RgocFAf7rtl
         oYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rxg8wmjxreDjdCxMbMFlkmFGNPMJBkC8wL2SGMFmsIE=;
        b=kAaaH7no/XNut7zOytXYZ1j3gxLhgNQAvN2qVBrbLeHcOV64C1MfBuCib24ut6gSSq
         tSfwAmvjEolbbjKDGH6pzrjoRHG3mYkfIV8j3fJ/KS3QxafP0H2QT0pKbeuOrsRTkJnS
         NgwciOP4H0X5Zr3Wz+r6Tey2XDo6xD5ApLZ0pGSxGfZGO1KKe18W2y5rYyfR1hj1oAaX
         vFee1uIY2PnDspn1uLtZytI9xYxOe6w4eJs0hRt0ykYzVLaEHUpEVI4E1alrOfrWZbRk
         Jwn53f16CdBPVYhY0xdvMnWLcVZD9AcjKP9PZ7AJD8WKBSWDRoyPvA47UAlD2IOYCc3f
         Ag2A==
X-Gm-Message-State: APjAAAUieS2BtI4wT3icADBEzeCgWpfwDKaRkU2ku4yHNzSZ2UrWcjXN
        SS7jpZijc2QWugP5y7rlIYdl0Q==
X-Google-Smtp-Source: APXvYqz6AFzCkyjyEbLox3ck731L1v4MNuLzNiI4VmJe3XCIzy/DGkwb5lkGPjUJsnaVTCB/OecZNA==
X-Received: by 2002:a7b:c183:: with SMTP id y3mr3518038wmi.0.1582192909156;
        Thu, 20 Feb 2020 02:01:49 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-188-94.w2-15.abo.wanadoo.fr. [2.15.37.94])
        by smtp.gmail.com with ESMTPSA id z1sm3663496wmf.42.2020.02.20.02.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 02:01:48 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 3/4] nvmem: increase the reference count of a gpio passed over config
Date:   Thu, 20 Feb 2020 11:01:40 +0100
Message-Id: <20200220100141.5905-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200220100141.5905-1-brgl@bgdev.pl>
References: <20200220100141.5905-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We can obtain the write-protect GPIO in nvmem_register() by requesting
it ourselves or by storing the gpio_desc passed in nvmem_config. In the
latter case we need to increase the reference count so that it gets
freed correctly.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 948c7ebce340..071fb897394c 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -349,7 +349,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	}
 
 	if (config->wp_gpio)
-		nvmem->wp_gpio = config->wp_gpio;
+		nvmem->wp_gpio = gpiod_ref(config->wp_gpio);
 	else
 		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
 						    GPIOD_OUT_HIGH);
-- 
2.25.0

