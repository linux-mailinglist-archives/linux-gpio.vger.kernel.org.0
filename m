Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A10540454D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Sep 2021 08:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351012AbhIIGDP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Sep 2021 02:03:15 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:42881 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351002AbhIIGDO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Sep 2021 02:03:14 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 08 Sep 2021 23:02:05 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 08 Sep 2021 23:02:03 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 09 Sep 2021 11:31:44 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 0B9855444; Thu,  9 Sep 2021 11:31:42 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V3 0/2] Add Vol+ support for sc7280-idp
Date:   Thu,  9 Sep 2021 11:31:26 +0530
Message-Id: <1631167288-27627-1-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

David Collins (1):
  pinctrl: qcom: spmi-gpio: correct parent irqspec translation

satya priya (1):
  arm64: dts: sc7280: Add volume up support for sc7280-idp

 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 31 ++++++++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 37 +++++++++++++++++++++++++++++---
 2 files changed, 65 insertions(+), 3 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

