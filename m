Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8E2441511
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Nov 2021 09:11:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231693AbhKAIOD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Nov 2021 04:14:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbhKAIOB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Nov 2021 04:14:01 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D220C061714;
        Mon,  1 Nov 2021 01:11:27 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id iq11so4662791pjb.3;
        Mon, 01 Nov 2021 01:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=J9QT2lHWekz3y2luPuBfa/44XsdKO2ND6DuwVMfcAzw=;
        b=JOC3FnY6vmzclt30T9ywNFncB8JUYf8Ot3HU0/enGDVoWXg60vQWfm2PYYdORwJ0Ge
         uJlbcg4Zdl3TG+FHE2mhvaUpzs3K5k5J5NnFWe7MVhbqwKc3k24d1TL5YiBF/YZUjWRN
         zk8ROcL8EUEcFVyxJytxHybsWu41+IFCO+SlXBDcp/lRRW9ptUmy2OXc6rwAdi4RHOmz
         TAhNNDcTCVTOCg8cES1DHaqbRhzt9v7jT8bwfwnYJndR/MFDEpJBTBVtEWOSb04YuYeU
         MLiyRGU27/Fiv/oRMt9LxxlRRxNJMjMcP1ad3ZFSrCYpMrkuZt5HXseEOeXMJjcad4B8
         N3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=J9QT2lHWekz3y2luPuBfa/44XsdKO2ND6DuwVMfcAzw=;
        b=TS/LitFrF7FT5rDecOR+v7DbkE+9d5ss+JhOjIVZ/gbeVzpX26ewdEdDSJQLkT8JNc
         ROSrrGytLG4D3RLPPeUdjpgSVvgUvoVzfYZyenFco8YrqsSeycumo8PVQw6Hjk91QuyL
         9IhOy7XO5OmSnVdcAj2ze3KL4CyaUtzaWq9RMzxLccC9HjVjRrMiYQZNFq26/cZJ0FUb
         pzfM0kQdqkhCJia3IRxh9kIIXm2BpAO08FaTSKuomh4ddpFJXPZ6Xud6jn/sc6aCXK+k
         ojujwXTV7QN0IibtA5+vmZge56kPBQEFyB05SiMbkHpyhBzrVcVYIMze5X/idKe8tG1E
         7eug==
X-Gm-Message-State: AOAM531pX6ej8SoGc1XB6wTXuTIiYMyyPMJK8Te9F7DC0izaP88A2Szq
        MmVST0IreLAsWowtkQh/JME=
X-Google-Smtp-Source: ABdhPJzr68vZLGPkmyiaFiHoAgFgE+LlvljKsj6pdJSQM1U+uLIl6MSNATSYt0vqbJodSVslryXkpQ==
X-Received: by 2002:a17:90b:4acd:: with SMTP id mh13mr4213888pjb.230.1635754286998;
        Mon, 01 Nov 2021 01:11:26 -0700 (PDT)
Received: from scdiu3.sunplus.com ([113.196.136.192])
        by smtp.googlemail.com with ESMTPSA id d2sm15732606pfj.42.2021.11.01.01.11.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Nov 2021 01:11:26 -0700 (PDT)
From:   Wells Lu <wellslutw@gmail.com>
X-Google-Original-From: Wells Lu <wells.lu@sunplus.com>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org
Cc:     qinjian@cqplus1.com, dvorkin@tibbo.com,
        Wells Lu <wells.lu@sunplus.com>
Subject: [PATCH v2 0/3] This is a patch series for pinctrl driver for Sunplus SP7021 SoC.
Date:   Mon,  1 Nov 2021 16:11:14 +0800
Message-Id: <1635754277-32429-1-git-send-email-wells.lu@sunplus.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635324926-22319-1-git-send-email-wells.lu@sunplus.com>
References: <1635324926-22319-1-git-send-email-wells.lu@sunplus.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sunplus SP7021 is an ARM Cortex A7 (4 cores) based SoC. It integrates
many peripherals (ex: UART, I2C, SPI, SDIO, eMMC, USB, SD card and
etc.) into a single chip. It is designed for industrial control.

Refer to:
https://sunplus-tibbo.atlassian.net/wiki/spaces/doc/overview
https://tibbo.com/store/plus1.html

Changes in v2:
 - Addressed all comments from Mr. Randy Dunlap.
 - Added more 'defines' in dt-bindings header files (forgot to add in v1).
 - Modified vendor name in MAINTAINERS file.

Wells Lu (3):
  pinctrl: Add driver for Sunplus SP7021
  dt-bindings: pinctrl: Add dt-bindings for Sunplus SP7021
  devicetree: bindings: pinctrl: Add bindings doc for Sunplus SP7021.

 .../bindings/pinctrl/sunplus,sp7021-pinctrl.yaml   | 277 ++++++++++
 MAINTAINERS                                        |  10 +
 drivers/pinctrl/Kconfig                            |   1 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/sunplus/Kconfig                    |  33 ++
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
 include/dt-bindings/pinctrl/sppctl-sp7021.h        | 171 ++++++
 include/dt-bindings/pinctrl/sppctl.h               |  40 ++
 20 files changed, 3249 insertions(+)
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

