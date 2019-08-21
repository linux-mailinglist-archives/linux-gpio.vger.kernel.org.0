Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B23F597307
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2019 09:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727393AbfHUHJc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Aug 2019 03:09:32 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:32805 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727206AbfHUHJc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Aug 2019 03:09:32 -0400
Received: by mail-lf1-f67.google.com with SMTP id x3so1016236lfc.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2019 00:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WvCdDs27K7pjHlxW/lguM0GFJmclMsxyphThq+/f3Rc=;
        b=jRu11QVUnY7WAsa5c4Pn7tT8vTDJPlCCvZD1cVOL65bTSbdvAsTjNvzrA+BDBer2uz
         ldRNTwHabJGAEshGShfI4bt4Btkpk2dlXVq+D9AuLOWVjIgWbgHGiVYiDVhij8m4qct0
         SYntJjWgACJFo6gUaphsrrf/Mso/PNxx2eWAIVHVLCTV9khRmDnvOrqg+eMRFqrynjgu
         BYX28dnuakxnGn1pmC87zY4uFdAEHfNejwSKKiaFoH1QzaI0DxojTweuFnso4l855z9d
         s/Fo/tZlbUgn+heAOqNFppoLBbv0y1TwpzYBdve3yvp5Q7P0q/AJ8bkcIBsqb+W8oeoR
         gqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WvCdDs27K7pjHlxW/lguM0GFJmclMsxyphThq+/f3Rc=;
        b=mO4QRI0ukneK+sM2FK6T64fWJNJVF+v1Qbw33DhlimO2ToLRWgUtu5/k9RIW2Q89lk
         lab+sNJ7EfE9w0gpOAwrknTHJqA0YmOm/6U91ANZAbRz7mxy9FfMMJHxrHgWLemKH68X
         CLIZ1Vkk63Y3NUhg3zYIdLYUe5QoA/uGlaYYPOQkp6bNF+kAEpJHnZk+NDEcQob/nPPt
         pxi3JL7MbeYNVBIkasThfJ/7j4RgorEAOLHs5HbzV4BB6DTgUj3X4dkyn+fnbty8MgcS
         MF/4qS0e3j0uZVKS/qvZBhmcrWf3i3C6gBDXyPPAQ7GOWROBecYGg8hUEsImuc9Upf54
         1ZJQ==
X-Gm-Message-State: APjAAAWl4hZogY9o4jSEcSejFhJyhkZUVWsFe9bQetUR2CVSwABjJR0a
        rAZ5B8LF/HANxkvZ10zJTuXbn1FZkGY=
X-Google-Smtp-Source: APXvYqwb6vw+VuYXeTdqYZW/uMlKecXd8Xn//7FEoYqK2DQRMFtB+FnNbDOeCgtCykOUjyfCga5/gg==
X-Received: by 2002:ac2:5596:: with SMTP id v22mr17177263lfg.132.1566371370315;
        Wed, 21 Aug 2019 00:09:30 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id r89sm3134693ljr.75.2019.08.21.00.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 00:09:28 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: coldfire: Include the GPIO driver header
Date:   Wed, 21 Aug 2019 09:09:23 +0200
Message-Id: <20190821070923.687-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Coldfire GPIO driver needs to explicitly incldue the
GPIO driver header since it is providing a driver.

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Geert can you pick this up for m68k?
---
 arch/m68k/coldfire/gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/m68k/coldfire/gpio.c b/arch/m68k/coldfire/gpio.c
index a83898426127..ca26de257871 100644
--- a/arch/m68k/coldfire/gpio.c
+++ b/arch/m68k/coldfire/gpio.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/device.h>
+#include <linux/gpio/driver.h>
 
 #include <linux/io.h>
 #include <asm/coldfire.h>
-- 
2.21.0

