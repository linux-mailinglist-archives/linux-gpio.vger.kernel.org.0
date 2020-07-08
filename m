Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63C9C217E12
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 06:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729283AbgGHET0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 00:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgGHETZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 00:19:25 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D49DDC061755;
        Tue,  7 Jul 2020 21:19:25 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id s26so5755199pfm.4;
        Tue, 07 Jul 2020 21:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ReGzyNGSefSJPOQjrjTLmjVp9vl7IO2xu/zGO+d6rEM=;
        b=PrrrfCY1xy9tox1r5mwnGG1Hs/6ErrSNt7uV0Lh10KSlJ4TiSFPaf4t+0atNjRmPCR
         0+noFTKb1xHzOvTMPFl2icZtN/I5z9po70kHyjn91sT95mkHLe0mItMbti3N9f95hdaI
         1eSWs2TyCyH+abrsBny/Tx3EA0KeYJAgYmAXpOYlomDaBFCeyRFq3V7OWmId7ihIsl7i
         VyztPfli1GUIb4d0FNkXKi/IPacgTGiBykNAb4L8U7B2UlA7hR612KYFUWE8MO+uL/dA
         dCMfm5zpJX1oxpgqI+IDz0Zja3v0QjM6z6Nl6lrCeIBCMCYGyHjvSGJ7Kn/w7z+gSB3j
         O/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ReGzyNGSefSJPOQjrjTLmjVp9vl7IO2xu/zGO+d6rEM=;
        b=K2aStbKy0dUlg7cgdtRgtfzFt9Kgly0QJ1n2kMfGCtodjLWKz8veCf2ya1Llkao7mY
         6Ys0YpB+20TNnQ0/p6QdLZsWOWtM2PDTSEZeZqHoNkPskVSCVvaTRg8770o5vlpohzmG
         UQMd3TKNIOpQQD/Y1XEHRnkb0NXgbjZQYrxJpHm7ecg40d1yM9O5ICXYmoqXBNla+wS8
         pOnLxUUKb3z7mmDJbjNUsq9alC/P7MIFSp5bZ4ODvpFBx7+6MMIdPcIJZfasDMzd5DeB
         mnYjgyllvGVleXM8sebg4Nnm58vmReHkbBcNucvWDMZENsSEsRNyUH51limqD6DKPeqw
         oyPg==
X-Gm-Message-State: AOAM533MkvCte2SnY66/3s3gwgAKFAQ81SsjQm6eN7hw/gvu+8Dh/ieq
        qfIE1Hcylskb+ZVwkrM5s43RLwgP
X-Google-Smtp-Source: ABdhPJzhTCtMfgimGZzzI5s5UdY0rskw6sIx+56m7WLhJKXAeqOU19yOLllhvWcl4jbAbDkK6jvkYg==
X-Received: by 2002:a63:184a:: with SMTP id 10mr24372049pgy.446.1594181964999;
        Tue, 07 Jul 2020 21:19:24 -0700 (PDT)
Received: from sol.lan (106-69-191-222.dyn.iinet.net.au. [106.69.191.222])
        by smtp.gmail.com with ESMTPSA id gx23sm3821951pjb.39.2020.07.07.21.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 21:19:24 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 07/17] gpiolib: cdev: remove pointless decrement of i
Date:   Wed,  8 Jul 2020 12:15:50 +0800
Message-Id: <20200708041600.768775-8-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200708041600.768775-1-warthog618@gmail.com>
References: <20200708041600.768775-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove pointless decrement of variable, and associated comment.

While i is used subsequently, it is re-initialized so this decrement
serves no purpose.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index b39e7ef8c0d4..d50339ef6f05 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -331,8 +331,6 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 		dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
 			offset);
 	}
-	/* Let i point at the last handle */
-	i--;
 	lh->num_descs = handlereq.lines;
 
 	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
-- 
2.27.0

