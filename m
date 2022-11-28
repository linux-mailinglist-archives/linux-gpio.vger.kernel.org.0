Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2A1063B0B6
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Nov 2022 19:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234076AbiK1SIW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Nov 2022 13:08:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234069AbiK1SIG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Nov 2022 13:08:06 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBEF659FF6
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 09:52:21 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id t1so9089148wmi.4
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 09:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dibc9ypp0Q6XbTsifB1ue+YUADzHWkwbuvMtdIKjxQQ=;
        b=4im5lt765haSulIwEkgqdxEvE9h4M4wp3TRUgnIOejFUdCw9PcKIETCWvBbZya1Mcj
         FKAhuWdT1mO3VIPozkdTSmDp/6cobIzwyR5Q4WHikUhjgGH8VNirVgxqfllzFEHqjv0m
         mInR0irKqQC28i28arolf+j7do3FZTTZIuP3OD6Sxsel6/9Cvo3aEJzSsHIVhKg0kV82
         8q6a6BOsP5VIHW8RjWohMsr5nxqpiYgIEDSJbXHubAUhUVKEkFUnHr9Qed4Kkzysxv5v
         XsiqXy69aPBl/YCEDZ9BB9j42AW0Hpd/2VbVQqbTMiD/UWK49lrceL1TyItgi+XoMEpD
         Q3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dibc9ypp0Q6XbTsifB1ue+YUADzHWkwbuvMtdIKjxQQ=;
        b=QSFlwXmIFDqemxg7ph4rEgDosidqKJHDg8zY9UafbMjHTcQKq3DhRsZ8AoZAHavMAq
         TLATJr/Is4pwCMUO0ZCZuGAyXDQtAqbOklCoDwEaS0/NKem8876Ee1+OZYwplu/FLVtI
         f+g6QUMSGEaxWO7AstDNXdJ+WkPqmfZYZWcj0O491cOPLgJuqbW1FGn8FZ2lVJU+fomE
         ICzJ7++WruNxgdLtjxX2yj9K1ohzWi9IWoaudWWHgEHfK0Ry1i47ozEyVyWGTpgyPzFb
         S6HVq64ciwkDs6P3EaVGPtAfSCCcjdMfOlSXf2+ONwylTBkAnxykoSdm6ba2n4+jnQ6+
         cJtw==
X-Gm-Message-State: ANoB5pmmZZpNIVk5+soVikW4lgvQcRwj147IDDrcCv6c3LRz8ZZIJDbC
        XIoEnXuiD3D4VL4+xTjqs3sx5Q==
X-Google-Smtp-Source: AA0mqf6Fyo9ILJk30OroWysuv9NytlHqKSnd+1O6cWNLrD056ikszVIDzVixXavJV8LqsZMxZqJ/7A==
X-Received: by 2002:a05:600c:3495:b0:3cf:a258:99b with SMTP id a21-20020a05600c349500b003cfa258099bmr38004715wmq.34.1669657939770;
        Mon, 28 Nov 2022 09:52:19 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:791b:cf20:d3ea:d01])
        by smtp.gmail.com with ESMTPSA id w7-20020a5d4b47000000b00242109cf587sm5828856wrs.28.2022.11.28.09.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 09:52:19 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 0/2] gpiolib: don't allow user-space to crash the kernel with hot-unplugs
Date:   Mon, 28 Nov 2022 18:52:12 +0100
Message-Id: <20221128175214.602612-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is a second iteration of the changes that aim at fixing the situation
in which the user-space can provoke a NULL-pointer derefence in the kernel
when a GPIO device that's in use by user-space is removed.

v1 -> v2:
- add missing gdev->chip checks in patch 1/2
- add a second patch that protects the structures that can be accessed
  by user-space calls against concurrent removal

Bartosz Golaszewski (2):
  gpiolib: cdev: fix NULL-pointer dereferences
  gpiolib: protect the GPIO device against being dropped while in use by
    user-space

 drivers/gpio/gpiolib-cdev.c | 240 +++++++++++++++++++++++++++++-------
 drivers/gpio/gpiolib.c      |   3 +
 drivers/gpio/gpiolib.h      |   5 +
 3 files changed, 205 insertions(+), 43 deletions(-)

-- 
2.37.2

