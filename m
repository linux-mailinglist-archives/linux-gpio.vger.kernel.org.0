Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20D852A6DE0
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 20:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731114AbgKDTa5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 14:30:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730389AbgKDTa5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 14:30:57 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37DDAC0613D4
        for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2020 11:30:57 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id v5so3504184wmh.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2020 11:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e+B4nn+p6SZl8VwNKsIwWlOdD51ov0d76Utq0vxaU8M=;
        b=vQ6r5NKUfUoH6zxRR/t4N8Ndt5Qt2rIQ4STPSFDtPuzui6ro3NzW2pe9Bc1vQFNzfV
         TfHzVbLO9TIGAsQnKYlKIuSaMLvRXOtw2xLeFydPuoZfHxQ/Cp/WfA/sX+LMqXpoxDRe
         S+sQ/QUtJLJIU8WK2MRwiUSfzZvSwX7kW3F9aHKU5/yl54G5IyxE6QuHi4YOEINMLoyf
         i07fivKubVP7PqY710hdExXKheyV7mWBdLtzA1bixaCIZ8zOwcCQKZ3FmbUDJJm5NbRp
         tqqmSROBrrx8h4pO4Ij+M7HSP8ZUWLxvwIxNCu3yUoC74krCppxZNozNpyiRYO9g+bvk
         XcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e+B4nn+p6SZl8VwNKsIwWlOdD51ov0d76Utq0vxaU8M=;
        b=XK/fJADB4I611zYsF1oIZjhM2jJFApnCNyIli5C/vDSwco7yHZSA9eFZKrbckzK3Di
         8BWxePPnv4CYzePEvXJmKH2NiNJzrhat1uYYllKjqPqdECNgwhXwWrouM5zNk5itLcfb
         iibObyrwz11yJa0ulSDsjP2ijfMhu+zla03FrxS6BRVRmSnSgWIaI5bHFCSICmu3Z15H
         QDdmlM1Nxdsk7+vvEYDFIDxf3rYjCExRQiHrf4LAg3O8Nq0YtlzSwMS+mKYK3WMK5arJ
         rhsTekedZD1OidHjgJkeDk+WF/+O6nagJttsqwzIrxmSj0vo3KQVtt/CCUv4Oqa0RhV5
         OVNw==
X-Gm-Message-State: AOAM530/IdW6b0TejUIuDp+IF9kbWgCX2kA4Ehn6Hbg9KDF436197D4O
        WfYqkeSv2y3xxdoamsjQBKHGYQ==
X-Google-Smtp-Source: ABdhPJzHNVHbF+dAaencqhQbE8YKSuUJoCIc128keyMbqIKB5KKOffJsTQet890hcblRShwH+P4JCg==
X-Received: by 2002:a1c:6843:: with SMTP id d64mr6465760wmc.131.1604518255891;
        Wed, 04 Nov 2020 11:30:55 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id m12sm4051671wrs.92.2020.11.04.11.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 11:30:55 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 0/8] gpio: exar: refactor the driver
Date:   Wed,  4 Nov 2020 20:30:43 +0100
Message-Id: <20201104193051.32236-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

I just wanted to convert the driver to using simpler IDA API but ended up
quickly converting it to using regmap. Unfortunately I don't have the HW
to test it so marking the patches that introduce functional change as RFT
and Cc'ing the original author.

v1 -> v2:
- add new regmap helper: regmap_assign_bits()
- fix lvl vs sel register access
- set value in direction_output callback

Note: I didn't use the fancy method of offset calculation Andy and David
suggested because this series broke the driver according to Jan - let's
get it right before we modify it any more. I found a couple problems that
could maybe cause the crash. Jan: could you give it another spin?

Bartosz Golaszewski (8):
  regmap: provide regmap_assign_bits()
  gpio: exar: add a newline after the copyright notice
  gpio: exar: include idr.h
  gpio: exar: switch to a simpler IDA interface
  gpio: exar: use a helper variable for &pdev->dev
  gpio: exar: unduplicate address and offset computation
  gpio: exar: switch to using regmap
  gpio: exar: use devm action for freeing the IDA and drop remove()

 drivers/gpio/Kconfig     |   1 +
 drivers/gpio/gpio-exar.c | 151 +++++++++++++++++++--------------------
 include/linux/regmap.h   |  16 +++++
 3 files changed, 90 insertions(+), 78 deletions(-)

-- 
2.29.1

