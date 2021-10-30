Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C23D2440624
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Oct 2021 02:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231635AbhJ3AFt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Oct 2021 20:05:49 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:26285 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbhJ3AFt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Oct 2021 20:05:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635552200; x=1667088200;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=quu+gRf/y0qo8PfOpUQkOniQbXWEtqDofZCN2hj6b2M=;
  b=FsR5boi7QWYF+FFreYfFtYYtqbp6hO6upjmUN1JLwGILUYDTbvCKmT4V
   6bl2vt+7FS5vJgAbznshRqT7b+ruAnY7/BP/KOuViGAGQLdO4MaTvdFH4
   +xl59SUqyMrarrwngygfUgVjfmtF037KROHsaLNFcbP+ct8l3EsKQqHJi
   Y=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 29 Oct 2021 17:03:20 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2021 17:03:19 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Fri, 29 Oct 2021 17:03:19 -0700
Received: from hu-vamslank-sd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Fri, 29 Oct 2021 17:03:18 -0700
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <linus.walleij@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <manivannan.sadhasivam@linaro.org>,
        "Vamsi Krishna Lanka" <quic_vamslank@quicinc.com>
Subject: [PATCH v3 0/2] Add pinctrl support for SDX65 
Date:   Fri, 29 Oct 2021 17:03:09 -0700
Message-ID: <1635552191-16505-1-git-send-email-quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>

Hello,

Changes from v2:
 - Addressed comments from Bjorn
 - Collected Reviewed-by for the patches 

Changes from v1:
 - Addressed all Bjorn's comments

This patch series adds pinctrl bindings and tlmm support for SDX65.

Thanks,
Vamsi

Vamsi Krishna Lanka (2):
  dt-bindings: pinctrl: qcom: Add SDX65 pinctrl bindings
  pinctrl: qcom: Add SDX65 pincontrol driver

 .../bindings/pinctrl/qcom,sdx65-pinctrl.yaml       | 195 +++++
 drivers/pinctrl/qcom/Kconfig                       |   9 +
 drivers/pinctrl/qcom/Makefile                      |   1 +
 drivers/pinctrl/qcom/pinctrl-sdx65.c               | 967 +++++++++++++++++++++
 4 files changed, 1172 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sdx65.c

-- 
2.7.4

