Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 596442EB9A4
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jan 2021 06:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725789AbhAFFup (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jan 2021 00:50:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:42780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725562AbhAFFup (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 Jan 2021 00:50:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80FD5227C3;
        Wed,  6 Jan 2021 05:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609912204;
        bh=rW1KoscSO0fWq06/R8w7NrZsccgTF/Xdl4geIz4CYhI=;
        h=From:To:Cc:Subject:Date:From;
        b=D1fxrTgCvabAVX8nJ2PzqoeB4H1Ul3vuYLBquwU8dKyUnVN+EhVknXNLk0pXPaU1A
         7SKc3fIuipKRp4AxfGdt+4UqFE/C/J+u/IYjtn/PRu1KsTJD33pK1yd2ro85ihETvf
         sZyb/BYqKKRXUZvVSMhF9a80LCZOwzE5baP1iwMZoskuWI4/SiHkGfWIi+o9CzPaT/
         2o8gFA3mtTW0hnfh4opdlMDuKZIwQdkvqpN5v/SMl5kbbiCsbXZ448FZa0c1jpqKyy
         70+KuVApmTGBGThAYUGuLqg9aYVTN1hrgLnMj5/AATQAjnEEtz85v2H6ODCxusMydr
         ROc/m9HwEQLUA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] pinctrl: qcom: Add SM8350 pinctrl support
Date:   Wed,  6 Jan 2021 11:19:48 +0530
Message-Id: <20210106054950.303244-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This add binding and driver for TLMM block found in SM8350 SoC

Changes since v2:
 - rename to qcom,sm8350-tlmm along with binding and driver structs
 - fix some nits in binding pointer by Rob

Raghavendra Rao Ananta (1):
  pinctrl: qcom: Add SM8350 pinctrl driver

Vinod Koul (1):
  dt-bindings: pinctrl: qcom: Add SM8350 pinctrl bindings

 .../bindings/pinctrl/qcom,sm8350-tlmm.yaml    |  149 ++
 drivers/pinctrl/qcom/Kconfig                  |    9 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-sm8350.c         | 1649 +++++++++++++++++
 4 files changed, 1808 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8350.c

-- 
2.26.2

