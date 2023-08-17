Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF75877FE1F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Aug 2023 20:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354558AbjHQSuf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Aug 2023 14:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354556AbjHQSuK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Aug 2023 14:50:10 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D852727
        for <linux-gpio@vger.kernel.org>; Thu, 17 Aug 2023 11:50:08 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fea0640d7aso1926745e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Aug 2023 11:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692298207; x=1692903007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uK/+jhMPygx69GUsGCd267yIiLDwmXOdy8VGUVU/xyY=;
        b=WTpjoCJLH6AkctOgqnqTRCyp59TZvHW87DMz1ctJRXruu4unit8yMHozRUBTzR7eLz
         1pQrDouCCKVakbtHiP+fGkMnFlvlsyigRIDmW4nv9ueoR4+mM0WZXCfr0vDcD1fisPov
         Rsui6+ixG0yjW3pi14GRPnHSYxBZ/47jznc8Kxc/BZWcdg31Mo1a8/DR2o4Tthy0zN6f
         v9VR+rNWneP4w82aw6dwqsJX+4N/nNiucVdGgg5h3uqAChb5GAy9DFblYX1DXvbPPeZL
         GW5r42mO/doSY+zYAoDPEmHrLjPvYX37NDgwLqcjU428cKPfyJ5RStqDG9Gh2lV2k8m4
         rmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692298207; x=1692903007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uK/+jhMPygx69GUsGCd267yIiLDwmXOdy8VGUVU/xyY=;
        b=DRLasiEyNxFmZnm2lbWjC4Pxynyp0C0cFzMxkzaGO1xhg5dRez5jcwff4rYiFbYiB4
         7vn+9lJgISEGFI/8gfr5+uO1Cah+Tt6h7ulsPWeyM3lyNshsKee7x601YdYNVYxM6uby
         rNrbIvH8oaYUWEXWWbjyxL3mX2Tjf+EeY0QCKmi8Surp9yGxPqmW3FvG192jnEfMXtlg
         dBjPvuVccXO5pwofBHnG3xC2EPC6bT6tiYmQZ4esgKO/Wxy42LrGYEHgr1BwGlifG4Gr
         olwZDKFY6CeZMnppuP/SrnTWrWp9zwctyAQb6j1OLk5lA4/TKudKuJzhsl80vDtp+p87
         k6jw==
X-Gm-Message-State: AOJu0YzZmyK5MUnxwHtxRxgUGqhEj6Ug31UPte9OHbcZuxB7fujgkEdu
        qKewvWo3X3JaNdZ+vC4JwJ6Xqg==
X-Google-Smtp-Source: AGHT+IECBFoEbHtE4j3df39bssJNZTUqcv+NZuqrf5y1Ng3Qo+/SpMFs8cNWWm7zEeGTF43SBGOyeQ==
X-Received: by 2002:a7b:c84b:0:b0:3fa:98c3:7dbd with SMTP id c11-20020a7bc84b000000b003fa98c37dbdmr439394wml.41.1692298206688;
        Thu, 17 Aug 2023 11:50:06 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2f99:c690:b4da:e3d2])
        by smtp.gmail.com with ESMTPSA id a23-20020a05600c225700b003fe1cdbc33dsm3963020wmm.9.2023.08.17.11.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 11:50:06 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 0/6] gpio: cdev: bail out of poll() if the device goes down
Date:   Thu, 17 Aug 2023 20:49:52 +0200
Message-Id: <20230817184958.25349-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Wake up all three wake queues (the one associated with the character
device file, the one for V1 line events and the V2 line request one)
when the underlying GPIO device is unregistered. This way we won't get
stuck in poll() after the chip is gone as user-space will be forced to
go back into a new system call and will see that gdev->chip is NULL.

v1 -> v2:
- not much is left from v1, this time we don't repurpose the existing
  gpio_device notifier but add a new one so that cdev structures don't
  get unwanted events

Bartosz Golaszewski (6):
  gpiolib: rename the gpio_device notifier
  gpio: cdev: open-code to_gpio_chardev_data()
  gpiolib: add a second blocking notifier to struct gpio_device
  gpio: cdev: wake up chardev poll() on device unbind
  gpio: cdev: wake up linereq poll() on device unbind
  gpio: cdev: wake up lineevent poll() on device unbind

 drivers/gpio/gpiolib-cdev.c | 101 ++++++++++++++++++++++++++++++------
 drivers/gpio/gpiolib.c      |   7 +--
 drivers/gpio/gpiolib.h      |   9 ++--
 3 files changed, 94 insertions(+), 23 deletions(-)

-- 
2.39.2

