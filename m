Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC18B3D2F11
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jul 2021 23:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231533AbhGVUns (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Jul 2021 16:43:48 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:23582 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231489AbhGVUnq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 22 Jul 2021 16:43:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1626989060; x=1658525060;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MVI8KZShZuixsP4t0NwyWEs7cc53l61P3hxD+woWL70=;
  b=Ea2XRNgbY/nekz7GmptpNES6YpC7tyg7g2OxfZAAgO8v9QttISbd/wDK
   XM03a9X8nvoRSFbtdNWGKuigXz1K5r8gxmjPu+gQlUNKqwj1TZY7daCcO
   jXul2xEg7fIzhBss7fIy09t0xfcq51cgoJ+/Xv2PhN3wwG07RHs+1cbW7
   M=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 22 Jul 2021 14:24:20 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/AES256-SHA; 22 Jul 2021 14:24:20 -0700
Received: from vamslank1-linux.qualcomm.com (10.80.80.8) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Thu, 22 Jul 2021 14:24:20 -0700
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <olof@lixom.net>, <soc@kernel.org>, <linus.walleij@linaro.org>,
        <robh+dt@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        "Vamsi Krishna Lanka" <quic_vamslank@quicinc.com>
Subject: [PATCH v2 0/3] Add devicetree support for SDX65 Modem and MTP 
Date:   Thu, 22 Jul 2021 14:24:02 -0700
Message-ID: <cover.1626987430.git.quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03d.na.qualcomm.com (10.85.0.91) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>

Hello,

Changes from v1:
 - Addressed Bjorn's comments 

This series adds devicetree support for Qualcomm SDX65 platform and MTP
board. This series functionally depends on Add Pdc, GCC and RPMh Clock support
series [1] and Add pinctrl support for SDX65 [2] which are under review.

With this current devicetree support, the MTP can boot into initramfs
shell.

Thanks,
Vamsi

Vamsi krishna Lanka (3):
  dt-bindings: arm: qcom: Document SDX65 platform and boards
  ARM: dts: qcom: Add SDX65 platform and MTP board support
  ARM: dts: qcom: sdx65: Add pincontrol node

 .../devicetree/bindings/arm/qcom.yaml         |   6 +
 arch/arm/boot/dts/Makefile                    |   3 +-
 arch/arm/boot/dts/qcom-sdx65-mtp.dts          |  25 +++
 arch/arm/boot/dts/qcom-sdx65.dtsi             | 210 ++++++++++++++++++
 4 files changed, 243 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/qcom-sdx65-mtp.dts
 create mode 100644 arch/arm/boot/dts/qcom-sdx65.dtsi

-- 
2.32.0

