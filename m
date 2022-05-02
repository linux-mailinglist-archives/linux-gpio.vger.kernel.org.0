Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9B4516D70
	for <lists+linux-gpio@lfdr.de>; Mon,  2 May 2022 11:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380873AbiEBJh7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 May 2022 05:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349713AbiEBJh6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 May 2022 05:37:58 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6CC442EE5
        for <linux-gpio@vger.kernel.org>; Mon,  2 May 2022 02:34:26 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 125-20020a1c1983000000b003941f354c62so4359401wmz.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 May 2022 02:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=chO9wtDC2MyZWlxrwBhtVKtyweTI246LrXKDxS7qvic=;
        b=VzjqvTwPweWsoRC2NVEUqtVEUUGjy4JZkIOg0NDE2xIHxqY/gYT2gV9xGH91VRWGgS
         VdBTjNW3c8yukhXx6xjKOBF3ibZEQQ6pPwpANEAyy7jV7VIoF70t8yO25XeLvle2w49E
         EP7OxGralCg7isao62EgOiaOl2dOgffklL8+DLdAnqWr3gWYMJfR6l928xR0Ma4i5aLC
         x+JC6i0zqfrZjDeCxfILDi18hPRUg9/i6M5fVFWJ4Igyret7J40DeaNRfeYEAUvFsOtO
         kIJytLp4u6lcqZ4RhEbcjZcYrh7gi8twkmVB/dpRLzfzGfk/zs7tlerJ2PxGi2ZELWwT
         8w2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=chO9wtDC2MyZWlxrwBhtVKtyweTI246LrXKDxS7qvic=;
        b=IKwa10WFvuCLNxX3bGhrSslp6BlSovH03Sxglc7CZNkeh+nyrfvZumhOEm/BYlPdSh
         cU7+kobktiexXGSZ9nzEzp/HluQfLuPY4jQhcRDuJVMDYQ4PRpRqA7flYHIfFiHFgKww
         bQpTHwAGhoNo7W4oRCNhLU81aOF4/UnlP/mOgNh/NLybiBUu7kbiN/wTR3eDb6CdyIyO
         Lju94Re82VLLZIvspPfOw6SaLWnDnsnz9SygyrRtnXUzjojExkj22lgrqbrHDCjTwVs/
         Oirq9Yy+a76ugEXEphFUv/NCcVM90MruEuThAUGXRlr7o2vlYvsnGss4oX5PWI4lxCy5
         /UyQ==
X-Gm-Message-State: AOAM530sSTBiAVmohWSEZbLEuQWuioUnIwM5359gfHHMOX8linnvN8FC
        MUh4MlpGXQKNxw6YwQPtttEJBQ==
X-Google-Smtp-Source: ABdhPJy+9wZm9GuGGT6hgKcKpuHXTo24bKjjElVAft4J/U6lBSQkQRbqfpGVR3AGcaIaP3AIxbV+Rg==
X-Received: by 2002:a05:600c:4f50:b0:393:f258:46ed with SMTP id m16-20020a05600c4f5000b00393f25846edmr10287147wmq.35.1651484065162;
        Mon, 02 May 2022 02:34:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b643:d945:6c79:d4f6])
        by smtp.gmail.com with ESMTPSA id p25-20020adfa219000000b0020c5253d918sm6747732wra.100.2022.05.02.02.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 02:34:24 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] MAINTAINERS: update the GPIO git tree entry
Date:   Mon,  2 May 2022 11:34:16 +0200
Message-Id: <20220502093416.22744-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

My git tree has become the de facto main GPIO tree. Update the
MAINTAINERS file to reflect that.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Reported-by: Baruch Siach <baruch@tkos.co.il>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index edc96cdb85e8..9d47c5e7c6ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8385,7 +8385,7 @@ M:	Linus Walleij <linus.walleij@linaro.org>
 M:	Bartosz Golaszewski <brgl@bgdev.pl>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
 F:	Documentation/ABI/obsolete/sysfs-gpio
 F:	Documentation/ABI/testing/gpio-cdev
 F:	Documentation/admin-guide/gpio/
-- 
2.34.1

