Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58FDB32E22A
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 07:30:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbhCEGan (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Mar 2021 01:30:43 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:14893 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbhCEGan (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Mar 2021 01:30:43 -0500
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 04 Mar 2021 22:30:43 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 Mar 2021 22:30:40 -0800
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 05 Mar 2021 12:00:16 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 898CE3C33; Fri,  5 Mar 2021 12:00:14 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     kgunda@codeaurora.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, satya priya <skakit@codeaurora.org>
Subject: [PATCH 0/3] Add GPIO support for the PM7325, PM8350c, PMK8350 and PMR735A
Date:   Fri,  5 Mar 2021 11:59:56 +0530
Message-Id: <1614925799-3172-1-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

satya priya (3):
  pinctrl: qcom: spmi-gpio: Add support for four variants
  dt-bindings: pinctrl: qcom-pmic-gpio: Convert pmic gpio bindings to
    YAML
  dt-bindings: pinctrl: qcom-pmic-gpio: Add pmic gpio support

 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 272 --------------------
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 281 +++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |   4 +
 3 files changed, 285 insertions(+), 272 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

