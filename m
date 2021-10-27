Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B96243C5AC
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Oct 2021 10:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239683AbhJ0I6B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Oct 2021 04:58:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231566AbhJ0I6A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Oct 2021 04:58:00 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A59FC061570;
        Wed, 27 Oct 2021 01:55:35 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id n36-20020a17090a5aa700b0019fa884ab85so4530330pji.5;
        Wed, 27 Oct 2021 01:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=EKr2QPNgvld6bHgGFu9VdTmdSThIn7dNK98xyMZN/Fg=;
        b=cicOtjHGnv+iHPnA4D9Y7spZmxHA/TPT9GULlIdkGpwYA399ZtG/SZgKmS2d9bD0L+
         UCowrRDINCixO8X/AmwLB0kDiPDIZLH4UmSA45xnEug4CCd3rFEtYdswxBVj2dZZYAj7
         wprJePSMNVRL1sgZg4Ti9Na97+qryima/cHBfXRbUNH8USJfdTzX6/wrzM5wVZ6aGecr
         y/nndcnKBsPB/a5W917ZLciaazalA0NoCGxQQ10ctMSKj8JVltfzmy5GQ5gzZhPb7ZS5
         ICxUQtg4gefv6p9AnPi6ZGGFWM14iEh4rTG+4USumXB4MzBqlw1hkKjYliYB9tOLpVqn
         +MNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=EKr2QPNgvld6bHgGFu9VdTmdSThIn7dNK98xyMZN/Fg=;
        b=3QsJJgvnj+X9bFXJV934TnpAnQ9wd94bgjumfg9csaEu8l/9iFrwLE+Wb4hpfWX75O
         9xfbQoc64L+fSVma/PrnTSjJ2qywCPriT3GMAJwMKx/gVipipsSB9xL1EXMARo1hDxNW
         xavJHliUGuXyhLBTmB38CmV1M1n/zb1OyMQj0TjOgiBW/c3CXLxKWgDJ3FZzg9OiFNfQ
         7kdiXWWtw9KaHOjk3/fR1JA2zmfR37FJac1qoaAidxpe6X4AV6KgYQitQJqa394fbT08
         WY49CqLdBfHXpcrYFHwIbgecXlBoTInksI0/27x8E0FHpiQcIeQD+BbgHok6SKrmPJVU
         vEOg==
X-Gm-Message-State: AOAM531ZSyFdtzXfTh3vxtFscgn3Mv/izsIh2IGXS4oHubmqqivak6c8
        cMRXdspAvcU5Wb1Ek1aB/Fw=
X-Google-Smtp-Source: ABdhPJyIpx8uxdUHImBdTBKzGnXsBU3nsi0BPwJG7reF0zHZKeEfdEx/K/uU3sso/0ix7mcWlEMmwg==
X-Received: by 2002:a17:902:8682:b0:13f:8e12:c977 with SMTP id g2-20020a170902868200b0013f8e12c977mr26635511plo.62.1635324934982;
        Wed, 27 Oct 2021 01:55:34 -0700 (PDT)
Received: from scdiu3.sunplus.com ([113.196.136.192])
        by smtp.googlemail.com with ESMTPSA id a15sm8336773pfv.64.2021.10.27.01.55.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Oct 2021 01:55:34 -0700 (PDT)
From:   Wells Lu <wellslutw@gmail.com>
X-Google-Original-From: Wells Lu <wells.lu@sunplus.com>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Cc:     qinjian@cqplus1.com, dvorkin@tibbo.com,
        Wells Lu <wells.lu@sunplus.com>
Subject: [PATCH 0/3] Add pin control driver for Sunplus SP7021 SoC
Date:   Wed, 27 Oct 2021 16:55:23 +0800
Message-Id: <1635324926-22319-1-git-send-email-wells.lu@sunplus.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is a patch series for pinctrl driver for Sunplus SP7021 SoC.

Sunplus SP7021 is an ARM Cortex A7 (4 cores) based SoC. It integrates
many peripherals (ex: UART, I2C, SPI, SDIO, eMMC, USB, SD card and
etc.) into a single chip. It is designed for industrial control.

Refer to:
https://sunplus-tibbo.atlassian.net/wiki/spaces/doc/overview
https://tibbo.com/store/plus1.html

Wells Lu (3):
  pinctrl: Add driver for Sunplus SP7021
  dt-bindings: pinctrl: Add dt-bindings for Sunplus SP7021
  devicetree: bindings: pinctrl: Add bindings doc for Sunplus SP7021.

 .../bindings/pinctrl/sunplus,sp7021-pinctrl.yaml   | 277 ++++++++++
 MAINTAINERS                                        |  10 +
 drivers/pinctrl/Kconfig                            |   1 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/sunplus/Kconfig                    |  32 ++
 drivers/pinctrl/sunplus/Makefile                   |  11 +
 drivers/pinctrl/sunplus/gpio_inf_sp7021.c          |  48 ++
 drivers/pinctrl/sunplus/pinctrl_inf_sp7021.c       | 501 +++++++++++++++++
 drivers/pinctrl/sunplus/sppctl.c                   | 359 +++++++++++++
 drivers/pinctrl/sunplus/sppctl.h                   | 181 +++++++
 drivers/pinctrl/sunplus/sppctl_gpio.c              | 136 +++++
 drivers/pinctrl/sunplus/sppctl_gpio.h              |  73 +++
 drivers/pinctrl/sunplus/sppctl_gpio_ops.c          | 288 ++++++++++
 drivers/pinctrl/sunplus/sppctl_gpio_ops.h          |  75 +++
 drivers/pinctrl/sunplus/sppctl_pinctrl.c           | 593 +++++++++++++++++++++
 drivers/pinctrl/sunplus/sppctl_pinctrl.h           |  33 ++
 drivers/pinctrl/sunplus/sppctl_sysfs.c             | 385 +++++++++++++
 drivers/pinctrl/sunplus/sppctl_sysfs.h             |  33 ++
 include/dt-bindings/pinctrl/sppctl-sp7021.h        | 136 +++++
 include/dt-bindings/pinctrl/sppctl.h               |  40 ++
 20 files changed, 3213 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/sunplus,sp7021-pinctrl.yaml
 create mode 100644 drivers/pinctrl/sunplus/Kconfig
 create mode 100644 drivers/pinctrl/sunplus/Makefile
 create mode 100644 drivers/pinctrl/sunplus/gpio_inf_sp7021.c
 create mode 100644 drivers/pinctrl/sunplus/pinctrl_inf_sp7021.c
 create mode 100644 drivers/pinctrl/sunplus/sppctl.c
 create mode 100644 drivers/pinctrl/sunplus/sppctl.h
 create mode 100644 drivers/pinctrl/sunplus/sppctl_gpio.c
 create mode 100644 drivers/pinctrl/sunplus/sppctl_gpio.h
 create mode 100644 drivers/pinctrl/sunplus/sppctl_gpio_ops.c
 create mode 100644 drivers/pinctrl/sunplus/sppctl_gpio_ops.h
 create mode 100644 drivers/pinctrl/sunplus/sppctl_pinctrl.c
 create mode 100644 drivers/pinctrl/sunplus/sppctl_pinctrl.h
 create mode 100644 drivers/pinctrl/sunplus/sppctl_sysfs.c
 create mode 100644 drivers/pinctrl/sunplus/sppctl_sysfs.h
 create mode 100644 include/dt-bindings/pinctrl/sppctl-sp7021.h
 create mode 100644 include/dt-bindings/pinctrl/sppctl.h

-- 
2.7.4

