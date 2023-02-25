Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F23F36A26D9
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Feb 2023 03:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjBYCu2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Feb 2023 21:50:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjBYCu1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Feb 2023 21:50:27 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15BE52F78A
        for <linux-gpio@vger.kernel.org>; Fri, 24 Feb 2023 18:50:26 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id u6so888344ilk.12
        for <linux-gpio@vger.kernel.org>; Fri, 24 Feb 2023 18:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cpnzRSdeHpu7zRfyyARAxFGt4T+K0T3/ApDPvJLfeYs=;
        b=PzMGchl0ITpMcxFdruiIZUM5p3fBqjVJy97zyNubOJ7oG2XqP+qOurZiTJVmW61G5T
         tyd1UcRin/FFMorkdwRlz3dCXl8hlXa93VIx0f8LoaHsiZFNLYyfTOSg5G89ccYaojPd
         rjNn42/xFr4AdV/FSrgMiL8PgvCCPHfkzJIWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cpnzRSdeHpu7zRfyyARAxFGt4T+K0T3/ApDPvJLfeYs=;
        b=KVnzsrwqhkGcDrVsJo1Ey8yZN6vkf9L+ucNzjM84TqbX+OVTD1JpgTGRm1l97b0VeF
         4jR36Vk2sKfzgL/fzn4PajrVGkX8HXNwg6lGG0huUPvkgXEGu9jmnHd76Axjm1el1WGN
         uZSvKqm7eBzsAzToGCrPV/43qFnMVjgflALbAQCqC8v0lY67n91TfY7mQXFdYf2Sw3VY
         1juDH41QEBMWtZkmzU+KpViACoEzLjuNM3JGZgAgfo6L9o49P1j3vVQ9Jj3kIVsiINW9
         0EeW5KHhN27xRugL9JTrfKCUPo20EJbscBVdan/OcXe28ElscWZ0j4Jj8u4rVOQJfrS7
         GgHQ==
X-Gm-Message-State: AO0yUKXNpTMW+QcZe5rDH7s/cwLXgApvbkLTvc3qeqAMFLWikbGqXs/R
        UINkI8F0rdlEL5DMpjOmU+W9aBBokh5uxyk/
X-Google-Smtp-Source: AK7set8C1w2Ato+ToR+ZhLCmnnhlu0HXels2A185D36gYvBk7YmYFm6w/ROpsOyAEyRVGB+lenjxxg==
X-Received: by 2002:a05:6e02:20ca:b0:315:29ff:da98 with SMTP id 10-20020a056e0220ca00b0031529ffda98mr14770299ilq.14.1677293425091;
        Fri, 24 Feb 2023 18:50:25 -0800 (PST)
Received: from localhost (137-025-033-021.res.spectrum.com. [137.25.33.21])
        by smtp.gmail.com with ESMTPSA id b13-20020a05663801ad00b003e9e5e1aacasm174466jaq.143.2023.02.24.18.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 18:50:24 -0800 (PST)
From:   Benjamin Li <benl@squareup.com>
To:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     Benjamin Li <benl@squareup.com>
Subject: [libgpiod,0/2] tools: fix compile issues when GNU extensions are not present
Date:   Fri, 24 Feb 2023 18:50:20 -0800
Message-Id: <20230225025022.3871665-1-benl@squareup.com>
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

