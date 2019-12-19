Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DFCF125F69
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 11:43:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbfLSKmu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 05:42:50 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:42221 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726734AbfLSKmt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Dec 2019 05:42:49 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576752169; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-Id: Date: Subject: To: From: Sender;
 bh=T9NsD/M02vdnbyOUnwhyyGvAMjZyJMRP82J5Usiy73c=; b=CdY8KbsCXeYckDzZkNXPemqIfV88LaWDMWyf44xvVZGKC4oxBWhX51InQipvzaKUEFwe6npw
 eK03FhD4/ql0+hla+KX9RV36qZLpnbp5Krg9khCUAyqsQ0JO9GE8v8imlPdfXKSDFgURZTJ3
 XDT652bBYRCvf65eIxuPKOTjRz8=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfb5426.7fc03d6f2ca8-smtp-out-n01;
 Thu, 19 Dec 2019 10:42:46 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A3D07C447BB; Thu, 19 Dec 2019 10:42:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from srichara-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 33C73C4479C;
        Thu, 19 Dec 2019 10:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 33C73C4479C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
From:   Sricharan R <sricharan@codeaurora.org>
To:     sricharan@codeaurora.org, agross@kernel.org,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-soc@vger.kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        sivaprak@codeaurora.org
Subject: [PATCH V2 0/7] Add minimal boot support for IPQ6018
Date:   Thu, 19 Dec 2019 16:11:42 +0530
Message-Id: <1576752109-24497-1-git-send-email-sricharan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The IPQ6018 is Qualcomm’s 802.11ax SoC for Routers,
Gateways and Access Points.

This series adds minimal board boot support for ipq6018-cp01 board.

[v2]
 * Splitted dt bindings  and driver into different patches. Added missing bindings
   and some style changes.
 * Added ipq6018 schema
 * Addressed review comments for gcc clock bindings.
 * Removed all clk critical flags, removed 1/1 factor clocks, moved to new
   way of specifying clk parents, and addressed other review comments.
 * Sorted nodes based on address, name, label. Removed unused clock nodes,
   Addressed other review comments.

Sricharan R (7):
  dt-bindings: pinctrl: qcom: Add ipq6018 pinctrl bindings
  pinctrl: qcom: Add ipq6018 pinctrl driver
  dt-bindings: qcom: Add ipq6018 bindings
  clk: qcom: Add DT bindings for ipq6018 gcc clock controller
  clk: qcom: Add ipq6018 Global Clock Controller support
  arm64: dts: Add ipq6018 SoC and CP01 board support
  arm64: defconfig: Enable qcom ipq6018 clock and pinctrl

 Documentation/devicetree/bindings/arm/qcom.yaml    |    7 +
 .../devicetree/bindings/clock/qcom,gcc.yaml        |    3 +-
 .../bindings/pinctrl/qcom,ipq6018-pinctrl.yaml     |  172 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts       |   41 +
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  215 +
 arch/arm64/configs/defconfig                       |    3 +
 drivers/clk/qcom/Kconfig                           |    8 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-ipq6018.c                     | 4674 ++++++++++++++++++++
 drivers/pinctrl/qcom/Kconfig                       |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-ipq6018.c             | 1161 +++++
 include/dt-bindings/clock/qcom,gcc-ipq6018.h       |  262 ++
 include/dt-bindings/reset/qcom,gcc-ipq6018.h       |  157 +
 15 files changed, 6715 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq6018.dtsi
 create mode 100644 drivers/clk/qcom/gcc-ipq6018.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-ipq6018.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-ipq6018.h
 create mode 100644 include/dt-bindings/reset/qcom,gcc-ipq6018.h

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
