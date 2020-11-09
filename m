Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8D32ABCD6
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 14:41:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730620AbgKINjH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 08:39:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730607AbgKINBw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 08:01:52 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF77C0613D4
        for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2020 05:01:50 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id 23so8582537wrc.8
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2020 05:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z9RxCG2dK/UJMA4EuFffdX8+hzKCSPZ9ADW27XtraBI=;
        b=D49tBI74fzz2MEEwNWYcmRES8YSib+Qj65+puZ0m5J7dfnX+sINlyvg3uO+RtyaLGb
         Zjt9E3vdpw3jC7KYXZA3WAJxDiO1iWK6iOFqh94IBvEkkm0o+Tk6/1G2Lc4h+m8o06LT
         DZ7uZCMdgO1EGbqcRr+6OIPS3Bs22hUPFB5OnaxCXeueuXOHW+nT5l2131S06dmHldED
         RYQy+tfg6+BV5nkucs42CQvuz2cXA3RXcRfTUn777XOtzBiYjwmdPudWmg2+GSJHM5gc
         wPBBIY05h/77O1cq+8ZqtCux6wOXmumFG+znrul5D5DIB4CQxlMXGCrcNl4f5PVV0Wy7
         MZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z9RxCG2dK/UJMA4EuFffdX8+hzKCSPZ9ADW27XtraBI=;
        b=lJOtbe407wQdbc6gA00luLLEycAIupt6MKQICaNAm1gyRJfW7o+n0Hx0jNNclbk7ep
         QMqjrjCDqffIpfuY66AO1/SgaD6bZIBOs8RUkZLSdTQ7cX6VeHNSoUGAmZMZkDax4JMM
         tofXRG9QzZaHp+wrYKTjUWIGZSZuCHreQkQcqBKTL1xg9FI5yGV82grFJJ1xQm61u1GO
         qA7uOgd6HPSJZKdT7PDCCLphOLLsF7td5fepAGiC+jAFn+EB3EiuJVJsN1vMukPJWsMm
         3CC2Q5RGhie5LANf8ZAFzbV/rDGpykARk7+3D3ZS38iDkQsyaOjgHAj4OE/sHZfFrF7t
         v4uw==
X-Gm-Message-State: AOAM532H05+AcRIwhbygNdi+ij1wk7P7o9tBw48O8eOeKFOrL+CzeWQ8
        xgqYJwcx86rNaFnN6liSfW9thg==
X-Google-Smtp-Source: ABdhPJy+c20JY5rcE/Lg2B+Rt5GfKNz2OFbjI9lrN+MwarjXXYVoiCLQwTPsSkAAkfn8SS45xSiFcA==
X-Received: by 2002:adf:b1d6:: with SMTP id r22mr17068843wra.136.1604926908683;
        Mon, 09 Nov 2020 05:01:48 -0800 (PST)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id z5sm13135938wrw.87.2020.11.09.05.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 05:01:47 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     linus.walleij@linaro.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 0/2] pinctrl: qcom: Add sm8250 lpass lpi pinctrl support
Date:   Mon,  9 Nov 2020 13:01:33 +0000
Message-Id: <20201109130135.28589-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds support for LPASS (Low Power Audio SubSystem)
LPI (Low Power Island) pinctrl on SM8250.

This patch has been tested on support to Qualcomm Robotics RB5 Development
Kit based on QRB5165 Robotics SoC. This board has 2 WSA881X smart speakers
with onboard DMIC connected to internal LPASS codec via WSA  and VA macros
respectively.

Most of the work is derived from downstream Qualcomm kernels.
Credits to various Qualcomm authors from Patrick Lai's team who have
contributed to this code.

Am guessing existing qcom folder should cover maintining this driver too!
If not I can send additional patch to consolidate this along with other
Audio related drivers in Maintainer file!

Changes since v2:
 - addressed various coding style related comments by Andy Shevchenko
 - moved to devm  and bluk apis as suggested by Andy Shevchenko
 - moved slew offset to group struct for more clarity
 - updated comment log to reflect few similarities between other msm TLMM blocks.

Srinivas Kandagatla (2):
  dt-bindings: pinctrl: qcom: Add sm8250 lpass lpi pinctrl bindings
  pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver

 .../pinctrl/qcom,lpass-lpi-pinctrl.yaml       | 129 +++
 drivers/pinctrl/qcom/Kconfig                  |   8 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 734 ++++++++++++++++++
 4 files changed, 872 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c

-- 
2.21.0

