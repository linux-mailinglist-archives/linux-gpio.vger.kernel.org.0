Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5935B694DA5
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Feb 2023 18:05:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbjBMRFN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Feb 2023 12:05:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbjBMRFN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Feb 2023 12:05:13 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F0DC1F4B2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Feb 2023 09:05:11 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id a2so12973992wrd.6
        for <linux-gpio@vger.kernel.org>; Mon, 13 Feb 2023 09:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DLTWRK7M+TUFP8jIcnF//HyyXXnxzgffRiYXyEK9PG0=;
        b=GSc99BIbenzxHLMvxYmyrId2tcmnC8AMj50bjk+mnuVMlZM0e5qMO4mk1zjjE+Mhov
         CWvOSFIZRDHijgvqhRtxJz7aIA2wp6XU0pArYeBHI2xehKONeGPsgbF5f+fx+0nTi9uo
         xE6ir0t5XC7CAe5THV1opS1Y1SuDKJN2Wjk+xmXWygbxLaLaT2d0sZ4hWGxk+b/3A9qe
         M7n7Hi1WpFTNdZJYjSe4VDYUtQoaQ7BHspCYo5u33kzRiH/nhmPPBL8hlMxffkPXFHOp
         ld8iWzIXJyyq8B6bEvTUZTeySEObjvDjQnRkjRnfrnl84sjkRFG7O+IA6F0e2FX7wwRO
         Iggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLTWRK7M+TUFP8jIcnF//HyyXXnxzgffRiYXyEK9PG0=;
        b=XlXhWnNMEaMlW51n1Tyvc1T3NEGaK4VsMRDKt384P54HSdXoaOZeXQX/TWJb+Tmy04
         6mb9t1IajOoXQpPyOSY+MIJWKz+oyYaTdiAFVslZVC0eC6z88d7f0tZDFcFrXgYs2HOM
         B94l0dAw6R+PuCtdzbkZMkFzgpJ0o3wiS3aKVVyAGONvuNh1H1JkXS5IND9aIXBrRpaT
         AwTBb0gJsLJsY/8S1BixQWHTXsOA96AVlqAPfousXYiJUJ4Oa3isLtcb3oYXknZ+MEAR
         VzJ5d0865yrgaQXwgyWtXK6HV5AA1XqGz8kp9Fyf5eqLFvRHpJ9wb938uGnAIL1wZtdk
         kZlQ==
X-Gm-Message-State: AO0yUKUfz0cn7NboPus5wOJDvCsFTVbgsAplGVE4KaUIszF651BVJqoF
        aFkbJRKVMZ9wI+/N6cXDoMjXGg87E7y6AhFx
X-Google-Smtp-Source: AK7set9aMwnfTjA/3jToDEtJ4Of5U2Zw5F0Rpg9y2lTWKZl4oG/ujoI3Fv0IBsWeM+XufTbdg1WYFw==
X-Received: by 2002:a5d:4bcf:0:b0:2c5:6080:b37 with SMTP id l15-20020a5d4bcf000000b002c560800b37mr1115211wrt.39.1676307909809;
        Mon, 13 Feb 2023 09:05:09 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b003:f645:fa8:ccfc])
        by smtp.gmail.com with ESMTPSA id a4-20020adfeec4000000b002bfc0558ecdsm10888449wrp.113.2023.02.13.09.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 09:05:09 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Peter Robinson <pbrobinson@gmail.com>
Subject: [libgpiod][PATCH] bindings: python: pass DESTDIR to setup.py
Date:   Mon, 13 Feb 2023 18:05:04 +0100
Message-Id: <20230213170504.360265-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As per automake docs:

The DESTDIR variable can be used to perform a staged installation. The
package should be configured as if it was going to be installed in its
final location (e.g., --prefix /usr), but when running make install, the
DESTDIR should be set to the absolute name of a directory into which the
installation will be diverted. From this directory it is easy to review
which files are being installed where, and finally copy them to their
final location by some means.

Prefix $(prefix) with $(DESTDIR) when calling setup.py.

Reported-by: Peter Robinson <pbrobinson@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/Makefile.am | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
index 9fb2e95..75ce53b 100644
--- a/bindings/python/Makefile.am
+++ b/bindings/python/Makefile.am
@@ -18,7 +18,7 @@ all-local:
 
 install-exec-local:
 	GPIOD_WITH_TESTS= \
-	$(PYTHON) $(srcdir)/setup.py install --prefix=$(prefix)
+	$(PYTHON) $(srcdir)/setup.py install --prefix=$(DESTDIR)$(prefix)
 
 SUBDIRS = gpiod
 
-- 
2.37.2

