Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0504140A3E9
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Sep 2021 04:55:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237777AbhINC40 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Sep 2021 22:56:26 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:4575 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235706AbhINC4Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Sep 2021 22:56:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1631588108; x=1663124108;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=dJKSxrbeJpw3YsxSsUDA5foo0B0T6SqMrKqinmFJFCY=;
  b=KzGHVKmNF10nfkj6kOzYtU4EmOGJnRSFWQpg/2U2hiWeActYo2ciHmkY
   vS8ROQfdiYFrS3YQ5NjZHjnXpko5EJjzzrjpqc4gREIzo4xSSj+qk4AYH
   KdzL8Z8CoEUiunmrV3BqWA1gGYsMLsXMhaaB0g3H29Cgz0oPQp2f9PAnj
   8=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 13 Sep 2021 19:55:07 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2021 19:55:07 -0700
Received: from hu-subbaram-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 13 Sep 2021 19:55:06 -0700
From:   Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Subbaraman Narayanamurthy" <quic_subbaram@quicinc.com>
Subject: [PATCH 0/2] pinctrl: qcom: spmi-gpio: Add support to enable/disable output
Date:   Mon, 13 Sep 2021 19:54:53 -0700
Message-ID: <1631588095-4499-1-git-send-email-quic_subbaram@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support to enable/disable output for Qualcomm SPMI GPIO.

Subbaraman Narayanamurthy (2):
  dt-bindings: pinctrl: qcom-pmic-gpio: Add output-{enable,disable}
    properties
  pinctrl: qcom: spmi-gpio: add support to enable/disable output

 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 2 ++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                      | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.7.4

