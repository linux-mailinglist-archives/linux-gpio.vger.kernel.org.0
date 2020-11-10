Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF8872AD656
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 13:34:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730097AbgKJMeP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 07:34:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730285AbgKJMeO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 07:34:14 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 107D2C0613D1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 04:34:13 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id d12so10974104wrr.13
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 04:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=adL3l4Z6O1Wj+nFN/YxWHj+awQmL8BIw4xUsIWOJIFU=;
        b=Nsjm8reLrdYXF2sLjBGZBs3f0O3DYYm074C+5wU1y1Mb3uxDxUdJmpixYJjsWAxJqs
         yYvncqv74ENtBuaTNZy50rmpQf1LZjsAhLhLi8EMKOM+/WFwodJDHpdOsFoAGydVk/k1
         pqPwV2uA0B3wbX6aZ2IR/AitIrybVa9VZq2jAAPeuwSF7kPvgeDvMGICGSNYcsygS45y
         oWQdzoLV9c5BVKQS0Urkg5NaV2jE0/yomuJcNnjSrxb63rme9YW9vLRSuFiQTGqhrXRE
         nUxQ9xp0xeIhIJTqOAqbG0Ojo8ASBg3OlG9KHJz+eLnEDgqFC92VHWTT9psdtnjy0xNj
         MdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=adL3l4Z6O1Wj+nFN/YxWHj+awQmL8BIw4xUsIWOJIFU=;
        b=rb4OogkN3W759Drg1tNVLyyO+qiODyhr9tEXCB9hDQgnSZtmrGLtL6IO5vNsm+9IUP
         s4e0RwJfDawIGLTaHKFUcYQQDJBAVekd1SyRWn93POrqttaAs9kifYBTxlkvhi4IVWpd
         yQXpUiynqT2pOWcc494pcVMWJ7XhS4tocsY61JNPiE1mc0qNmWHnBxJmSAKbe+A6RVXe
         UOMQWf0DvYNJOVj33fjuYRHwL0xXLlQR2bheAX904nx83Xv4TS37G+/BeVqccDzNGul8
         slC+9T9dRJiio1cz41IJfFMWVEce42jz74qIwETRFyXgchEQrog5vs5N6tANnEQb1F7f
         Bziw==
X-Gm-Message-State: AOAM532ZV6LRZfierRN1FwJVPy1SWBUaAEpGi3zNnBlWOEs0nH6ker3g
        hfUiGXlo302TkC+A+7c9eIiF1g==
X-Google-Smtp-Source: ABdhPJzIf+xes4pbK8ViJUFON2p6tZalRmIbV4zLDrGGg9J1BgPQkEOpaISWbOnzBL0i02asNOFOnA==
X-Received: by 2002:a5d:44cf:: with SMTP id z15mr3640515wrr.353.1605011651869;
        Tue, 10 Nov 2020 04:34:11 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id s8sm12942217wrn.33.2020.11.10.04.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 04:34:11 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 0/7] gpio: exar: refactor the driver
Date:   Tue, 10 Nov 2020 13:33:59 +0100
Message-Id: <20201110123406.3261-1-brgl@bgdev.pl>
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

Note: I didn't use the fancy method of offset calculation Andy and David
suggested because this series broke the driver according to Jan - let's
get it right before we modify it any more. I found a couple problems that
could maybe cause the crash. Jan: could you give it another spin?

Bartosz Golaszewski (7):
  gpio: exar: add a newline after the copyright notice
  gpio: exar: include idr.h
  gpio: exar: switch to a simpler IDA interface
  gpio: exar: use a helper variable for &pdev->dev
  gpio: exar: unduplicate address and offset computation
  gpio: exar: switch to using regmap
  gpio: exar: use devm action for freeing the IDA and drop remove()

 drivers/gpio/Kconfig     |   1 +
 drivers/gpio/gpio-exar.c | 154 +++++++++++++++++++--------------------
 2 files changed, 77 insertions(+), 78 deletions(-)

-- 
2.29.1

