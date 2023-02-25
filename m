Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C24DA6A26E5
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Feb 2023 04:12:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjBYDMl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Feb 2023 22:12:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjBYDMk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Feb 2023 22:12:40 -0500
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89EC76BF50
        for <linux-gpio@vger.kernel.org>; Fri, 24 Feb 2023 19:12:39 -0800 (PST)
Received: by mail-il1-x12e.google.com with SMTP id i4so943362ils.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Feb 2023 19:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EegiaCt3i75KVoRCREM6GnhJCLFk3rbBPD+j8gbqGEQ=;
        b=D3pGMSnPdv1DoU8/rqEz3oyxsx96NozJNjXo/cPTU7q1XkcgEb3fI5I6QgLhnG19Wb
         lXeCWcHT2oOQOR/wQTpXzQo5wqzPxGdSoYOteZwWg2ca4no1h2DkhVgO02zB0CuiA8Hb
         c2Zefo96cAfOamnLMJMqIt8+7OnSDJ/J41HwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EegiaCt3i75KVoRCREM6GnhJCLFk3rbBPD+j8gbqGEQ=;
        b=YPB56cMD+JB40cpagX4yUKTn7tXiBJbUQ2RsfWeMsqGvI3IShfpqyX1sm0m4RvoOnf
         1nicL0nTzwl2E6c9XEJDV1GQUAWkrJ/71uTrVxHbolRe2AvXYx9ShNhwLIE5p8AgU/fK
         DFXnqEkUdBfofar1Kd7d12dc6BB24Yu3MgiNggS1fQPcchPTz2IcUnaEb5r+KVzLnjML
         fZyvhbe6kr2Mq5A54Pv0JLYXUcdDqcaa0hI2MdJXjD/Du1Euj7RLSh+v4q+/SfS7LLhh
         DhKqwck8nRD/4dsQBpplMcqJNBYbiUn42Xqtch5i734ZVvYWTMC0f1bl41BxoLaT6R/F
         muDw==
X-Gm-Message-State: AO0yUKWSxXqfUxuznj7nJoodz9jmr+nGPzyU8yxoxgSsIZP9Pl8/EF7b
        2T8bjP4d1mhvrghkscnQdMCQne1IRRi8vaJk
X-Google-Smtp-Source: AK7set8L8Uz0S0YcYGnULRUUBUI+WY5TVuKX0znBMcK4TnuweSboxxiFyvY0By6pS/q45NgPsgDvDg==
X-Received: by 2002:a92:9410:0:b0:310:d294:1664 with SMTP id c16-20020a929410000000b00310d2941664mr11422833ili.7.1677294758582;
        Fri, 24 Feb 2023 19:12:38 -0800 (PST)
Received: from localhost (137-025-033-021.res.spectrum.com. [137.25.33.21])
        by smtp.gmail.com with ESMTPSA id o19-20020a02cc33000000b003e69be53404sm176251jap.150.2023.02.24.19.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 19:12:37 -0800 (PST)
From:   Benjamin Li <benl@squareup.com>
To:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     Benjamin Li <benl@squareup.com>
Subject: [libgpiod,v2 0/2] tools: fix compile issues when GNU extensions are not present
Date:   Fri, 24 Feb 2023 19:12:33 -0800
Message-Id: <20230225031235.3886280-1-benl@squareup.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

v2:
- Add missing Signed-off-by: tags.

v1:
Fix issue when building against a C library without GNU extensions, such
as Android's Bionic libc.

A commit with a sample Android.bp file that's working against Android 11 is
included for informational purposes, which I don't expect Bartosz to pull.

Benjamin Li (2):
  tools: use getprogname() when available to remove dependency on glibc
  build: add Android.bp to build within Android tree

 Android.bp           | 129 +++++++++++++++++++++++++++++++++++++++++++
 configure.ac         |  11 +++-
 tools/gpiodetect.c   |   4 +-
 tools/gpioget.c      |   4 +-
 tools/gpioinfo.c     |   4 +-
 tools/gpiomon.c      |   4 +-
 tools/gpionotify.c   |   4 +-
 tools/gpioset.c      |   4 +-
 tools/tools-common.c |  16 +++---
 tools/tools-common.h |   4 +-
 10 files changed, 161 insertions(+), 23 deletions(-)
 create mode 100644 Android.bp

-- 
2.25.1

