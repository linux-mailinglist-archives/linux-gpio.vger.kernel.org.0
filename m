Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83F55EAD7C
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2019 11:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbfJaKfN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Oct 2019 06:35:13 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35876 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726864AbfJaKfN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Oct 2019 06:35:13 -0400
Received: by mail-wr1-f67.google.com with SMTP id w18so5656827wrt.3;
        Thu, 31 Oct 2019 03:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QJA3BXi0PqgEChZSJiF+hVyIYXKWNRWBiihtLarR1AU=;
        b=Adpfq5Mpv5oJ46thXytFwIWSHPYYs5LxZ5j+MUHeQBJyCcYsKwSay0URuvZgLp2kiG
         OpiNY9LtDUUAiMNaGZZtu0fwdGKpKPaJ/zPaX+3xMS1fLEtVN4igHb833n/3/jwOnzwC
         FrxpP09p1nrA9DCqwGQ3BqbSiZFdQAQzUlLluvWkqzYCKlbxc6GcUkBf/JUNSEien5mi
         mo939N33rC/lOS+AU6hXzRiY6BK9CJIv7XpxETz9w20anZIQH/E3SQKJOqDmczWObSlV
         IcIA1JsUlwYUzCaqXcw8hQpKtpkdsE1boK6Oaf5c+GxKmke9KmvzjUp1yfYrjDmMXd3I
         9llQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QJA3BXi0PqgEChZSJiF+hVyIYXKWNRWBiihtLarR1AU=;
        b=Tj/tgUcZHT3mei8daFKuXnflGv8qJbDfPExa2wujQf3LT642Rpg/xaYZ6Uw5zVIPCg
         t8xe7ndypzMhMc/z6I5xn1904FJdRTy8QoIDv4nTOvLdeCQHU7lrbs7Q5SrjpcHZkOUo
         20QsPEWnhhEF9ySaK9iGrWIpUQz2zOpQn1U3qu9ryMcXZwSEp8vX8Ik1MdvtFIXXktQe
         qBRg40GMg0h8CjTrQlG9a6pP1fdkR7npS/WoaSAKaZp6lbUYbW4nvedUNJ2d2et2Smmb
         Uewflk8DVn++KHw1gDBFS0ogBLvG64m9B3LUV9A0025l1W3IknmNhwlirSU7XxBB3aMf
         QvnA==
X-Gm-Message-State: APjAAAWrHpIZMa2aHqtD0kdxxg82/V0uh9eQGQT2zuTItIArXZWrZr6o
        kt2+Z/35LtK9zRgbjld1uBRCBY+Rqzo=
X-Google-Smtp-Source: APXvYqzAT6fVYeBRyzu8L8V441c1dXoVdahpxYo991+Ki0fyhX8NoJh1UA+enhQ4CESDAFUDxX4qAA==
X-Received: by 2002:a5d:51c3:: with SMTP id n3mr4829708wrv.5.1572518111069;
        Thu, 31 Oct 2019 03:35:11 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id o15sm3414687wrv.76.2019.10.31.03.35.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 03:35:10 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, bjorn.andersson@linaro.org,
        agross@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 0/4] SPMI GPIOs and MPPs on PM/PMI8950
Date:   Thu, 31 Oct 2019 11:35:03 +0100
Message-Id: <20191031103507.30678-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

This patch series enables support for GPIOs and MPPs found on the
PM8950 and PMI8950 ICs, usually found on boards using the MSM8956,
MSM8976, MSM8952, MSM8953 (and APQ variants) SoC.

These are important to get the PA_THERM, QUIET_THERM MPPs enabled
on PM8950 for standard thermals (and other board specific ones,
where applicable) and GPIOs usually used to enable the audio mclk
path, the wlan sleep clock and sometimes the eLDO for the WCD codec,
plus other board specific paths, where applicable.
For example, on the MSM8956 Sony Xperia Loire platform, this also
includes a GPIO for the USB switch and one for the simple GPIO
controlled vibrator included in all devices for this series of
boards.

This has been tested on Sony Xperia Loire phones, including the
Xperia X Compact (Kugo) and Xperia X (Suzu).

AngeloGioacchino Del Regno (4):
  pinctrl: qcom: spmi-gpio: Add PM/PMI8950 compatibility
  dt-bindings: pinctrl: qcom-pmic-gpio: Add support for PM/PMI8950
  pinctrl: qcom: spmi-mpp: Add PM/PMI8950 compatible strings
  dt-bindings: pinctrl: qcom-pmic-mpp: Add support for PM/PMI8950

 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 4 ++++
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt  | 4 ++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                     | 3 +++
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c                      | 2 ++
 4 files changed, 13 insertions(+)

-- 
2.21.0

