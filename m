Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0DB168244
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 16:49:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729305AbgBUPs5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 10:48:57 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36187 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729267AbgBUPs4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 10:48:56 -0500
Received: by mail-wm1-f68.google.com with SMTP id p17so2413109wma.1
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 07:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=weuvYYix3RqIGgN/zRk1CorKOjlasqkVrieHVbtyLfQ=;
        b=pDPNgmdOf/U0uJA/dCUvRKyjmPqgQvuJPLGrWl10qYMA1x29exMf1l4sMCoM/uyRq3
         HW+5fymFWoWTnZ6Ipuwh119yotiA8G/fYUEzHjW2lZT/0/W8DD5VlOpQNw7I2jBIJLzO
         zGlZqnauVbfzXjoB453dr1XEsE3UdK7Z8lOAjNxhu5asdDQmJXAdfTzhXozAWlBs80B/
         juK+HqFYs2X3k/XqQsoCxV7v24sstOWillOR3fN0ESUYNfSUohFjodwZzddws9LqGupi
         KilmL3Wp7U2udJH8sEleyox/chdfTl2xWR78NHWjZHYV1MpiUMIWaQflO4I66iDXet+G
         UNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=weuvYYix3RqIGgN/zRk1CorKOjlasqkVrieHVbtyLfQ=;
        b=G93I3rqTqFSnfnNpyWwXHK/CKA+vGwYVmccaXkYbM7SScWzMxWCOoZTyVQ18cV6h9X
         iromIpJ5z36/aWDRC+jh4upcOvZuxn1Jgv5a4gu3ZNEYX+lIO8yicE2iDexhH5GKC31V
         jLOkkwoUnwKvPYTeMIjNgCsJg8kGD7lCGov6neiHqwZsiInWKIi5G24EePBRunV73Vs0
         UwaNr552X8hKyUun0sgBHTdie8SpYlkl/Zv8cwyHomOZZbfY9vmp6z0O5CE8L+N7LUEu
         kxdWr2hLubpEc4TY0V6O///w6Sdtjx/V9JPZuQCauena7X7C+nNl4PegHoDYnP3OJYi0
         xU8g==
X-Gm-Message-State: APjAAAVqH5tB1qBYJOEUX7zOmj7GDCD9oyuwPpsFFwZuAORbXUESNo41
        9Sg1ucZJrGkSs0j//1/ar/qXsmehqsE=
X-Google-Smtp-Source: APXvYqz92SmB6gKyEyIcN3ICAdhIl2aQg8oaEDyPWAMvK1vUcPAjc3XIajuwdwWuLn4EzJh5mbCYdA==
X-Received: by 2002:a1c:bc08:: with SMTP id m8mr4707440wmf.189.1582300134092;
        Fri, 21 Feb 2020 07:48:54 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id h10sm4267947wml.18.2020.02.21.07.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 07:48:53 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 5/5] nvmem: release the write-protect pin
Date:   Fri, 21 Feb 2020 16:48:37 +0100
Message-Id: <20200221154837.18845-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200221154837.18845-1-brgl@bgdev.pl>
References: <20200221154837.18845-1-brgl@bgdev.pl>
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
index 4a4ef2049022..790ec9b5552e 100644
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

