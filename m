Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A59FD55E760
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 18:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347499AbiF1Oz7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 10:55:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347483AbiF1Ozx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 10:55:53 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B92ECDD;
        Tue, 28 Jun 2022 07:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:Message-Id
        :Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=jZuySzSeLPFuyMaTbHvbearnnMYPsF7DujhGSdwCgEk=; b=VJkDFJ9xpIuezY184IWpafJEVa
        BdgUla15BpGJTbhmHWL2DuOctCaP4MFE/xlXGsc6D04ondvaiZWBwqwafE0+WEYSLLcdMhCCiqtZV
        o7ibufE9hbHUdNVLqTUHeOaOYRPlfuh4PqNMWbCJEJ/bAe+g7gqOjgYOwy9h6zM+ucO00Cm0GKBch
        JkXqv3JPcc3vvZc+oiKfx/+DFAJ8eUtRnurMpmlmzcBvxEKqmSqpr95ysumosEpdOuf/9VnjXdHfv
        fxSY1Bk2o2EpjgTOMHQQ/KFX7Eju9gVTGAhqP0z6n3EEaQkA1Tor95yk8KjAQg/aolVuWct82BYn/
        VgKBngXQ==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o6Ccy-006LlH-TT; Tue, 28 Jun 2022 16:55:44 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH 0/2] pinctrl: qcom: Add pinctrl driver for MSM8909
Date:   Tue, 28 Jun 2022 16:55:00 +0200
Message-Id: <20220628145502.4158234-1-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make it possible to control GPIOs/pins on the MSM8909 SoC by adding
the necessary definitions for the existing Qualcomm TLMM driver.

Stephan Gerhold (2):
  dt-bindings: pinctrl: Add DT schema for qcom,msm8909-tlmm
  pinctrl: qcom: Add pinctrl driver for MSM8909

 .../bindings/pinctrl/qcom,msm8909-tlmm.yaml   | 152 +++
 drivers/pinctrl/qcom/Kconfig                  |   8 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 drivers/pinctrl/qcom/pinctrl-msm8909.c        | 956 ++++++++++++++++++
 4 files changed, 1117 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-msm8909.c

-- 
2.30.2

