Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8327B2D6
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 21:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727625AbfG3TEW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 15:04:22 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43442 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfG3TEW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jul 2019 15:04:22 -0400
Received: by mail-wr1-f66.google.com with SMTP id p13so66911291wru.10
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jul 2019 12:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YByX/MIEikMo6y+/BsApUfFIwT5Nds6qeZI/FLz+iII=;
        b=WJ+4MQqoD9Q3uf+EAOcOO8aRe05TiQmbFfTElKl33AA8RZrjfXZ+aG8+irnIj+XI4Q
         LBETQTjaFuYsoLAUGd63TFC4yAWQk6UdApDMkFZjEckz/3CXhb4HubQa6xt4y6BeRADT
         bVu4BRzhzWdnWtkMxAamu061nZFREfmqXVbBSpujNOi9vCL4XYLfdWRJI6ALHIQTm6Qb
         T2qsQSJ88fgsMdTG+uvLm/uSeqYHMBTGVQGUDYINQuRmz5nBH+lq8K5+MEe0ACdtdMeH
         71Jm4zZeMeZ2ABoIuLrOgK7N+e/jLRSW7gx6XSO5vC1pvEGpCX7EFKPYpAN2PPuvxFS2
         g/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YByX/MIEikMo6y+/BsApUfFIwT5Nds6qeZI/FLz+iII=;
        b=mFSzWdN/FbNvqnFkAxVr8apyEaJPsrCws5bW1p3yF6LbyMTJiXXDzZodyVBUJ/GEzW
         GHKftqO0FpE3wZdo9E3ysvlNSqs1fNgaIEJAD2dyV60IZ5qqlR+X19u/YKasgDkMeksY
         YXvcG2N6+U43y92RdKBrBTWHWg0aFB3Vao6mgmDOugoWEwtJ/sNHXO1/y/c5vd+kDq9Z
         jAFMu1lRD/KJpoQ0NQ/2AgOtnDYDFpOazGuXwtagBR9xd65y0DMGzXkj2Vhs4B8VVsLK
         qHGN1ixRds2qlcEEi1CFZm4QlHpNaYUNl6WZf4j5afNUwLiN1OymIpgmBkJVweBfhgEW
         UdZg==
X-Gm-Message-State: APjAAAW7ZE0sHvwxpP/st9MLldTPIGd9K91vaNNsrTqqj7IzzqacHb7T
        D3O4Mev8K//PYthAzYSXGtg=
X-Google-Smtp-Source: APXvYqyn9kR5ox2tUYNuHCQwQ0oJJf99Zz5HJW+MbxcGa1UsxCTY2cv5FAD75cN3D3eVQsJgpVvCRw==
X-Received: by 2002:a5d:5348:: with SMTP id t8mr24009159wrv.159.1564513460919;
        Tue, 30 Jul 2019 12:04:20 -0700 (PDT)
Received: from localhost.localdomain ([141.226.31.91])
        by smtp.gmail.com with ESMTPSA id a84sm82414251wmf.29.2019.07.30.12.04.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 12:04:20 -0700 (PDT)
From:   Ramon Fried <rfried.dev@gmail.com>
To:     bgolaszewski@baylibre.com
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        Ramon Fried <rfried.dev@gmail.com>
Subject: [libgpiod] [PATCH] gpioinfo: mark kernel claimed lines as used
Date:   Tue, 30 Jul 2019 22:04:10 +0300
Message-Id: <20190730190410.24786-1-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In case where the GPIOLINE_FLAG_KERNEL flag was set because of muxing,
The used column was still showing the pin as "unused"
Fix that by writing "used".

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
 tools/gpioinfo.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index bb17262..85f8758 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -119,8 +119,11 @@ static void list_lines(struct gpiod_chip *chip)
 		     : prinfo(&of, 12, "unnamed");
 		printf(" ");
 
-		consumer ? prinfo(&of, 12, "\"%s\"", consumer)
-			 : prinfo(&of, 12, "unused");
+		if (gpiod_line_is_used(line) && !consumer)
+			prinfo(&of, 12, "used");
+		else
+			consumer ? prinfo(&of, 12, "\"%s\"", consumer)
+				 : prinfo(&of, 12, "unused");
 		printf(" ");
 
 		prinfo(&of, 8, "%s ", direction == GPIOD_LINE_DIRECTION_INPUT
-- 
2.22.0

