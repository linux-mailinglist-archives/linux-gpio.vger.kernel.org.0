Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16AB13C7042
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jul 2021 14:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236050AbhGMM2T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jul 2021 08:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236042AbhGMM2S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jul 2021 08:28:18 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F562C0613DD
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jul 2021 05:25:28 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id k20so14485047pgg.7
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jul 2021 05:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yFk6vFnQFG7ZWEqZL8vxx2NScrRz0FV0Zv2XkeycqM0=;
        b=iTehfo8w2ynAJEPK10171kyKSz4ksKH4qJJ3LHJuNXGJG5znqzsVliShZN21WBEiFo
         ffdEK69JPQiVBOW6OViL+Tue43WilPDXoLMpadkT+7XEORnrBzfmnvePK9nuI/RMPWVt
         YmxTg+NKrcoMEKAWo1727DyiqfRIE+Jmw+wSxBsI7G4YBc0yWRt7FKdyMd8teJEfJ/7v
         E1omPdIg7ve2jrVHO6YmRlH0ycxst1xEZKCAhi2BSj/urOYNvwCYZu7IE1DKF1CpHYIH
         /qljVcuV5+AlXV5YQiTc9ZOfDQj6VlQBzYUom27gDegNnxX85sh0pxLXmNv7SfCFcGg3
         5TZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yFk6vFnQFG7ZWEqZL8vxx2NScrRz0FV0Zv2XkeycqM0=;
        b=G5QMV3eGJm9zXUu073DkYwVBR9JxOyotUp1IaD7swvavnCThiAJ6XKAroEGwQL5EOu
         wbga978IF270oG4JuAKttLwhYgGAB5cPaNdrtoCrLSdoPmYWmIZahEULDq3IpnMDV/r2
         s0sKwsJlozCynjcNnifKzysO4cCT0F5ZvHlbp6ndDDra3t4F/zATaK8yIQVq8iKFvnZj
         2Nhx+ZBpNzGc3CvMuWcOR/tFjh7bIMXbp2xBdHxYZ4gYvEGa/sNCLsngn/1aQeWZtbLE
         z7geZiV/HKx6rOPLZzF1hwOagCqsMg6G8F4lWZYkdtSWwUk+1h417wjKem+Yzs1Yg2qE
         BfsA==
X-Gm-Message-State: AOAM5302VaDtR0LMmVPtwuQMO2EWzT2viYc15SUAssGrm1zxfDTXshhJ
        CV6Ee0Nl+EcD4pXc6xybmpQ=
X-Google-Smtp-Source: ABdhPJzT9kWKtoERpDGXmdUHgssQ1/yYGNo2ikbo28dQU/ROotRTf2EqLAzXNf5hmkaqSP6iIfygLw==
X-Received: by 2002:aa7:8886:0:b029:32a:7290:ba42 with SMTP id z6-20020aa788860000b029032a7290ba42mr4455377pfe.65.1626179127948;
        Tue, 13 Jul 2021 05:25:27 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:3cd0:e668:9a9b:3005])
        by smtp.gmail.com with ESMTPSA id x7sm12782723pfc.96.2021.07.13.05.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 05:25:27 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, shawnguo@kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/2] pinctrl: imx8mn: Constify imx_pinctrl_soc_info
Date:   Tue, 13 Jul 2021 09:25:12 -0300
Message-Id: <20210713122513.3112941-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The imx_pinctrl_soc_info structure content is never changed, so it can be
declared as 'const', like it is done on all other i.MX pinctrl drivers.

Make it 'const' in this driver too.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx8mn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx8mn.c b/drivers/pinctrl/freescale/pinctrl-imx8mn.c
index 448a79eb4568..dbf89cfba477 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8mn.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8mn.c
@@ -317,7 +317,7 @@ static const struct pinctrl_pin_desc imx8mn_pinctrl_pads[] = {
 	IMX_PINCTRL_PIN(MX8MN_IOMUXC_UART4_TXD),
 };
 
-static struct imx_pinctrl_soc_info imx8mn_pinctrl_info = {
+static const struct imx_pinctrl_soc_info imx8mn_pinctrl_info = {
 	.pins = imx8mn_pinctrl_pads,
 	.npins = ARRAY_SIZE(imx8mn_pinctrl_pads),
 	.gpr_compatible = "fsl,imx8mn-iomuxc-gpr",
-- 
2.25.1

