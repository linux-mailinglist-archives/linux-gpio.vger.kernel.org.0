Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 272762AB138
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 07:26:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728904AbgKIG0b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 01:26:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:33274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727077AbgKIG0b (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Nov 2020 01:26:31 -0500
Received: from localhost.localdomain (unknown [122.171.147.34])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D4B192068D;
        Mon,  9 Nov 2020 06:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604903190;
        bh=nWJ3XKFoO5Uhw686hH17QIA1fPBqriVVOcCzDDYLQrU=;
        h=From:To:Cc:Subject:Date:From;
        b=oyq2iwqbe+biiYtko/WTaAll3CbGH6VeY8Ejx7mEgHi16Q3MA2UUUu23sDg4Wc6dD
         86ivp7cG1CklMWU7d1nY42AvvwDSvErdATohcr5c+J8melY+ZdgtUVGTDgEkXpTtjT
         rcW+jLkmnoTd80lX1urYQ8bC/VfsvsxbrML61Qi4=
From:   Vinod Koul <vkoul@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] pinctrl: qcom: Add binding and driver for SDX55 pincontrol
Date:   Mon,  9 Nov 2020 11:56:18 +0530
Message-Id: <20201109062620.14566-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series add device tree binding documentation and driver for SDX55 SOC
pincontroller.

Changes in v3:
 - Add ack by Bjorn
 - Fix dt_binding_check errors
 - Add gpio ranges in binding

Changes in v2:
 - merge the functional groups together
 - move pins to single line for readability

Jeevan Shriram (1):
  pinctrl: qcom: Add SDX55 pincontrol driver

Vinod Koul (1):
  dt-bindings: pinctrl: qcom: Add SDX55 pinctrl bindings

 .../bindings/pinctrl/qcom,sdx55-pinctrl.yaml  |  154 +++
 drivers/pinctrl/qcom/Kconfig                  |    9 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-sdx55.c          | 1018 +++++++++++++++++
 4 files changed, 1182 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sdx55.c

-- 
2.26.2

