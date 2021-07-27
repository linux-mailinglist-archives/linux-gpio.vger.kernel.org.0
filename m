Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBF3C3D7994
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 17:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232698AbhG0PUa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 11:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232600AbhG0PUa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jul 2021 11:20:30 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28ABAC061757;
        Tue, 27 Jul 2021 08:20:30 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id f18-20020a05600c4e92b0290253c32620e7so1912200wmq.5;
        Tue, 27 Jul 2021 08:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2g0Z5T/kJig7GSFBfzqqFvjtQDsXphUXlySVJdVzeEw=;
        b=PazBalT289ywavG6jiOOxp/zFekc+czI8xvz76OV777MaNF+17QFiwpeyo2f0WtA1T
         qWFkUHc12u5SA+HkjRs1gZlafF2YYYGy6AMBRquSs94zX6gy3vnXn1cL4GdqPtPzgKtm
         UaqkOXKtyaRO4dBk4KIPRKO4ClnhDpk0+HFk5AAb0nT6VvG/YB0wGIEonQeNv9Z6S8kf
         jcSjNEJIzTD1WI6pLXfdlkujeRHi6MpSjQjTxZ/08z6u2+nXOB9XK8Tf9XKqCH86hZy2
         VvTBUTCi497thnvoPf7iBrIXdfgNTTb1fD7dpmwkfg5tQmIAxMeHo3PjMhoDyzPCSDQU
         /cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2g0Z5T/kJig7GSFBfzqqFvjtQDsXphUXlySVJdVzeEw=;
        b=Ea2XukABiFeo5Wm34F39D/nx9W1M0EFrvmG041nFpm4Vux472czJQ6XQUbWo0/0I4v
         MOYqXRJLPryKUOt2HMj2YxsSb0c4Zw5Y6kOYNhNeAQshkPdxlA1HdnvayyJjIEYqPssQ
         I5Y6etyV5YngGeOJRNpphjU1GG8yy19Yb0vkfPYLSfuIsrX3iAw5ebWLT9w7VkDLgIQL
         d5Ph7S4rrTSj4vIdbqR3eY7PtjQoD7CSXbiZ8bg/fWxxMxR+o4pz1uYs9X0Y4D6x0Dqr
         hKChZUcpKPQasJbSdlTyGJy6LnUyTuYecVEDkjnpzr4wVpEWsJ0gVQbaxRguGFRq4thV
         8rWw==
X-Gm-Message-State: AOAM532LbDifmbtqmtFwvPMOrP5S08ORVQrKSZlGJnc7aaO7hlkbPkXA
        qoC8/DVSZ+c6IUHKTgDSDK+Pbjuz2GjrXdZ2
X-Google-Smtp-Source: ABdhPJyflMtMPkBLLlxiM9NLzNoLE7/SrtHZZeliauUtrDuSUtoMYlS1MDTvDU0o1FudNOitvKri6g==
X-Received: by 2002:a1c:acca:: with SMTP id v193mr4686356wme.107.1627399228422;
        Tue, 27 Jul 2021 08:20:28 -0700 (PDT)
Received: from localhost.localdomain (189.red-83-51-242.dynamicip.rima-tde.net. [83.51.242.189])
        by smtp.gmail.com with ESMTPSA id w185sm3372393wmb.11.2021.07.27.08.20.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Jul 2021 08:20:28 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, gregory.0xf0@gmail.com,
        bgolaszewski@baylibre.com, f.fainelli@gmail.com,
        matthias.bgg@gmail.com, opensource@vdorst.com,
        andy.shevchenko@gmail.com, git@johnthomson.fastmail.com.au,
        neil@brown.name, hofrat@osadl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] gpiolib: convert 'devprop_gpiochip_set_names' to support multiple gpiochip banks per device
Date:   Tue, 27 Jul 2021 17:20:23 +0200
Message-Id: <20210727152026.31019-1-sergio.paracuellos@gmail.com>
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

Changes in v3:
  - Reflow a string literal to be on one line in PATCH 1/3.
  - reflow commit messages PATCH 2/3 and PATCH 3/3 to occupy a little bit
    more available space per line.

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
 drivers/gpio/gpiolib.c      | 32 +++++++++++++++++++++-----
 include/linux/gpio/driver.h |  4 ++++
 4 files changed, 33 insertions(+), 49 deletions(-)

-- 
2.25.1

