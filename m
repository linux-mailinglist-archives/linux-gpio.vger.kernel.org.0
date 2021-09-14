Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D49440A405
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Sep 2021 04:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238312AbhINC7G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Sep 2021 22:59:06 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:62433 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237839AbhINC6y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Sep 2021 22:58:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1631588258; x=1663124258;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=2KEsJQqEBxdh9+Xw/TkLXm39dmRDCs2+Xq0UotlTssU=;
  b=iFb3gD9M38Ka3wrAS2yNLxiPKShWqjPOOYj+vxs3AEpTIG/19itny9Yr
   XH8wieVb33srm+pzo00nPBzvsRl8UhUVWDWXKY4NFdJ99UiWreYYYobZO
   mtG+7fYlV4nBANTWrS2EaULpm7eY+o2JlMOLSmSZA9+wvt4cfFnXo9pu5
   E=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 13 Sep 2021 19:57:38 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2021 19:57:37 -0700
Received: from hu-subbaram-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 13 Sep 2021 19:57:37 -0700
From:   Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Subbaraman Narayanamurthy" <quic_subbaram@quicinc.com>
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom-pmic-gpio: Add output-{enable,disable} properties
Date:   Mon, 13 Sep 2021 19:57:25 -0700
Message-ID: <1631588246-4811-2-git-send-email-quic_subbaram@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631588246-4811-1-git-send-email-quic_subbaram@quicinc.com>
References: <1631588246-4811-1-git-send-email-quic_subbaram@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the pinconf DT property output-enable, output-disable
so that output can be enabled/disabled.

Signed-off-by: Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 9bd01db..fa7c319 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -170,6 +170,8 @@ $defs:
       input-enable: true
       output-high: true
       output-low: true
+      output-enable: true
+      output-disable: true
       power-source: true
 
       qcom,drive-strength:
-- 
2.7.4

