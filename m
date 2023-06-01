Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E95EC719F43
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jun 2023 16:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233607AbjFAOK3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jun 2023 10:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233797AbjFAOKS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jun 2023 10:10:18 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E2CD18F
        for <linux-gpio@vger.kernel.org>; Thu,  1 Jun 2023 07:09:56 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-30aef0b8837so835453f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jun 2023 07:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685628592; x=1688220592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B1tHw320ahZh5GmfgBXFOOXe+NfQPOQO7G1I9DoQAak=;
        b=lmyKPs2ku5M19dbBtakT/cK78oaP8p73Xh4PObzXrYVM+ptnUcppl4e4bp4TjTM0Hq
         EH4z8ahP7p4kWVGYmTh5NmvOe9IRhdeGqEDpZEZfSfX0wn7mNhGdHDHcBysSYa4I9CD3
         Srb2YigyMWRfHP0xkjj6Se+YJtrVaNHVfaiVFD0rXJbOzpWrBLRA9GzilbnOHzBtl7Sj
         HsAfR6jc462hrb1V2xhXdBf32ao4IvnutMP4LfOlJ9oipxXznXIFSQ/Wdgl2OaRiqR8f
         f48XG8RzX1O7BS4AyCj2P81UYS3Vpx2cOE7MWrnwf+ioY65pQVgfHS6c4mar5EpeBSiH
         QQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685628592; x=1688220592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1tHw320ahZh5GmfgBXFOOXe+NfQPOQO7G1I9DoQAak=;
        b=d473YFH3OjgXWdAYn1eRldqHcAlyAFRVwQTPSQVnQ4fNAnQRmPfPMkk/L1GICVDj0X
         4C6uEj9bHZ0JsKwSsW9C+kJZPKrYBWdssD2H1UfkcN/sPAFXAo9oH83RIfVzSiFMDUGE
         XkrSWMsq2EMHtTuu1Kr4M3QNaqE90RisbGnZs3yV/v7ApykOsrlbwEmi+p0+tVsG62jv
         Pq1BgkKZvse6/MEXSTSJ8ZPCKGrUQHW5fT4WOP6mpnS18bsfdj1K5OleiBpGAJcBFILm
         MYRje8wrBsjwXnIdgkGYpKt2NOzQag/yIGJAlhjIVc5si/hzvtq+QVIXTAK6nWXzxmy6
         2HQA==
X-Gm-Message-State: AC+VfDxesbYN+7n7IgAKvu/qXEfNFZe7C6f4d/1A3bBbaLruX6+3MBjq
        3oHlUsfAw6nYqLdWwlPVxJsEGg==
X-Google-Smtp-Source: ACHHUZ6U0KcUfxGua1gz0SB9K35/QqUioHppALL1IEEKIYBtbQVVN2uAVkUMQwDihh6C2I0jfZCOVQ==
X-Received: by 2002:adf:ee49:0:b0:306:3da7:f33c with SMTP id w9-20020adfee49000000b003063da7f33cmr2152266wro.63.1685628592192;
        Thu, 01 Jun 2023 07:09:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:3615:4a34:76d3:7537])
        by smtp.gmail.com with ESMTPSA id l19-20020a5d5273000000b0030ae09c5efdsm10534795wrc.42.2023.06.01.07.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 07:09:51 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] tools: tests: replace egrep with grep -E
Date:   Thu,  1 Jun 2023 16:09:50 +0200
Message-Id: <20230601140950.779453-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Since version 3.11 egrep emits the following warning to stderr on startup:

  egrep: warning: egrep is obsolescent; using grep -E

This makes the tests fail (though that seems to depend on BATS version)
so replace egrep with grep -E as suggested.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tools/gpio-tools-test      | 2 +-
 tools/gpio-tools-test.bats | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/gpio-tools-test b/tools/gpio-tools-test
index 5b6c72e..ed39ed5 100755
--- a/tools/gpio-tools-test
+++ b/tools/gpio-tools-test
@@ -37,7 +37,7 @@ check_prog() {
 check_prog bats
 check_prog modprobe
 check_prog timeout
-check_prog egrep
+check_prog grep
 
 # Check if we're running a kernel at the required version or later
 check_kernel $MIN_KERNEL_VERSION
diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index adbce94..c83ca7d 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -154,7 +154,7 @@ gpiosim_cleanup() {
 		ls $BANKPATH/line* > /dev/null 2>&1
 		if [ "$?" = "0" ]
 		then
-			for LINE in $(find $BANKPATH/ | egrep "line[0-9]+$")
+			for LINE in $(find $BANKPATH/ | grep -E "line[0-9]+$")
 			do
 				test -e $LINE/hog && rmdir $LINE/hog
 				rmdir $LINE
-- 
2.39.2

