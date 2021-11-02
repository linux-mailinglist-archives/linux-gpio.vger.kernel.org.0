Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA73443917
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 23:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231958AbhKBXAj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 19:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231778AbhKBXAF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 19:00:05 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4938C06122E;
        Tue,  2 Nov 2021 15:57:20 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id s9so584003qvk.12;
        Tue, 02 Nov 2021 15:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IL3OGRIIMFUvv6ERH/SkSwRuJ7jwKuspNRDZqrtOGDc=;
        b=DyZ94o0+FQapY+J2rZGkoXsLLRkGrxuOD1iAX7zCkinTqnJQtKhnlPzPST9jAIF53r
         t4hR9tfTJuOst3R2jZuV3ik2uN5iG5H+gwTo8EgR5Jh0TO1tuFcSlyvxe+ggPYTXl84l
         cV6GMTfbNyoYZrdG36nx7Bjkb6JM8d75JrX72XaQbEtBofIEGV7QNsuxN/SR1hfGBNLy
         5HAJ+09LherHqBSp/nnbD0aVPMYgEGzCoqcK2aaTDkNzMVwF/oLYDtTqT5htLnQLZ7wf
         E5aXGmyiXnQFxlHhAhJ33A3Pgit7HcLH6bJGNDWRDm246WuBYCRrzUeZflEwwRln44ZL
         NtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IL3OGRIIMFUvv6ERH/SkSwRuJ7jwKuspNRDZqrtOGDc=;
        b=VktOCQ7MYXUAYM1gYzpCRZ9IvL9vQIJyTlF2TIVU19rqP4+FIIE1Ue6LUpCLP7cxj0
         YHQBOtZYoiYQWgpa6Qozj/QPRZtFB0UFRxCFIxU6UTD/xh42skJfPm8Jh+Urf25p5ndV
         bVin/Z2AtFoLc8VE2YV+DEhE6V2m1CaB9uWZqHet6N8efJuL1DXIxkXm5mr21hxqXJ7j
         PonU3IMeEk3O946oDEG3849dAKVvi/qlR4X0520jO1cW9UmToN+9o1T6GEVNGXsPVEAR
         pJsM1ayQRZsbJKxftJsPFJcdTkRo8d7d0EBbJwEXG+VhOhzUADk38JHdzmeKztghUM8O
         wUnQ==
X-Gm-Message-State: AOAM533HEmxu3WgI+3kqUfHDToBsV8sgGn8I2lIXvzU4T5NDzhsRYBcG
        +H7w+s/C/0WZUb0o16WncY8=
X-Google-Smtp-Source: ABdhPJzvncT8jsqO17WmjFqU6dV6qTNP9fA3RJ7MZ0N0WVKoE7yR2jImRsI9mqAM64mBQA1Ci/knDA==
X-Received: by 2002:a05:622a:84:: with SMTP id o4mr32151612qtw.41.1635893840049;
        Tue, 02 Nov 2021 15:57:20 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id v19sm351222qtk.6.2021.11.02.15.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 15:57:19 -0700 (PDT)
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
Subject: [PATCH v2 10/13] dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT compatible string
Date:   Tue,  2 Nov 2021 18:56:58 -0400
Message-Id: <20211102225701.98944-11-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
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
---
 Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
index 19621a2f8beb..bbb600f0e105 100644
--- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
+++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
@@ -34,6 +34,7 @@ properties:
           - fsl,imx6ull-usdhc
           - fsl,imx7d-usdhc
           - fsl,imx7ulp-usdhc
+          - fsl,imxrt-usdhc
           - nxp,s32g2-usdhc
       - items:
           - enum:
-- 
2.33.1

