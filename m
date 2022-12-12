Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABD1B649B4B
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Dec 2022 10:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbiLLJfp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Dec 2022 04:35:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231858AbiLLJfP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Dec 2022 04:35:15 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8AA77643
        for <linux-gpio@vger.kernel.org>; Mon, 12 Dec 2022 01:35:14 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso4598164wmo.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Dec 2022 01:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rY8DRlVqqS2cpY4PtC8DLd9Eg+h3VtapKYxL0wpBGQ8=;
        b=3dNV+1YtWvNLsD8cS5D/En25J/sqFS+zR8Rc+0K/8nFoQRPyaBIqOPwgauZDMPdaFI
         yip6xFcquKd1ix3JUtRhS7U+cr9fEK7u/gYfPf6XZysAEeJP1iVyUy7Kth3Mw19/FFiV
         tnBPqulxFz6n9VCOOcXfUL3bBgUggBrZwMsedta9JZ9gm9s542MudQj7iquWYoBZLFB7
         uz0j6ense8MUVsYY2QAq2m2cSdvA3tEpjb8TDbL+nj+qFROoUqMkQ6xXoz4dYrHxDbmC
         maxZFmKJ4++M6M3aEkb4RoH8J18Z91oKxH5MfPx/mWhMMAKL1z/wmh3vu72m5HGyPZRZ
         bsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rY8DRlVqqS2cpY4PtC8DLd9Eg+h3VtapKYxL0wpBGQ8=;
        b=tfLjTa05n1pwVyRUGws42Cn5+awRZVGPGeVpqefsYHXp+WJkXpWspsOueh7OTInYDj
         erXjqM0pSesSME/uHvfVQGvK3wpAavSVjDc5aeJVdRKO31UdlC09aU9Cuyb0Ge3+YG+P
         ztk0UC83a1GdD/Tg75kHuTIBBMu0UO0EP09ddHxjG5x0KCvZicKRQ8xoZr6is1fDiizg
         3OjKkQxW4diJ3vhMME278x7FXEobtFIAaDt0pG1RjZPlcSb2vxPxWMu7ijCPA7nnuDlt
         ZfC46IHBhjrHHSrBK8Xs5WAH32Ym2Z0HP3zxzwNcHRvrwTXiBToxclh84Po2yX2Vo2QR
         bJMw==
X-Gm-Message-State: ANoB5pkwkHm33U+7ME6xSDHU8My6EDTPCrrMD/Gh19OzWnimS7WXD8jY
        KuLowrz/+rWBI8mhLGbBR5TszfbzEoKoxbRm
X-Google-Smtp-Source: AA0mqf6iKCqCfGPmhGP5BNKftdL4UfMGrFmEVfny/0+WVa6E9zTnPyZKiP8wrJEpYZDxLqZEl73jtg==
X-Received: by 2002:a1c:4c06:0:b0:3cf:88c3:d008 with SMTP id z6-20020a1c4c06000000b003cf88c3d008mr11583413wmf.28.1670837713093;
        Mon, 12 Dec 2022 01:35:13 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:8f39:2597:6684:1762])
        by smtp.gmail.com with ESMTPSA id g11-20020a05600c310b00b003b47e75b401sm9301396wmo.37.2022.12.12.01.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 01:35:12 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] tools: tests: remove leftover echo
Date:   Mon, 12 Dec 2022 10:35:10 +0100
Message-Id: <20221212093510.146129-1-brgl@bgdev.pl>
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

This looks like some unneeded leftover from the development that was
missed because bats intercepts all echo output.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tools/gpio-tools-test.bats | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index bf7f3d6..adbce94 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -392,7 +392,6 @@ request_release_line() {
 
 	run_tool gpioinfo
 
-    echo "$output"
 	output_contains_line "${GPIOSIM_CHIP_NAME[sim0]} - 4 lines:"
 	output_contains_line "${GPIOSIM_CHIP_NAME[sim1]} - 8 lines:"
 	output_regex_match "\\s+line\\s+0:\\s+unnamed\\s+input"
-- 
2.37.2

