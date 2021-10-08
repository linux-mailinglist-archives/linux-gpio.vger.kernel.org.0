Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6732E4265B4
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 10:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233767AbhJHITo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 04:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233072AbhJHITk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Oct 2021 04:19:40 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5B88C061762
        for <linux-gpio@vger.kernel.org>; Fri,  8 Oct 2021 01:17:45 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id r10so27144301wra.12
        for <linux-gpio@vger.kernel.org>; Fri, 08 Oct 2021 01:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JDZbXCl9bSoGyZWgwef05HDv8VNeS1jh792KUo3neRA=;
        b=OYmhEfweByggqpQU57fPOKHqFV9b2B7AkrLhzr6cE913ljzUap38E2A/Sf1/3qIrS9
         EEJp33XQyD0KaM1D+/D57E/6ouWlMXcXk3Uy+oiNqT3Uvt7VBiOoScrAzwZ/tUdMEOqT
         O0Ym1rpYreAii4UkdKMOIHqU12zOpVRHEA+jB6X6aAYBEqpqVg+2HDeCYRfxC2zgJt6V
         mmJ58UDOJKxqxVe3jKx1SiM14C3Ytx5sfLcjY9qgLKWk2LXOF/mhDZBdCbvsT5N10qQT
         jno+owKxqWysxQSQSIDHwSYhgFFAyQM5/E8Kkalnki2LJEcKEo7rTFMqtM+XDifn0jH3
         9v/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JDZbXCl9bSoGyZWgwef05HDv8VNeS1jh792KUo3neRA=;
        b=VUF05SfD+xlSgWNL8pfrC2rexqhGdyQn2o7Ah7ga+Slzu41lxu/+N8hjmMpKycNJVR
         g4xeZBn3BZk2AuODv2uoofJVSi9gn5gli/phJkKmm/7z7zglSWK9LgUF8bNtYsSbAzFY
         Z2Lq/rZUocK68z+XXN5CdqgyFivQG8jLnOtHxAOsFPfg9QQScBlpnDOAbNPZndIx9vig
         ALT00638Q+LFqvY/DjVMAayFp1/dBzF+ibmMlPkKHmUwVj7Y3wu0yr/+vXTj20wWv/tA
         vxBltCAmWUstLnSNhuYcVRKh9MoNhqKjyJfJunvOwktHAWqV7jbsMEchn6DnKwK68ADR
         3trg==
X-Gm-Message-State: AOAM531UMVlGwAKwLm/vOhcgwrs3In6CFa6XiJlHRDR8iGZ+cz58tEpM
        EmcuWfgeXKNb0Y0VKicQtE3lLg==
X-Google-Smtp-Source: ABdhPJyZdS6TI7AjqLam2wc2FQYnHz+kaNFqNZoXR9Dh3OIT7M7DNUAdw6stcvV7m+6nd9Uat4gGww==
X-Received: by 2002:a05:600c:2212:: with SMTP id z18mr472321wml.39.1633681064467;
        Fri, 08 Oct 2021 01:17:44 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id i3sm1759530wrn.34.2021.10.08.01.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 01:17:44 -0700 (PDT)
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
Subject: [PATCH v7 1/8] configfs: increase the item name length
Date:   Fri,  8 Oct 2021 10:17:32 +0200
Message-Id: <20211008081739.26807-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20211008081739.26807-1-brgl@bgdev.pl>
References: <20211008081739.26807-1-brgl@bgdev.pl>
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

