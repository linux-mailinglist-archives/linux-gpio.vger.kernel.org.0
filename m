Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 013F63CB7BD
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jul 2021 15:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239803AbhGPNQu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jul 2021 09:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239822AbhGPNQt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jul 2021 09:16:49 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A938C06175F
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 06:13:53 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id a22so5011751vso.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 06:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2Jt7KsHHJ0QRR2aeG4nrHvfyry7JeoeiUDEakBZ0Su8=;
        b=pLxDeA+DFRiaep1wQr3SbLMy2KCzdY4gFH4vlbDfWUvWycwnAMqiZVDseklr4vMQ8O
         Kcu7KadrYxfkGljA8u8FAZvuqfE9FwCB/QVzcWT2fvYvjh3y/z042DxS8RR8iiJIJGy2
         UU6W4mjym3GXp2WEEbbRjNojoxCGklHbD3Ww8J1h8K4cmrnPWYdKQ+indkAXI+wnnZME
         koA3d7diY3lqnAU0cf+k+RqldZLnsCkLQccW6d8LQwkE4LNpYsEDisgZYPMXcFrJTtuI
         Lefdw47IdpJfbavrJZheCBwUvet8YfUOgru3cIaFdL5pK3UHvZZ60nzM0EDVsNZrJicg
         ovmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2Jt7KsHHJ0QRR2aeG4nrHvfyry7JeoeiUDEakBZ0Su8=;
        b=n8h5U/7yZenDs72fpAUekG8RnTUN6XVgXO9ZFjEHmVZTLQNsTw2rplUqWFTkpN7bKw
         pG8N/keNQhjm5ptriqyLE5WGitIWPzXmqeqnIDfOXKAiexeu1/V1spDt9f8JTi+y7oo/
         N09VPWcQLy+unz3ZYYDhPUQYiI+8yRjg/53nZTYlLgqeGhhPc+AGA+Rb0J0okVyxaMiD
         PavGkMUoy/lLld7slWDn3W2aR63ExOBeaAAecaZPiEtmdyb1Wly8LpVHLcAIqx+lemFv
         Y6D8ey3q+Ug8yKJTpnnINwPnkkfa8syQh/BigoEXF9LP+nvi8NubGZxjJ5aFMqU+EYOw
         9TZw==
X-Gm-Message-State: AOAM532Pj0CRl3qlPhLQ41Ihep++gkAunsTa4O7Y0hzr3TpJo1BrbN2F
        dCe2ohOafZyuyp4B4pBE5xBg7oKxdFpi2g==
X-Google-Smtp-Source: ABdhPJy7ocqT5v3LgeTs2QXor67+YWig9mPB3c8okuAzv+ZsCiO37dLlM517DrH1crHW4nw0o0wi2w==
X-Received: by 2002:a67:7142:: with SMTP id m63mr12235936vsc.8.1626441232580;
        Fri, 16 Jul 2021 06:13:52 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:9f0b:cb12:835a:e9f9])
        by smtp.gmail.com with ESMTPSA id z23sm1175608vsk.32.2021.07.16.06.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 06:13:52 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, shawnguo@kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH] pinctrl: imx8dxl: Constify imx_pinctrl_soc_info
Date:   Fri, 16 Jul 2021 10:13:41 -0300
Message-Id: <20210716131341.3370620-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The imx_pinctrl_soc_info structure content is never changed, so it can be
declared as 'const', like it is done on all other i.MX pinctrl drivers.

Make it 'const' in this driver too.

Reported-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx8dxl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx8dxl.c b/drivers/pinctrl/freescale/pinctrl-imx8dxl.c
index 041455c13d0d..f947b1d0d1aa 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx8dxl.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx8dxl.c
@@ -155,7 +155,7 @@ static const struct pinctrl_pin_desc imx8dxl_pinctrl_pads[] = {
 };
 
 
-static struct imx_pinctrl_soc_info imx8dxl_pinctrl_info = {
+static const struct imx_pinctrl_soc_info imx8dxl_pinctrl_info = {
 	.pins = imx8dxl_pinctrl_pads,
 	.npins = ARRAY_SIZE(imx8dxl_pinctrl_pads),
 	.flags = IMX_USE_SCU,
-- 
2.25.1

