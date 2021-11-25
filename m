Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC6645E240
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 22:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357398AbhKYVVG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 16:21:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357034AbhKYVTF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 16:19:05 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE4B2C061784;
        Thu, 25 Nov 2021 13:15:05 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id m186so12918247qkb.4;
        Thu, 25 Nov 2021 13:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=loKGtqwC+Nu4d8PRLPlowPaDjaBxyF6vxvNrHOfxfpU=;
        b=aEUYIbe8VTlSlxsD08awhC4tUNC84Hf1o0Elc9WzwBoGOZjuLGYF1pFmo+ZAx+5j7a
         zlkfMjcSo9Us9jBM8yjkStVASlJ4jSB7Yd3Gx5cIwg8otGRJyKR9TJvn8HEV4JLG9ssm
         g+dbJUtePguoTH4Wajt1sXxNVQYDFWVtRi+BB59OLpAFR9IBI04xdTWxE/PHbEQISZ1z
         y8RDRgT1EV5+AbYYuM8bbzlc3iM810cU1Sgx1yClUv2msdeYVvnqqT4GOZ/M5T6muyEm
         Eb1xTCfv7mIjPVAnhDrzK4PemiVthV0UQOwVSyOVHkPhdH+K8fwKBNdhXDV/eZzZpto+
         DSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=loKGtqwC+Nu4d8PRLPlowPaDjaBxyF6vxvNrHOfxfpU=;
        b=P7rir7yep4FKD9mUQ6c+1z4sp1fSP21cGWZxUjoeWvjcq6/Rn4B0TyFsNeyiwcZMOR
         rY6lfUes7UZFS4N6nIHTLfujJczGCJpPa6ZvvmBCpMY+hSMY97FfwzG54Y9dpYX0oCBK
         feDN18Mzb8jPnw+Oqw0YsoTEd2UV5kDjyyLRYgT4LYUFNEaMF7EwGqeeSkrJbenyhCNZ
         ws4bnxdJ/z6Mn7VRbzhdnsaXnlwHkvohy7zT5/2C1BKe7KJqX714WGTIgqN2ZXpOe71R
         eOZTRpBh6mL9dFHMTdT0mBd+n+2w+lohDbm1ZzfG1OvxJKUkWCjTtk6OUb0usDbNtFX2
         reOw==
X-Gm-Message-State: AOAM532i3Ia4R5XlPKUa+EETcXT1WJYWAaYhCU6KGfPHSP0e4hwxjtSG
        7d9DnjUmA/fLKetNgu3InEc=
X-Google-Smtp-Source: ABdhPJwN1wto/UYyazZajqsPSZ8uJ7gwlGC0IU1ufSoDNhIXP6rIVFBlJmb7pG3QqXtxU3SoXq4eaA==
X-Received: by 2002:a37:9dd3:: with SMTP id g202mr10038212qke.774.1637874904976;
        Thu, 25 Nov 2021 13:15:04 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id j22sm2068175qko.68.2021.11.25.13.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 13:15:03 -0800 (PST)
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
        nobuhiro1.iwamatsu@toshiba.co.jp, Mr.Bossman075@gmail.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>
Subject: [PATCH v3 10/13] dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT compatible string
Date:   Thu, 25 Nov 2021 16:14:40 -0500
Message-Id: <20211125211443.1150135-11-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Jesse Taube <mr.bossman075@gmail.com>

Add i.MXRT documentation for compatible string.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1->V2:
* Nothing done
V2->V3:
* Rename imxrt to imxrt1050
---
 Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
index d5be9863009c..3fd6deff07f2 100644
--- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
+++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
@@ -34,6 +34,7 @@ properties:
           - fsl,imx6ull-usdhc
           - fsl,imx7d-usdhc
           - fsl,imx7ulp-usdhc
+          - fsl,imxrt1050-usdhc
           - nxp,s32g2-usdhc
       - items:
           - enum:
-- 
2.34.0

