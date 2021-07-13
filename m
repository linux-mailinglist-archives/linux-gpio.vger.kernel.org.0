Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6AB3C7043
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jul 2021 14:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236076AbhGMM2V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jul 2021 08:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236042AbhGMM2V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jul 2021 08:28:21 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADAFFC0613DD
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jul 2021 05:25:31 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id b5-20020a17090a9905b029016fc06f6c5bso1983838pjp.5
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jul 2021 05:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A7V+Qnp5gi1X6gyQ6cKEefgZdWO2pLhjYg9xWj0gReQ=;
        b=aF+EcplbdruFO7T0XcIFGITcXd4RJPMt5uKdV5giBlXuGY88bmL0ANrGoXQckljVFg
         Adfb+vgoRmwuFfJUtZYcK6SFrd2Ztx/ju/brZyIoZPhcXfg6Gg/wj7W18vxec5ePWf3O
         fSmSm1di5r1Aq5b3/r1Mp4Ywt3fF6NFA5ocBrconTfvmmCpHhcHgcO26cAX5cZJiPY4A
         OFRJ6oApcBU7E839UTlEaIm4vonwL67kiN8JEg1AN4z7K1R/oZVFYl4DMgFxqxsA+fgv
         1cdBPyWZYiqgUpoyx2eQZAnDwpGL4cXmcNtLSLraXiUmpev4ZWuCIKnStiX00B1ayrM2
         G+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A7V+Qnp5gi1X6gyQ6cKEefgZdWO2pLhjYg9xWj0gReQ=;
        b=Ws45p+8JXTFm/D/uqOfcy44iR+dwRJQtatRhklcXbrAwul4QpYvJjc+RqItjTSJ/oj
         uLw6obkVLD0lleW6/rIVqoQ/e5QtTqUBK8vV3E07e51ACIjA6MG+EFe+eMNmqsqsCP3i
         LS8pcpAyushXPXguUWFNPZqnWpy49YvCh381KsomY4az1qT/PxU9BsQdwwACgZEbj7gV
         UR2kcIYAWXTnkLo89g3jSgXAwrC28vxOGFwvsYXEkfQB5F4UDFIwLBKxFn5RG05kSPMU
         y2dFH24KZ0cl82bywwU7nfb1OJD0WbPb2NAte9vQRbotG4IM7mEK9To2CtiAkaGSr0A3
         N7kg==
X-Gm-Message-State: AOAM531wNU251RzV5R15z2B8+uN8Iqt0k89kaycpZgte5sY060b96s4/
        Q87UQPIWKC5Put6bL0nmQiY=
X-Google-Smtp-Source: ABdhPJxf3JxwxlB3aLGYkJyF64/Vrb9kOlQ1g29dR8uO+ZFQ83jktXx0f0B+A2n1KwUVa1oYv/1tcg==
X-Received: by 2002:a17:90a:6a01:: with SMTP id t1mr4154970pjj.10.1626179130756;
        Tue, 13 Jul 2021 05:25:30 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:3cd0:e668:9a9b:3005])
        by smtp.gmail.com with ESMTPSA id x7sm12782723pfc.96.2021.07.13.05.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 05:25:30 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, shawnguo@kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] pinctrl: imx8qxp: Constify imx_pinctrl_soc_info
Date:   Tue, 13 Jul 2021 09:25:13 -0300
Message-Id: <20210713122513.3112941-2-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210713122513.3112941-1-festevam@gmail.com>
References: <20210713122513.3112941-1-festevam@gmail.com>
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
 drivers/pinctrl/freescale/pinctrl-imx8qxp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx8qxp.c b/drivers/pinctrl/freescale/pinctrl-imx8qxp.c
index 4f97813ba8b7..0a0acc0038d0 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8qxp.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8qxp.c
@@ -194,7 +194,7 @@ static const struct pinctrl_pin_desc imx8qxp_pinctrl_pads[] = {
 	IMX_PINCTRL_PIN(IMX8QXP_COMP_CTL_GPIO_1V8_3V3_QSPI0B),
 };
 
-static struct imx_pinctrl_soc_info imx8qxp_pinctrl_info = {
+static const struct imx_pinctrl_soc_info imx8qxp_pinctrl_info = {
 	.pins = imx8qxp_pinctrl_pads,
 	.npins = ARRAY_SIZE(imx8qxp_pinctrl_pads),
 	.flags = IMX_USE_SCU,
-- 
2.25.1

