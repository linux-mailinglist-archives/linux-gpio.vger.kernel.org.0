Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0DE25D915
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 02:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbfGCAeF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Jul 2019 20:34:05 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54041 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbfGCAeF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jul 2019 20:34:05 -0400
Received: by mail-wm1-f67.google.com with SMTP id x15so372792wmj.3;
        Tue, 02 Jul 2019 17:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TGoqpi8eTuf/N4Y6xU5hQJ3LkSfTnTRxjGlzchSiNoo=;
        b=iJzLgUkaf/kITE4bgtlY7bRYzyMu418HQO39xYh5QhykMUkbA7iuGAEPIkd5OA23oJ
         IV/QNiGjxXVWfUF/bOXvMfR7spHQ4DHr8DpZa8s0o9eRRTtPhJj8JDjtKnHPbSPs5tC3
         jTbxSo0AraxUKtNkaMNehTDcIkl1QGaOp1pu38PhAp6MW0NYPuysWVyCGpAFM1B5KdAK
         XZ6ov3TmN9MBV3uDyXf8TlLmqrAW+A4xHYIUr3iLnrOhelsx5+2ijz/pMtBuQveMFwj7
         MUMwlm+N/RADtZ8rtGNu8I/pE+2mScENf3NPQJ4aWUgBU2r/z155Lkcw4c6RwhkmvPBG
         tSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TGoqpi8eTuf/N4Y6xU5hQJ3LkSfTnTRxjGlzchSiNoo=;
        b=qKn4efvMbY+lUKFDEXtsbBTUJclnXJ1nVy47oVgj9w3Cg/1p97b9lDbTbrNOqXPlsM
         Iy5lZHA3S0bPD8xOA21y80GKzSYc4m3DDezv+FcQXekF3Y7R1jk2suCHUiJtiRAXrnmI
         PS4y2+oWAIeFxz63+yHhSCE4Ojtfn5EGpfbz9wx5Z0bBgKiua//wH91908jYqjxfZT5T
         bbW2ELLsOqFXW3n383Zgi9PUzxsEct1lnv888f2VMekGuLcpbYh8/mbImn+5uEjhDKng
         12sInHyF4A4vf1+SxPSdQJyIvpnm3PCx8gZzfnZhVm7ZrsDOJ3apU2P/xPwX7n9VpROT
         Dk+A==
X-Gm-Message-State: APjAAAW+jxdEkfDS0VoubRClucIuEu9RFJh77Xp2x7nieYJwC+w6O90a
        mpBoKgpLlTQYhTXzanynDGaL6Pp+
X-Google-Smtp-Source: APXvYqyooLUdpD1x6HJlyZAkAlxvY6nD8KekDIR8WttCJQ6A3tTSLOeJLUZ0B7DLdI7FkWi8Nr6Btw==
X-Received: by 2002:a1c:c145:: with SMTP id r66mr4721581wmf.139.1562106791814;
        Tue, 02 Jul 2019 15:33:11 -0700 (PDT)
Received: from blackbox.darklights.net (p200300F133D62000A09003363445C98E.dip0.t-ipconnect.de. [2003:f1:33d6:2000:a090:336:3445:c98e])
        by smtp.googlemail.com with ESMTPSA id 18sm253513wmg.43.2019.07.02.15.33.10
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 02 Jul 2019 15:33:10 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     blogic@openwrt.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org
Cc:     dev@kresin.me, linux-kernel@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 3/4] gpio: stp-xway: get rid of the #include <lantiq_soc.h> dependency
Date:   Wed,  3 Jul 2019 00:32:47 +0200
Message-Id: <20190702223248.31934-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190702223248.31934-1-martin.blumenstingl@googlemail.com>
References: <20190702223248.31934-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the xway_stp_{r,w}32 helpers in xway_stp_w32_mask instead of relying
on ltq_{r,w}32 from the architecture specific <lantiq_soc.h>.
This will allow the driver to be compile-tested on all architectures
that support MMIO.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpio/gpio-stp-xway.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-stp-xway.c b/drivers/gpio/gpio-stp-xway.c
index b31e08f84681..9e23a5ae8108 100644
--- a/drivers/gpio/gpio-stp-xway.c
+++ b/drivers/gpio/gpio-stp-xway.c
@@ -15,8 +15,6 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 
-#include <lantiq_soc.h>
-
 /*
  * The Serial To Parallel (STP) is found on MIPS based Lantiq socs. It is a
  * peripheral controller used to drive external shift register cascades. At most
@@ -71,8 +69,7 @@
 #define xway_stp_r32(m, reg)		__raw_readl(m + reg)
 #define xway_stp_w32(m, val, reg)	__raw_writel(val, m + reg)
 #define xway_stp_w32_mask(m, clear, set, reg) \
-		ltq_w32((ltq_r32(m + reg) & ~(clear)) | (set), \
-		m + reg)
+		xway_stp_w32(m, (xway_stp_r32(m, reg) & ~(clear)) | (set), reg)
 
 struct xway_stp {
 	struct gpio_chip gc;
-- 
2.22.0

