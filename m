Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF6744A848
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 09:24:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244029AbhKII0s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 03:26:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239099AbhKII0s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 03:26:48 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DB3FC061764;
        Tue,  9 Nov 2021 00:24:02 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id r5so19608019pls.1;
        Tue, 09 Nov 2021 00:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/ObBvvdfK0rOPDXHfLBPPfh89zKu+hFmOacks0ZOP8Y=;
        b=IPerIFMJ7EW74Om8qHG2xT4JFQYWF+rpZSAWuBGSY6dYLl+WH2ZdhsTQB+8tjzk0gV
         4lMJQ4P+L6FiysAygAF+s7ByLvp91lAaM6Rg+HPT0Z0n7LyzL7RSZk6Uk4tkGZ3T3MsJ
         2vlipZiVoH2/Zr5fjkDAFnhasZcJaJ4vQApDnSl8iWhwsYPHBBYkwuOSmlcJLFSe+giw
         VGoo+iG/HoWkKrLsoMNxZJoMYbtbwAS4Kw6AQQDUGweBVhaggIwrw3gwbGnbRKTwhWPd
         /itfRKSud1HUyySLZJDVkE1xBKBq0IyylWXocdgZuICSrARfnQqq3jCBiMTrXJOClD5f
         V61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/ObBvvdfK0rOPDXHfLBPPfh89zKu+hFmOacks0ZOP8Y=;
        b=4uyDXkI2a3KnFovMUDPQ8QcYH75Qg45pW5k2TU+NNrtheuw5OxjH2Y5OT6aAyhZQxk
         ceaq9XLfWrgIGVhlZ9ygCipHhvfJ6xOpdadgCSHoy+uCKE+70GNIQra/NlCTX+QRC3vV
         fD7pO/lMH7ru57PpbXUsWua0szeR0kk3DDW/3Acfj261lDHQe6Uos7CLBDD0UdCg/SRR
         kdrD6qsltvcN7Ja7Te89PIloi+BO5iunvutThQSFmHWwgCRNuF2olnq/wOaxsVk0n/KF
         WiuVpqzl6UiLHA0KOefmPxyxa0cjYtjoCgEASa5YfRij9zCZeBttGp5ir2HcB5iT91dG
         DJVw==
X-Gm-Message-State: AOAM532Ur2zPqNMpUPccH6k4GNfkXLyscBdSAEMZuaNP7DVx1D8IY4Z9
        5fBw7/8Ur/AuBPqQLKEBRgw=
X-Google-Smtp-Source: ABdhPJyKSDwtCCwSUW8AR8d9qzOSeuyM5hs9Wk8F7LxJO0LRG6ld3ZCFjPM61qsMhC6w71bG0zMlqQ==
X-Received: by 2002:a17:903:246:b0:13f:2ff9:8b93 with SMTP id j6-20020a170903024600b0013f2ff98b93mr5628103plh.54.1636446242111;
        Tue, 09 Nov 2021 00:24:02 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id kx3sm1730566pjb.5.2021.11.09.00.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 00:24:01 -0800 (PST)
From:   cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To:     info@metux.net
Cc:     vireshk@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, chiminghao <chi.minghao@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] drivers:gpio: Remove unneeded semicolon
Date:   Tue,  9 Nov 2021 08:23:57 +0000
Message-Id: <20211109082357.131251-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: chiminghao <chi.minghao@zte.com.cn>

Fix the following coccicheck REVIEW:
./drivers/gpio/gpio-virtio.c:437:2-3 REVIEW Unneeded semicolon

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: chiminghao <chi.minghao@zte.com.cn>
---
 drivers/gpio/gpio-virtio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index aeec4bf0b625..84f96b78f32a 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -434,7 +434,7 @@ static void virtio_gpio_event_vq(struct virtqueue *vq)
 		ret = generic_handle_domain_irq(vgpio->gc.irq.domain, gpio);
 		if (ret)
 			dev_err(dev, "failed to handle interrupt: %d\n", ret);
-	};
+	}
 }
 
 static void virtio_gpio_request_vq(struct virtqueue *vq)
-- 
2.25.1

