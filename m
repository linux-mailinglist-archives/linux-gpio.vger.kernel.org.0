Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62A152614ED
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 18:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731914AbgIHQkk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 12:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732064AbgIHQhZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2020 12:37:25 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7817CC0612F4
        for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2020 05:58:24 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id k18so1938320wmj.5
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2020 05:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DQtqq8I3b88XI5RYkNp0j+Hhm0cs0BlkIjWpufTUkHo=;
        b=zGVSmZ8TUolLFNV/SsDchqySxOuN18r9lrsOARAJiX8qgn27HVUTobIjs+FYWvWZpK
         QJ9gcWtrP5eg2kUnaDlT/VIsKzYVJy5Tgjs6skknmbDBNfWKHIhhM8k92MWQP9grUzvx
         hO/bdDAA1TCeMktIhuyqFMepQssGn5M6ifZvgjb+ybyIOnK+CeRS5pIKUqZiL2Yvb8c3
         p+OxFlYmMmL/IPbMNHXlwiYsiND/zk/JjY2fKEW6VLjK0jG6FgBW4WFbYSkSyJtCUPCy
         uzKGXeFcqyrWDhyozGOeoo3YF6BqoGxKrANx3KnIVV/KCbwsQmkGjcW4P0RzNP+dYHVk
         PExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DQtqq8I3b88XI5RYkNp0j+Hhm0cs0BlkIjWpufTUkHo=;
        b=c0MD9MZm0yIKZdLEk5Vz6l2f6+6E3RZrtklw9N52voKkQd5XBU45pMzdEUGJO2Yk4w
         bfT0iwsYFvUMHsgqlz5LI1EHcjWsdRyUzy/cP+Ibi4zbV5WsfyjNVB94qJ4bTHY4xu2x
         iaAI8LFujb1J4njQI52UneZD6rracYwXtbaZrn8nOeSo0rO5Hh7Fq+5wv4p0jvO+3npF
         zAnuaPcRMwAfqQBw8s15ZKs3JUJpHOZKAU90BAX5/cqeLY7vBtip4r+2j7m1XJZEggQh
         CTnDGkx4hjjXHubbx/IzSwcjBi1e5YO0xLRRjJQ4c/oZN6PFygdO29y4ntluFn0n+4G1
         RWNA==
X-Gm-Message-State: AOAM532fDvreeDR+MZIE26sQsbnXi7XpCCCqkWK98GP5vrQ+LXrM03F7
        FEik/07VmyJwkIOoso0Jnybing==
X-Google-Smtp-Source: ABdhPJxQEsA3ZPJXdjC2LTeIeTB/KU9KtEAAN1nSB7wVImXoTAnYJJZmEA23KzFA8RTOBZvJqk+S9Q==
X-Received: by 2002:a7b:c4c4:: with SMTP id g4mr4396170wmk.110.1599569902933;
        Tue, 08 Sep 2020 05:58:22 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id y207sm34817875wmc.17.2020.09.08.05.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 05:58:22 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/3] gpiolib: generalize GPIO line names property
Date:   Tue,  8 Sep 2020 14:58:10 +0200
Message-Id: <20200908125813.8809-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

I initially sent this as part of the gpio-mockup overhaul but since
these patches are indepentent and the work on gpio-mockup may become
more complicated - I'm sending these separately.

The only change is adding additional property helpers to count strings
in array.

Bartosz Golaszewski (3):
  device: property: add helpers to count items in string arrays
  gpiolib: generalize devprop_gpiochip_set_names() for device properties
  gpiolib: unexport devprop_gpiochip_set_names()

 drivers/gpio/Makefile          |  1 -
 drivers/gpio/gpiolib-acpi.c    |  3 --
 drivers/gpio/gpiolib-devprop.c | 20 ++++++-------
 drivers/gpio/gpiolib-of.c      |  5 ----
 drivers/gpio/gpiolib.c         | 55 +++++++++++++++++++++++++++++++---
 include/linux/gpio/driver.h    |  3 --
 include/linux/property.h       | 13 ++++++++
 7 files changed, 74 insertions(+), 26 deletions(-)

-- 
2.26.1

