Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D445CC97F
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 12:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727597AbfJEK7o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Oct 2019 06:59:44 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36520 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfJEK7o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Oct 2019 06:59:44 -0400
Received: by mail-wr1-f66.google.com with SMTP id y19so10002310wrd.3;
        Sat, 05 Oct 2019 03:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=12I5o/x19Yzhg4jgf+Zus4YvgDpld4Qzx29ov6d7ymA=;
        b=Z5yhES4aj7grSgFLPrcuxqpLFlwuX5BcUlZOmgtBUJWE8Tnosi7VgWaDRdReI+nU4R
         MKqog+bI2ddY2KYWr/XpwuApWXpHx7MN7AS3QYEe4oswojByTr+tdbvVjJlPQA6jMo13
         O4bSMHQ2uXPINhyTOZAjU+AMSk+ZbaUm10fs0uq+rg+JCj7A4rezdLIRHQBjLhXxDn5v
         JTuJv/iuBknjw1Jzr3A/MITLxf00flE5D53LfeehHov5EpS3CDwAjG6byrFkoO2cVIph
         dv4FAZzjeaaIc7CPmGUFLMNsw7aSPDxG/ulpItRuftverAf5WTh1oWVah9qsHBY7NdQ2
         10gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=12I5o/x19Yzhg4jgf+Zus4YvgDpld4Qzx29ov6d7ymA=;
        b=clkRvOYRowD62AoSAHmv3WM01fjyMekXNf7c2tKv4xa803gbUoBt+qON9GHVirQhSj
         /07qDkoVsqo/1YviT3ARxFMnSePQIu40S9rsK1V5jXBfYkJSXwoYL7goVSDQ6ytooPns
         7fDna8Gu3Yqi8pHVOGn9tB7OSXTsBrarxxkCE0uSxHIORjh+sdY0H9kfXQpWaHmxHaVB
         bkbBxmcsesZQ+xs3LWwcVzDlij8MaXI/SXqCcHuX7khhL4F1+ZP7iEUve4xKWQpNPW/h
         0EBM78MLew4MMtCjBp6IEvx4BhR26f0tY0Jcewj4sOiirQ+PL0bzSnvq1+28/x6sBlTd
         zldQ==
X-Gm-Message-State: APjAAAXJbXumLc1Yl9Qiqj3Q/mCSIvkX8rQNQut6v7TdnCT2ME0qV7o8
        JwuaxuHw74X7802/KEH+NHyLjkNd5cvpaQ==
X-Google-Smtp-Source: APXvYqxuhYvnFGGxvad24ATWxMUplKUx8ffrUs123MlpzDfK1JJCfDwNjCQyQytf3Yx5+xX2Os8s0A==
X-Received: by 2002:adf:e88f:: with SMTP id d15mr298929wrm.324.1570273181253;
        Sat, 05 Oct 2019 03:59:41 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id u7sm9227678wrp.19.2019.10.05.03.59.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Oct 2019 03:59:40 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        marijns95@gmail.com, kholk11@gmail.com
Subject: [PATCH 0/2] Pinctrl driver for MSM8976 and MSM8956
Date:   Sat,  5 Oct 2019 12:59:34 +0200
Message-Id: <20191005105936.31216-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

As requested, I'm resending the pinctrl driver for this SoC
in a separate patch series, with the changes suggested by
Bjorn.

AngeloGioacchino Del Regno (2):
  pinctrl: qcom: Add a pinctrl driver for MSM8976 and 8956
  dt-bindings: pinctrl: Add MSM8976 driver bindings and documentation

 .../bindings/pinctrl/qcom,msm8976-pinctrl.txt |  183 +++
 drivers/pinctrl/qcom/Kconfig                  |   10 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-msm8976.c        | 1127 +++++++++++++++++
 4 files changed, 1321 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.txt
 create mode 100644 drivers/pinctrl/qcom/pinctrl-msm8976.c

-- 
2.21.0

