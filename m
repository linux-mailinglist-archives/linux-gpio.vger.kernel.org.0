Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C04B240A3FD
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Sep 2021 04:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238055AbhINC6y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Sep 2021 22:58:54 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:62433 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237823AbhINC6v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Sep 2021 22:58:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1631588255; x=1663124255;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=dJKSxrbeJpw3YsxSsUDA5foo0B0T6SqMrKqinmFJFCY=;
  b=MuLk6reCbXNiogXybxcpYP3D2otxpAlvKB5+Eqvy/JGJyWzBr1x21uN4
   U3OFDV3KWz7wo3uCfYSPfV9JPbQCQeW1IfzansRHUhxYJwttKh2CJ2wek
   IDBfGQKZBUikoPHGgbc539faKKIqttpWF30nZQ+y8RBNmUKvpMwYFrikk
   g=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 13 Sep 2021 19:57:35 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2021 19:57:34 -0700
Received: from hu-subbaram-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 13 Sep 2021 19:57:34 -0700
From:   Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Subbaraman Narayanamurthy" <quic_subbaram@quicinc.com>
Subject: [PATCH 0/2] pinctrl: qcom: spmi-gpio: Add support to enable/disable output
Date:   Mon, 13 Sep 2021 19:57:24 -0700
Message-ID: <1631588246-4811-1-git-send-email-quic_subbaram@quicinc.com>
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

