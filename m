Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05411141DFA
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Jan 2020 14:13:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgASNNk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Jan 2020 08:13:40 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:26314 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726798AbgASNNk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 19 Jan 2020 08:13:40 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579439619; h=Message-Id: Date: Subject: To: From: Sender;
 bh=FmJHa2FasAfuTkbac3HOfTDpK2WgWNjbFpSdx7jBY20=; b=NOnR1U04mK1G2Xb89xAOw4ZjL/6jRzdfIBzt9+yQYMgKeQREyuMP7yg5gaNodbNDV1cexrKK
 BACCvzbFXLcIf+GdV3c/j4gnGOi+/D5jhyyvMSYFoWiefUt3xAVpJ/IBWZw/EfLJ2utfRAJO
 muj1639fdNi8yzYxth49FF8AfHo=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e245602.7f1f8224ff80-smtp-out-n02;
 Sun, 19 Jan 2020 13:13:38 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9FFB2C4479C; Sun, 19 Jan 2020 13:13:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from srichara1-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C75F6C43383;
        Sun, 19 Jan 2020 13:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C75F6C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
From:   Sricharan R <sricharan@codeaurora.org>
To:     agross@kernel.org, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org,
        robh+dt@kernel.org, sivaprak@codeaurora.org,
        sricharan@codeaurora.org
Subject: [PATCH V6 0/5] Add minimal boot support for IPQ6018
Date:   Sun, 19 Jan 2020 18:43:16 +0530
Message-Id: <1579439601-14810-1-git-send-email-sricharan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The IPQ6018 is Qualcomm\u2019s 802.11ax SoC for Routers,
Gateways and Access Points.

This series adds minimal board boot support for ipq6018-cp01 board.

[V6]
 * Addressed more review comments on pinctrl bindings from Rob.
 * Patch 4 arm64: dts: Add ipq6018 SoC and CP01 board support has build
   dependency with,
	https://lkml.org/lkml/2020/1/9/84
[V5]
 * Addressed review comments in pinctrl bindings from Rob.
 * Ran make dt_binding_check with modified patch.
 * Added fixed rate clocks in gcc clock controller node.
 * Patch 4 arm64: dts: Add ipq6018 SoC and CP01 board support has build
   dependency with,
        https://lkml.org/lkml/2020/1/9/84
[v4]
 * Addressed review comments in pinctrl bindings from Rob.
 * Ran make dt_binding_check and no issues was reported.
 * Deleted absahu email id from patch 4, since its bouncing now.
 * Patch 4 arm64: dts: Add ipq6018 SoC and CP01 board support has build
   dependency with,
	https://lkml.org/lkml/2020/1/9/84

[V3]
 * Removed clock driver and bindings from this patch series, and added them
   as a different series.
 * Removed qpic_padN from pinctrl driver.
 * Addressed review comments in dts, and added the remaining fixed clocks their
 * Fixed review comments in pinctrl bindings

[v2]
 * Splitted dt bindings  and driver into different patches. Added missing bindings
   and some style changes.
 * Added ipq6018 schema
 * Addressed review comments for gcc clock bindings.
 * Removed all clk critical flags, removed 1/1 factor clocks, moved to new
   way of specifying clk parents, and addressed other review comments.
 * Sorted nodes based on address, name, label. Removed unused clock nodes,
   Addressed other review comments.

Sricharan R (5):
  dt-bindings: pinctrl: qcom: Add ipq6018 pinctrl bindings
  pinctrl: qcom: Add ipq6018 pinctrl driver
  dt-bindings: qcom: Add ipq6018 bindings
  arm64: dts: Add ipq6018 SoC and CP01 board support
  arm64: defconfig: Enable qcom ipq6018 clock and pinctrl

 Documentation/devicetree/bindings/arm/qcom.yaml    |    8 +
 .../bindings/pinctrl/qcom,ipq6018-pinctrl.yaml     |  174 +++
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts       |   30 +
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  263 +++++
 arch/arm64/configs/defconfig                       |    3 +
 drivers/pinctrl/qcom/Kconfig                       |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-ipq6018.c             | 1107 ++++++++++++++++++++
 9 files changed, 1597 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq6018.dtsi
 create mode 100644 drivers/pinctrl/qcom/pinctrl-ipq6018.c

-- 
1.9.1
