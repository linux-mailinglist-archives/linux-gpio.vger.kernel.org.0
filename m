Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6D25E86F0
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2019 12:29:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729070AbfJ2L2x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Oct 2019 07:28:53 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44239 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729085AbfJ2L2w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Oct 2019 07:28:52 -0400
Received: by mail-wr1-f67.google.com with SMTP id z11so13187809wro.11
        for <linux-gpio@vger.kernel.org>; Tue, 29 Oct 2019 04:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8IfX0jQOtqDn2pCZaOvwF7GcoFk09fED5oporBC3z5U=;
        b=hgqZKdfCfJnFj64xw3rXV3VPEK6d30/74W69Yz65m7g+kcAqJDHvB87K3T3uaOzxdG
         gDZMXPaHvF023TiCfdStdHxb59TDTlRirgQZCPVLF7e4Sq24i/aoB6trORieuPmale8m
         4H5agAOoNs10bZaFM+1LWvTScfQOQdVGEeHSKlbz1XFHUB42UXM10+8WtH1MCpJ4zajW
         z14D1/7i8aPEvwd8jvt6XlVu9U14gCyk/J8s0iS6GmyyTFJX96AQ5reclNp10Ie3hrsb
         g6sje56OCtVCgIX1MfM/wLcb/p9eZincHg4Nxes1s2mDThkK8LhqjuM2aoG+QAuaS/C3
         CrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8IfX0jQOtqDn2pCZaOvwF7GcoFk09fED5oporBC3z5U=;
        b=F1WFJk4qg8BMoNuZft3rEZrXxwmoCGno+6hGBMsNid53S+DnFVljuV1trBgLRmsNjE
         SM0FTwnZ3XqGVlaxXDr1MaGG5sG1raZGxqcS+mwsPS0/BVAbyWeEfKRZf7+q/2K2LTAO
         y3V3gRshALt7Ghi/UAMF3JYqFPAnwhy02uP7YIgQFjaNXKn03XUlpakczPwGTKetk0yL
         19OqIsrflJwO+aaY57gt7IUEYNEQGIoo1i05m1IMVR3gmMCQoZaLa+geD8sxx9D/6O6n
         6UI2ioccKVxVHyCjVXALY8I2VftcTXvUgWAC7tG3HxExAjMdDscEDpNlfmKc98/b126W
         Am7w==
X-Gm-Message-State: APjAAAVL9GrS1KEcPtoW9ouJCkz/eFdn1mi+iylgSEEQnpm5pqRwb+C+
        oODMJIKs22IDGr0ygYi6pNmBuw==
X-Google-Smtp-Source: APXvYqxX7UvGklw4BukJiiU81RExjsPkGX9S1gah8yPCTcdMvKCN/bvu59A8jbhXzGu0JHLxw6LDnQ==
X-Received: by 2002:adf:ea50:: with SMTP id j16mr18810399wrn.295.1572348530671;
        Tue, 29 Oct 2019 04:28:50 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id f20sm2373247wmb.6.2019.10.29.04.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 04:28:49 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh@kernel.org, broonie@kernel.org, lee.jones@linaro.org,
        linus.walleij@linaro.org
Cc:     vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 00/11] ASoC: Add support to WCD9340/WCD9341 codec
Date:   Tue, 29 Oct 2019 11:26:49 +0000
Message-Id: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
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

Pin Controller patch does not have any link dependency, it can go by its own.

Most of the code in this driver is rework of Qualcomm downstream drivers
used in Andriod. Credits to Banajit Goswami and Patrick Lai's Team.

If anyone is interested to try, here are working set of patches on top of rc3.
https://git.linaro.org/people/srinivas.kandagatla/linux.git/log/?h=audio/v5.4-rc5-YOGA-C630
alsa ucm files:
https://git.linaro.org/people/srinivas.kandagatla/alsa-lib.git/log/?h=DB845c

Thanks,
srini

Changes since v2:
- Updated mfd driver as suggested by Lee.
- Updated bindings as suggested by Rob.
- Addressed various comments by Cezary Rojewski
- Cleaned up code a bit.

Srinivas Kandagatla (10):
  ASoC: dt-bindings: add dt bindings for WCD9340/WCD9341 audio codec
  mfd: wcd934x: add support to wcd9340/wcd9341 codec
  ASoC: wcd934x: add support to wcd9340/wcd9341 codec
  ASoC: wcd934x: add basic controls
  ASoC: wcd934x: add playback dapm widgets
  ASoC: wcd934x: add capture dapm widgets
  ASoC: wcd934x: add audio routings
  dt-bindings: pinctrl: qcom-wcd934x: Add bindings for gpio
  ASoC: qcom: dt-bindings: Add compatible for DB845c and Lenovo Yoga
  ASoC: qcom: sdm845: add support to DB845c and Lenovo Yoga

Yeleswarapu Nagaradhesh (1):
  pinctrl: qcom-wcd934x: Add support to wcd934x pinctrl driver.

 .../pinctrl/qcom,wcd934x-pinctrl.yaml         |   52 +
 .../devicetree/bindings/sound/qcom,sdm845.txt |    5 +-
 .../bindings/sound/qcom,wcd934x.yaml          |  162 +
 drivers/mfd/Kconfig                           |   12 +
 drivers/mfd/Makefile                          |    1 +
 drivers/mfd/wcd934x.c                         |  306 +
 drivers/pinctrl/qcom/Kconfig                  |    7 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c   |  365 ++
 include/linux/mfd/wcd934x/registers.h         |  529 ++
 include/linux/mfd/wcd934x/wcd934x.h           |   31 +
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wcd934x.c                    | 5084 +++++++++++++++++
 sound/soc/qcom/sdm845.c                       |   86 +-
 15 files changed, 6651 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,wcd934x-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
 create mode 100644 drivers/mfd/wcd934x.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c
 create mode 100644 include/linux/mfd/wcd934x/registers.h
 create mode 100644 include/linux/mfd/wcd934x/wcd934x.h
 create mode 100644 sound/soc/codecs/wcd934x.c

-- 
2.21.0

