Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8737E161BF4
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2020 20:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729608AbgBQTyo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Feb 2020 14:54:44 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39933 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729481AbgBQTym (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Feb 2020 14:54:42 -0500
Received: by mail-wr1-f66.google.com with SMTP id y11so21192525wrt.6
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2020 11:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XWr9d1ajXFj1+3i5dkAdmDb2mHo0visFJ3r0UjQmCPA=;
        b=QU3yhGzt1nI2tSShwBcrtbO8PsjxVzQf42Ad56dDCNe/2PndW4x+YwT43UAD+tMgSO
         x/Faym00HrVbq+9y63LY2lOz9PNpw0Zu+oMhLBFrwIXpCUIvLBuuuStlmcZoBVfS5osl
         GpWXToShF1Ny3an8qWLn57OPAX90d4JKpJpdx9XlNU2QCMXSed8qmKC5KzhwWAHtKHjC
         N87eK20TEDcRLCavoSm6UIL7b3z7zWLQsBCreQsMBIkwVPmG46i3rucA19h5kSDYHmq/
         4BbMwdTaOJCVW9CINC4aq/rfRGE2eR6VpkgK4VE2/vv/3TojugIhwJULOyS4W3VIPhGW
         y9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XWr9d1ajXFj1+3i5dkAdmDb2mHo0visFJ3r0UjQmCPA=;
        b=AMKhJmM2DzxdWJimyNHzopPXWsUzlhSsKMet5mw3rUrCx7prX1fsmdXfCukcNANnJU
         o3tYwYt63gNH1vlLjnJm57um5mTx7+mbBs0Wve7KUsrlzCEBJCr1tL3VUr18rBjUKQx8
         NWkid1R9eTAV4TZoLVu5BpmI8vFeooIgUF4ieTl9uBJ5B6bH985IWRy+oLdMmY3MHWaS
         1/yFV+3XnC5EI4c/7atsEpjkEs4auEEDgOc85HNz3/7LYeQ2yviWmRq5PtzSlgIKMJzs
         A9hreCCtwMdkrjK9Jkp3pKmSPnPystfYJONfgNahGFGJU/OVtpyl3EK/cVjKJX2AG01+
         40Dw==
X-Gm-Message-State: APjAAAVNj5VLrmQDJrjcbFAYX2sig3ontpG0MXA2ozEr2Fgs3BbR1SSe
        zOGUwosmLhUo9/8GvGOrgYm3BxBT4nk=
X-Google-Smtp-Source: APXvYqywsM8jPQ7r6g46gIuEMB7OfnXrRlAZ0KPt3Y7Pl/+BOIWuy+or7jMvqVTQPx91QlvOxzKdEg==
X-Received: by 2002:a5d:498f:: with SMTP id r15mr23384114wrq.284.1581969279536;
        Mon, 17 Feb 2020 11:54:39 -0800 (PST)
Received: from debian-brgl.local (8.165.185.81.rev.sfr.net. [81.185.165.8])
        by smtp.gmail.com with ESMTPSA id v5sm2679469wrv.86.2020.02.17.11.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 11:54:39 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/6] nvmem/gpio: fix resource management
Date:   Mon, 17 Feb 2020 20:54:29 +0100
Message-Id: <20200217195435.9309-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This series addresses a couple problems with memory management in nvmem
core. We fix an earlier memory leak in error path in patch 2/6. Patches
1/6, 5/6 & 6/6 add reference counting to gpio_desc structure and use it
to correctly free the write-protect GPIO. Patches 3/6 & 4/6 fix newline
problems.

Bartosz Golaszewski (5):
  gpiolib: use kref in gpio_desc
  nvmem: fix memory leak in error path
  nvmem: remove a stray newline in nvmem_register()
  nvmem: add a newline for readability
  nvmem: increase the reference count of a gpio passed over config

Khouloud Touil (1):
  nvmem: release the write-protect pin

 drivers/gpio/gpiolib.c        | 26 +++++++++++++++++++++++---
 drivers/gpio/gpiolib.h        |  1 +
 drivers/nvmem/core.c          | 14 ++++++++++----
 include/linux/gpio/consumer.h |  1 +
 4 files changed, 35 insertions(+), 7 deletions(-)

-- 
2.25.0

