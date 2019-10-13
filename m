Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92D72D55DA
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Oct 2019 13:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728960AbfJMLku (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Oct 2019 07:40:50 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45271 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728956AbfJMLku (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Oct 2019 07:40:50 -0400
Received: by mail-pf1-f194.google.com with SMTP id y72so8745997pfb.12
        for <linux-gpio@vger.kernel.org>; Sun, 13 Oct 2019 04:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=JJesClvZPI57LiKAGH+mfL4LvGX/K6XZEsgwxovyzfw=;
        b=uhxJhoaSSS5T1/0ebEMzWzw7K6b7OXDjdOgSIcbOIkJTJ0I81TmRPxdNTiOG0AQe7o
         lyjnfkJkE4PAOv5uaLWlBGxOZpdnxbKuRWc1Yw/LNOHo5P6zYTue7Lmu60CvUG0Ihzwf
         Aol58rW3yf+M7+tDeNidJ5FFuGM3hQ1iV7C+lziFhbIUs3iTzjmGegkZnOVt9d6tlY/b
         k+3eJAroNZ3EPIbDVHt05eCeNLhSJ75acTNxMLeBhMa5/KqctdGSZkYzyPCPy+DD6A0s
         xn1cBT/dZ9lEl9j46KsBLRBZXoaQbbFrXQ12/0IX+asRKYpzRI/Eac3F0Ug3g8DBKPtN
         m3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JJesClvZPI57LiKAGH+mfL4LvGX/K6XZEsgwxovyzfw=;
        b=tG0B7pkHAuqo80y5+579ZkHW3VWMqCMYCxoJ20czlYa3K1QuC5LbAK7nLewGBziOtH
         g1pFxTy22KJ6KwkyYsNBNZwwAldplHQgq6/JPU4hpil8cLNn+8v9TY8Kaovj1m/Ozfi/
         Tkk3Fea0pDD/QzrETbtE+QpBeJ6Biq3W5K1aFZoQlMX+4FTMe8Ii2a3BG0UoOArp8+Du
         jOlnYBWTCth3+BJ/KS53NOvnLKI4tBYC5NA3oigmDQROPkc1Igp7uYU5tYcD6Z6FdBbm
         4LC9DSTH/iWJa2yhkj2/hie/QdgZ46p/Zxvq0UACxi3ucYskzopMHWiwBCXhjm7Of5f9
         aA3w==
X-Gm-Message-State: APjAAAXm1hSOibDUhMXxym8UxVSG5jFc00GORMl69iJ0YoC+iyojWSbH
        crYYAu9izLzp640mnbtmmeDF
X-Google-Smtp-Source: APXvYqxIeS2C0iQ5M1sifVwuU36Fj7ZdRpllo3pk4Sj4fF4++WdHr5Vc/z9REKwAGjsy3h12qGMzNA==
X-Received: by 2002:a63:d246:: with SMTP id t6mr27729211pgi.5.1570966849575;
        Sun, 13 Oct 2019 04:40:49 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:8e:4f53:b957:652b:7622:f311])
        by smtp.gmail.com with ESMTPSA id g12sm23165736pfb.97.2019.10.13.04.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2019 04:40:48 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-unisoc@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, orsonzhai@gmail.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/4] Add GPIO support for RDA8810PL SoC
Date:   Sun, 13 Oct 2019 17:10:33 +0530
Message-Id: <20191013114037.9845-1-manivannan.sadhasivam@linaro.org>
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

Manivannan Sadhasivam (4):
  dt-bindings: gpio: Add devicetree binding for RDA Micro GPIO
    controller
  gpio: Add RDA Micro GPIO controller support
  ARM: dts: Add RDA8810PL GPIO controllers
  MAINTAINERS: Add entry for RDA Micro GPIO driver and binding

 .../devicetree/bindings/gpio/gpio-rda.yaml    |  50 +++
 MAINTAINERS                                   |   2 +
 arch/arm/boot/dts/rda8810pl.dtsi              |  48 +++
 drivers/gpio/Kconfig                          |   8 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-rda.c                       | 334 ++++++++++++++++++
 6 files changed, 443 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rda.yaml
 create mode 100644 drivers/gpio/gpio-rda.c

-- 
2.17.1

