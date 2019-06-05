Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D66E33622B
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 19:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbfFERQM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jun 2019 13:16:12 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58046 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbfFERQM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jun 2019 13:16:12 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 407346063A; Wed,  5 Jun 2019 17:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559754971;
        bh=FdlcBmhv22cQY8wMK0PgQ3r93qrONz476UJE+bJjDO4=;
        h=From:To:Subject:Date:From;
        b=Ieo5tQpi9gySz3Ixsi3ysw/ZxCGrXrVPG1DnZnWoOY3QMYtvBeZ5rkVxtQeZ32OC+
         x2+YTZuVvItNudc2oKLRCuuxXK3ZQiu5LDku4aV9SApDbJZqlc5CgOWIt0dV8BrvxL
         Fo6jLfoOTW3sXoUiki4hA4kRwzwJS8PJbdiLNITw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from srichara-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8C14E6063A;
        Wed,  5 Jun 2019 17:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559754970;
        bh=FdlcBmhv22cQY8wMK0PgQ3r93qrONz476UJE+bJjDO4=;
        h=From:To:Subject:Date:From;
        b=cLqKEbMtwDbOXwdDl5cANUaP7t18uBCbMBe4k5vi9oKe/Tm7pAM1uwQUWgomgI7TX
         m0i+G52gG6GFw3vJCjGbUyodA8b6wDNQFyjG6b/BTOG46yiPZNBmAfriaFsZfecH/K
         Cs1KlvCAP5UjUe/G7yjje9LlepUmjCfaU9NrMzB4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8C14E6063A
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
From:   Sricharan R <sricharan@codeaurora.org>
To:     robh+dt@kernel.org, sboyd@codeaurora.org, linus.walleij@linaro.org,
        agross@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/6] Add minimal boot support for IPQ6018
Date:   Wed,  5 Jun 2019 22:45:55 +0530
Message-Id: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
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

This series adds minimal board boot support for ipq6018-cp01
board.

Sricharan R (6):
  pinctrl: qcom: Add ipq6018 pinctrl driver
  dt-bindings: qcom: Add ipq6018 bindings
  clk: qcom: Add DT bindings for ipq6018 gcc clock controller
  clk: qcom: Add ipq6018 Global Clock Controller support
  arm64: dts: Add ipq6018 SoC and CP01 board support
  arm64: defconfig: Enable qcom ipq6018 clock and pinctrl

 Documentation/devicetree/bindings/arm/qcom.yaml    |    2 +
 .../devicetree/bindings/clock/qcom,gcc.txt         |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts       |   35 +
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  231 +
 arch/arm64/configs/defconfig                       |    2 +
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-ipq6018.c                     | 5267 ++++++++++++++++++++
 drivers/pinctrl/qcom/Kconfig                       |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-ipq6018.c             | 1183 +++++
 include/dt-bindings/clock/qcom,gcc-ipq6018.h       |  405 ++
 13 files changed, 7148 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq6018.dtsi
 create mode 100644 drivers/clk/qcom/gcc-ipq6018.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-ipq6018.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-ipq6018.h

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

