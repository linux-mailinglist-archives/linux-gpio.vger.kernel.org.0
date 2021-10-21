Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2CB243697E
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Oct 2021 19:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232294AbhJURqR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Oct 2021 13:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232539AbhJURp2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Oct 2021 13:45:28 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 223B0C06122E;
        Thu, 21 Oct 2021 10:42:51 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id r4so148846edi.5;
        Thu, 21 Oct 2021 10:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CjoKkwUCJK3HIw5uHUmZ4CoHPrFG820t9YmJMstPH0E=;
        b=O5f3HwOjkQ4+tB3xOrnbF1ENNuT1PacJnXp2w3ojguDJsknTzHV9rEUb4qXA4Ptl47
         GqPq4xeOJs5SBPRaFMA2pu0zmXGnnxb6X1jDlzfrxJoQrFYueuoBR9rbXlRmYSKOkIxt
         hRpyaRhiOnZSEnbkhKwPGWvDhQYWRF57zFZ0tXeAYjhhrs0wwIpHVUm+4ILeoBzlv95H
         D/4j+k5Ykebn8T7qUvTR5yCyPRq+qceNq37YSUYqChv4O5pCN045UfvmFIDMFFpKuHMz
         Hs1PrlKW2BAUoyDHKSCUJW9F98gNYoQPeOtYlhRPzTJLSq2s4ZvfpyRktPcgBuCSJ8/N
         zt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=CjoKkwUCJK3HIw5uHUmZ4CoHPrFG820t9YmJMstPH0E=;
        b=1XlH9CMsnZmtTP4MNT/lHRzqwXjx2xDoXCW7Bbyf/f/QBO9TlpxsTiJugefAvfQprr
         EHtAqGi6V599WzieImMbht2gzv8SsEIFizAUbzkPm/I+ZGeRM6tQ8u14ibTPQ7v1qky1
         K0vpe4ip4tVQIricBzBspcg7GqM6xziReqSOlapYOrWvkah/tuXPcZ08znI0Y9UvsEpD
         dk3ICHphhL7J0ojPpjWJE9A+bNV8TQHPiP4jRHyyyaqbsazMMRjitZbwYD21HW8xU6MM
         pGM7Rrz4Q01DfLsGIB33Ik70P09CWQRDW28GlmctltJ+51zNpjUp6B6z4JzYMijJobvT
         tYoA==
X-Gm-Message-State: AOAM533VrruI9VwAMNW3wYvWLqpJux/CULQUat7B1oo3+6AT9cJstckz
        7Pq0P2FHGVIFbK41JyqTc6E=
X-Google-Smtp-Source: ABdhPJwDV3DSHvGqkiveCixNp0SkGI0VrJyje9fMw5jEXhibMe23T9hVaEq64JHE1rPBxiwiiy3dBw==
X-Received: by 2002:a17:907:d8d:: with SMTP id go13mr8983097ejc.556.1634838169801;
        Thu, 21 Oct 2021 10:42:49 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id h7sm3144847edt.37.2021.10.21.10.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 10:42:49 -0700 (PDT)
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
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/16] dt-bindings: serial: snps-dw-apb-uart: Add JH7100 uarts
Date:   Thu, 21 Oct 2021 19:42:20 +0200
Message-Id: <20211021174223.43310-14-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211021174223.43310-1-kernel@esmil.dk>
References: <20211021174223.43310-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add compatibles for the StarFive JH7100 uarts.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
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

