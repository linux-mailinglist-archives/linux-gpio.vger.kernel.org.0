Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81457157F32
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2020 16:51:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727641AbgBJPvH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Feb 2020 10:51:07 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35133 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726796AbgBJPvG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Feb 2020 10:51:06 -0500
Received: by mail-wm1-f67.google.com with SMTP id b17so968467wmb.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2020 07:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VVUX15grq0yL5hXK2L5z6URUpFhkeVkraI0SBslrt6c=;
        b=HzbYqqhD1l4W/GGIpLtzVUedbDNSgT72PN6pVatV3aQPy+E3PxizRtOTMNZQ9E2Ck8
         uFsq+hnRcG6WCWRo4UbtSmqfe8eAVuMehP32sMLXQjqdjBbuDamKXYcyxHXT2NcS4iuF
         e2EP46PP4kw/R2zXCUOiit8cPLYyq1XhLysSP/J/aW5W2lzzdJGg3O1/AwOW1W8DpQcK
         SXnry8wJTHHCUCe+ec/H3ktIzV4Qv+kDbUgWR075zDYyrqzF5S6AmQDXL9s4bp7xmVsm
         m5UDK6yTCmKuynz3WXCt9MKYaiMT+d1CsBcOwYVyLGghrNSBHRhdhUOnWoRMqQpGLwlc
         P0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VVUX15grq0yL5hXK2L5z6URUpFhkeVkraI0SBslrt6c=;
        b=MBrIO+eYYuYhjkbPFESVIlLwJYjMNko5x9ATgHptjTU+NrgIZ367fyaBKUkzeuyiT1
         /1EEds75pw9XPgaYr67ER4jx5l24CsIl9wryrZanR/3vvbSzJIOQcEDolFyleReWENPO
         bBV+V7r23+Qonf9xjsdoboZvE5r3C0oU08CwsYDVnNIm5BJtZJYz4TuGjYuz3+9RWezl
         JPpBfOtyvtjIOcVgDLd/cNmQNOd00MxkcduY8zRiAB57gIQAlsG4I+F9oAs0PICPMm46
         BjCMKZ9cSaELBEZ+712bgoyv14scEN2aL2lUVpoCyi2VP0pEr1WEb/BuGcYiNGc+GmsY
         woWg==
X-Gm-Message-State: APjAAAXLKpxGe1pAxzLyrzMFUUEVHIou+X9FlzYEl8mMfIlxoie5TEKh
        zNtNtx5wNBdXGVcmknVFlN3fKA==
X-Google-Smtp-Source: APXvYqzHJoaOC9IEEOzx74BbUevlCU0ZsygtMKB+vATcmTPdQ0yW5TKt0SmxNUc0LZg+05VlrggL9Q==
X-Received: by 2002:a1c:491:: with SMTP id 139mr16408185wme.117.1581349864626;
        Mon, 10 Feb 2020 07:51:04 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
        by smtp.gmail.com with ESMTPSA id b18sm1096420wru.50.2020.02.10.07.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 07:51:03 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] gpio: mockup: coding-style fix
Date:   Mon, 10 Feb 2020 16:50:59 +0100
Message-Id: <20200210155059.29609-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The indentation is wrong in gpio_mockup_apply_pull(). This patch makes
the code more readable.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
This fixes another indentation error introduced in v5.5 that I missed before.

 drivers/gpio/gpio-mockup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 7d343bea784a..3eb94f3740d1 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -171,7 +171,7 @@ static int gpio_mockup_apply_pull(struct gpio_mockup_chip *chip,
 
 	/* Change the value unless we're actively driving the line. */
 	if (!test_bit(FLAG_REQUESTED, &desc->flags) ||
-		!test_bit(FLAG_IS_OUT, &desc->flags))
+	    !test_bit(FLAG_IS_OUT, &desc->flags))
 		__gpio_mockup_set(chip, offset, value);
 
 out:
-- 
2.25.0

