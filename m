Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA8BD414417
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 10:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233950AbhIVIt1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 04:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234018AbhIVIt0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 04:49:26 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28465C061574
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 01:47:57 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id u15so4497252wru.6
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 01:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JDZbXCl9bSoGyZWgwef05HDv8VNeS1jh792KUo3neRA=;
        b=DZoVchhLRFdzVUSe0yYXFAwpDBWfu1vFZ0e8QBzM0DJRTQ/1IIRN8+wkYnyQ675Stt
         fvnYdZ2fO47NjBy82ZYQNVLi07vzSSdAAQnhqqL6lxF/OHNJiXVVlMF4a7/Y/pqK5I/E
         XeTXT93CXdY3TWrNl1gQ3HfjfPgtdsfqOxY/x1O6NXBWcow6ZNvykFwMk1RpIILJug+z
         5JofUn0Vz7jdiul7TFF1XgvvJR8oJWfa2WJhCxyD2Mnz4jV7AYPOBwCno3ejcw1UhUwW
         wj0WCf7mJjiKIgZIy8hXOmM3jHoJWMRNfSkXyjeQW+HqCcm8cYBY20j120GHWI/t4/zh
         L2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JDZbXCl9bSoGyZWgwef05HDv8VNeS1jh792KUo3neRA=;
        b=Gijp7GLXAPNLbK4YHKk9vMPnJPGShLfut/QMALRGr8lVHElTDTG9U5Pwpk4zM+lg9t
         Y0Zt6TCFkjl6X2qxmGLuDPK6yALuQYK9wwTsQA8f0tSRfr/a+jU8nU47T5JtUqSoveAE
         eF4ucmVQ6INlB5erNSD/M1BMMG7RlwXrurv6TiSRqew+S8QqOcWnBQizSdBG5HcdkvVS
         KW0rXOhsncon4wTuNhGZSCfFqqD4x2S4KmBVzHYwx3LMejVki3wzADDHVlNe1XTX6gtM
         EHaH03UaB5DxEI8N7MAQLqyJL+GRBQh97ylQUZ75xovTsMjv63JyFPex3TRmFvkTLpTY
         OrUQ==
X-Gm-Message-State: AOAM5320HupYcxkgvp6EfoC890nHApMkxZ9gMvjGrczz74qBYwALHLKX
        IZV83rhoZTRi7f9vQgpksHd7Ng==
X-Google-Smtp-Source: ABdhPJxeOvXJdOxLLJLg+I0IFMJsUNCZoiM3vmEEn5yFUSosTs2xx+btmuYiAJ/mjC10thMN/vVaPQ==
X-Received: by 2002:a5d:58c9:: with SMTP id o9mr41027703wrf.279.1632300475255;
        Wed, 22 Sep 2021 01:47:55 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id v10sm1591048wri.29.2021.09.22.01.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 01:47:55 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v6 1/8] configfs: increase the item name length
Date:   Wed, 22 Sep 2021 10:47:26 +0200
Message-Id: <20210922084733.5547-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210922084733.5547-1-brgl@bgdev.pl>
References: <20210922084733.5547-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

20 characters limit for item name is relatively small. Let's increase it
to 32 to fit '04-committable-children' - a name we'll use in the sample
code for committable items.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/configfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/configfs.h b/include/linux/configfs.h
index 97cfd13bae51..e398fb2e83b2 100644
--- a/include/linux/configfs.h
+++ b/include/linux/configfs.h
@@ -25,7 +25,7 @@
 #include <linux/kref.h>   /* struct kref */
 #include <linux/mutex.h>  /* struct mutex */
 
-#define CONFIGFS_ITEM_NAME_LEN	20
+#define CONFIGFS_ITEM_NAME_LEN	32
 
 struct module;
 
-- 
2.30.1

