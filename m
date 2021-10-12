Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC1242A602
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 15:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237076AbhJLNnw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 09:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237022AbhJLNnt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 09:43:49 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D02C061745;
        Tue, 12 Oct 2021 06:41:47 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id j21so70336690lfe.0;
        Tue, 12 Oct 2021 06:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nYnj837QB7gRmzPOTymQ8FnnAOwmMUTYd52xsFO2G8E=;
        b=mzLxDCOM+Kg3hMTCGRfq1Vvfqxnv2JIJfuJpmQKinS03at8nnbmz4UXj5XABkHF9a9
         TN3+jXQjxyarcf8XyWZJUTIDQn1nP31sZ7OfRSJplLaM2Ka50LtAaDQGVORZthrnKUNt
         jYuTvoAFa/wsBMiMnzoJrcrq4Z16Al040Sqsx31szClrRUGb7isdhm2gwO34D9HnvmyS
         o3sJckzgLsD6o1CMbuxOWeXB/mtAHqc09ykFHfJLGiRCZnBT7BVo55J54UJzq4z/9QO2
         Uk7a/tyhLXgmk+K80Lv9BwYfX227eC+F7cdgukCPfy2coNSas62BR4qrpbQu09TtBMFf
         NQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=nYnj837QB7gRmzPOTymQ8FnnAOwmMUTYd52xsFO2G8E=;
        b=5cT35ydM6NQFdxV1v9o0CtLRqdytDYoZwN6dcJqocXr56+xo29Xo4Lpm/oVJSO8aZj
         krjTJTvXHA+yNlmxj6b4wJXJYj+4dp9RB3pDfSuPomD2SgZbtwnmfzbrEVfXH+6xy6hb
         XpZjXgWASNv6a2XLGVnSMAXPXTkt/dzpJTl/VubS8lZwKWmzB4qIa3tlRdyySSgMcjtx
         9Iul9y1kNWBwfvfSBfpSpeaEHFIcBc8HFmqCrfRWM6jJX5vrY0Q/8nPxPA9xgkj5cjVq
         D3fbg9fxuZyGUJxhY5KGWvPsXwyW83gvs3JZbx8VB/ebTgfjbih+ZTCyoVhEjzjG26fn
         CI2g==
X-Gm-Message-State: AOAM532SwTLtlEz02ViTKy5Fcmf92U9VFEjm8d/udA4BvpCKckJ3HUQy
        UjcY75p1/TamXel8Nc0aLkg=
X-Google-Smtp-Source: ABdhPJw0Y+Is+pilioHQEW23A3vndAwFNww2YwMV+e5rNNquUVn/AFH1c9Wkphely2wuOYNJLh8ASA==
X-Received: by 2002:a05:6512:1090:: with SMTP id j16mr30855989lfg.434.1634046105632;
        Tue, 12 Oct 2021 06:41:45 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id k16sm1033761lfo.219.2021.10.12.06.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 06:41:45 -0700 (PDT)
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
Subject: [PATCH v1 03/16] dt-bindings: interrupt-controller: Add StarFive JH7100 plic
Date:   Tue, 12 Oct 2021 15:40:14 +0200
Message-Id: <20211012134027.684712-4-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012134027.684712-1-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add compatible string for StarFive JH7100 plic.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
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
2.33.0

