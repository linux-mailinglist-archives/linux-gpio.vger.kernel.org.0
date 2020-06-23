Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2308220483E
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 06:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732107AbgFWECZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 00:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbgFWECY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 00:02:24 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD44BC061573;
        Mon, 22 Jun 2020 21:02:23 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id 35so8570386ple.0;
        Mon, 22 Jun 2020 21:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bC9ynXd4F/s6hkCty4NlJ0fUEOgHX2qzuPDIPZLMBAM=;
        b=lX0q9/G7P57n76scvPKm16pAXRU989y9yxg/302JoL5I+xc1czMEHkY7NJuaQJc3O8
         nzesxpfEg8IAl42rlpHSvjDtnGWkGxTbGFO13aDsBrLIILUHAGzVUtQ2Jiv+DKiDJGsY
         HHJrBCbmC4ITjFw4nfSLaZGKCSmeyYjMWv5O23RG9JVsgdVlSr5aQYzEFxDbgeH+GNkx
         l+3GqF6ENTDVm1Fo71mqlQ06XGTyxWKTF82T3dRiLUeO1z9rFfhWDOPLHe7+s3MlcSX9
         KfbnpByFpwawWld0mg9Sa8SB0wNP1GpXsiPjCV+iQ38V+aLNDbleJ/ZhC0v6a50+BaHZ
         c5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bC9ynXd4F/s6hkCty4NlJ0fUEOgHX2qzuPDIPZLMBAM=;
        b=Eoqjn+xlymSCOQjW//grBdD3r7KxS/u7J/OTfYPIJJvpNbmaZhe9Z70tec7hbf0J+N
         ldQWPleaFbWmmyZXue+J5ejV+lnoqYXaN8Q49vhRGChwvCCPT+EogrOnbi9ZXn8iCrNV
         OjpEJsYn4DBihbMiRDStvpJ4yHKmR39BswHkHgsLm2VzJGJbgyJU+dBpatQcLHM/TnS0
         1kP38x1YrkhJOFyoByqV9fmaU+z1e4dXEVj1cSVMpTp+VkQ/31RiM94yrztUm2ZAywBB
         XWlDX1lrPsHiOnvdmFFlweCZj59Z8i2Vuh6vVv9psBsm11HpO4L5hkEO5fYgxNrwvHw/
         RYBQ==
X-Gm-Message-State: AOAM531Kl5JV5dLpDDTQolS9rD30oXzQ+MVoztonzFFubj6VEZxE3i5Q
        1E0pEQpsa35kEgDhyV5B8Bo0KCFDxjs=
X-Google-Smtp-Source: ABdhPJwuBsimsEDAM0kN1xoKk2e3IJbQmSvvCwoZGzBsg4I7b3+HKOxTYB47LNPlLGeZycaC4tRunw==
X-Received: by 2002:a17:90a:df11:: with SMTP id gp17mr725282pjb.188.1592884942911;
        Mon, 22 Jun 2020 21:02:22 -0700 (PDT)
Received: from sol.lan (220-235-126-59.dyn.iinet.net.au. [220.235.126.59])
        by smtp.gmail.com with ESMTPSA id n64sm12442315pga.38.2020.06.22.21.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 21:02:22 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 07/22] gpiolib: cdev: remove pointless decrement of i
Date:   Tue, 23 Jun 2020 12:00:52 +0800
Message-Id: <20200623040107.22270-8-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623040107.22270-1-warthog618@gmail.com>
References: <20200623040107.22270-1-warthog618@gmail.com>
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

