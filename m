Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C88C23EAF70
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Aug 2021 06:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231548AbhHME4j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Aug 2021 00:56:39 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:47348 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhHME4j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Aug 2021 00:56:39 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 12 Aug 2021 21:56:13 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 12 Aug 2021 21:56:10 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 13 Aug 2021 10:25:48 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id F2AC653FD; Fri, 13 Aug 2021 10:25:46 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH 0/2] Add Vol+ support for sc7280-idp
Date:   Fri, 13 Aug 2021 10:25:29 +0530
Message-Id: <1628830531-14648-1-git-send-email-skakit@codeaurora.org>
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

