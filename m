Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48DFE2AD97E
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 15:57:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731191AbgKJO4G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 09:56:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731117AbgKJO4E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 09:56:04 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1482FC0613D1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:56:04 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id h2so3292527wmm.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P/FM3SMv3SB2sukISrVKcep86V1B6E/aNLJz2tne09k=;
        b=tIhZV71Q4boKhfAj3rBGGOhDubcjk8h9xi0zeADwf79XuWZCYP9iiJLX7dhizOcndI
         QdcGQCgZpMIJPlAQ0nLG78bQjzDfoSxMtNL0hh2TAVNz75cPbmZCHzFa8UtnuibG+Ysy
         f+Ru23ldKtfI2rK/C6aYoQWJzGmEz1K4TAzSDRhvEtqpInAPIiqtimVERE3jyuHtcci0
         TiQoqSWmTH2SB3bOZiUBpHi0KL8x6MLyNxaSaIG7uqogEMswBGdy0ITKGD7JsH1Qa9dy
         TlawCPc+p1FjmvUYAOGHxwI+hdQw+ixUh9t3zk2VKoDNwrT0lUhLQjtwN3skspFzdfof
         pZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P/FM3SMv3SB2sukISrVKcep86V1B6E/aNLJz2tne09k=;
        b=qt570rJ//OOZXifA1+NZZ/PXN/cIF3z5aP+opbNtt0yeujdHoaL/2/uKOnZN/CjjZm
         +t3gRwKLcdMH7CfyxpirTnGon8odZ+pqOsdukk2juZc0wM/vm1bgLywKLxutbDWW/6bp
         5iPaCYcjhla6PH8iwbumkZlcK84xx74iIiPLO6um4ujUhVloBPX8ig9Ro+PKjiRC+I3Q
         8Q01a4u3KU7aiR2m5JoUFTNCHfNvczbhUlNpzOJ6D6ikTY+i6uwCe/DFwkE0XmeEjJ2U
         dxBjiAgp7L/VD3vNgV3+QD0KDPLnXPT25ospTmR5z1NUfhHspl0IGRW5sPY5djPGWo0P
         MMeA==
X-Gm-Message-State: AOAM5337RsKaW7vpVB0ERJwmGH9YLXhtxGps5J5OUB1RsQrV7e0A3c7f
        a/KAoVtyMpZ7cwhDjIm44RKIpg==
X-Google-Smtp-Source: ABdhPJxw2U/1PtlE0cL6yafWRPApOChPFBAYZDeZDTAijh+MqnUlHK6C2x1xc3XmE1BYZUFTzdaAsg==
X-Received: by 2002:a7b:cf31:: with SMTP id m17mr72757wmg.62.1605020162791;
        Tue, 10 Nov 2020 06:56:02 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id f17sm3261827wmf.41.2020.11.10.06.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 06:56:01 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 0/7] gpio: exar: refactor the driver
Date:   Tue, 10 Nov 2020 15:55:45 +0100
Message-Id: <20201110145552.23024-1-brgl@bgdev.pl>
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

Bartosz Golaszewski (7):
  gpio: exar: add a newline after the copyright notice
  gpio: exar: include idr.h
  gpio: exar: switch to a simpler IDA interface
  gpio: exar: use a helper variable for &pdev->dev
  gpio: exar: unduplicate address and offset computation
  gpio: exar: switch to using regmap
  gpio: exar: use devm action for freeing the IDA and drop remove()

 drivers/gpio/Kconfig     |   1 +
 drivers/gpio/gpio-exar.c | 155 +++++++++++++++++++--------------------
 2 files changed, 77 insertions(+), 79 deletions(-)

-- 
2.29.1

