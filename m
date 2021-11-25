Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73A1345E239
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 22:18:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357362AbhKYVVB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 16:21:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350944AbhKYVTA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 16:19:00 -0500
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D59DC0613FB;
        Thu, 25 Nov 2021 13:15:01 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id g28so12911225qkk.9;
        Thu, 25 Nov 2021 13:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CRiRkKzr1AeW/lMR7VbQ1x0Ahhyksx/jfiQOUrZiHcs=;
        b=qkaBA1VdJww7Bb6PRGpFUQah6QHBqMQrDToN91347S9MFKqRlnZqcRh1sU1xL+CtBO
         0rcUSgZy7m7eYKF82IFoEwthaYUmhcPMN9rD4mE/xcKJzKDQkre33p3sng703EZppJYK
         DHO8rPyplp+aLVwoFVRZqPpKyYVKxDr5IU7Vr2QbGEdOYW1R3hrK67cE1qcXdImBJJj0
         5gh/RoGqUqXyqxAX0zwHN5JgJ5zuCDv69ficfUtlxnv+2TWWF4L6tDf1kGmqviCV++ze
         WdJR89fk8sP3skxrYxCL95IAlF3HktnvTWDMRioJ6MBkXmOb9wh9nCA5mtKGK1l93RJg
         59/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CRiRkKzr1AeW/lMR7VbQ1x0Ahhyksx/jfiQOUrZiHcs=;
        b=tl8+ypz/0TaWWZ/ASgZq1rMVnwrrMjiq/9XfeXLnFGv0Bj9Urb4lls/l9TY/fLJPzG
         DUjktxsQOPWGDy52gutq+CPyrCJd+dBzjTsZlCwGMZQDD0C8LNGVpiglJ2gEg8H4oFkj
         h7UY/DNyYOHYje3Rz5DhlIQ7hsXZWKY8AMxekofWxYV5ioC0/J6eH0rxoNKnIuzWgXp2
         4ZGPyK6LaC4L+VAu6je+bpaHWFJkZ6W8FR9FgVy+iv5ZZAMaD4+VlUpFVAZN4rmUz1w1
         zNGQ09FkX4x2f6dmeB754/3UEu0WHT5DPPpphDyVa4Ml+crZilRzKbOlTCdpnQayR7JC
         buBg==
X-Gm-Message-State: AOAM5321DR+bbkfWptZLGGttvyJ7KhRQqzEDMExnz06+ey33QhH2HXgC
        pbyhoj7KyNVCJVIAPG1WQqA=
X-Google-Smtp-Source: ABdhPJz7pxrwTvbocRSYFRZ8ihiAIdmpmQfJTGwXf29/xyKqDKF3VHZY830ofxr4lDFdFeX5LVS8cA==
X-Received: by 2002:a05:620a:27d0:: with SMTP id i16mr18213069qkp.440.1637874900715;
        Thu, 25 Nov 2021 13:15:00 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id j22sm2068175qko.68.2021.11.25.13.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 13:14:59 -0800 (PST)
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
Subject: [PATCH v3 08/13] dt-bindings: serial: fsl-lpuart: add i.MXRT compatible
Date:   Thu, 25 Nov 2021 16:14:38 -0500
Message-Id: <20211125211443.1150135-9-Mr.Bossman075@gmail.com>
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
 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index a90c971b4f1f..c37085804c5c 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -21,6 +21,7 @@ properties:
           - fsl,ls1028a-lpuart
           - fsl,imx7ulp-lpuart
           - fsl,imx8qm-lpuart
+          - fsl,imxrt1050-lpuart
       - items:
           - const: fsl,imx8qxp-lpuart
           - const: fsl,imx7ulp-lpuart
-- 
2.34.0

