Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A79043C2A11
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jul 2021 22:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbhGIUJT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jul 2021 16:09:19 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:8334 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbhGIUJT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jul 2021 16:09:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1625861196; x=1657397196;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tL3GcnotdHKbbsXQ/boARt+da3xuE9RVsSCcT0uHStE=;
  b=GH531ghHB9J3Khd/XToBLRT9652RabluBGIZPWiFdsehs0qHO2QYg7s+
   y3LrjHMKAvjYqMQ/YS9rCDW/w5gg6MjihZwIlDg7hPV2IUOkyt1jzhl+u
   7SEjXf47PSj9b63htbc06TTfMKygRprOIQ5fM/mvsK2CQJV8rDdI4JYfy
   c=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 09 Jul 2021 13:06:35 -0700
X-QCInternal: smtphost
Received: from nalasexr03e.na.qualcomm.com ([10.49.195.114])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 09 Jul 2021 13:06:35 -0700
Received: from vamslank1-linux.qualcomm.com (10.80.80.8) by
 nalasexr03e.na.qualcomm.com (10.49.195.114) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Fri, 9 Jul 2021 13:06:34 -0700
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <linus.walleij@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <manivannan.sadhasivam@linaro.org>,
        "Vamsi Krishna Lanka" <quic_vamslank@quicinc.com>
Subject: [PATCH 0/2] Add pinctrl support for SDX65
Date:   Fri, 9 Jul 2021 13:06:16 -0700
Message-ID: <20210709200618.20230-1-quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03g.na.qualcomm.com (10.85.0.49) To
 nalasexr03e.na.qualcomm.com (10.49.195.114)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>

Hello,

This patch series adds pinctrl bindings and tlmm support for SDX65.

Thanks,
Vamsi 

Vamsi krishna Lanka (2):
  dt-bindings: pinctrl: qcom: Add SDX65 pinctrl bindings
  pinctrl: qcom: Add SDX65 pincontrol driver

 .../bindings/pinctrl/qcom,sdx65-pinctrl.yaml  |  175 +++
 drivers/pinctrl/qcom/Kconfig                  |    9 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-sdx65.c          | 1100 +++++++++++++++++
 4 files changed, 1285 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sdx65.c

-- 
2.32.0

