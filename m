Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60B152B037D
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 12:07:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgKLLH2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 06:07:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727959AbgKLLGt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Nov 2020 06:06:49 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7960C0613D1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 03:06:48 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id k2so5565979wrx.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 03:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dbi4B8V7iFl1cX1HV9/fxZL8oEY8zF9VYGI8CA54D6k=;
        b=CvwPXnmMtFl9AGYKA5YDXJzXbJQNOtL6P8VY/Py2eWKBxU4twf6j7B6rCOCuZwyCd6
         B2Cl/FpTc4pgqzYRv4HANZo4r8rVC7WNMCnAHBQ1B0Lq0cNtrrT6RrPlsHQTNHbzMDV6
         QHA3VKpd2GymFijPWMl0W0m/1aPhQE5VYOWch6fEhHkK0MkBqpxBoCNWQm1ojbJK8xFI
         Bl980XiBaNMyPLo6wt0P/9JSKbSJyjjUEMcfwIhakWxkNVpVt/YMf++qwZhvPofpNoK5
         KngViflPX+pqdrWYn+guhh6G1lFPYX3kPym5AmMcbLiXftoE1OkPE3qHdps0fNnMe4os
         1IXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dbi4B8V7iFl1cX1HV9/fxZL8oEY8zF9VYGI8CA54D6k=;
        b=JoUg/6zJW4WeBE20n8p1S6ecLA9Twut/WYpfbCSG2MdB7tX4CR2liF65cN1xFEvG97
         KjW8fT2ZkwE3kFAX/D5s4j+LsnFataFE3qfLqo8TQICFcfbrKGw9QBq6X/3MggB8YkdD
         ImHHVJZsWvPgwcX6NsOFlWg/S+6B6/qDAqSU6Bd4vl2ScUeGspKJ1wbg7msSxO9Y/uU4
         b/PlcpS5/ucr/8wkRSeboCRK+pQWdoBLaFCJGdzZHxQc0+cHKCFuH101Vq8u40ScVtRn
         1dkLuDCJiQkhKveAHKCY6+AYPTpMo2/j0GiplYwzdPymnxolyPkzQcBITEBCQRJL4U2t
         y5Pg==
X-Gm-Message-State: AOAM532MnuE02jLu0vvPeWSOfg1u5Ywe99ri7H0eF3caRoSu64xKNHRC
        Jy44VRZE6M/+Y676Ofb4Z/V7Eg==
X-Google-Smtp-Source: ABdhPJym0hHgU+Hc+lgPW6BySJtiuDbEe+D562vTY0h8wAJ0Mryz+CjDG8x8FxZhRMlfMLF6T2XALQ==
X-Received: by 2002:a5d:56c7:: with SMTP id m7mr37440154wrw.201.1605179207431;
        Thu, 12 Nov 2020 03:06:47 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id q12sm5082413wrx.86.2020.11.12.03.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 03:06:46 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 0/2] treewide: remove ctxless API
Date:   Thu, 12 Nov 2020 12:06:40 +0100
Message-Id: <20201112110642.14903-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

As I mentioned in another thread: the context-less API seems to be unused
outside the gpio-tools. There's no reason to keep it in v2 then. Let's
remove it and convert gpio-tools to regular API.

The tools are converted in a rather quick and dirty way because I don't want
to spend a lot of time on something that'll be modified soon once we convert
the library to using uAPI v2.

All tests still pass.

Bartosz Golaszewski (2):
  core: provide gpiod_line_bulk_clear()
  ctxless: drop all context-less interfaces

 include/gpiod.h            | 412 +--------------------------------
 lib/Makefile.am            |   2 +-
 lib/core.c                 |   8 +-
 lib/ctxless.c              | 456 -------------------------------------
 tests/Makefile.am          |   1 -
 tests/tests-ctxless.c      | 375 ------------------------------
 tools/gpio-tools-test.bats |  12 +-
 tools/gpiofind.c           |  25 +-
 tools/gpioget.c            |  36 ++-
 tools/gpiomon.c            | 177 +++++++-------
 tools/gpioset.c            |  42 +++-
 tools/tools-common.c       |   6 +-
 12 files changed, 182 insertions(+), 1370 deletions(-)
 delete mode 100644 lib/ctxless.c
 delete mode 100644 tests/tests-ctxless.c

-- 
2.29.1

