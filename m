Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38C4378FC42
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Sep 2023 13:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349153AbjIAL3j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Sep 2023 07:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347220AbjIAL3i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Sep 2023 07:29:38 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81C741BF
        for <linux-gpio@vger.kernel.org>; Fri,  1 Sep 2023 04:29:35 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-31768ce2e81so1570851f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Sep 2023 04:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693567774; x=1694172574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9EaAex4HlOHqeKyfOLHzXuy4iCLTeRj26vS5muyi5kk=;
        b=ZVk69ldn7qfnYFWaGOiL09ufKbMcQ9oMzCWxBIocC5cbtTTHpcxtJl8IMxxoAWVwTx
         qwpD817KqANiosenxXz+/sg1IX12B8oHe/Rjq9s8uqEcFEQigYncXdewccrxgmEHl5u9
         1cBu/kFlXsoQF8f/ZQ97jtIJL6ZnnI8MJJ/e+aFrLtvdJmPbKlxiYaMdLfSkXcDRVGZG
         hMzDSqR2C16mXivfd/s4SA5397+ZyzRMtXBejuY8D3CXlP3eJblf/tjO985S8i2c55KG
         5kwJInhi4qGHsZrkIIjztGKxRUifk4ogz96pJf2AQMvh96rqfVEq+LftmmTjSTNCGP+I
         Jrpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693567774; x=1694172574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9EaAex4HlOHqeKyfOLHzXuy4iCLTeRj26vS5muyi5kk=;
        b=SFtBE7YZOJemeVi+QpXENatJHtI2BCBbtx6eE+BCNWwHQLmaYX66u163bnzA1lGfIO
         gVM9LchkF+b/IRfpMN0iZaAeRXfH0QW/OIvDqDgeUccL+hsMRBc/YfV2zHbmqw0Cw5MZ
         oc/S5RBrJFpSZ+xQ2x2b0zwjVSQD823BgqlI1pt2tKU3lgMdpxSM4IMb+u8ld/3PigCD
         W3Rez1eswgLrFDiZVZqqIw0Qe8/BEMFBBJc0+EiMMa9Y3GUtildidlJSOorGthVn8XRl
         tfarAIB0jsoTFNHeToRprsUMNs5Z/cxepoqGsYPP0Ma+q/9TvhGdn0ahIEqVeUH+sBsh
         4xIg==
X-Gm-Message-State: AOJu0YwLOwqrrhW8kqU+z4GNklJF65vwXQJJZGYIBpQEbw68a74LPRO8
        wjIsoEQ6MMAnuGLApuu8qz6NXFv67KpZsM9C9oM=
X-Google-Smtp-Source: AGHT+IFvZdfTdbE53d6bsED4ru0wj144SrZBLOBWESjwyDL+nb/yc40a2WDeQwIfEz4tDXvrERf8yQ==
X-Received: by 2002:a5d:5344:0:b0:317:4cf8:35f9 with SMTP id t4-20020a5d5344000000b003174cf835f9mr1418808wrv.16.1693567773941;
        Fri, 01 Sep 2023 04:29:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e94b:1054:6760:aa27])
        by smtp.gmail.com with ESMTPSA id a28-20020a5d457c000000b00317f70240afsm4963426wrc.27.2023.09.01.04.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 04:29:33 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 0/3] pinctrl: da9062: don't pull in internal GPIOLIB headers
Date:   Fri,  1 Sep 2023 13:29:23 +0200
Message-Id: <20230901112926.13216-1-brgl@bgdev.pl>
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

I'm removing instances of users of internal GPIOLIB headers which should
not be included by anyone but GPIO core code. The pinctrl-da9062 driver
uses gpiochip_get_desc() which we should put into the gpio/driver.h
header as it does sometimes make sense for GPIO providers to get its own
descriptors without having to go through gpiochip_request_own_desc().

Bartosz Golaszewski (3):
  pinctrl: da9062: add missing include
  gpiolib: make gpiochip_get_desc() public
  pinctrl: da9062: don't include private GPIOLIB header

 drivers/gpio/gpiolib.h           | 2 --
 drivers/pinctrl/pinctrl-da9062.c | 7 +------
 include/linux/gpio/driver.h      | 2 ++
 3 files changed, 3 insertions(+), 8 deletions(-)

-- 
2.39.2

