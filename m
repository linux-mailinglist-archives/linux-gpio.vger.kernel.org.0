Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3423143695A
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Oct 2021 19:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232261AbhJURo5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Oct 2021 13:44:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231873AbhJURox (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Oct 2021 13:44:53 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 567EEC0613B9;
        Thu, 21 Oct 2021 10:42:37 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id a25so343582edx.8;
        Thu, 21 Oct 2021 10:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MCca8WmqiZmvjsKFOBNufzAInvNjctDyKcXO2F2kBQQ=;
        b=TQjF/z4gJgAJiNH32UrxrXDgHZj7FpBafMT7G/89Q2si+DDxOMrC9ZRsg0NI2AH3t+
         tXL/1EYmV8KJazCpVz/3fhhUHNsfKssBIikEmM17eQ8UTMaL5avj3AU/vpILUmZplkMe
         HwpIoKu1D9SdUWusZndSGEvNvsnJC9yD4RHm/an/ibdRUoJa/HtdH78l9VYlhNuSTczC
         cCJecHazUnDqsbZY93LGpauBnBob6eVGtErw6BbkIHsVYNq1qL8ARBUVYl2DjUjHl73K
         FvoWmUFtnPs9x0KS/j0TgJ/AbgpBqJhy4czZ0eWV07dP+b1pIyrFdC22Aas8tgyCnrnb
         PTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=MCca8WmqiZmvjsKFOBNufzAInvNjctDyKcXO2F2kBQQ=;
        b=rXHrSgYxaUQMf1zmiDdvmV7HGZkX4e87TUVekDNcQWsDiccEE4s+Kpi9+Kv0628gMn
         rm7AbzOQwu7h3u56weZscrNIqf5ZMOpiPGBendiN4U6vayv+rOyAC9bqVxPetUQuTWpy
         Ar42YUk1ykB7A0H+5+RarvdMg7gcELchoGj1KlBHvkMnb7wVQyunPPYMwgR3puWEQyG1
         +3pYAvccKVnhHtcra65Jz2FhFqm3Dm0VQmQy1yj+QhGQUX5yvTzyWmry4El2jrC0N8W3
         5uKLeCrjO5uULkpnnOjrdktLfncOp19LFSZjLQz9jV0hpRsJJMy6/OOoRm6OmaEy1Ycx
         xm/w==
X-Gm-Message-State: AOAM531D2MEHcEm5+lenU8p+c61oiaYoC8Wnu87LKoYKIH9YPTrIrc2T
        obKO5hSC5sK/IGXGU5FTnE29XCrSVcpqzg==
X-Google-Smtp-Source: ABdhPJzJYngSIkBuImIS3HQujkU2qyzg7pzE2cfapYrdsUmfEGCaOcEXh1aq6FzaCLH/YGvTArPTCg==
X-Received: by 2002:a05:6402:3554:: with SMTP id f20mr9652573edd.210.1634838156013;
        Thu, 21 Oct 2021 10:42:36 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id h7sm3144847edt.37.2021.10.21.10.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 10:42:35 -0700 (PDT)
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
Subject: [PATCH v2 03/16] dt-bindings: interrupt-controller: Add StarFive JH7100 plic
Date:   Thu, 21 Oct 2021 19:42:10 +0200
Message-Id: <20211021174223.43310-4-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211021174223.43310-1-kernel@esmil.dk>
References: <20211021174223.43310-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add compatible string for StarFive JH7100 plic.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
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

