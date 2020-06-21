Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCE7202D11
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jun 2020 23:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730762AbgFUVi1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jun 2020 17:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbgFUVi0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jun 2020 17:38:26 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C631C061794;
        Sun, 21 Jun 2020 14:38:26 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id o26so12112809edq.0;
        Sun, 21 Jun 2020 14:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vnu56GmBAwblUczHbGSdd7zke/RQaFZcGRgfpSvBvlk=;
        b=YbIWe/DbyLDV5lGO+zSF0NWAtI1d6KCc1KjSYojjGWS9GwErTrY0K2omK/p1rZTR05
         3+BABBTM5rzJe6jm9+kEFgiRwC6vpZpQMV2Ssxjd3HBDjeXuQzkhgPR+kKcQ7um7Y7Oh
         7iFzdMoGGTTE2/SAceps9R+5esbQUWxwL8cSmKO0TDjg6dPSAWZS41tVQlIzUvkpyt+h
         TaF8YDjKEg6pNpjZBgMvNdSxFJrFHUkc27gg+UPUdkJftBLdjFkUfiNfWFEaBnhKpKfA
         NP/yEdR5AeS4XBQebpA3onh9vdMiGSDFgEc0137CGnjT27/lGywSr2teOsnkkFQxdF6N
         wC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vnu56GmBAwblUczHbGSdd7zke/RQaFZcGRgfpSvBvlk=;
        b=NChUiXdPTq1yOGoHzs8AMYFsEZ0CHk/RW5nqDKaUEgTxM0ne8M12UFOeeYa2xGRjFI
         2o60AlTw7HBS6yLjiKQxRmzYOi4raLOwk23R+xYRQFW9IS6JJFpB2r9gf3Ivo8camHYJ
         2shu5p4TGzF61eIUE2yJoZv9ezhjjO9+jUopznPDb48e7uwM8h5qMaZKQ1/SLMsq20Ve
         GIFhLBpdnG++NnJx/3wJMNeepY/3OTacBn53C0zMBdH6BkHIchI2CnFIF5IHd96mX3sw
         A7pSPUx7uSOOrtKElhjMFeu+NFfBlyy4FsaNHRC5bsPt57JMUtPGjCIBGuJgNx1FJ6S0
         LT5A==
X-Gm-Message-State: AOAM533uUbwj9goZ8qI9DcdqwaQhMC+rqU/HeSmX1tJadlsNVAp4KJRX
        4l8giXD7DHjR/HpKYwR7PVI=
X-Google-Smtp-Source: ABdhPJyDWGhxB4Wz/W05+cyyvkt9j/pcCyRpQ938KbfC349MMk15yUOX/NT2Rk8iXNvfBgdTRxhjHA==
X-Received: by 2002:a50:f01d:: with SMTP id r29mr2671558edl.158.1592775505261;
        Sun, 21 Jun 2020 14:38:25 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id w3sm10130012ejn.87.2020.06.21.14.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 14:38:24 -0700 (PDT)
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
Subject: [PATCH 0/8] Add support for Sony SDM630-based boards
Date:   Sun, 21 Jun 2020 23:37:56 +0200
Message-Id: <20200621213806.551879-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series brings support for Snapdragon 630 and
a few smartphones based on this SoC, namely all
sdm630-based Xperias.

At the moment the things that the platform needs
the most are RPM regulator support (but that's in
the works already), MMCC/GPUCC drivers and perhaps
some USB stuff. Overall, lookin' pretty good, as we
can reuse many existing drivers.

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
 arch/arm64/boot/dts/qcom/pm660l.dtsi          |  45 +
 arch/arm64/boot/dts/qcom/sdm630-pins.dtsi     | 268 +++++
 .../qcom/sdm630-sony-xperia-ganges-kirin.dts  |  13 +
 .../dts/qcom/sdm630-sony-xperia-ganges.dtsi   |  39 +
 .../sdm630-sony-xperia-nile-discovery.dts     |  13 +
 .../qcom/sdm630-sony-xperia-nile-pioneer.dts  |  13 +
 .../qcom/sdm630-sony-xperia-nile-voyager.dts  |  20 +
 .../dts/qcom/sdm630-sony-xperia-nile.dtsi     | 136 +++
 arch/arm64/boot/dts/qcom/sdm630.dtsi          | 991 ++++++++++++++++++
 .../sdm636-sony-xperia-ganges-mermaid.dts     |  19 +
 drivers/clk/qcom/clk-smd-rpm.c                |  77 ++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      |   4 +
 drivers/soc/qcom/socinfo.c                    |   1 +
 include/dt-bindings/clock/qcom,rpmcc.h        |  10 +
 18 files changed, 1717 insertions(+)
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

