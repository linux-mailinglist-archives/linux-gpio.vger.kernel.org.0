Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0927EB9D4E
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Sep 2019 12:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407496AbfIUKMV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 21 Sep 2019 06:12:21 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35914 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407493AbfIUKMU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 21 Sep 2019 06:12:20 -0400
Received: by mail-wm1-f65.google.com with SMTP id m18so4504478wmc.1;
        Sat, 21 Sep 2019 03:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hKYyLM5BOtgVBAAvkvS6FKjjOSYeaYgSfPRLTapRKxI=;
        b=BXFtczkROFTd5F7nF9vFs4iYb/cGWoJaUouhm2hadcjaC9BAkpztyj8GZ+CHtVhSkN
         RzDk5E2HYyftOb0z9Jll49dR8M5vDUqT6NKke3GNaTARgIMNq376F6+v5pP337HZiSJ7
         3cYlKHQ7KW+0tdwSqYBhhodWNsZpjOhSCo2RwakeqDD0IfhL41sfclmJa8hemR070T07
         bC/t6wy9TOtB0nhk/I6jciKASlEx4PY1RRSs6dYdNrbG8+2dXD/Bjs2PqVvClGYNzu8N
         35gzeAE30rlOdAco2CX5VZmVmquRZx/h0dlfUvOHpFZjlYe1vrFITJawWB6NSXSns4Fh
         m+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hKYyLM5BOtgVBAAvkvS6FKjjOSYeaYgSfPRLTapRKxI=;
        b=M2rhiCFUalese7me6/So3kdxS3wXiskuHeoHXNItE0gf1MJezg+Ct9bPAqbb6iM2rV
         E5FxLFKgIHWJ0nc80BQ84Jf5hpIRAfW3yOLIa2qMUniUd79x10JLbzL1E1I5CgvH2JGu
         MCCVVGuXld3x1Ku2gBNDAquJ3sp3hHamA5FmLLqn0GCcBVPe8OdG2axuoWulAllFLubn
         1r/G+Fm8a+eR0S1tgyY1OYxt/B7NJez+ongRU3t4X0JIoX9AhscaOHSerXOL7TfK6j4v
         QTJ/zWLE31MLSGQp4A4l2owMf6HcmuQtOTbsuU0OBXSVJ9Zg08Pnn5HKniuzNxorYFie
         NykQ==
X-Gm-Message-State: APjAAAWZUbC5ExIj2cTla1DdzhoDFCUFjOIuw3ZIJGVTTMLJt6rlTGdb
        vcClEpDim/fJYwJWprV6SvMrd8GSaP0=
X-Google-Smtp-Source: APXvYqyAyeHjA0IHOFwyiWVlAxV7cz+4lfM13iaW080T9Jssw1kpOAbR6dS1yp3jx7QwG6EEheR0Lw==
X-Received: by 2002:a1c:3182:: with SMTP id x124mr7129433wmx.168.1569060737898;
        Sat, 21 Sep 2019 03:12:17 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id l1sm6129262wrb.1.2019.09.21.03.12.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Sep 2019 03:12:17 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH 0/5] Add core MSM8956/76 SoC support drivers
Date:   Sat, 21 Sep 2019 12:12:02 +0200
Message-Id: <20190921101207.65042-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

This patch series adds support for the core components that are
required to run the MSM8956 (and MSM8976) SoCs, such as pinctrl,
GCC clocks, RPM power domains.

The personal aim is to upstream MSM8956 as much as possible.

This code has been tested on two Sony phones featuring the Qualcomm
MSM8956 SoC.

Angelo G. Del Regno (5):
  pinctrl: qcom: Add a pinctrl driver for MSM8976 and 8956
  clk: qcom: Add MSM8976/56 Global Clock Controller (GCC) driver
  soc: qcom: smd-rpm: Add MSM8976 compatible
  dt-bindings: power: Add missing rpmpd smd performance level
  soc: qcom: rpmpd: Add rpm power domains for msm8956

 .../devicetree/bindings/clock/qcom,gcc.txt    |    1 +
 .../bindings/pinctrl/qcom,msm8976-pinctrl.txt |  183 +
 .../devicetree/bindings/power/qcom,rpmpd.txt  |    1 +
 .../bindings/soc/qcom/qcom,smd-rpm.txt        |    1 +
 drivers/clk/qcom/Kconfig                      |    8 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-msm8976.c                | 4215 +++++++++++++++++
 drivers/pinctrl/qcom/Kconfig                  |   10 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-msm8976.c        | 1128 +++++
 drivers/soc/qcom/rpmpd.c                      |   23 +
 drivers/soc/qcom/smd-rpm.c                    |    1 +
 include/dt-bindings/clock/qcom,gcc-msm8976.h  |  293 ++
 include/dt-bindings/power/qcom-rpmpd.h        |    9 +
 14 files changed, 5875 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.txt
 create mode 100644 drivers/clk/qcom/gcc-msm8976.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-msm8976.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8976.h

-- 
2.21.0

