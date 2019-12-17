Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D36D122B14
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2019 13:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbfLQMRB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Dec 2019 07:17:01 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36919 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727407AbfLQMRB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Dec 2019 07:17:01 -0500
Received: by mail-wm1-f67.google.com with SMTP id f129so2898974wmf.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2019 04:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uvkcmzWWNz9+vvDl5lj9jSidtFGQN7sTpNsfRZj6iOc=;
        b=p1fpn1woHPX0xistfLZ2FIMnrxMkOwvBnFdqRaqUrUsBTdUGddlqaXaKDbVYA58saV
         zl4sFWG3x9FKyHmdSfAgHZmnMHwYTOqFKWgXE7npDUO++TaANqqJR5flItwqSW3BVsk+
         NIb49F2bDT/Zgn7DjYYgTL90X/8JXIZE3IfTXG7sgltuT/ypstmEu8TPxCZ7ol/6jaYm
         /pubBnp85lw3s0/l89Ume7f/ZrdoXf6EKE7r1fHAzSaDdTm/A8qV5wbjuYb27WgyUSNo
         yXR3QckcV4o3dfR3LiTUfkvLb93D0WfClTushCMklkeaH2kulnoQlxiJhckYwASPk+6+
         C2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uvkcmzWWNz9+vvDl5lj9jSidtFGQN7sTpNsfRZj6iOc=;
        b=ktCHNuIMDRhfDAGaXB1FntqgaOqzbRQZnBWa5XoKU01dN4u5esp7DIuEsk07FYqCyR
         z0uQ+/lR0clme3//ddZlqrAKCzt7Z/w/CESe2xZ3niBjwMFjcPg0RWZKFY5U+wMbiVeG
         ChfY9mu7ziIp1yQlQiTf/NGzfMMvbQh+rpLkKg0ptjxBrkklXfFOFCA460qgJJnbndBM
         EsaH9+dIHb7dB3EP0DjBMj8fp3arg69oAXf3TWAhNuRXIvEChsPFBle9sAylAPiJjCWj
         EQRxlSmKSxLRk3lu7zvjt/N8GLWvQCfVYD0hO7rO1bx7vQsQoSHLnOiFv9JOTf+sFkgv
         QNaQ==
X-Gm-Message-State: APjAAAVZL2uG3/7R/q9rgHS3hVdRtF30897fbL17JMgk9j5IqATiqIXz
        UwwX9iu3jtr5NgsvAvaD1zxdPQ==
X-Google-Smtp-Source: APXvYqy0Y+iBxxIqL2VTzMcQpKB1C0uzPqguqaHBeN0RjsFa/n7TfiB/n92Yqnot3rrj/anxAG05Wg==
X-Received: by 2002:a1c:7508:: with SMTP id o8mr5038469wmc.74.1576585019035;
        Tue, 17 Dec 2019 04:16:59 -0800 (PST)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id f1sm25087270wru.6.2019.12.17.04.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 04:16:58 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh@kernel.org, broonie@kernel.org, lee.jones@linaro.org,
        linus.walleij@linaro.org
Cc:     vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v5 00/11] ASoC: Add support to WCD9340/WCD9341 codec
Date:   Tue, 17 Dec 2019 12:16:31 +0000
Message-Id: <20191217121642.28534-1-srinivas.kandagatla@linaro.org>
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
Patchset for this is already sent for review at
https://patchwork.kernel.org/cover/11185769/
    
This patchset has been tested on SDM845 based DragonBoard DB845c and
Lenovo Yoga C630 laptop with WSA881x smart speaker amplifiers via
soundwire and 4 DMICs.

gpio controller patch does not have any link dependency, it can go by its own.

Most of the code in this driver is rework of Qualcomm downstream drivers
used in Andriod. Credits to Banajit Goswami and Patrick Lai's Team.

Thanks,
srini

Changes since v4:
 - updated microvolt bindings as suggested by Rob.
 - slimbus optional property patch already applied.

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
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wcd934x.c                    | 5084 +++++++++++++++++
 sound/soc/qcom/sdm845.c                       |   86 +-
 15 files changed, 6401 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
 create mode 100644 drivers/gpio/gpio-wcd934x.c
 create mode 100644 drivers/mfd/wcd934x.c
 create mode 100644 include/linux/mfd/wcd934x/registers.h
 create mode 100644 include/linux/mfd/wcd934x/wcd934x.h
 create mode 100644 sound/soc/codecs/wcd934x.c

-- 
2.21.0

