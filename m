Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93DF112DE26
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jan 2020 09:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbgAAIUj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jan 2020 03:20:39 -0500
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:56920 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727226AbgAAIUS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jan 2020 03:20:18 -0500
X-IronPort-AV: E=Sophos;i="5.69,382,1571695200"; 
   d="scan'208";a="429578764"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/AES128-SHA256; 01 Jan 2020 09:20:08 +0100
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     kernel-janitors@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 14/16] pinctrl: qcom: ssbi-gpio: constify copied structure
Date:   Wed,  1 Jan 2020 08:43:32 +0100
Message-Id: <1577864614-5543-15-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pm8xxx_pinctrl_desc structure is only copied into another
structure, so make it const.

The opportunity for this change was found using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
index dca86886b1f9..c7912135bbfb 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -439,7 +439,7 @@ static const struct pinconf_ops pm8xxx_pinconf_ops = {
 	.pin_config_group_set = pm8xxx_pin_config_set,
 };
 
-static struct pinctrl_desc pm8xxx_pinctrl_desc = {
+static const struct pinctrl_desc pm8xxx_pinctrl_desc = {
 	.name = "pm8xxx_gpio",
 	.pctlops = &pm8xxx_pinctrl_ops,
 	.pmxops = &pm8xxx_pinmux_ops,

