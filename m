Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD5A77E159
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Aug 2023 14:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245067AbjHPMVB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Aug 2023 08:21:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245070AbjHPMUi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Aug 2023 08:20:38 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3684B2136
        for <linux-gpio@vger.kernel.org>; Wed, 16 Aug 2023 05:20:37 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-319779f0347so2561452f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Aug 2023 05:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692188436; x=1692793236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jLh/negnTwluibo6jtiJjzohUikGXUShD/K+FOySKiw=;
        b=Anx1XYN13rdyuN8+XOJB7ld+3JrSxDVieeevuFr/sOI8VfnZDbBxoTSbMYiqjri658
         hrhj4P5rBe9r3hFu/kZpTJmkTmD9YTiPMMmx+KLvydZaK1EZ/GycMZaAG0Uv6LTT6rx2
         2JctPaAxa9hGxxHYduZCFckSmo5CpX+nHbX7qNtoa/mK5ITB+KfRuV3D29PSXniK1VzR
         eZhYdgznJJKo3xWhk1BjBjMFDJEpYR7paW65YqVpYX1ROIyqi+OysAoFXYoC4dY0bRMg
         E8FoIqnvwyAhwQhH/TTtfHRqpj3H18CUU/fyfjpcXMi+uvPf+2X/4GkHlUhnf0OgHsbW
         X2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692188436; x=1692793236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jLh/negnTwluibo6jtiJjzohUikGXUShD/K+FOySKiw=;
        b=PyO+aOlJjWFQhcnaoVOGdhc2jHgvfnHUF487kYxcpqJHb1Vnnaan2Isktymspy1cSo
         Nhje+JiFOdUK21hWLKmp/mO6LFij3sZ+bzG5fK7L6MxVH4WUItxmQkp4Kbonv6emzHgm
         yRkM4+J+zwu0zCX0Y3vVFeqwxuX35azf1amlLTreMgl9f+/fQTkbxdSoGT9nR2w65zYi
         oxxKqDpKb3xx3DhjTHu1hVUiJPIwotH9t2+uXAntgi6ZPgZKorowaPAjHg8elHXxoNSQ
         wW4r9XH0WdkdntRKnc3GS0LIlZMsoEOrsWHHqjySnvz9GG2ilnhv5ySzTFglgJ8NwMYj
         FlBQ==
X-Gm-Message-State: AOJu0YzEyqDXVXobW4iPfE7Ey71rdlSH5eXNsJHMm7VnhSgrTi2qfxu6
        5wvuUYSUHTXqbxSgSpDgipyQcw==
X-Google-Smtp-Source: AGHT+IGhOLt0CZddayDndy/iUcglJyQGtRzjOPAvpFHUqMQzctkcdACIYHjlED9Y/3MOvvQsUDDqjA==
X-Received: by 2002:a5d:55c7:0:b0:315:ad1a:5abc with SMTP id i7-20020a5d55c7000000b00315ad1a5abcmr1612887wrw.5.1692188435603;
        Wed, 16 Aug 2023 05:20:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:55ba:c083:817:86f])
        by smtp.gmail.com with ESMTPSA id e6-20020adffd06000000b003196b1bb528sm14566112wrr.64.2023.08.16.05.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 05:20:35 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 0/5] gpio: cdev: bail out of poll() if the device goes down
Date:   Wed, 16 Aug 2023 14:20:27 +0200
Message-Id: <20230816122032.15548-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
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

Bartosz Golaszewski (5):
  gpio: cdev: ignore notifications other than line status changes
  gpio: cdev: rename the notifier block and notify callback
  gpio: cdev: wake up chardev poll() on device unbind
  gpio: cdev: wake up linereq poll() on device unbind
  gpio: cdev: wake up lineevent poll() on device unbind

 drivers/gpio/gpiolib-cdev.c | 127 +++++++++++++++++++++++++++++-------
 drivers/gpio/gpiolib.h      |   3 +-
 2 files changed, 105 insertions(+), 25 deletions(-)

-- 
2.39.2

