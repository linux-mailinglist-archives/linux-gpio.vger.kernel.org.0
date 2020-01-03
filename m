Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5242712F7A4
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2020 12:49:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727507AbgACLtx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Jan 2020 06:49:53 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:27931 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727521AbgACLtu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jan 2020 06:49:50 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578052190; h=Message-Id: Date: Subject: To: From: Sender;
 bh=r2EZ+2xziX53OTfMONPxF+br2j1dHKKsLKUSUS0Dx10=; b=KuwxZypd1sgUbeA0hc1hMIDoDTvVEIja5LUV6qwnsJW4c8iXrtRiSpV3ikqYbK89gVtv3e7r
 NxIw3FjWIno5A3oI7nBmk9K/7s/QU/Pm0UjUMfFD67Uap4MkjLP524QVF9f7Ezwnf/A39JQ8
 APIDjeMhtEgs5N3ZnuUblk3Wc7g=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e0f2a5c.7f53337e1068-smtp-out-n01;
 Fri, 03 Jan 2020 11:49:48 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0B9F0C433A2; Fri,  3 Jan 2020 11:49:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from srichara-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A824DC433CB;
        Fri,  3 Jan 2020 11:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A824DC433CB
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
Subject: [PATCH V3 0/5] Add minimal boot support for IPQ6018
Date:   Fri,  3 Jan 2020 17:19:32 +0530
Message-Id: <1578052177-6778-1-git-send-email-sricharan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The IPQ6018 is Qualcomm\u2019s 802.11ax SoC for Routers,
Gateways and Access Points.

This series adds minimal board boot support for ipq6018-cp01 board.

[V3]
 * Removed clock driver and bindings from this patch series, and added them
   as a different series.
 * Removed qpic_padN from pinctrl driver.
 * Addressed review comments in dts, and added the remaining fixed clocks their
 * Fixed review comments in pinctrl bindings
 * Patch 4 arm64: dts: Add ipq6018 SoC and CP01 board support has build
   dependency with,
	https://patchwork.ozlabs.org/patch/1217293/

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
