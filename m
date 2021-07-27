Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 928353D78D2
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 16:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236879AbhG0OtZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 10:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232579AbhG0Osl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jul 2021 10:48:41 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 585FBC061764;
        Tue, 27 Jul 2021 07:48:20 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id l18so7851654wrv.5;
        Tue, 27 Jul 2021 07:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LZvm4USQdqsCZD69NMVXLAHolwkxVoNmXAwlJdJ9QRo=;
        b=l88ukeEGX5jtKr/To2msfjzkB6kiirKXMZSs6WULJ55O4vZf8eufoKKlpUKkxS5tV0
         3CiBFTX56zNMW7BzSnqLDn2iFIj/zQTuRRBrOku2+RF+94CUEGOT+35BpxsV/fsMWU3F
         bhf7/xKm/FWMH6gm8+KPj4JkE/8vQKOFw+JlvKsaq9LGYjcdFrHq4bbQKPSoB62hNY2r
         usS+QZTen8DjPEcljDpQkntRrgHRNX61aB5iVECo/Y17ActcFa0YQ43urp+Y+ZMw62kg
         Ck9nBs+BXJ4evHbTh9CPASfHgXgD6V5SAiTu+fZcubBY0L5oumqccT4oVqY4p8uP4Cf9
         MjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LZvm4USQdqsCZD69NMVXLAHolwkxVoNmXAwlJdJ9QRo=;
        b=T6ULH9Qyv2FlJ1W7dxwEnU4G7AlPpUjtiRxZkM5Z9i9OqBVjLJpeHgRkmuZblaaPUv
         iYOLYyR5Lvj1PCh5c8wY7pOFTGwM41jMepetB5QJ1yl/jrcOo2571rGnDf9U5ER/5eex
         iktk+P16SCv0y5qCSxIWkfD2BvOhkarUwDqDkGBxh23RqKzV54x2QxJheiKdDnBL0yHX
         8yWjoS/HxEvGqa8kvSUOCz/ooy3OCjkFFeUN6HTXnRR2A+pnlZEAqOggEtlmb2LIVp2I
         PWhl4mSHMMGIXXzt+05+37re4s20jSxKrsU9uc6iKnpdQaWns896NUV6pzJTf/I9u86i
         VnaQ==
X-Gm-Message-State: AOAM532siLKTYTNp6b4mpejq8nYoC7oDDbt6pPUgBGTlf7tWpUyNeH7X
        Ja4IUzIwuPgYKAci6GPErVcaGzSr9Kvf2FGl
X-Google-Smtp-Source: ABdhPJx6Ps0GzyHegkECeAPH2KDt1wz7Jl1ELL7imvYbcuCUSBt4yKmQhFCVE0qK1eEzIyJCa1/DSw==
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr25008047wrs.405.1627397298754;
        Tue, 27 Jul 2021 07:48:18 -0700 (PDT)
Received: from localhost.localdomain (189.red-83-51-242.dynamicip.rima-tde.net. [83.51.242.189])
        by smtp.gmail.com with ESMTPSA id o14sm3002555wmq.31.2021.07.27.07.48.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Jul 2021 07:48:18 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, gregory.0xf0@gmail.com,
        bgolaszewski@baylibre.com, f.fainelli@gmail.com,
        matthias.bgg@gmail.com, opensource@vdorst.com,
        andy.shevchenko@gmail.com, git@johnthomson.fastmail.com.au,
        neil@brown.name, hofrat@osadl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] gpiolib: convert 'devprop_gpiochip_set_names' to support multiple gpiochip per device
Date:   Tue, 27 Jul 2021 16:48:13 +0200
Message-Id: <20210727144816.8697-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are some unfortunate cases where the DT representation
of the device and the Linux internal representation differs.
Such drivers for devices are forced to implement a custom function
to avoid the core code 'devprop_gpiochip_set_names' to be executed
since in any other case every gpiochip inside will got repeated
names through its internal gpiochip banks. To avoid this antipattern
this changes are introduced trying to adapt core 'devprop_gpiochip_set_names'
to get a correct behaviour for every single situation.

This series introduces a new 'offset' field in the gpiochip structure
that can be used for those unfortunate drivers that must define multiple
gpiochips per device.

Drivers affected by this situation are also updated. These are
'gpio-mt7621' and 'gpio-brcmstb'.

Motivation for this series available at [0].

Thanks in advance for your feedback.

Best regards,
    Sergio Paracuellos

Changes in v2:
 - Address Gregory Fong comments in v1 of the series [1].
 - Collect Andy Shevchenko Reviewed-by for the series.
 - Collect Gregory Fong Acked-by for PATCH 3/3.

[0]: https://lkml.org/lkml/2021/6/26/198
[1]: https://lkml.org/lkml/2021/7/8/47

Sergio Paracuellos (3):
  gpiolib: convert 'devprop_gpiochip_set_names' to support multiple
    gpiochip banks per device
  gpio: mt7621: support gpio-line-names property
  gpio: brcmstb: remove custom 'brcmstb_gpio_set_names'

 drivers/gpio/gpio-brcmstb.c | 45 +------------------------------------
 drivers/gpio/gpio-mt7621.c  |  1 +
 drivers/gpio/gpiolib.c      | 33 ++++++++++++++++++++++-----
 include/linux/gpio/driver.h |  4 ++++
 4 files changed, 34 insertions(+), 49 deletions(-)

-- 
2.25.1

