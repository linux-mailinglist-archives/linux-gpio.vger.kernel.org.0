Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3FE438A59
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 17:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232499AbhJXPoi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 11:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232163AbhJXPnv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 11:43:51 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 526DFC0432C1;
        Sun, 24 Oct 2021 08:40:55 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id o12so8133815qtq.7;
        Sun, 24 Oct 2021 08:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vgtfqpJ2UFlTkiMWu/m6pDold20P16J5tOJCpP4mfRs=;
        b=J/NlAl/YoY9eut7+2Gd/+ADk1l/GxoWPCfezyJwmtato5/EZzHseRr8lFJrbI0yv1x
         W40RTcdpv78Zt6sG8GPgYXbRsHuhHSmnui7f2kX2fdILYS1yuzRnFT5W+Yr0GUNKpUGJ
         PcwhJTaQ5PdXk83MDazdgTOqOG+CymAgrPkcUT/HLURWNrQdQeNsMEALM0FK+IZ7ifSE
         x4oDCfG0y2bSXYG7xSmZr0vW7Z9Tq4OHThvZu2h3ZefjnRj1cQgPJtULkTNEz3pTHYnC
         Kk223MLGoyqjksSQsHxQeizEuEwEpTA3okfqQx4590XkFdLvSeTXkjLrmb5k8Gv8VihX
         862Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vgtfqpJ2UFlTkiMWu/m6pDold20P16J5tOJCpP4mfRs=;
        b=0GmD4sdlLHfFh+YbXlGbD1DQubBu0Jttoi9FiJSzNFyVzwDuEEok+wEXyMzv8fKAyj
         mMTggSiMH959BMwBuTYzdwf/ZeDaayBWnEyRnFPMQmBHDIyCiQ2kVZ7QR0v34dd1NvUd
         RJncIRjdJHs4RMiRsyLmVzNRzHfoBiTAsiQTYLEr6ZvDRZbiUqUUIlR1jCsXDrgXeKYx
         6FjNmEWLYZkV9Ewc81gRybgI5BM1NDYORCtWWP5xAFKQyXpHlMurd3vaD9JWiJuDicvf
         4eqI7BcorrlC+oRO0fpXLhzczO5Nra9zt4WrgxNCEgU2P7Hpog+5b6efXJlxLoEeAhrW
         j8fg==
X-Gm-Message-State: AOAM5313j9cAYwgwhmaY62aEmsdl7EbPYa/VUTwNGfDCrLnVD3kFDXMy
        Wz4UOCf0YEoNd8NP6SUy/Ts=
X-Google-Smtp-Source: ABdhPJxz9ISTP/92XiTZMUUmzkXOkPWMWuUnYoUpGIXXHVJIXl0bys5MJECmCuABcI7hXktUoYPDoQ==
X-Received: by 2002:ac8:5e14:: with SMTP id h20mr12064103qtx.364.1635090054510;
        Sun, 24 Oct 2021 08:40:54 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id x9sm7291731qtw.84.2021.10.24.08.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 08:40:54 -0700 (PDT)
From:   Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To:     linux-imx@nxp.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
        stefan@agner.ch, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
        adrian.hunter@intel.com, jirislaby@kernel.org,
        giulio.benetti@benettiengineering.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, leonard.crestez@nxp.com,
        b20788@freescale.com, Mr.Bossman075@gmail.com, fugang.duan@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH 10/13] dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT compatible string
Date:   Sun, 24 Oct 2021 11:40:24 -0400
Message-Id: <20211024154027.1479261-11-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add i.MXRT documentation for compatible string.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
index a3412f221104..8b6fca1bd39b 100644
--- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
+++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
@@ -34,6 +34,7 @@ properties:
           - fsl,imx6ull-usdhc
           - fsl,imx7d-usdhc
           - fsl,imx7ulp-usdhc
+          - fsl,imxrt-usdhc
       - items:
           - enum:
               - fsl,imx8mm-usdhc
-- 
2.33.0

