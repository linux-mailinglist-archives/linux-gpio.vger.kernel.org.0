Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 468FE28F7DA
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 19:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgJORwu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Oct 2020 13:52:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbgJORwu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Oct 2020 13:52:50 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 058B1C061755
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2020 10:52:50 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id b10so1536479qvf.0
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2020 10:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3X2I7cStvd4xmqXPkLy3fXOehmsfR0eEy/FJS4kQRN4=;
        b=uDsFnTi9fojDa0LwirOQ3Qr0N4KT9yDBPURJVYLt27K5U1xL+HiC3aArX2i9hVGnFS
         stt7WE+GLKM8egbl6y0pBB791zj6NQbtsgsp9/JZq/KfU/2JPVPQ3uQZVF4zpY2A8ZTI
         LC5HFu/ttkaV+S37TSIx9//JvlDusro5wTrk2vPOxaqIWXmYrKN7oSUONK6doMdCS2Lj
         JytgSjtvGuZU0KE5uDgiSHyEgBW2+xdcbbzvOmc1itguj6R8iisk6ENrWtlXWYNBUv3g
         4ECwoI3tvK8StGjolgrzCpP5G6XjO0Kr0LA2cXexmBy3fGknkHIwOScWOVtMVaFgMf3m
         nwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3X2I7cStvd4xmqXPkLy3fXOehmsfR0eEy/FJS4kQRN4=;
        b=P8SibSYjTU7AEW5UbsbbHDQVFtIos0ECfuC4Hx2d4NRbB1Q44RnVqmlhMZEcpc1Cum
         MobDufp6FbbwR74kFIq0RVVRZI+Hs+YjNrcThqQIDmLn5ZRb9t9ETULk3pt+s6rWiOxT
         R2sENMSEEvhuA3d8BzAfnOedsaEyZ25Et9vrI7os5/lLBj35oA97x7iN+2czL5yVLP4D
         YZ7P0VHi8JM7soAAXESd3V0oKqbyBe65WHx5Wvbk01X04HAhL1vPKUKzP6Q+2h1MpXLH
         84JEGMpFH8BZKKikTeuaDypL7MEojR4b4XV0uYdfJqCQ6bnI1GoquI65HN+PGBdONxmT
         tVqA==
X-Gm-Message-State: AOAM532Ior9+CeqpnlUr6iq87HkgVJxxRmwvERUTViw7Nk4Rwq3aHOpq
        RZP41BjAGbzd5JRtLANKJ7MMmuPEKitahQ3o
X-Google-Smtp-Source: ABdhPJwj6qF+UqxaKrlFNAxnjnGOO2ckSkDPeekIXCm+Sq/pPq65tdpFJMr7MccGlbhbjMuVt1SMlQ==
X-Received: by 2002:a0c:9c09:: with SMTP id v9mr5768776qve.57.1602784368947;
        Thu, 15 Oct 2020 10:52:48 -0700 (PDT)
Received: from mfe-desktop.router7c4a3c.com (modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
        by smtp.googlemail.com with ESMTPSA id h8sm1464955qto.46.2020.10.15.10.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 10:52:48 -0700 (PDT)
From:   marc.ferland@gmail.com
To:     linux-gpio@vger.kernel.org
Cc:     Marc Ferland <marc.ferland@gmail.com>
Subject: [libgpiod][PATCH] doc: fix typo
Date:   Thu, 15 Oct 2020 13:52:35 -0400
Message-Id: <20201015175235.1054316-1-marc.ferland@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Marc Ferland <marc.ferland@gmail.com>

Signed-off-by: Marc Ferland <marc.ferland@gmail.com>
---
 include/gpiod.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index e684ab1..8b7c619 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -1057,7 +1057,7 @@ int gpiod_line_request_both_edges_events_flags(struct gpiod_line *line,
  * @param config Request options.
  * @param default_vals Initial line values - only relevant if we're setting
  *                     the direction to output.
- * @return 0 if the all lines were properly requested. In case of an error
+ * @return 0 if all lines were properly requested. In case of an error
  *         this routine returns -1 and sets the last error number.
  *
  * If this routine succeeds, the caller takes ownership of the GPIO lines
-- 
2.25.1

