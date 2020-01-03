Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09DE912F720
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2020 12:26:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbgACL0B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Jan 2020 06:26:01 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:49545 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727457AbgACL0A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jan 2020 06:26:00 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578050759; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-Id: Date: Subject: To: From: Sender;
 bh=WE57pxSUJyR+L5tsiqVz5w7Z/BAF2j86LaPJYplaCc0=; b=Bzh68sSTdZpEuEMty18/wKGYJn8NYa03a3WRJrD2zWDkXSdvRKUurlMOL1hcLZgzjmyC51Ou
 852/kiKCqMwrxDQB3DC/BLBmwF7bmWS18UVhbdtKVnOuv2QVnL1H89scwPj3cYR5S7dJA04l
 Fh/wGEHakanS2tbdulfQsWmUOQw=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e0f24c3.7f4dc728f378-smtp-out-n02;
 Fri, 03 Jan 2020 11:25:55 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EF909C447AE; Fri,  3 Jan 2020 11:25:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from srichara-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 980C9C447B2;
        Fri,  3 Jan 2020 11:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 980C9C447B2
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
Subject: [PATCH 0/2] Add Global clock controller support for IPQ6018
Date:   Fri,  3 Jan 2020 16:55:42 +0530
Message-Id: <1578050744-3761-1-git-send-email-sricharan@codeaurora.org>
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

This series adds Global clock controller support for ipq6018.

The patches were a part of https://patchwork.kernel.org/cover/11303075/,
now moved it outside based on Stephen's suggestion.

Sricharan R (2):
  clk: qcom: Add DT bindings for ipq6018 gcc clock controller
  clk: qcom: Add ipq6018 Global Clock Controller support

 .../devicetree/bindings/clock/qcom,gcc.yaml        |    3 +-
 drivers/clk/qcom/Kconfig                           |    8 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-ipq6018.c                     | 4643 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-ipq6018.h       |  262 ++
 include/dt-bindings/reset/qcom,gcc-ipq6018.h       |  157 +
 6 files changed, 5073 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/qcom/gcc-ipq6018.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-ipq6018.h
 create mode 100644 include/dt-bindings/reset/qcom,gcc-ipq6018.h

-- 
1.9.1
