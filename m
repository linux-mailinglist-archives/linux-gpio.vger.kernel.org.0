Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71432411648
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Sep 2021 16:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239969AbhITOHr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Sep 2021 10:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239948AbhITOHq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Sep 2021 10:07:46 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF243C061762
        for <linux-gpio@vger.kernel.org>; Mon, 20 Sep 2021 07:06:19 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id w17so21922228wrv.10
        for <linux-gpio@vger.kernel.org>; Mon, 20 Sep 2021 07:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JDZbXCl9bSoGyZWgwef05HDv8VNeS1jh792KUo3neRA=;
        b=f0NjFa0ICpmOy6mJy6ZsZplhHyydCU94Zej5JSP9XGx3f63aD7JkDhnUl/PQiZ5OVz
         a8KfewcJ4bjk9bfFwnDv/0Y0Law5wFx6P2JeGfnMis3tdhUbWkya8AV/fp0JehOvKQNA
         ywUEiyoNnkKXI8w7g6zpB2wKnpFn5513svDBs1e9Z4DDTfV6hrQQ6nppp0YcnnhQnT/f
         HlVeo8fC85zeQBOi8u5FIGAa7Pgv/pL1fVIKgSrEvwDO9sKFTkpi/Qtahuro5H9lIC6p
         CPri2/DZ48Ick1PxF68X/tsqN1CVMkSE1xmnpgUyEzWVs+Sfb0soSnvD8ik4cMqIJz7l
         VX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JDZbXCl9bSoGyZWgwef05HDv8VNeS1jh792KUo3neRA=;
        b=UKIMhUBE5g5k3mbrsG3Fy6VGLdA02a27K5ldZSyJf0pBp6uFuZQrT4RejEv5GDXgwy
         vADH0c3Cnx+PPvUTBHuB/gWXLA8gRyp0tFQSg7jFsMuV+u7w51UtxPV3qSMjQRYm9Kcq
         Twm5szrXTy3B1F27J3aw9W9pyMdzI6jGw5BkKCT6LCsiKmAXrOI4u6DDyP75WcxPPotz
         KkCFQlsd918TjkapGM+TDGxMbQCIrbKyylrmknfQllwRF3WtYw63D75AdADLiVWb7G8i
         LIJ+QmgLCA2NrUQpX8l9jQdCIwb5itQz9L1NdEaAut6bBjoNKxnyQVDwj55XKILMfELT
         XETg==
X-Gm-Message-State: AOAM533T0HM3qOenRiQ3yH0dogagR8XvhLEvNPbbUfhynQniWCHwIZa9
        jAfYiEVhJI0VSqhvMweeuz+ypw==
X-Google-Smtp-Source: ABdhPJzN6BmCIpSs6souDrSrdMhgcmcvAj7+/HavXepIjwcdQITU2X2WeMzV4dpqmPFPsrfrTCdprw==
X-Received: by 2002:a5d:6ca2:: with SMTP id a2mr28449768wra.291.1632146778072;
        Mon, 20 Sep 2021 07:06:18 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id h18sm15801461wrb.33.2021.09.20.07.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 07:06:17 -0700 (PDT)
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
        Jack Winch <sunt.un.morcov@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v5 1/8] configfs: increase the item name length
Date:   Mon, 20 Sep 2021 16:05:02 +0200
Message-Id: <20210920140509.5177-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210920140509.5177-1-brgl@bgdev.pl>
References: <20210920140509.5177-1-brgl@bgdev.pl>
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

