Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEF1F1623A1
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 10:43:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbgBRJm7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 04:42:59 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39392 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbgBRJm7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 04:42:59 -0500
Received: by mail-wr1-f66.google.com with SMTP id y11so23034831wrt.6
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2020 01:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=waac/W6URRBuGIR7jL67/WOXUw483M/6QXKK8+dDCbU=;
        b=Fsu1Sr51tqbL1dgNFsyf3MMny9okBD14oykYFEJfQFdXTZQsO1IFrmkF75+LNto+Ya
         sdpS+Ohl9w6zxtlaL+hQIbbIEqjLu2kAXe2kPJ6JtbtdhUKEFfeHNKWHR5VeLC4k0LiM
         g7OVG//ibmuyjpiFwJ3MRgQ3hcNysQjLPqKENz1h9fzPhqvHrOJqlaFj1yWMYriPzn6A
         WSVPZcLW1eLqZSXyP6M288Gpi9/QM1kvXnnyeVlUxqyQlv0Eni2c+NWAPl/e3caO+dg4
         OHkep5YDgOAHHaqBQ+lOF0U8NvqEy9jaOXIqoo/1ZfEMqyuGILvFP1/OUDqDeQlL0ZbA
         pkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=waac/W6URRBuGIR7jL67/WOXUw483M/6QXKK8+dDCbU=;
        b=j9coJL84OlpYSzxIoq6+dZ5YvYgYlHit1rB1ChV0JJ6AzLWEGVQcakQuzVjQz7rGY0
         PZS3f2l7+/K34SMwbpVqhoel6O0DPDNnE4niBeF5NFYS+R6iSyPA1bWwhOQXk+eCF5+p
         g9pL1sIB2FCTG1/KXxXGJX89cDtjcRx6tS0tt6YgPSp+3OTYJdpx9prQUJ61ojIQWbTJ
         t6FE8fMopfBfyewGuXlWUTP3TarvcCCpG/uiKt8UzcnBXT4RiFfDELlHVcbdfNglOpNx
         fG26b1F81HIeYXVekAN+UGFSEtEicGlXUUvk0WWn0l+oQHR9L8uW0MzzwzFKV4sk6fIu
         3zdg==
X-Gm-Message-State: APjAAAVdNZyKXvqqQQTIGqaEi1HMQizwcRiZ0iMLAfXtKZ39rj8iIeXM
        Kwgr1hX0XegBwIkWNYb4WNxddA==
X-Google-Smtp-Source: APXvYqyDnPY3FSpPFblahKI761byO1rRgj4JUGCjnBEWIdUSc09GCXNAoj/Q8jDDVxhS3lCFGMlPvg==
X-Received: by 2002:a05:6000:367:: with SMTP id f7mr27385763wrf.174.1582018976653;
        Tue, 18 Feb 2020 01:42:56 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-188-94.w2-15.abo.wanadoo.fr. [2.15.37.94])
        by smtp.gmail.com with ESMTPSA id s23sm5351095wra.15.2020.02.18.01.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 01:42:55 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 0/7] nvmem/gpio: fix resource management
Date:   Tue, 18 Feb 2020 10:42:27 +0100
Message-Id: <20200218094234.23896-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This series addresses a couple problems with memory management in nvmem
core.

First we fix two earlier memory leaks - this is obvious stable material.
Next we extend the GPIO framework to use reference counting for GPIO
descriptors. We then use it to fix the resource management problem with
the write-protect pin.

Finally we add some readability tweaks.

While the memory leak with wp-gpios is now in mainline - I'm not sure how
to go about applying the kref patch. This is theoretically a new feature
but it's also the cleanest way of fixing the problem.

v1 -> v2:
- make gpiod_ref() helper return 
- reorganize the series for easier merging
- fix another memory leak

Bartosz Golaszewski (6):
  nvmem: fix memory leak in error path
  nvmem: fix another memory leak in error path
  gpiolib: use kref in gpio_desc
  nvmem: increase the reference count of a gpio passed over config
  nvmem: remove a stray newline in nvmem_register()
  nvmem: add a newline for readability

Khouloud Touil (1):
  nvmem: release the write-protect pin

 drivers/gpio/gpiolib.c        | 30 +++++++++++++++++++++++++++---
 drivers/gpio/gpiolib.h        |  1 +
 drivers/nvmem/core.c          | 18 +++++++++++-------
 include/linux/gpio/consumer.h |  1 +
 4 files changed, 40 insertions(+), 10 deletions(-)

-- 
2.25.0

