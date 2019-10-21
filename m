Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F836DE4BA
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 08:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbfJUGo0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 02:44:26 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33455 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726180AbfJUGo0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 02:44:26 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so7797749pfl.0
        for <linux-gpio@vger.kernel.org>; Sun, 20 Oct 2019 23:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=tQTXewI5i0bEVradqq9Sq1stUuXOotbi+yIpe8Hlupg=;
        b=WFlXnvlgJ+jcyIw59Uz+owZcPNPQ1HtL5w1mICzF8spJiXkhgncCcOZCpxGWl7W943
         OjBInY4itK+9A7OlbOcWgZYN3pftkP3gjDhcp/d34le6xa6Z3GmJFQSPMOHTRgnF7CaP
         HbfjsuxT7BeTqbE0HtxOuYVowBIhaxEpRi1QIkHZMknzRVVecWrC9jQfIHeV6DMLH8Mk
         SFLfvm60se9EapSFWYVNxJUphu5DpLjoR7494+LIRi2ORMRsZx3xT936fdBgsB9Ql9bO
         r9p1P4ezgnp6p4dPpHkpAUaiR1ND7w7BbMNodIjGSivaMJbRXv7WziXcEVW5sEDUS+So
         zzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=tQTXewI5i0bEVradqq9Sq1stUuXOotbi+yIpe8Hlupg=;
        b=HgyKwMND35HwSuQEOf3JVq16gY/UILCDoKaW4et6YCPmjrVgUZyaBmpMmEx6mJXmSo
         A511IPlzDqBSSk3Tx7t38Vbuz0rPAKcH0G/6zIgQL1TalSn93RZ6XR01yDn7zBW5cGFz
         6tYE8qynzmY7CmfjFBa7xLxHgx7XY2sM0EiD/Wxrg6Cx4dtM0xQm/GEAzwI09q+qzucv
         ZUQvbmyKzQtfsarm2XrPx1qgkAKPRD1ieJyscJ7wI1Pw2rDO5+rc88SmcC9ng4QPBv0S
         DiZBXlXsAr5qPh0bopxw0g+X7si6k8n0YRwqQfi5cxTXkBG5w8fC3bFjhWpy7s8q3Zse
         Kquw==
X-Gm-Message-State: APjAAAUQ6Ukh02OckkxTS5MwU6g/ZMN82WCWf/MGJitAn4b56l3EBtjj
        M0asiRFKJbi2kFvP68tI885w
X-Google-Smtp-Source: APXvYqyG5D0ojTYQgR6SJoK4uoARccCbrx2DDzS7r4COsrTWbOcndEHVS0u6KS5oKvN+wRRK5jf8yg==
X-Received: by 2002:a62:b504:: with SMTP id y4mr21198203pfe.198.1571640265355;
        Sun, 20 Oct 2019 23:44:25 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:700f:8db6:2442:890f:ac37:8127])
        by smtp.gmail.com with ESMTPSA id d4sm13156624pjs.9.2019.10.20.23.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 23:44:24 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-unisoc@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, orsonzhai@gmail.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 0/4] Add GPIO support for RDA8810PL SoC
Date:   Mon, 21 Oct 2019 12:14:09 +0530
Message-Id: <20191021064413.19840-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

This patchset adds GPIO controller support for RDA Micro RDA8810PL
SoC. This SoC has 4 GPIO controllers and each handles 32 GPIOs. Except
GPIOC, all controllers are capable of generating edge/level interrupts
from first 8 GPIO lines. The pinctrl part for this SoC will be added
later.

This driver has been validated on 96Boards OrangePi i96 board from
Shenzhen Xunlong Software Co.,Limited with libgpiod.

Thanks,
Mani

Changes in v3:

As per the review by Linus W:

* Switched to GPIO MMIO for simplifying the driver
* Elaborated the driver commit message
* Some misc changes to the driver

Changes in v2:

As per the review by Bartosz:

* Dropped the not implemented gpio_request/free callbacks.
* Used device_* helper to fetch ngpios.

Manivannan Sadhasivam (4):
  dt-bindings: gpio: Add devicetree binding for RDA Micro GPIO
    controller
  ARM: dts: Add RDA8810PL GPIO controllers
  gpio: Add RDA Micro GPIO controller support
  MAINTAINERS: Add entry for RDA Micro GPIO driver and binding

 .../devicetree/bindings/gpio/gpio-rda.yaml    |  50 +++
 MAINTAINERS                                   |   2 +
 arch/arm/boot/dts/rda8810pl.dtsi              |  48 +++
 drivers/gpio/Kconfig                          |   9 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-rda.c                       | 294 ++++++++++++++++++
 6 files changed, 404 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rda.yaml
 create mode 100644 drivers/gpio/gpio-rda.c

-- 
2.17.1

