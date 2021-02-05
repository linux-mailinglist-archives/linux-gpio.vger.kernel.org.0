Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0589F3115AF
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Feb 2021 23:43:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhBEWir (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Feb 2021 17:38:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:53124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231833AbhBEOCg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Feb 2021 09:02:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33F7464E2A;
        Fri,  5 Feb 2021 14:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612533701;
        bh=NFeWIebETg3okPClyzNzxfFim9lVW6swzDLEuTntgIo=;
        h=From:To:Cc:Subject:Date:From;
        b=eoQ/m5XH0+SUUDudg/i3Z0Lty/d7yrvyftbrWjo46RHfmBOnXsMwSGo+BDiIXlxD5
         9YRrJNiCgGWISqQQvXQIatKRGzfHfYX6vn++p1qefLwOflxcb8BvwCjXrD4A0GxI1z
         kEnFDQyLVvxit7TzofSyH3zT8m5fKBC+/l9Y5osPtr+FsKc8fAYoh0K3TsfGMxMw9t
         irJCbnx2o5l3PbUKbyOyi41YMHQFuZ1+LNN668IbsGz8eFHRhjGK3f1VQuoIwg5KXK
         IXCHZuVGCeSt/U5ai/AxJpIcvuIt881IKrzkYuD9Yqjg6ixXukURyJAqMcS1VPXV/V
         vBzyiBKiAsg3g==
From:   Vinod Koul <vkoul@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] pinctrl: qcom: Add SM8350 pinctrl support
Date:   Fri,  5 Feb 2021 19:31:30 +0530
Message-Id: <20210205140132.274242-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds binding and driver for TLMM block found in SM8350 SoC

The binding is dependent on TLMM common binding from Bjorn:
 https://lore.kernel.org/linux-arm-msm/20210126042650.1725176-1-bjorn.andersson@linaro.org

Changes in v6:
 - Add rob and bjorn r-b
 - removed quotes around 'defs' and drop the phandle for binding

Changes in v5:
 - rebase and revise binding based on Bjorn's qcom common TLMM binding

Changes in v4:
 - rename to qcom,sm8350-tlmm along with binding and driver structs
 - fix some nits in binding pointer by Rob

Vinod Koul (2):
  dt-bindings: pinctrl: qcom: Add SM8350 pinctrl bindings
  pinctrl: qcom: Add SM8350 pinctrl driver

 .../bindings/pinctrl/qcom,sm8350-pinctrl.yaml |  145 ++
 drivers/pinctrl/qcom/Kconfig                  |    9 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-sm8350.c         | 1649 +++++++++++++++++
 4 files changed, 1804 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8350.c

-- 
2.26.2

