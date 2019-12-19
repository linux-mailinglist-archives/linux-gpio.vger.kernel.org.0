Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30EBC125F18
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 11:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbfLSKd4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 05:33:56 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51658 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726656AbfLSKdC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 05:33:02 -0500
Received: by mail-wm1-f67.google.com with SMTP id d73so4894923wmd.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2019 02:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9IU6iI2PMO8JogASt6ZUpvqvc9+EPfynpc2LWZABp/Y=;
        b=X9osVpQ0OkinTYh3s178FgRq339JnFDDUFr1az/q1iaDBFMsakJgttrpiRS4Ql+GxC
         tw1ObLYPaGTKLznlK6Uz/vGsBNY+uYl1zs/wbc0XvuuNbvSpJ60jlgLzB3yows4TyobM
         4xxESxwN9Mvfa5sji6iN5VCOJ5+zR9qbWXgrhLTB61H+UXJLNBBnw53t1ziNkPCPUlbb
         35jNuBJSBPoFdRfJvhewNtN2m+jv8FnTnf8ZhXmQirzqO2x/omMZobq06rK2wFIoD0aV
         r4o0RrfPJil5ZHJ8YyHaDuPqLRZtf4ghc9VKwO0Vr9m+pYH5wAFEqU3b7Gr/kEiArW26
         7fpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9IU6iI2PMO8JogASt6ZUpvqvc9+EPfynpc2LWZABp/Y=;
        b=Hyeax4Tu+vwSbJDOOegmaQvgzPP3WG8d8mRqJGfV+brh8ylOYO/XTSO6vmX7Os0E36
         wOPKJsjTEZcq38DqncWMPlciHiJJKktHQJRGVYbUrq29gPkfuBU0U8cwhSImFe8iYBRC
         CYq2WB36ZJWw71oLymtUKZxc6aO+/adtme6CWnQOfaeoqcqk7BvdhRKH2yrXZj7OArPo
         Sk+E34ZxccyR6SNRr3/wCTaeNS9v4N1njKjkhRHoYt+MVp4p2ssGPqwOa5fw00MjAWA0
         5zbqIsRNK5jQr7f7gjgACngiws8v42s6ovXhw0LKfkdw6V4olS/3772aUjoFGlsbTC7S
         1X3A==
X-Gm-Message-State: APjAAAUINYmpfuL4obSH54WB92+g2xVfnIVx+cEoetI8sh98Rmf8mXYP
        q6hk07nUUDqA+zGW65i1PWzkYQ==
X-Google-Smtp-Source: APXvYqy+JwRWUQgmpm9nw8G5BBEcn38dMvSGvV3I2wHLJptK09xWxa3G/M1vSLRdfkKOOz28xNAaaA==
X-Received: by 2002:a1c:f303:: with SMTP id q3mr8602199wmq.98.1576751581042;
        Thu, 19 Dec 2019 02:33:01 -0800 (PST)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id i11sm5962942wrs.10.2019.12.19.02.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 02:32:59 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     broonie@kernel.org, lee.jones@linaro.org, linus.walleij@linaro.org
Cc:     robh@kernel.org, vinod.koul@linaro.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, spapothi@codeaurora.org,
        bgoswami@codeaurora.org, linux-gpio@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v6 00/11] ASoC: Add support to WCD9340/WCD9341 codec
Date:   Thu, 19 Dec 2019 10:31:42 +0000
Message-Id: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patchset adds support to Qualcomm WCD9340/WCD9341 Codec which
is a standalone Hi-Fi audio codec IC.
This codec supports both I2S/I2C and SLIMbus audio interfaces.
On slimbus interface it supports two data lanes; 16 Tx ports
and 8 Rx ports. It has Five DACs and seven dedicated interpolators,
Multibutton headset control (MBHC), Active noise cancellation,
Sidetone paths, MAD (mic activity detection) and codec processing engine.
It supports Class-H differential earpiece out and stereo single
ended headphones out.

This codec also has integrated SoundWire controller.
Patchset for this is already sent for review.
    
This patchset has been tested on SDM845 based DragonBoard DB845c and
Lenovo Yoga C630 laptop with WSA881x smart speaker amplifiers via
soundwire and 4 DMICs.

gpio controller patch does not have any link dependency, it can go by its own.

Most of the code in this driver is rework of Qualcomm downstream drivers
used in Andriod. Credits to Banajit Goswami and Patrick Lai's Team.

Thanks,
srini

Changes since v5:
	- added correct MFD dependency to codec driver

Srinivas Kandagatla (11):
  ASoC: dt-bindings: add dt bindings for WCD9340/WCD9341 audio codec
  mfd: wcd934x: add support to wcd9340/wcd9341 codec
  ASoC: wcd934x: add support to wcd9340/wcd9341 codec
  ASoC: wcd934x: add basic controls
  ASoC: wcd934x: add playback dapm widgets
  ASoC: wcd934x: add capture dapm widgets
  ASoC: wcd934x: add audio routings
  dt-bindings: gpio: wcd934x: Add bindings for gpio
  gpio: wcd934x: Add support to wcd934x gpio controller
  ASoC: qcom: dt-bindings: Add compatible for DB845c and Lenovo Yoga
  ASoC: qcom: sdm845: add support to DB845c and Lenovo Yoga

 .../bindings/gpio/qcom,wcd934x-gpio.yaml      |   47 +
 .../devicetree/bindings/sound/qcom,sdm845.txt |    5 +-
 .../bindings/sound/qcom,wcd934x.yaml          |  175 +
 drivers/gpio/Kconfig                          |    8 +
 drivers/gpio/Makefile                         |    1 +
 drivers/gpio/gpio-wcd934x.c                   |  104 +
 drivers/mfd/Kconfig                           |   12 +
 drivers/mfd/Makefile                          |    1 +
 drivers/mfd/wcd934x.c                         |  306 +
 include/linux/mfd/wcd934x/registers.h         |  531 ++
 include/linux/mfd/wcd934x/wcd934x.h           |   31 +
 sound/soc/codecs/Kconfig                      |    8 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wcd934x.c                    | 5084 +++++++++++++++++
 sound/soc/qcom/sdm845.c                       |   86 +-
 15 files changed, 6399 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
 create mode 100644 drivers/gpio/gpio-wcd934x.c
 create mode 100644 drivers/mfd/wcd934x.c
 create mode 100644 include/linux/mfd/wcd934x/registers.h
 create mode 100644 include/linux/mfd/wcd934x/wcd934x.h
 create mode 100644 sound/soc/codecs/wcd934x.c

-- 
2.21.0

