Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4C92B4180
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 11:46:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729280AbgKPKnJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 05:43:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729189AbgKPKms (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2020 05:42:48 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B32C0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 02:42:47 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id c9so23251135wml.5
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 02:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Bx0bwB8usWIGXQU6DeOYV9xHI+q7mXHS7hZ1vV9tck=;
        b=Sjo+8Err9noENP9ZXt891O85sVDqiqCyYo93SgK3VG6j6OwaDV9Zazkwf7yHNzSRJP
         l1Ry1Fi4Jboo6Ng2zV2I/WMRBXQ4dLiOBRs/utowNCNilwma6LT3WKPmbBUbYGMk49GC
         d1Neh+N+ksSLgoI/D0Jm+UtPim0A/gxOdRi8qoG+kOP4mrHnPbeqocB5M3uLR1icTcvD
         yiLrRZ8JS39+mKPCx8G8fy5ZY+XhW2VpM45HUWUUo2yk78tXdYonWS1GRJIHhEbmk+T7
         SKo1GCRF7UAlguKOgJpdq4WsMBDu0F9OUaztQ6pV5Qs7XGL/n4tfvtJAYfw3ZTb0v8qB
         7jPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Bx0bwB8usWIGXQU6DeOYV9xHI+q7mXHS7hZ1vV9tck=;
        b=GrexthOn8R3IZwjB4ctu+VF5rBXRa6/dbs93R3CGC1u5dzDCzA830Paf2wux+s1mVF
         OiwJ/xc3hJdYGE3kbRVvt9epi3gVYRJI4cEVjLnwi1IV0xBf6tP+/rnAyE6YXCFqC5C7
         InnOfghQQAJFF7OTR52WLUbcVDT4UEBKLXvYArSzr7GfxkDphu06vBoEq43CY6PS/eFn
         KOMdA+G1hDOhii1uaKVGYX9wFRYWWDWH5SYLHycpNlcjJD/7G73Tn6jTz/3q5u1D2aB2
         aSF+9hXTPSDswkSNA9P5mNoJccVd3J2xYcZClj7qWG91r4OaV6Nli5YLsvVmddEdFaCb
         LSkQ==
X-Gm-Message-State: AOAM5333dshN+NzUXQDMQi9m/NATyjvTSsT6Rbi+iLmnW3yNITD1PquU
        WwFVLRatV3JHkfAqana3WvgxRg==
X-Google-Smtp-Source: ABdhPJzN3VlxVGSntXS+YyLoLvOZXfSX/aWdI21WZGt10d7rsuaDIcqV9aBmHWK/N7Uw47a/raxJzw==
X-Received: by 2002:a1c:97:: with SMTP id 145mr14413406wma.72.1605523365855;
        Mon, 16 Nov 2020 02:42:45 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id v16sm20583283wml.33.2020.11.16.02.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 02:42:45 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 0/7] gpio: exar: refactor the driver
Date:   Mon, 16 Nov 2020 11:42:35 +0100
Message-Id: <20201116104242.19907-1-brgl@bgdev.pl>
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

v2 -> v3:
- drop the regmap helper from series

v3 -> v4:
- renamed the regmap variable to 'regmap' as leaving the old name caused me
  to miss an assignment leading to a crash (culprit spotted by Andy Shevchenko)

v4 -> v5:
- set the reg_bits to 11 in regmap config
- collect review tags from Andy

Bartosz Golaszewski (7):
  gpio: exar: add a newline after the copyright notice
  gpio: exar: include idr.h
  gpio: exar: switch to a simpler IDA interface
  gpio: exar: use a helper variable for &pdev->dev
  gpio: exar: unduplicate address and offset computation
  gpio: exar: switch to using regmap
  gpio: exar: use devm action for freeing the IDA and drop remove()

 drivers/gpio/Kconfig     |   1 +
 drivers/gpio/gpio-exar.c | 160 ++++++++++++++++++++-------------------
 2 files changed, 82 insertions(+), 79 deletions(-)

-- 
2.29.1

