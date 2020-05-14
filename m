Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE8E1D2A62
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2020 10:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgENIjH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 May 2020 04:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725972AbgENIjG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 14 May 2020 04:39:06 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49750C061A0E
        for <linux-gpio@vger.kernel.org>; Thu, 14 May 2020 01:39:06 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id w19so16686297wmc.1
        for <linux-gpio@vger.kernel.org>; Thu, 14 May 2020 01:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tnuTV/zXdDzicY2b17ET4DFOi9wOJQg8YIzv1AfW3WE=;
        b=oMQv2N5Uoee4PNvjxqELJOdtY+6u6I9dJbzTAYSosIwOc1NbOr3Go3jCOQYIOyNs9a
         iWubTq/HyBgZ7wxkH3Fv9mCtq1R7BylmqgFJN3A8aQcEQgTbO+jddHUOv8ev/9/mN0Tg
         Y/y3NFdhrrD0BvVUBvR2XnVP/758zyG8c/u5HpuRAHGtf8wWaqc4sKMOLtw7b7gOYQbk
         9HB31ok5iClkiZ618qlcnXN1xXRIAwsjdqz6jxnsV5cEkLGSLAOy8K/UWW1ZaTWXLjjl
         mHmCu2pS3SRcVvGFucmB8C831De63G4rsEA+dZU0h/ne17J+s6WR4mCQAp0Uj9CLDePt
         iqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tnuTV/zXdDzicY2b17ET4DFOi9wOJQg8YIzv1AfW3WE=;
        b=SJ5qepF/O7izDbJGiXHsjBSwAOu6hyf4FzVLkMykznn0VZS9ZUgdVQY9Ga4bNHWeaD
         FAI5eEoptD51fhXDnANnDfHfa5f39S5a65FfOaYseAhdb284pJT/lJbWf+GauZnTA71u
         QUqM5l2rKdTdXDzLRykLk94RObD1J3JwTIS+JiztOTdBmUGXyN4hSDuL+ZhBuE+xkIZP
         oqPK4vf9FWTqjh1WVxKOxCSYQ2J3oFoG3CM15tQjLPTRm5EfNYBUHLLMaBoS4QVp7xL0
         pxVfY0eTAMyHh/Yx8UPAQ5obA+4P8OOoYokysdfl0ub+jpuDt9b2Fwq3gFBPNtPvPj/P
         x3mg==
X-Gm-Message-State: AGi0PuYkIXWp1VJ9Qkirf7NOlP5s0Elr8QBgtkPy2QDmQlm/DVj3dGio
        nJLCq8pz7us2Fh+FtWP8LBfTRQ==
X-Google-Smtp-Source: APiQypJdRVNG7dbrl/q2cvp5LB+HckmtujXzbpUZ+iYZXFAJE2euKPihQf6Ut4igAb6LJPAXXs3O8g==
X-Received: by 2002:a1c:7f86:: with SMTP id a128mr47570067wmd.95.1589445544981;
        Thu, 14 May 2020 01:39:04 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id z7sm2975922wrl.88.2020.05.14.01.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 01:39:04 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 0/2] irq/irq_sim: improve the API
Date:   Thu, 14 May 2020 10:38:59 +0200
Message-Id: <20200514083901.23445-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The interrupt simulator API exposes a lot of custom data structures and
functions and doesn't reuse the interfaces already exposed by the irq
subsystem. This series tries to address it.

First, we make irq_domain_reset_irq_data() available to non-V2 domain API
users - that'll be used in the subsequent patch. Next we overhaul the
public interfaces - we hide all specific data structures and instead
rely on the irq_domain struct and virtual interrupt numberspace.

The end effect is that we limit the interrupt simulator API to two
functions (plus one device managed variant) and zero new structures.

v1: https://lkml.org/lkml/2019/8/12/558

v1 -> v2:
- instead of just making the new data structures opaque for users, remove
  them entirely in favor of irq_domain
- call irq_set_handler() & irq_domain_reset_irq_data() when unmapping
  the simulated interrupt
- fix a memory leak in error path
- make it possible to use irq_find_matching_fwnode() with the simulator
  domain
- correctly use irq_create_mapping() and irq_find_mapping(): only use the
  former at init-time and the latter at interrupt-time

v2 -> v3:
- drop the controverial changes to irq_domain code and only leave the
  changes to irq_sim and its users with the plan to revisit the former
  at a later time

v3 -> v4:
- add the Ack from Jonathan
- remove redundant parts of patch 1/2

v4 -> v5:
- add the review tags from Linus
- use the irq_set_irqchip_state interface and drop irq_sim_fire() entirely
  as suggested by Marc

Bartosz Golaszewski (2):
  irq: make irq_domain_reset_irq_data() available even for non-V2 users
  irq/irq_sim: simplify the API

 drivers/gpio/gpio-mockup.c          |  53 ++++--
 drivers/iio/dummy/iio_dummy_evgen.c |  34 ++--
 include/linux/irq_sim.h             |  33 +---
 include/linux/irqdomain.h           |   2 +-
 kernel/irq/Kconfig                  |   1 +
 kernel/irq/irq_sim.c                | 267 +++++++++++++++++-----------
 kernel/irq/irqdomain.c              |  24 +--
 7 files changed, 250 insertions(+), 164 deletions(-)

-- 
2.25.0

