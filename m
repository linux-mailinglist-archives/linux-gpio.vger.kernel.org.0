Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD78120402C
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 21:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbgFVT0J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 15:26:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbgFVT0J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 15:26:09 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF6CC061573;
        Mon, 22 Jun 2020 12:26:08 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id w6so7848204ejq.6;
        Mon, 22 Jun 2020 12:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+HdQGf8AeeZRegXNcVVI803kxK+9B394fTQRhPgBEJw=;
        b=rgJFTLWtpK6HV/xUgz6uEKz42am8tmm8d6/fTDnWa92XngtSicbRIbVSWCz06swyLc
         LRBTDK3jNgmdq3qjrVu6ZPa3Q+D5QNPeCWLNS17VPTqSS9PPgj22/8EIV9yq/CY3zVtX
         gai4TG7llx7Vav6yj4F2cX9sFa0sLhquzoWcAcwW5aYkni0khP+G2UOozySbEjh4Ecy+
         2o78hLMTmiIujtZS5RuRltcR7pyvNk7H6LAu2qSdmq8C2pLQKbUjAoHUSjpJpZw1pE/T
         tzX/BUcFE3wK1PMGSbM7oCh3VgLbEtH6+1xl3hZfVLzXDSOfEUeUpttqhe7bkWteHK9O
         s8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+HdQGf8AeeZRegXNcVVI803kxK+9B394fTQRhPgBEJw=;
        b=UBwc6wxiy9SE8MIvJ7z9jbN2dU0ZWGwHn/2cOCXpZHugKL+PzL81ep+cjBx/QQXEon
         Dwphz1GKH7JGs1AQd+T2aSrPzWSgUTb7b7BPAs6qztn7DqSG+R2SBuJoNkkKBPJbdLup
         jgCsPawRdswNx986PrGlQ6un6nWYf+zqCQ5+j3657DWV1riESiVsyrqC5jHAkl7gBD3N
         IUJpdvYcmU5iQmnZQbFo1thgv7tdW4BUbIwu4Rqff/prKLU8XIbqVAQwp4N88g/mYsyI
         3oP7e3/G15GrAfTPsIAlyVEyjT84PtdLr+1LUnV4tTvXVB+vzYqmmOs5glPWxE/1q6/d
         nQFw==
X-Gm-Message-State: AOAM533wGymbsD4cxOk7NBgtzpxzUUIjsqHqHvHjen5EeOfEYaJBW3yH
        jjzPZOKShff7FsA8AwBVFXM=
X-Google-Smtp-Source: ABdhPJzpYEMSbX2ijdGUKIsAGuoFgTRy6+0EdJZzJjegCr26ZxUju7lYEPsEttt2zGCy/fnx/w0gOA==
X-Received: by 2002:a17:906:94c4:: with SMTP id d4mr4132675ejy.232.1592853967406;
        Mon, 22 Jun 2020 12:26:07 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id d16sm4043336ejo.31.2020.06.22.12.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 12:26:06 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v3 0/7] Add support for Sony SDM630-based boards
Date:   Mon, 22 Jun 2020 21:25:50 +0200
Message-Id: <20200622192558.152828-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

changes since v3:
- order nodes by address (I might have
made some mistakes but I tried hard..)
- remove qcom,sdm630-mtp
- use pretty device names instead of
codenames
- fix an overlooked indentation
- add a compatible for sdm660 for mailbox
and document it
- drop the already-applied socinfo patch

Konrad Dybcio (6):
  pinctrl: qcom: spmi-gpio: Add pm660(l) compatibility
  Documentation: Document pm660(l) SPMI GPIOs compatible
  arm64: dts: qcom: pm660(l): Add base dts files
  arm64: dts: qcom: sdm630: Add sdm630 dts file
  arm64: dts: qcom: Add support for Sony Xperia XA2/Plus/Ultra (Nile
    platform)
  mailbox: qcom: Add sdm660 hmss compatible

Martin Botka (1):
  arm64: dts: qcom: Add support for Sony Xperia 10/10 Plus (Ganges
    platform)

 .../mailbox/qcom,apcs-kpss-global.yaml        |    1 +
 .../bindings/pinctrl/qcom,pmic-gpio.txt       |    2 +
 arch/arm64/boot/dts/qcom/Makefile             |    5 +
 arch/arm64/boot/dts/qcom/pm660.dtsi           |   50 +
 arch/arm64/boot/dts/qcom/pm660l.dtsi          |   36 +
 .../qcom/sdm630-sony-xperia-ganges-kirin.dts  |   13 +
 .../dts/qcom/sdm630-sony-xperia-ganges.dtsi   |   40 +
 .../sdm630-sony-xperia-nile-discovery.dts     |   13 +
 .../qcom/sdm630-sony-xperia-nile-pioneer.dts  |   13 +
 .../qcom/sdm630-sony-xperia-nile-voyager.dts  |   20 +
 .../dts/qcom/sdm630-sony-xperia-nile.dtsi     |  136 ++
 arch/arm64/boot/dts/qcom/sdm630.dtsi          | 1174 +++++++++++++++++
 .../sdm636-sony-xperia-ganges-mermaid.dts     |   20 +
 drivers/mailbox/qcom-apcs-ipc-mailbox.c       |    5 +
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      |    4 +
 15 files changed, 1532 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm660.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm660l.dtsi
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

