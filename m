Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8EB242A635
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 15:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237199AbhJLNoe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 09:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237220AbhJLNoU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 09:44:20 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C55C061772;
        Tue, 12 Oct 2021 06:42:16 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id p16so17250870lfa.2;
        Tue, 12 Oct 2021 06:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SP3ukIpWgejkYPr25X5V3f6f4cfAs1jYw+VX4Qabu68=;
        b=n4mn9H3yBZU5NxCyx9v/kHth3RsW3yoA9HUheYI4yoJqaPJXoYoA4HTi2/pEsQGzOc
         ZxQogFfcpgTjNLOYgGS+IivOBzsZ9aT9Gud8A1BQCGY7bXlFgSHesD0cMOys2oOm447o
         XVUwgUyzAuXMbc59pJTcPxS+JNI9qVBkoKHXLOsy5eY9h9IYTMh0Ia89R/mVNDsrPtAl
         I2zkaBpHnwa7o7lpJNVAQAutwnNRJYQLO+w2g21KGRBL6DU8JyfAAkrBS/ZnItJr7Na1
         GunByUhNHTU4TCknilLVcCI5FWO9ocI8ZWLlkACHhOdQoEhsPaE/UkWejuTOCSF/31f0
         6sag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=SP3ukIpWgejkYPr25X5V3f6f4cfAs1jYw+VX4Qabu68=;
        b=zhdGltR5xibw7YC3rcvDUVx8/cM9DBfjOFyxsaQXDiV44QSKn58iMVHvqFJj1Ddp+M
         aMx495glYR3oaYIru/ZyOgk6/JW6h/7AMKDRlR7rasezImHKzZBtRjAuGyP98wSLR/IU
         Zup1H76FDwDyQIdHG0NV/Oh52QeCtkL8eIaUy7VjqhqJD70JRMPuELTPksdzKizKDk6n
         WDNdf1MahXR2lUlWFegmLyhTOvpco0Nom1wHniGO4wkIXgnbNUVXKi0tR67Wpjx9acBM
         QvW2UCJDugtW/4YSb60tPgpTN4u65HoA36iDQ7biygHZxKFflcExYnnePpn3kHqsdLst
         gJ+g==
X-Gm-Message-State: AOAM530w2nmtbDlPhwWE2/7s5h2BHQY6d8UrO2BzJ6wsaVpZqpCLCxKE
        nswm6HT7kl2vlu1qa9uQExM=
X-Google-Smtp-Source: ABdhPJwoseP3cc4gsjA7m/LA316WUSr0lQbPRj7mGDZjFft6jEPQ3Zn36oOowhIU3P3nB/RI5aZWCQ==
X-Received: by 2002:a05:6512:260f:: with SMTP id bt15mr32895654lfb.134.1634046134691;
        Tue, 12 Oct 2021 06:42:14 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id k16sm1033761lfo.219.2021.10.12.06.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 06:42:14 -0700 (PDT)
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
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 13/16] dt-bindings: serial: snps-dw-apb-uart: Add JH7100 uarts
Date:   Tue, 12 Oct 2021 15:40:24 +0200
Message-Id: <20211012134027.684712-14-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012134027.684712-1-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add compatibles for the StarFive JH7100 uarts.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
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
2.33.0

