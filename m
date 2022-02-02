Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 728004A702E
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Feb 2022 12:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233698AbiBBLmQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Feb 2022 06:42:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238004AbiBBLmP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Feb 2022 06:42:15 -0500
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A98C06173D
        for <linux-gpio@vger.kernel.org>; Wed,  2 Feb 2022 03:42:15 -0800 (PST)
Received: by mail-qv1-xf33.google.com with SMTP id i19so18629358qvx.12
        for <linux-gpio@vger.kernel.org>; Wed, 02 Feb 2022 03:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EU7htQR9jiepwG7F9yRq3BzovxCC6pSdj6b35MC8l+A=;
        b=IqLX5CE9uqzxyEXXLi6uiNxYHyUvzSGN67d48aE59kFd8JmjDPKLG18jwhhNQAYF2+
         PpqCW783mCYVD4j1fBNk0d1KfV7Tzzn9AO1ljGMlRwy13XrLNtvRNy2ShEY0sn4/n9kK
         jdr/KcYtZ+/gmbuzqqStOIrt8COlUetUtHeemhfojNZihI4B+8vCJELcjzvuRaBtNirq
         JqsbZix7IO5xaraxCdqEb5+FkAo7h4oLxf6/6AcScy+v72Q3HjBEiDoD3rBOWjmOYhZK
         FRMeLVJAF5R5C5ar9/eO/b4XkYcfKwBFz3APxdHcF/eZaLnnhLARN8UEX+VbMZb6m2O6
         WPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=EU7htQR9jiepwG7F9yRq3BzovxCC6pSdj6b35MC8l+A=;
        b=pymb57IUsFL4o+otYr2IEZFBVQg1nqBBJOyei0QF4lmpYTS5Qxoyll3FjZ1MDtM/mv
         9YfV9ej6gJXBhbiLZXXJy58Y6n/EK4RJlva8RupbyTcD9YnnXJEheW2RPNTsLvGo+3Mp
         JRJQzdVZHUO7dATx0B7WaCAJRnt+ayv0CSv//zs1aSY/3F/6IryG7vwpAXdKeWTaVRu2
         7ppgO62apgS1DOa1KqmwiTBNM5CTs4Xzml7yqlZCOmPfWiFkcEC/+LrQI2MAPNydQaZY
         OqgpH7kmWHpapSNCjTn0sbgrKtF8uDa+c0IZ7D92j3UQB991dL4bAmYHWpwopCd+Me5F
         cP0w==
X-Gm-Message-State: AOAM530kTf9BvH5R40wr6q29uXt6iFg0MUQAupUv6kAkRGUZEpWC9T6C
        iQDD2oQ6oynK+62aR/Qinj/bWH+EEjU=
X-Google-Smtp-Source: ABdhPJwSjJ0OMVyD+4TCIPwj1utvTxiVyxuErrVxjO9U0zRd8LthV0K+VzzzozeyUzDSZ21tDVFt8g==
X-Received: by 2002:ad4:5745:: with SMTP id q5mr25528671qvx.55.1643802134220;
        Wed, 02 Feb 2022 03:42:14 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id 17sm36629qkj.23.2022.02.02.03.42.12
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 03:42:13 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
To:     linux-gpio@vger.kernel.org
Subject: [libgpiod PATCH] core: Fix line_bulk_foreach_line invalid memory access
Date:   Wed,  2 Feb 2022 22:12:04 +1030
Message-Id: <20220202114204.31918-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Running libgpiod applications under valgrind results in the following
warning:

==3006== Invalid read of size 8
==3006==    at 0x10C867: line_request_values (core.c:711)
==3006==    by 0x10CDA6: gpiod_line_request_bulk (core.c:849)
==3006==    by 0x10AE27: main (gpioset.c:323)
==3006==  Address 0x4a4d370 is 0 bytes after a block of size 16 alloc'd
==3006==    at 0x483F790: malloc (in /usr/libexec/valgrind/vgpreload_memcheck-amd64-linux.so)
==3006==    by 0x10B884: gpiod_line_bulk_new (core.c:109)
==3006==    by 0x10DBB0: gpiod_chip_get_lines (helpers.c:24)
==3006==    by 0x10ADC3: main (gpioset.c:313)

This is because the foreach loop reads the next value before checking
that index is still in bounds.

Add a test to avoid reading past the end of the allocation.

This bug is not present a released version of libgpiod.

Fixes: 2b02d7ae1aa6 ("treewide: rework struct gpiod_line_bulk")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 lib/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/core.c b/lib/core.c
index 6ef09baec0f5..4463a7014776 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -178,7 +178,8 @@ GPIOD_API void gpiod_line_bulk_foreach_line(struct gpiod_line_bulk *bulk,
 #define line_bulk_foreach_line(bulk, line, index)			\
 	for ((index) = 0, (line) = (bulk)->lines[0];			\
 	     (index) < (bulk)->num_lines;				\
-	     (index)++, (line) = (bulk)->lines[(index)])
+	     (index)++, 						\
+	     (line) = (index) < (bulk)->num_lines ? (bulk)->lines[(index)] : NULL)
 
 GPIOD_API bool gpiod_is_gpiochip_device(const char *path)
 {
-- 
2.34.1

