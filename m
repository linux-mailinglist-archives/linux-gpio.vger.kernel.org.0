Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD4D1443909
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 23:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbhKBXAV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 19:00:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231881AbhKBW7x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 18:59:53 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF07C061226;
        Tue,  2 Nov 2021 15:57:17 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id b11so606138qvm.7;
        Tue, 02 Nov 2021 15:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tp9jx2w5xmRhSaPrYSvUOoWJLgBK25gjF2mKOgOPi54=;
        b=DC9F86JFyMzvhwAJ8oMM2sDIypcHHp9DbVM5si3RX95RM2moTu0uoFSA0baLffKlqq
         eUizVFCdDZ0RTc436CrtFVQ5/2AcU0xumBwy0bRnCluOZnWRHKLoGdua2apkW7ylIab9
         YmBNPNA6yjyKhrev1P5DRag4pBTChfRW14lpr1sZH+d5afAvfgGcd3ZtGD9vwdXHvt/J
         MKyHtDc/eYXUHUWQUAc01YBfpGHcu/JQgzghi7FFYdBlGUycnN1njQy5Gh1C1Y5hpcii
         /rWr3Ys0GYy96YRn34J6WUNWMhKYkcUa7mIrFdB4HvE+Tq945tO5E6ohmPgP1XLn+SRq
         kfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tp9jx2w5xmRhSaPrYSvUOoWJLgBK25gjF2mKOgOPi54=;
        b=Owg2eEwlTmOaKxPhdceO0chcKVxQI8s2dYEbN5AHCB3v/z+Q8J0KuyTkYWBRE6OyO5
         AJIeo9EqroffpK8rqkV1pO4BIM6OSlHbbAgALBCRwl+V0v87H5IZL9QV5Bqw31XfWTJ6
         1j+Thn1qhb4sOZMxIbEl4zqyPGp8lWEdN9sgsmiHulszfBT8a3MefuHjyPk+DIIaxZam
         GumGqvx0Q3tCbwQR71Ep0cwfsljP0L4AsU8Y1pDYu+5yfOOLqWa6matZDbz+4r1sxYm5
         AcLANEtZCswJt2hg6PsPz2kUSfQ4j945g56rJLjVOKzl5DEyNkjhvd2WCuOvZ0iG0x9U
         la7Q==
X-Gm-Message-State: AOAM530LdPEUxzquKn7iBQNabx8B828iF9mVXmm561EJhh/tlyLNUh9J
        2wyVOIuCW5EclLtvNhfW94s=
X-Google-Smtp-Source: ABdhPJyzSRLpFUewjxKCJfvWBNc5NBKG2onhv262G8514DtfjfAc9GL1weix3lF+BV3Rd2zvlanphw==
X-Received: by 2002:a05:622a:d5:: with SMTP id p21mr26153541qtw.44.1635893836763;
        Tue, 02 Nov 2021 15:57:16 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id v19sm351222qtk.6.2021.11.02.15.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 15:57:16 -0700 (PDT)
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
        linux-serial@vger.kernel.org,
        Jesse Taube <mr.bossman075@gmail.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 08/13] dt-bindings: serial: fsl-lpuart: add i.MXRT compatible
Date:   Tue,  2 Nov 2021 18:56:56 -0400
Message-Id: <20211102225701.98944-9-Mr.Bossman075@gmail.com>
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
Acked-by: Rob Herring <robh@kernel.org>
---
V1->V2:
* Add ack by Rob
---
 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index a90c971b4f1f..4b4340def2aa 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -21,6 +21,7 @@ properties:
           - fsl,ls1028a-lpuart
           - fsl,imx7ulp-lpuart
           - fsl,imx8qm-lpuart
+          - fsl,imxrt-lpuart
       - items:
           - const: fsl,imx8qxp-lpuart
           - const: fsl,imx7ulp-lpuart
-- 
2.33.1

