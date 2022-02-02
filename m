Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 989594A70D3
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Feb 2022 13:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbiBBMdD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Feb 2022 07:33:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbiBBMdD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Feb 2022 07:33:03 -0500
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD82C061714
        for <linux-gpio@vger.kernel.org>; Wed,  2 Feb 2022 04:33:03 -0800 (PST)
Received: by mail-qv1-xf36.google.com with SMTP id g13so18791131qvw.4
        for <linux-gpio@vger.kernel.org>; Wed, 02 Feb 2022 04:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D6P+EaQFNxPvTuAt6DQ/0lVZyEOWvIZF0n+UKbVv0+U=;
        b=RIRAzEV8csgvN6oucqxHkUAhbhznsRb15qGmhV5vD2S2ShKsK/ZsZMeFEBfmWIYb/Z
         b5fYbx1lHCmbAfOP144egmoCSirEXnXuEfCuqrkPydH8gOItqQNaSxSkDfi1crnkd61q
         he/pRIxClsxHhy1iLlafI9tOzquk8ayH7vtc3p1ELoDwm12MALfB/f62uW/s4PFXzugN
         fdmy7bgq1m9jtJxJ157y8vE3xlFnvQbBlJju34x9CZl0dUjXOhwx7k9gVFNNBzBFVOg8
         V5tSCC34/vwgMM9BaN3oKQCZAv4SvadicW1szvflVrKYEdgodhv03zAEXe01tQNFEigd
         dBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=D6P+EaQFNxPvTuAt6DQ/0lVZyEOWvIZF0n+UKbVv0+U=;
        b=Q6s2IxK3ZerQQwrOLAd6ku/EidsRk87ars9JryD79TziTfw3Md+ugPg8Yhk2/+sbbc
         4t9cGzXtFd4r46B8shfQlmV5a3uN4Qa8yUQkeYkN1NplmCfJutpi918TvTiY17O4fZp9
         iC6Km6tIoiFSN+TFrERlqN9OXKYxgRE857prOn4Z74e5renFwhxWZQuxrMQ+HTW+rSux
         T6OzLAi8k6cwtZYiqJYxME5ZV7GQcN6ALWKjHXpYFisDbRedo09cEO0JL1GA390aMzCs
         tVqKkS50OdkdCLfaYCNIe82rBVPukspJlKC36L3jx3vV6DkB27G8si1KU/25eSXuMJ2c
         vVpA==
X-Gm-Message-State: AOAM532cfVt8Q6+clPcAdODllzQuC2ATapYpFKIWj5c8RNF/hmF/7LS7
        UMnKxqWxAzyjuAuscyhOZcnVMQQt1hM=
X-Google-Smtp-Source: ABdhPJxdt9eMwRg6JN6d7nkVz/WPS6SxYlOcnUv4//5aBQiFT9buqP8xAtMPaEeo0kdLAK1fdf5GPg==
X-Received: by 2002:a05:6214:b62:: with SMTP id ey2mr26923565qvb.86.1643805181827;
        Wed, 02 Feb 2022 04:33:01 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id bq41sm6742007qkb.9.2022.02.02.04.32.59
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 04:33:00 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
To:     linux-gpio@vger.kernel.org
Subject: [libgpiod PATCH] core: Fix gpiod_line_bulk_reset type
Date:   Wed,  2 Feb 2022 23:02:48 +1030
Message-Id: <20220202123248.36955-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

bulk->lines is an array of pointers, so it doesn't matter which pointer
type we specify to sizeof(). As it's a struct gpiod_line *, it would
make sense to use that.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---

Alternately, we could make this sizeof(*bulk->lines).

 lib/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/core.c b/lib/core.c
index 2e7ee4b5b896..6ef09baec0f5 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -117,7 +117,7 @@ GPIOD_API struct gpiod_line_bulk *gpiod_line_bulk_new(unsigned int max_lines)
 GPIOD_API void gpiod_line_bulk_reset(struct gpiod_line_bulk *bulk)
 {
 	bulk->num_lines = 0;
-	memset(bulk->lines, 0, bulk->max_lines * sizeof(struct line *));
+	memset(bulk->lines, 0, bulk->max_lines * sizeof(struct gpiod_line *));
 }
 
 GPIOD_API void gpiod_line_bulk_free(struct gpiod_line_bulk *bulk)
-- 
2.34.1

