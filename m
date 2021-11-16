Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1C7452BC7
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 08:41:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbhKPHnf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 02:43:35 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:3497 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230448AbhKPHn3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Nov 2021 02:43:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637048432; x=1668584432;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hPnptT6BSF+F95X1SXgn4kkxRac0u1jM2rjTRAEroUY=;
  b=O3CqrhS4K8yCQ2o1Axh2qvkBluG67H6M+YhgMPJ3oje2/GYFiBRUk7qq
   ehB7RSHG666HIDMm7dL3YjAcW+EdpXF2y/w39y5kIHi902yH55k5l7/UA
   1pjZ9r4cmOrVuiS/oi3s9BRWVGrATEp0+W+490Zkz6gY6I7aGcoWX6Fpi
   w=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Nov 2021 23:40:32 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 23:40:32 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 15 Nov 2021 23:40:00 -0800
Received: from hu-vamslank-sd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 15 Nov 2021 23:39:59 -0800
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <linus.walleij@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <manivannan.sadhasivam@linaro.org>,
        "Vamsi Krishna Lanka" <quic_vamslank@quicinc.com>
Subject: [PATCH v4 0/2] Add pinctrl support for SDX65 
Date:   Mon, 15 Nov 2021 23:39:44 -0800
Message-ID: <cover.1637048107.git.quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>

Hello,

Changes from v3:
 - Addressed comments, fixed dt_binding check errors and collected reviewed 
   by from Bjorn
 - Rebased on top of v5.16-rc1

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

 .../bindings/pinctrl/qcom,sdx65-pinctrl.yaml  | 195 ++++
 drivers/pinctrl/qcom/Kconfig                  |   9 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 drivers/pinctrl/qcom/pinctrl-sdx65.c          | 967 ++++++++++++++++++
 4 files changed, 1172 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sdx65.c


base-commit: 8ab774587903771821b59471cc723bba6d893942
prerequisite-patch-id: 07cee59dfdf0a1bd637b4bdc95ae68b34b8ffb0d
prerequisite-patch-id: b9bf5583d0b5368b8f2f32b9a94d5054899ec99a
prerequisite-patch-id: 730337f77ae4f00c8320c309fb864e760cc5ed54
prerequisite-patch-id: ba1594c6d524ae889dd4325d0912848f5542633b
prerequisite-patch-id: 6efd062dc77400d108f3f4a0c66010c69759d64a
prerequisite-patch-id: fb27c240bc512176c822e6f1c7cb5b8d65633c56
prerequisite-patch-id: 8125f49031bb5d9ebca1ca3e622080d6d3683bfb
prerequisite-patch-id: e6ecff6bfb4016b9118b2b25f4077355a1448220
prerequisite-patch-id: ba2f7d61be224484482d4910116ea69f1f5200ea
-- 
2.33.1

