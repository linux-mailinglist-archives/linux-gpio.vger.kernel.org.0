Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5844E2030F2
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 09:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbgFVH5z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 03:57:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbgFVH5y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 03:57:54 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88080C061794;
        Mon, 22 Jun 2020 00:57:54 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id g1so12870623edv.6;
        Mon, 22 Jun 2020 00:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BlKmF1D0UGNn/Ika+dFIWBekaBDdD9j5x4kuQyAHSyc=;
        b=sWkxKDTN9QMoJsp5vMgghXsX7yqy93ZILTRHSPUSzK5/2yWgh/Wk/ggBdLfo/ct7Hq
         eR5Q9IVzOEgvW6Tq8+blBtGPhbVEaK5B1Xm4SyXEBec5HKiUuYHR+HlM9Xkf4zp8x4SK
         yFEAisydw1Msb5JhG0Zun4Vgjqc+E/Z1ku8UzAeYRJwYKhiOxwXYieXdz9WyivMCKjAY
         gujxt64rH8cE8Xx71CJv44YJnp/e0AxWgFcIZ877FxVLXhUz6itlyMc3l6FFsBwupVeD
         8CxaeHLR2bq3SeQ3ZYglLvpuL4AQlNlnnVyVzlk7VeoO4aiZ00iZjNHnjaKCmEHjGjqG
         oKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BlKmF1D0UGNn/Ika+dFIWBekaBDdD9j5x4kuQyAHSyc=;
        b=SUx1Rkkkg73rQzjmgk+w0ObSBX5CZkkbG094crlooucSZAmoVyKY46Yh/exx1Lzohc
         nJUaHhWI6xSyPGKzQ60Hfrxpd+9hJGlRdmB9YcVObZvYyrjdjfYkOtNBq3i6bB2aDiQn
         P7iXxfKkar9RHcRRZ95DzOd/S1oWIoxEmaq09ePNNtlPVT7wX1pzaz3rlFzyDYDtz/ro
         +ao3C4g3eWKo58UbeGrqXMhzXLqQd1WCoJqcApzCxiAMGybf+QsSG3VxVu1YqZAPKUix
         4xXlHghPAvgU5ZXZmjuKFLI4P10GRCbCxY7ydif03cF6B7pB0WSPw+td6KHp6e5N7pJ3
         GN0w==
X-Gm-Message-State: AOAM531ceK1v68s05j+6iHRvkS6Jk6UNLEt0zLjGI+tVvZkLX73ADkeY
        tamog6BEul14jrnYg73Ey79ZNGO+DvA=
X-Google-Smtp-Source: ABdhPJzH06LXkS0dWJgLI4oi0/GeM9j+P2AxpQ+ylej1vFw2ndtYXXglAUZZyDYdlQ825rxw9jBmAA==
X-Received: by 2002:a50:9dc4:: with SMTP id l4mr16176792edk.52.1592812673258;
        Mon, 22 Jun 2020 00:57:53 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id b4sm10511606ejp.40.2020.06.22.00.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 00:57:52 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 0/8] Add support for Sony SDM630-based boards
Date:   Mon, 22 Jun 2020 09:57:38 +0200
Message-Id: <20200622075749.21925-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

changes since v1:
- fixed some indentation
- fixed a typo in RPMCC
- added Tested-bys

Konrad Dybcio (7):
  pinctrl: qcom: spmi-gpio: Add pm660(l) compatibility
  Documentation: Document pm660(l) SPMI GPIOs compatible
  soc: qcom: socinfo: Add socinfo entry for SDM630
  clk: qcom: smd: Add support for SDM660 rpm clocks
  arm64: dts: qcom: pm660(l): Add base dts files
  arm64: dts: qcom: sdm630: Add sdm630 dts file
  arm64: dts: qcom: Add support for Sony Xperia XA2/Plus/Ultra (Nile
    platform)

Martin Botka (1):
  arm64: dts: qcom: Add support for Sony Xperia 10/10 Plus (Ganges
    platform)

 .../devicetree/bindings/clock/qcom,rpmcc.txt  |   1 +
 .../bindings/pinctrl/qcom,pmic-gpio.txt       |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   5 +
 arch/arm64/boot/dts/qcom/pm660.dtsi           |  60 ++
 arch/arm64/boot/dts/qcom/pm660l.dtsi          |  46 +
 arch/arm64/boot/dts/qcom/sdm630-pins.dtsi     | 268 +++++
 .../qcom/sdm630-sony-xperia-ganges-kirin.dts  |  13 +
 .../dts/qcom/sdm630-sony-xperia-ganges.dtsi   |  40 +
 .../sdm630-sony-xperia-nile-discovery.dts     |  13 +
 .../qcom/sdm630-sony-xperia-nile-pioneer.dts  |  13 +
 .../qcom/sdm630-sony-xperia-nile-voyager.dts  |  20 +
 .../dts/qcom/sdm630-sony-xperia-nile.dtsi     | 135 +++
 arch/arm64/boot/dts/qcom/sdm630.dtsi          | 991 ++++++++++++++++++
 .../sdm636-sony-xperia-ganges-mermaid.dts     |  20 +
 drivers/clk/qcom/clk-smd-rpm.c                |  77 ++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      |   4 +
 drivers/soc/qcom/socinfo.c                    |   1 +
 include/dt-bindings/clock/qcom,rpmcc.h        |  10 +
 18 files changed, 1719 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm660.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm660l.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm630-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm630.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts

-- 
2.27.0

