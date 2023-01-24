Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC70679F05
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jan 2023 17:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234198AbjAXQl7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Jan 2023 11:41:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234485AbjAXQly (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Jan 2023 11:41:54 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E44CB74B
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jan 2023 08:41:29 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id h16so14450005wrz.12
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jan 2023 08:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mIZBXBrBO9juAB0MxFq1YgXdsI3c3YiizmncWQ1CgkE=;
        b=KC2v6dLyeY39cT+zOxPU3WV5hKE/TLYvDE+j9iIGbzz4FGQn0BghiXbHKMOcGltQO+
         FtJLrxB0cJlYfHL3fbRpfeHzwMzHh/4P218f7Vo8uxWyapKUu7iaUvfqfuw+sqpncLpB
         y0djvGw7FfbfZ9OBpEu8iJJJekmXDoQ4dUhlDXK+xfcaQ1sD6gO2g95USepr9ajlxTVt
         RHwi9kd4ONQ2IGcBlEwNfOC5k3mTzhSyLtzssPumVBFq4qNmci5fmELYdfqV57LL5GQj
         BCVVEMa9Kdy9RtbHh3KHPyrJphtBX+8s99+bx4XwjurmaPvh5BeVwRnBFyHkvPwbZYvd
         nWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mIZBXBrBO9juAB0MxFq1YgXdsI3c3YiizmncWQ1CgkE=;
        b=54yClEVGSlkdCiRWJDdef+w8dPlw8YZQP7bLvTmCJzriTwRJV5BHxY87V5b2/fvCqo
         zW884DKoQBYN6gtSYJk0YVmWb4flbxGcOdktGdZLbgKGOjzkvCY/hMtvTl6rxJKhYds/
         WKdmkU5pEbWOEUaOrmSzrye24EWmgVbLvxE067xt5/4mHl+xNjVYwo5LH7QRhEp2ZLPg
         8he+52YAOLgDwS2hHX5w36dy1iDxeSSXZBbxpNYctWHjdbL0UU1c8bpZz72pTxapczFk
         Bh/Z5LCZZEEk+ztHN/HAwTSxzVySBfqvxCwPUub6siJZ3huwBE8IXrhcM18viW0OuIwq
         J0QQ==
X-Gm-Message-State: AFqh2kqy9fJX9JBdymv5bwn+XhZzkdflpdtc9ydWG+nLbxyrp3bFvH0l
        P6dm9JpQt9QqmboUGE+yuJrZZg==
X-Google-Smtp-Source: AMrXdXtEsvjC2rwF9qrTPVlIoxQJGp0oGlu2bKLIpQfmsvxxwaKs89+AfMV+QLNuK/OnbnuiJucyLQ==
X-Received: by 2002:a5d:4dcb:0:b0:2bd:c1de:a33f with SMTP id f11-20020a5d4dcb000000b002bdc1dea33fmr19487990wru.19.1674578487749;
        Tue, 24 Jan 2023 08:41:27 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:9c80:c796:921b:31df])
        by smtp.gmail.com with ESMTPSA id y4-20020adfd084000000b0028e55b44a99sm2212951wrh.17.2023.01.24.08.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 08:41:27 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod v1.6.x][PATCH] build: don't expect automake to set $PYTHON
Date:   Tue, 24 Jan 2023 17:41:26 +0100
Message-Id: <20230124164126.291374-1-brgl@bgdev.pl>
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

It seems that the implementation of AM_PATH_PYTHON() changed in automake
recently and no longer sets $PYTHON variable which breaks the build on
some systems.

We know we use python3 so use python3-config explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 configure.ac | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure.ac b/configure.ac
index 3149384..0460810 100644
--- a/configure.ac
+++ b/configure.ac
@@ -204,9 +204,9 @@ then
 		AC_MSG_ERROR([python3-config not found - needed for python bindings])
 	fi
 	AS_IF([test -z "$PYTHON_CPPFLAGS"],
-		[AC_SUBST(PYTHON_CPPFLAGS, [`$PYTHON-config --includes`])])
+		[AC_SUBST(PYTHON_CPPFLAGS, [`python3-config --includes`])])
 	AS_IF([test -z "$PYTHON_LIBS"],
-		[AC_SUBST(PYTHON_LIBS, [`$PYTHON-config --libs`])])
+		[AC_SUBST(PYTHON_LIBS, [`python3-config --libs`])])
 fi
 
 AC_CHECK_PROG([has_doxygen], [doxygen], [true], [false])
-- 
2.37.2

