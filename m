Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D94BE4534EE
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 16:04:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237942AbhKPPHi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 10:07:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237855AbhKPPGt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 10:06:49 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85850C061210;
        Tue, 16 Nov 2021 07:01:49 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id b15so88862444edd.7;
        Tue, 16 Nov 2021 07:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JB6hpmX7hgdEksB90s0jcnSr+ju9+L9HjspXKT59qjU=;
        b=HE5ENt6vaiQfV4MNlDbaLaszGg3cLQ7pGZh6F6y7/YJ/u84MxEjir45qlyLH69uRsd
         28JPFOlEHaHzPVxRf+ViBuzn4l5/0PMefkaqtK/WELIJORG2O7e7eVagA1TB1qttH/H4
         G5JMSFLU+SYxN7pqFrYVK56L56jQZzPgWgTZdTp/omZCBftO1WGTxX7TKhrRuPchFCPo
         bXYZtk86HDldg9u+DrTx3IMgG5oUBoBr0dHf9P7ZGIc5wUNCvJUp+UwQJDQTbzBejxox
         bl10fnpqlykxFr+UVbQjiSjaFqIsLAk4MS4l25ExbgCt5oRDBnwBJwooHD51HJ2WHtGa
         MxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=JB6hpmX7hgdEksB90s0jcnSr+ju9+L9HjspXKT59qjU=;
        b=C4QB2VQqk2rpRzCwFXhqkjdcv5n6WnM8SybaN7ZqInqf1ROSr2BsgMdlGtT4aOXw8b
         j/HN9+DgNBZhrrm0+RxX3l7oECYkMXc5GGWUm/IVqktI3MihruCzWrC2l9vOxnitIR2h
         574bw8/WB57wls0qeap41xADA/2legjWuaXW7ofNWWd1l6RwesmtuB0U9Bb+P06UNF93
         0FyfUmFCPtYaqVhiVzP6cVsuYfZS2jN/X7Pery0ghWwSvfq5ly7lxhNQFil3MaEzWFde
         XDdSvK+JSC4Ykc4FyVACMI952PXaj0laRXh7VWT+5B6SLVoCjlS4ghIqItI0jP1Od3M/
         oOLg==
X-Gm-Message-State: AOAM533wxAbqoU3VDDOMOjKV5Tfj/e6tCvSltTXwTxU0n/kHolewkMOa
        eoBdbakMxi6Xi0OxAGbsc6s=
X-Google-Smtp-Source: ABdhPJx9yGvuPxfqElzl/dVvZFeP+txYs/F8wxyuWuezuC7HWxLcpZVsOpao0yAXkkShuW3qXAIveA==
X-Received: by 2002:a05:6402:350a:: with SMTP id b10mr11228785edd.184.1637074905967;
        Tue, 16 Nov 2021 07:01:45 -0800 (PST)
Received: from stitch.. ([2a02:aa7:4600:b4ae:a375:e7a0:9eaf:8d7b])
        by smtp.gmail.com with ESMTPSA id u16sm9414311edr.43.2021.11.16.07.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 07:01:45 -0800 (PST)
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
Subject: [PATCH v4 03/16] dt-bindings: interrupt-controller: Add StarFive JH7100 plic
Date:   Tue, 16 Nov 2021 16:01:06 +0100
Message-Id: <20211116150119.2171-4-kernel@esmil.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211116150119.2171-1-kernel@esmil.dk>
References: <20211116150119.2171-1-kernel@esmil.dk>
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

