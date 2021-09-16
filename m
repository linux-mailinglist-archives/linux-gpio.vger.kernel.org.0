Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DEF040DB0C
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Sep 2021 15:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240066AbhIPNX3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Sep 2021 09:23:29 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:57964 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229474AbhIPNX3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Sep 2021 09:23:29 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 16 Sep 2021 06:22:08 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 16 Sep 2021 06:22:06 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 16 Sep 2021 18:51:46 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 1F1C451A3; Thu, 16 Sep 2021 18:51:47 +0530 (IST)
From:   Satya Priya <skakit@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     swboyd@chromium.org, David Collins <collinsd@codeaurora.org>,
        kgunda@codeaurora.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Satya Priya <skakit@codeaurora.org>
Subject: [PATCH V5 0/2] Add Vol+ support for sc7280-idp
Date:   Thu, 16 Sep 2021 18:51:36 +0530
Message-Id: <1631798498-10864-1-git-send-email-skakit@codeaurora.org>
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

