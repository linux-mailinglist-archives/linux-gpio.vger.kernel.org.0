Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5604D3CD370
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jul 2021 13:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236465AbhGSK1e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jul 2021 06:27:34 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:49458 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236426AbhGSK1c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jul 2021 06:27:32 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 19 Jul 2021 04:08:11 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 19 Jul 2021 04:08:09 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 19 Jul 2021 16:37:38 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 802935091; Mon, 19 Jul 2021 16:37:37 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     kgunda@codeaurora.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, satya priya <skakit@codeaurora.org>
Subject: [PATCH V6 0/2] Convert qcom pmic gpio bindings to YAML
Date:   Mon, 19 Jul 2021 16:37:33 +0530
Message-Id: <1626692855-10194-1-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

satya priya (2):
  dt-bindings: pinctrl: qcom-pmic-gpio: Convert qcom pmic gpio bindings
    to YAML
  dt-bindings: pinctrl: qcom-pmic-gpio: Remove the interrupts property

 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 288 ---------------------
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 239 +++++++++++++++++
 2 files changed, 239 insertions(+), 288 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

