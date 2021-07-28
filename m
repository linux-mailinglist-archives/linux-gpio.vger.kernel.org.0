Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B77683D8678
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 06:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhG1EM7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 00:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbhG1EM6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 00:12:58 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68161C061757;
        Tue, 27 Jul 2021 21:12:57 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id c16so782251wrp.13;
        Tue, 27 Jul 2021 21:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/ZEyDUigUMqWE97oZVBOPlCSLFQfNmBWOKXXhKYmizU=;
        b=QFi27XD5HnVz+P6yzSrdZREFrbiOnUN7XZyP+0kxpoVMWYpgwYyZLhY3tavY4UHgQJ
         zcWqlj4labu5TH/OKww71WDkTIGZuOjT4w2zS9LmBPj9eA8OnerrCASeFfovmXS7e7ku
         2dZKzBl0Onlmc0aeuhL5R7/qGSPVVtOkx7o2V+yaayXVYtdibMQtJq1VPWU3AkqXC7nT
         K2yx5QairpR1fkikbVUfl9O3pqDrovnmvhNWGhEudIapo0TNlohWMXu2POWdfSIUgRRW
         8WwOJZMVfqQEN3h7AbmoepLCNCRFtteVoDtfGlZ4TVfauzLNNZGB9+q7GjM4VGJLF9oT
         e6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/ZEyDUigUMqWE97oZVBOPlCSLFQfNmBWOKXXhKYmizU=;
        b=LolEA/otj79JeYoHiVQ9IGv43VYMrXcwff95zRCWMHMkaQh+bQ/RAW8lGKdLoJRK8G
         TyEdc/w+b2fRD/2cq/X+Oe+hUidrClQt0b+UYACpCoa5MNI9LUUgX6xlHqN8aU21n4v/
         C16J7FBnXyupr1p52PhCqVXchL40NDWkm2QLrJGvqti1t6pWepYTNjUqpPuhOsqsDLm5
         0xbXOxg+LfGVJlvw3H9HTJ2lL7xCv/CMWm0LCp3kU/PuSnFY5yLQ0r0MhZdGdUm9Stw3
         n5YBFTbVtBLTpDpbq7MI1J/OWC3rIqjrTUcJvJy9XfaPCjhk+ZqMctfbDQlJTGKl7/9w
         oZ1g==
X-Gm-Message-State: AOAM533Vi7RT1RH6yi2j2BFRBncS0tXuiNctYGzNn0ISha5dWllZZWKV
        QCFfw4S8AdMMqfAxENyKPL9HanyPj2l7aoHS
X-Google-Smtp-Source: ABdhPJws4EufK+BSOLMGfSzwcNQCASk03QmC2cA3lKZCxqTznJ5VJUx5VIzVOiNhfezwjwPh1W0zmg==
X-Received: by 2002:adf:d1c7:: with SMTP id b7mr20284155wrd.108.1627445575735;
        Tue, 27 Jul 2021 21:12:55 -0700 (PDT)
Received: from localhost.localdomain (189.red-83-51-242.dynamicip.rima-tde.net. [83.51.242.189])
        by smtp.gmail.com with ESMTPSA id e6sm6274184wrg.18.2021.07.27.21.12.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Jul 2021 21:12:55 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, gregory.0xf0@gmail.com,
        bgolaszewski@baylibre.com, f.fainelli@gmail.com,
        matthias.bgg@gmail.com, opensource@vdorst.com,
        andy.shevchenko@gmail.com, git@johnthomson.fastmail.com.au,
        neil@brown.name, hofrat@osadl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] gpiolib: convert 'devprop_gpiochip_set_names' to support multiple gpiochip banks per device
Date:   Wed, 28 Jul 2021 06:12:50 +0200
Message-Id: <20210728041253.15382-1-sergio.paracuellos@gmail.com>
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

Changes in v4:
  - Add comma in warning message for clarity. 
  - Collect Gregory Fong Reviewed-by for PATCH 1/3.

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

