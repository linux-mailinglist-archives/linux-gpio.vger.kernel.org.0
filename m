Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90EC32C8058
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Nov 2020 09:55:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727571AbgK3Iya (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 03:54:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727557AbgK3Iya (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 03:54:30 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E98C6C0617A6
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2020 00:53:49 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id z7so14954554wrn.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2020 00:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=enlaps-fr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aZj3M+EE/bMXUKz+ydv6IKww7aCY3Cf/m2pA23ZCE1w=;
        b=kx4u3ud9+Z5v7dSGIKhivo8wGGdifJ3lLaLeNMdxygn2W3HcWz/kNvef11wNamKAVa
         6iKjtRSI1rtgqM2AsvlBMxUZ6yLghMXmxy8wwZo9ioGsyxBljITk+uToeOzxWsMojyRx
         undq4vwv9COgXqpZ24vGirnD6zGCSRztQnM9M4uNbyZZaw3dXieEmzzSG3n77hrVYX4h
         spWEbLzbOeMcRhD5QYk0hPLkHO+AOw/eunmeCcU2FtHvtQWtuRZXrXLQjAAEHdURjr77
         AIvVVT2/+SBljGd3dscMf6+X+9jc2VcxIlRwFOvGS6/ZuZQIMpQlHedlz+wzBsttnD/M
         rRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aZj3M+EE/bMXUKz+ydv6IKww7aCY3Cf/m2pA23ZCE1w=;
        b=altKYMwAe/CAgy5D+wUhnmktWdsnZBbHXF11BfHPu/y29RkUuxjQrARzt0r4wS178+
         1IhRMEOk25dD3n+lIJ/uT99K3sXg0LXHkBZOlWX6nDM2QqCwot+9TPIaCIGvrgg30a+u
         4UHrsZ6I1+pPAeFrWlo3oaHpQA1mUChiL13+ZGnppO4A0TeIW4dPGI6b8Duv3zPXBQHT
         nC2KSf/iFwi8pvXFJ0oFT9os7NhATOnJ7Hx0qxfvF0mgkJj1qFeCP01p5wjFr4OdDwvi
         rBdAZ8zq7wZ4W+jVQ4KZjWP+PxYkh3KMAkw2dsp9LxupSazNXpTX5XndrJdNjGExtbk6
         OwfQ==
X-Gm-Message-State: AOAM530oM/LQxUQQ+bM4TvrOad1JbrQlvpN//AGRhJuPlxQ81C47G/8p
        60dpGkuDwzh4y1zMNz8xPfTY9w==
X-Google-Smtp-Source: ABdhPJzHOnPwpvnzB/gBWRBygpHi+HHbuyH37iLy6xUsHEZwcHx8yVdj+g0ll0IgtHCms7UnfpsHLg==
X-Received: by 2002:adf:f2d2:: with SMTP id d18mr27636470wrp.302.1606726428740;
        Mon, 30 Nov 2020 00:53:48 -0800 (PST)
Received: from sabin.localdomain (pop.92-184-112-43.mobile.abo.orange.fr. [92.184.112.43])
        by smtp.googlemail.com with ESMTPSA id a191sm24388539wme.25.2020.11.30.00.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 00:53:48 -0800 (PST)
From:   Louis Rannou <louis@enlaps.fr>
X-Google-Original-From: Louis Rannou <louis.rannou@enlaps.fr>
To:     Dong Aisheng <aisheng.dong@nxp.com>, linux-gpio@vger.kernel.org
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Louis Rannou <louis.rannou@enlaps.fr>
Subject: [PATCH v2] dt-bindings: pinctrl: imx7ulp: fix incorrect pin CONFIG
Date:   Mon, 30 Nov 2020 09:53:18 +0100
Message-Id: <20201130085318.8133-1-louis.rannou@enlaps.fr>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

According to the imx7ulp reference manual, the LSB refers to PS (Pull Select Field) and
the 2nd to PE (Pull-up Enable).

Signed-off-by: Louis Rannou <louis.rannou@enlaps.fr>
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 .../devicetree/bindings/pinctrl/fsl,imx7ulp-pinctrl.txt        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-pinctrl.txt
index bfa3703a7446..50ae260581eb 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-pinctrl.txt
@@ -33,7 +33,8 @@ PAD_CTL_ODE		(1 << 5)
 PAD_CTL_PUSH_PULL	(0 << 5)
 PAD_CTL_SRE_SLOW	(1 << 2)
 PAD_CTL_SRE_STD		(0 << 2)
-PAD_CTL_PE		(1 << 0)
+PAD_CTL_PE		(1 << 1)
+PAD_CTL_PS		(1 << 0)
 
 Examples:
 #include "imx7ulp-pinfunc.h"
-- 
2.29.2

