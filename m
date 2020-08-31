Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11197257417
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 09:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgHaHOm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 03:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725810AbgHaHOh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 03:14:37 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0B66C061573;
        Mon, 31 Aug 2020 00:14:37 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id mw10so2504611pjb.2;
        Mon, 31 Aug 2020 00:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Qf/Ds7SliWgzv5NoIx/3dyTk8Rlg5L8HmfFS8O3CFzI=;
        b=Q7NiY6Lo54t+MxTryHqdz/996gTuNhU806h4ECgn4Hml7E/rPHqg/dssepr/kGCmbA
         6b7/QYGpWu+syPe7RSKXbgJEaokKcReRPg2TYgA+Y+PTCOjNiFMkSwowQ9msdHWZ49vB
         LlB1jIj10jHyy822to1hIhGGoxB/w0ffKcUWJ4jRceFlZ9vA6UJTEzSZejujXfWp5ykV
         /xAqzoBM0zqWDdzgUpUL8pxUVjJGXqqkklNy9CW3L/GndEW7IkxYAbweNWzh2i8p3zL3
         IO/1LUhqjEenzu54G6qWfB+1ZnjW9p3x/+2YuTZ6XfhP/rFnMsodJUtpwIA0a2narvlb
         oFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Qf/Ds7SliWgzv5NoIx/3dyTk8Rlg5L8HmfFS8O3CFzI=;
        b=Zt8Id/G75sCM/1k1+w6ybNwS/GFGlWK9eceWUxluGiakmyh124ad9v1xyGxOj0SCB5
         jt/4xi98n6zajWAMurmXF+7ISRZgyAoEo48rnKGZlhB6PeuMeOH0ZuXzkjyPxMHm88K0
         /KCV0flgRZxT6Bv0eH8Lyek3dCCKmu15QqGbWR0R/Jtk2sXS+/ZJlAoIeUEFtlMRAgeY
         yLk4ETykXrPahS73W19bk2WhusBU5pOob6siA8fjjumKfhj6nHDZSNXbysKjkMkRzmmC
         L7NjrngIgjQ+8JDct8+QqPTYuFxlFov3Vz+tg/7k53S/NFllNTSlD5i/CGzGv8/nhkUj
         omyA==
X-Gm-Message-State: AOAM531VugAQae3tpWJh66hy765QVjoDaDBEkdPauWCyqSTrPhA37hYn
        DrE+4ZYOgy2RXnN0DtTDwds=
X-Google-Smtp-Source: ABdhPJy8nY8XtR9EZXTzupyHvJJGtQ7HXiTXWyaRDf0tBjj/0E+TidRASc112iAxCWkRHgjDu7CJeg==
X-Received: by 2002:a17:90a:448e:: with SMTP id t14mr161196pjg.59.1598858077482;
        Mon, 31 Aug 2020 00:14:37 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.6])
        by smtp.gmail.com with ESMTPSA id s67sm7173587pfs.117.2020.08.31.00.14.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 00:14:37 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     linus.walleij@linaro.org, lee.jones@linaro.org,
        bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        dillon min <dillon.minfei@gmail.com>
Subject: [PATCH: 0/2] Fix TC35894 gpio interrupt bug
Date:   Mon, 31 Aug 2020 15:14:31 +0800
Message-Id: <1598858073-5285-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

This patchset intend to fix two bug on tc35894

1 offset counting is wrong in tc3589x_gpio_irq_sync_unlock()
2 disable Direct KBD interrupts in gpio-tc3589x's probe(),
  at least have to do this on tc35894, if not, after chip reset,
  IRQST(0x91) will always be 0x20, IRQN always low level, 
  can't be cleared. need more test on other tc3589x.

dillon min (2):
  gpio: tc35894: fix up tc35894 interrupt configuration
  gpio: tc35894: Disable Direct KBD interrupts to enable gpio irq

 drivers/gpio/gpio-tc3589x.c | 12 +++++++++++-
 include/linux/mfd/tc3589x.h |  5 +++++
 2 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.7.4

