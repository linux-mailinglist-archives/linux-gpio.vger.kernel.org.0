Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC9628FB4E
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Oct 2020 00:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732252AbgJOWrZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Oct 2020 18:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732248AbgJOWrZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Oct 2020 18:47:25 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 376B0C061755
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2020 15:47:21 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id n9so202132pgf.9
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2020 15:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qFaWvmJbO9izPPnSObAj7cRVcOIfeQesk9dxI5egBBo=;
        b=hHgmWdMnBFeq20UXsxBA5RWRLFTiFLvYV2Y8nBm1tgyv04b58s7Cg56KzsGyI/EB9g
         fkYMpSumTrlrLEHvY2bOv48/BwgpkIe0+OM/sUFi9OUqWv2KppQhDXXkO26mK337rHMh
         Lo20mVOs2AVBrb8xRvoVYv5h9iqdISzGcQDN/1tQOgvB7ElwkDlva1EypuUH6Qi9za+s
         D2zMpJnen6pt7uc1PDEVCah2151Olso+cBqfPRdB6O9ixZ+O6sAnsZSq1de0wHOIwkYz
         gRTO1N37H8GipKjyYQV47WXwU587TEOWbDtpotx4jdpW4AGa/vydLVABKQ8CDZ10h2gg
         jCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qFaWvmJbO9izPPnSObAj7cRVcOIfeQesk9dxI5egBBo=;
        b=RJ2aWSSkMD1Osx9K5fXKIxyxkRW3PxaQEvVEtceUVHqYlkL+JaOjwpT3/x2PvFgKeS
         Z3gxbrf+FzQ8PrgGKsgc5Hv6k7048lIvOTKJgAlmW48lXBkDjp8dWQmPRs1EGcmErhpa
         cWJY9hDhqURCOorLMu4MaxXUMNeJXCA1oA0X/rKQKTQcKlUJM5ZTW/LYNkxcjq+WOXd9
         5d2WPqeYtxM0KplKdwJvh8AavqCeoY/mAX6t/ZJ5JnIiYeRBIyPG7YrD/mq0Go0trtny
         qPaOZRhywFBWNKH2LJRYhRdXamotudwACAi2H2+TUmmaUvZUubX3ddhcEvsGAZ8Le3gL
         EsRw==
X-Gm-Message-State: AOAM531fi4HZXhZdW1ezL39aB9+4fWRopDyGAIqVrLn5hjJURW5fukm4
        0GQ+sF4tYNlVlmsT9quHP8PHWY9xYe2LKg==
X-Google-Smtp-Source: ABdhPJwpyATONwExLKP32MrvkoJYRojCrWPoLY9zkILIOQ7cf4TKv7Sub7DitAhpwpPc5s8vT9mB2g==
X-Received: by 2002:a63:f343:: with SMTP id t3mr636521pgj.86.1602802040345;
        Thu, 15 Oct 2020 15:47:20 -0700 (PDT)
Received: from sol.lan (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id t6sm330957pfl.50.2020.10.15.15.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 15:47:19 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] gpiod.h: fix typo in gpiod_line_request_bulk() documentation
Date:   Fri, 16 Oct 2020 06:47:11 +0800
Message-Id: <20201015224711.8624-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace 'prodivided' with 'provided'.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/gpiod.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index a6e34ae..f44a34f 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -1141,7 +1141,7 @@ int gpiod_line_request_both_edges_events_flags(struct gpiod_line *line,
  *         this routine returns -1 and sets the last error number.
  *
  * If this routine succeeds, the caller takes ownership of the GPIO lines
- * until they're released. All the requested lines must be prodivided by the
+ * until they're released. All the requested lines must be provided by the
  * same gpiochip.
  */
 int gpiod_line_request_bulk(struct gpiod_line_bulk *bulk,
-- 
2.28.0

