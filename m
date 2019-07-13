Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B30076790E
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jul 2019 09:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbfGMHxD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Jul 2019 03:53:03 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42316 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726301AbfGMHxD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 13 Jul 2019 03:53:03 -0400
Received: by mail-pl1-f195.google.com with SMTP id ay6so5876883plb.9;
        Sat, 13 Jul 2019 00:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BxT1lXrIjI4MogYqEojUE8SNVBh9y7FWDHUwy8cCsdw=;
        b=jAOwGbC8jBlXKHJn97XnZmosQe+NJXJ5dhbRxasmB2eC7BYS8+pHS/l4s73/GM1K76
         wI/sVpcPxG4AW+uvBPOxLbKjIYw25t7qI3saRYBuaaoFc7faoGIhSAYIXekO6cEjFXMg
         5xnMyd88vHVR7JLwWR75FKqby6Ckh/ThspQubV2bHv9ISdXV5fSQ1jk4QCXrwfYkPgDN
         N5gnSTL/rQB2J+fyH29dmxM76u1fbUKtBBCe5rya1vzkDYPWQYuJwd2eiaopWHnTAmUq
         I5SK0LRnVlWP2S/yeOrGF/YZqLmvfQ4o+NbSiK+LWZDzfHFQSxavk9tw78jR0RaI58PW
         B/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BxT1lXrIjI4MogYqEojUE8SNVBh9y7FWDHUwy8cCsdw=;
        b=qmpEPP+zknKEQzP4Uy0NiZWKDmtxgDrfjk/8hNm8wxyACoABBQCqjIcv2fXSwT9Kuf
         7wXDl/Ic3uY9rndiW3aeMly9aNpZTRdrtopOU3UWAtiste1gOftu7qNg6ng/tp82kyM9
         PiEk+r4GWt7VffMzXjAtKrNTut9gAUrajUwXOf+PMhZkIs1e9i3Nvk11LlqKbAriXuNi
         ROhGtUtdULmJx03qzdJImeEJfQ6BFA3+OYJDkmFxSoH0OocIpKEaJ2KCY8ghmySHDO4V
         F/eLcFItYVQ3U67Zsj8SCzgawgidkizA7GzLoDWv9/zZ5+QD7HTUQGEiljD3EjuOujYt
         YpWw==
X-Gm-Message-State: APjAAAVKfQnk0TcsBWa8bg1Eacp3+1rizt6KVZXj1SPCG36dHoG4Hcy+
        /w/8y/jQ8UELvnSuouWE0SI=
X-Google-Smtp-Source: APXvYqxjuxv/KiKrvCDO9qNZJz6NgvpklYuobQ91IJmkYQ/FZGA0mDcLy5EDF5uEizY5TFdd2qdTBA==
X-Received: by 2002:a17:902:e512:: with SMTP id ck18mr15606339plb.53.1563004382125;
        Sat, 13 Jul 2019 00:53:02 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id q1sm19004518pfn.178.2019.07.13.00.53.01
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 13 Jul 2019 00:53:01 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-input@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 0/2] Make gpiolib work with static device properties
Date:   Sat, 13 Jul 2019 00:52:57 -0700
Message-Id: <20190713075259.243565-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

These 2 patches implement GPIOs lookup for boards still using static
properties (instead of OF or ACPI), which will allow drivers to abandon
the custom platform data structures and switch to using generic bindings
with gpiod_get_*() API working transparently.

The 2nd patch was posted in September of 2018, before Heikki did the
switch from psets to software_nodes; I finally rebased it.

Enrico, it looks like you are working with a board that uses gpio_keys
that still uses platform data, it would be great if you could try this
out as I have not.

Thanks!

Dmitry Torokhov (2):
  drivers: base: swnode: link devices to software nodes
  gpiolib: add support for fetching descriptors from static properties

 drivers/base/property.c  |   1 +
 drivers/base/swnode.c    |  35 ++++++++++++-
 drivers/gpio/gpiolib.c   | 108 ++++++++++++++++++++++++++++-----------
 include/linux/property.h |   5 ++
 4 files changed, 119 insertions(+), 30 deletions(-)

-- 
2.22.0.510.g264f2c817a-goog

