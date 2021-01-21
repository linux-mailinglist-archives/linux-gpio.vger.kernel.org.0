Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8306E2FF1A2
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 18:20:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388536AbhAURSp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 12:18:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:43074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388800AbhAURSk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Jan 2021 12:18:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9273323A57;
        Thu, 21 Jan 2021 17:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611249477;
        bh=6AwqWcAOwTOOIJWaYhNG4AO3gYTwMZyEYPz1FEVOmcg=;
        h=From:To:Cc:Subject:Date:From;
        b=Wl9UmszsGOiJ8ERmu5xtorm+6t4VXebKH89JpBRUiykZTPrCp0vb9rylU29eQjpjo
         2tVQG4+hCjJG6r6LK07+NkOf3C9D51JGtfn0YOouBMo4x2+hu/eKOaZ45SHLY4Cibo
         mCcVx2OQXrI78KyoqcTjaFJGps+ddATnmi4nCQdPEC4te6xr660DikGyt16QHKw1Wf
         xK2F9nqO7YPxyQ+sijLl8UN5VgqKHqxQvxfYToenbw1nW8RSSK5hi6Foc1ICiKtTWM
         5T7r/QXMweJQqqq6B1oRrQM+J3gbCmJFPumpV9Li0K9QdPxtcbPI2oDraQ+DHxPxcg
         9EwrQSwWVlBQQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] pinctrl: qcom: Add SM8350 pinctrl support
Date:   Thu, 21 Jan 2021 22:47:45 +0530
Message-Id: <20210121171747.3161543-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds binding and driver for TLMM block found in SM8350 SoC

Changes in v5:
 - rebase and revise binding based on Bjorn's qcom common TLMM binding

Changes in v4:
 - rename to qcom,sm8350-tlmm along with binding and driver structs
 - fix some nits in binding pointer by Rob

Vinod Koul (2):
  dt-bindings: pinctrl: qcom: Add SM8350 pinctrl bindings
  pinctrl: qcom: Add SM8350 pinctrl driver

 .../bindings/pinctrl/qcom,sm8350-pinctrl.yaml |  146 ++
 drivers/pinctrl/qcom/Kconfig                  |    9 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-sm8350.c         | 1649 +++++++++++++++++
 4 files changed, 1805 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8350.c

-- 
2.26.2

