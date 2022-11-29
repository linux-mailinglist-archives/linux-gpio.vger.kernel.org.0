Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7846E63C027
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 13:36:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234383AbiK2MgJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 07:36:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231238AbiK2MgI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 07:36:08 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB905E3C1
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 04:36:02 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id w15so8653851wrl.9
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 04:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hWVgdCMnhwn+ULQ+BMW4C2l4SMlaLtwN2upBlcvgS5I=;
        b=gCF3NC4G0Dd0LlP+y1aC2rAe4K+TxDgb5TqSDZcoEf4E3LDMzbb/5RwlSMJaa/i9Nf
         NTxPIU5rQYUE1Y1oms/Slm3ZdDC7K+uIVxOSkB87oNhJiLTCJ5wRWKnXp2/0NmCoG3XW
         hUFEsjgZA2BRKWLLnJ0opppCUwKyjhhjKHPMt0dpn8h9/G3E0btTxzAw0Nx0MobK6/Y7
         5K1nu/I8BmsGrF8I73A7BiIjHYLXzvDCmDitjjdI/U094IqS3namvL9TWUOIs6edfvIG
         niv1NfQRQbGQqX6i8D0MhI7x3umUotNJpwu6Fo5Q+tkTQiYplEJbvXx0beUzFto2YQSW
         TIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWVgdCMnhwn+ULQ+BMW4C2l4SMlaLtwN2upBlcvgS5I=;
        b=6JemCRg2YBpqLlbVUmBxddm7JoIqwjrryKFtu9N8CWy4oaitIZnfz8sm1+AAW4JJTx
         tXq/KNmjsqJQsGp7pvuV9/kHHDtYXbQ65nD02e74xoy32OBjobLGsEEafNqrMD4zOomc
         SkX6cHidZYeC7aCIFdJYIITPT1FVQL5Y/dmoO56SVKnB3ew6uUvKpgQlDxxJUukiqSoF
         9f1dZ2deIkMP+WfzvqAWpxBm2/VR5Vq9G8187TjSb0yxeO8sn4ROgPn9PZq2RdXxCUSE
         lK7g/7bviqE7V30hBAHBJ24eSzfh9a/KhQNQgpOyl48MRpgsftA6TpkO0ddDN7BBzk/z
         Bw8g==
X-Gm-Message-State: ANoB5pmZMgKBBDaeSpgwbLeoYUZAbsMraZAE/4SmgETbS21uJ6/S0OeZ
        xAu1msU0Ef/PUpgrdhSFTS5Dlg==
X-Google-Smtp-Source: AA0mqf6qovACsKbyaIex6XGP7sYDtXnXXnhPZUzOzNHxlAzymrBknqzYhUkMUAwles2kf56JxRiq9g==
X-Received: by 2002:a5d:4f91:0:b0:242:1847:c798 with SMTP id d17-20020a5d4f91000000b002421847c798mr5833664wru.237.1669725361398;
        Tue, 29 Nov 2022 04:36:01 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6b19:1d8e:fbca:fd02])
        by smtp.gmail.com with ESMTPSA id k13-20020a05600c1c8d00b003c6bd91caa5sm2295306wms.17.2022.11.29.04.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 04:36:00 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 0/2] gpiolib: don't allow user-space to crash the kernel with hot-unplugs
Date:   Tue, 29 Nov 2022 13:35:51 +0100
Message-Id: <20221129123553.353410-1-brgl@bgdev.pl>
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

This is a second iteration of the changes that aim at fixing the situation
in which the user-space can provoke a NULL-pointer derefence in the kernel
when a GPIO device that's in use by user-space is removed.

I didn't add the review tags as the code changes significantly.

v2 -> v3:
- drop the helper variable in patch 1/2 as we won't be using it in 2/2
- refactor patch 2/2 to use locking wrappers around the syscall callbacks

v1 -> v2:
- add missing gdev->chip checks in patch 1/2
- add a second patch that protects the structures that can be accessed
  by user-space calls against concurrent removal

Bartosz Golaszewski (2):
  gpiolib: cdev: fix NULL-pointer dereferences
  gpiolib: protect the GPIO device against being dropped while in use by
    user-space

 drivers/gpio/gpiolib-cdev.c | 190 +++++++++++++++++++++++++++++++-----
 drivers/gpio/gpiolib.c      |   3 +
 drivers/gpio/gpiolib.h      |   5 +
 3 files changed, 176 insertions(+), 22 deletions(-)

-- 
2.37.2

