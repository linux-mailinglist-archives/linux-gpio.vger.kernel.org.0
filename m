Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 307534433CF
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 17:50:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235138AbhKBQwX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 12:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235012AbhKBQvw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 12:51:52 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 267D3C06120F;
        Tue,  2 Nov 2021 09:11:52 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id f8so56340750edy.4;
        Tue, 02 Nov 2021 09:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JB6hpmX7hgdEksB90s0jcnSr+ju9+L9HjspXKT59qjU=;
        b=fVb101zrOEdS1jAihWIfIyG+HQ66faBfoTEPEjsImMCJlaDk99daHWDiRdMv9qAm6U
         GM9H/u2t1uEvPHe30jLQEM+ouGBlHQe+ZhRo1x05dUPrBFSf8SKhs3rxpXbbxcQ+hLAp
         etv+xJQmu+twe90NWHLP3z3ci25uyuukUISDFEK6i2lfbVbpaopLQYGT5SSq/BvwlQbj
         EZcCo5CLWZIg+UbzGNT9ufQwPkQux5wMhqJsSJQOX7IxtVW69drDJMh4b77eacE469jg
         t9hRSVozQqpwWK2svSUwTunE16HCRfntTzc3PMSOsRLxVQFt0VJfX0xnWdeHbmoIQU7v
         AFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=JB6hpmX7hgdEksB90s0jcnSr+ju9+L9HjspXKT59qjU=;
        b=Cuwlg+BI3SRlfd9wtfhWm3YznVd0wJjMI4y4LSMxKwTDQW340ucit5+U2acqhkiVkS
         1KdnOnjcnwOgz3YEA4eST4QL7PA7TBU3uTx7fPsArdpjmFW87jt0K9jF2KuWdEV3kk9F
         cmFxCR7dPB1fxgdNpWYM1rZxS4nLejNSCR86gvA61HYv6VchUzIBHPWOiR6i2CzL9Ozs
         VqH/Wa61JiHyq+0cILdI5Q6rS4sp7AMnb5+2jYaDm+xMeBOb2tFfxTKTE5gvROraS70M
         D6dzPbmn65t3ntp9GyJWr3PDH80fbxBwtLPOAQyeOS6Jl91ClV/AUGVTszC9L9xBDuj1
         zzlg==
X-Gm-Message-State: AOAM530jbnzxfngcEvQ7CuH2GlgJ4tu8826+sJzxWsvCNz7ynKlLTB4c
        aEDZo5mTi4KFF8hHngkez1c=
X-Google-Smtp-Source: ABdhPJxfmR6VqzkUY6gH2B1BqxHGO4w5PXJoyND0TScH00vVuowx+rxq+rysIijJ0FZBUXcxhZe0Aw==
X-Received: by 2002:a50:fa99:: with SMTP id w25mr48882966edr.324.1635869510676;
        Tue, 02 Nov 2021 09:11:50 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id c7sm8451374ejd.91.2021.11.02.09.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 09:11:50 -0700 (PDT)
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
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 03/16] dt-bindings: interrupt-controller: Add StarFive JH7100 plic
Date:   Tue,  2 Nov 2021 17:11:12 +0100
Message-Id: <20211102161125.1144023-4-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102161125.1144023-1-kernel@esmil.dk>
References: <20211102161125.1144023-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add compatible string for StarFive JH7100 plic.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 08d5a57ce00f..28b6b17fe4b2 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -45,6 +45,7 @@ properties:
     items:
       - enum:
           - sifive,fu540-c000-plic
+          - starfive,jh7100-plic
           - canaan,k210-plic
       - const: sifive,plic-1.0.0
 
-- 
2.33.1

