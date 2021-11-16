Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08D6645352A
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 16:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237755AbhKPPIn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 10:08:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237812AbhKPPHR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 10:07:17 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C62C061229;
        Tue, 16 Nov 2021 07:02:21 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id r11so25349183edd.9;
        Tue, 16 Nov 2021 07:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eESfjL+iaVjt21sHtGEVPwxEB8OqLbpv+keCGxcdIyU=;
        b=GBo/tWD7/VC+DrNkyc+CGG7YNagc8t/FoORpQFKPHdPt0IV9Gx9y/PiZNrnUmDm5DC
         UZf06nG/gksTBavr4RbBiaK2NIIK59KlsVpy2t8CtygTzkbOnYeKkmskFq74hRdJDPLJ
         +OyK04RpIBUFrRiywEIh3s0gISQspVWuNN+I9YLGbOJ7/n4MprXmsJbNK+tzAMigYc0M
         DPnw1/fyPEKpBX/4iJ6hfH38jqAV8DvZiov8hHt8Ey9Kij0VBSapj3CgPhyswAYM0+58
         q4nq5XxKRORgwMw4hkuqr5IMxU+Enm39ADFfTtBSD9efiwxOWpTvyNyZC112irpFSpRN
         Zj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=eESfjL+iaVjt21sHtGEVPwxEB8OqLbpv+keCGxcdIyU=;
        b=C9fhA7Ip4OIz3tMW6v0+9O2jI57U2np6FWSg7hh51APog8rUHglGhgTsHJFvS1FkSe
         fNzTlJTfVxO5RaZmFz/BTViDrMY5iGhOkHBwTmdnVxOiXY1B8cPg/YCQzgyB9nDFz2o0
         jaztUO9bVGSn0rS91XzVXHxbYxTwgGNvO5tPC/R21mx5Iyk8SFmHSqPimYlRgiIURgd6
         APOFt1p/nT6ZqcA7evPA0qV8MhUzmnv2gCAm2b3e73ovb/ePDsJhZQYhbTLyTKjH6GsO
         OcrB8HzkKL9TRnAC5bHNE1MN28XjhLHU4dj5adN7MvL+4ipEWcE3prr8slm79FR1rE4a
         Y6zw==
X-Gm-Message-State: AOAM533/R06LjdzZAkX4PbQqPmyN38rSMH5FLqAIQtP9XaP+9MmjYEJr
        cND1kA3RJY/e04z28y7MNJY=
X-Google-Smtp-Source: ABdhPJzbcNiVffclTcRpaBO52GwEoEn2jk4MljQAy87jtPBHusK3NacuiHaKOoX55v9hJnHjiyoKsw==
X-Received: by 2002:a17:907:3da6:: with SMTP id he38mr10456201ejc.151.1637074937635;
        Tue, 16 Nov 2021 07:02:17 -0800 (PST)
Received: from stitch.. ([2a02:aa7:4600:b4ae:a375:e7a0:9eaf:8d7b])
        by smtp.gmail.com with ESMTPSA id u16sm9414311edr.43.2021.11.16.07.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 07:02:17 -0800 (PST)
Sender: Emil Renner Berthing <emil.renner.berthing@gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
To:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc:     Emil Renner Berthing <kernel@esmil.dk>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 13/16] dt-bindings: serial: snps-dw-apb-uart: Add JH7100 uarts
Date:   Tue, 16 Nov 2021 16:01:16 +0100
Message-Id: <20211116150119.2171-14-kernel@esmil.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211116150119.2171-1-kernel@esmil.dk>
References: <20211116150119.2171-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add compatibles for the StarFive JH7100 uarts.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/serial/snps-dw-apb-uart.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index b49fda5e608f..12137fe80acf 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -40,6 +40,11 @@ properties:
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart
           - const: snps,dw-apb-uart
+      - items:
+          - enum:
+              - starfive,jh7100-hsuart
+              - starfive,jh7100-uart
+          - const: snps,dw-apb-uart
       - const: snps,dw-apb-uart
 
   reg:
-- 
2.33.1

