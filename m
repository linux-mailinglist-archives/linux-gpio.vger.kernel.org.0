Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCD786A26E0
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Feb 2023 04:08:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbjBYDIi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Feb 2023 22:08:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjBYDIi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Feb 2023 22:08:38 -0500
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E7F7E397
        for <linux-gpio@vger.kernel.org>; Fri, 24 Feb 2023 19:08:36 -0800 (PST)
Received: by mail-il1-x134.google.com with SMTP id u6so903651ilk.12
        for <linux-gpio@vger.kernel.org>; Fri, 24 Feb 2023 19:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aB2V1rxqMnXGIQGEB+kp4bcXx+lL4sR6CwkEUL+Mtjk=;
        b=OKPzIrfeGbQ5P9p4+gLo53XIAkTuw1X7QCKKk19R61b0rdbpnBcdK6yWcLsUL1bD+p
         CsID6XyosbqHXrzsYBF04V+h6HkFEQ0gOiKtnh9fQwWQzjeTW3+YRhiBjtRQfypn9rGw
         6iAtzYrQyxdSSBdIfoWmFTGSBBYMtwxnK5BvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aB2V1rxqMnXGIQGEB+kp4bcXx+lL4sR6CwkEUL+Mtjk=;
        b=jLdvVU9BoiVx5ZIuBxMwpjUS0fxitRbLKYA6oJiz1Y56gbqhF4DQ3pU/s8+KIgRVnB
         B3Yirhb/a4hgc+22PP0GLnZRDyHxAIfk0zPgxBhfqkQqV2AW0RHmzU2MhviZ8eOxv9ox
         N+uN4/bdAFG6sgBZMoTc6YUCiCT1c2M8XpjFeGxkLUH2krmxehvQCJbwyBFFm1/MhcCd
         nud3929zAavnHUk7eRyDXuip7yFrzSzPQqszpaZpiKVGtN4cxw4hsh5GU09u8GbUl+zn
         fWCAgXrCU9LyBd8RgsRX+oPOotpW+BhH32xkF0loXDBWOdJr6LagNOXkgWZNxeqx1YyL
         lxNg==
X-Gm-Message-State: AO0yUKWK9hCy2N+oqBh6p22HsOE5HU62s88uNUDRtpIB4RryP+XuecrL
        WsO6qzX9mUuz7uNAZHgqbetXGBhZme/xl7a4
X-Google-Smtp-Source: AK7set/jNZOsiWk2N6w+C2N39yF2h/3tEh52J1mn/UH/x5ld6dWCXMbnbr3ALd7hUL0aIWkUE5AE9g==
X-Received: by 2002:a05:6e02:180b:b0:317:427:e7ed with SMTP id a11-20020a056e02180b00b003170427e7edmr7057998ilv.19.1677294515636;
        Fri, 24 Feb 2023 19:08:35 -0800 (PST)
Received: from localhost (137-025-033-021.res.spectrum.com. [137.25.33.21])
        by smtp.gmail.com with ESMTPSA id o14-20020a056e02092e00b00310f9a0f8a7sm227320ilt.76.2023.02.24.19.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 19:08:35 -0800 (PST)
From:   Benjamin Li <benl@squareup.com>
To:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     Benjamin Li <benl@squareup.com>
Subject: [libgpiod,v1.6.x,0/3] build: fix compile issues against non-glibc
Date:   Fri, 24 Feb 2023 19:08:10 -0800
Message-Id: <20230225030813.3885661-1-benl@squareup.com>
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

Fix issues when building against a C library other than glibc, such as
Android's Bionic libc. The basename() patch isn't needed on master.

A commit with a sample Android.bp file that's working against Android 11 is
included for informational purposes, which I don't expect Bartosz to pull.

Benjamin Li (3):
  tools: use getprogname() when available to remove dependency on glibc
  core: add missing #include for basename()
  build: add Android.bp to build within Android tree

 Android.bp           | 126 +++++++++++++++++++++++++++++++++++++++++++
 configure.ac         |   5 ++
 lib/core.c           |   1 +
 tools/gpiodetect.c   |   4 +-
 tools/gpiofind.c     |   4 +-
 tools/gpioget.c      |   4 +-
 tools/gpioinfo.c     |   4 +-
 tools/gpiomon.c      |   4 +-
 tools/gpioset.c      |   4 +-
 tools/tools-common.c |  12 +++--
 tools/tools-common.h |   4 +-
 11 files changed, 154 insertions(+), 18 deletions(-)
 create mode 100644 Android.bp

-- 
2.25.1

