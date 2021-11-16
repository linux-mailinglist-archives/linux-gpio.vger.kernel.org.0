Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943B94534E8
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 16:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237924AbhKPPHe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 10:07:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237842AbhKPPGt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 10:06:49 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D01DAC06120E;
        Tue, 16 Nov 2021 07:01:44 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id e3so52785380edu.4;
        Tue, 16 Nov 2021 07:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CMB5icMsNI9B+HlHvOZ/rsWpb2j9DPNZlwQY5zjCx08=;
        b=n9SeuxOXS3gI4AQNwEJV1oIlLn5uP2F8o0UII9zWz5LDEqfCBTVOn5m70Mjt/FVI59
         NlUSesXzufLGX5fWoa+TgTya1q+4LjU6VPDpsAw0EnjHO+T//9b7jFAAy/R2M44bvdSM
         /am+b4XYKGSR0upcBwY/+6B57gNRwBZLkSuwge5PfotKg2jCNV1Fn8NHXtSv1TiqE8+o
         Tpq5viWNUvtmDM38/cUZlU7JuC7brgk5Q8zU1SEgGlYEoPU6VeSGc0oHIwipiUo3FzhD
         VyYO+yu5eavWgkSgjERs/6VKy4B+1nQgq572MKwS+vwfS2dknwB9OssFIvAa40H2x8rT
         2WCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=CMB5icMsNI9B+HlHvOZ/rsWpb2j9DPNZlwQY5zjCx08=;
        b=K5vr0Ky+Nq5289AryDkS2aUrwAUD6/3KipmZZCoXGSvmK15dnw5LRg2ntusVvNOnq+
         DW75Vi/Fk81zJtWPh0IQVuvEaRMQSYFzQaSpe+bBsQfHy9xLHtfuP21gwRG2OJWu/lOq
         Hd2fgl2ZfDRb9IzKiHn7zS9jmHb+GFQanbvULc1BZ+FhrPXGbBO6OzxGRiAI1qhu5Vi5
         gUZB9HUHF1NaaueoLc3phtx+btcVwNTuJwMi4PBGxOkxnoWSog8yPjjiF7PpbQ9Wyt7e
         7sEpq8WPvbQv1bBYPKVdWnXc12TM+jf7nvSj6axFq6Xo2GjIf6btWQmEUw5DOlPzpgj0
         aCyw==
X-Gm-Message-State: AOAM531rCsgf1wg/YbMaDXJ2XDaMPqGfFIxX72unD958DrRykfRZ8pkt
        h5KRyukOIH+7L/vEVkWkch5lecuGsarEWw==
X-Google-Smtp-Source: ABdhPJw+EQ13uDQl3bfi5CHEZDvZZHxGJHUGTdHoXtISUwk6v3kE2Bnu1lG3gg+1Uy+IoWc3a0Y7dQ==
X-Received: by 2002:a17:907:a088:: with SMTP id hu8mr11082855ejc.234.1637074902328;
        Tue, 16 Nov 2021 07:01:42 -0800 (PST)
Received: from stitch.. ([2a02:aa7:4600:b4ae:a375:e7a0:9eaf:8d7b])
        by smtp.gmail.com with ESMTPSA id u16sm9414311edr.43.2021.11.16.07.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 07:01:41 -0800 (PST)
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
Subject: [PATCH v4 02/16] dt-bindings: timer: Add StarFive JH7100 clint
Date:   Tue, 16 Nov 2021 16:01:05 +0100
Message-Id: <20211116150119.2171-3-kernel@esmil.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211116150119.2171-1-kernel@esmil.dk>
References: <20211116150119.2171-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add compatible string for the StarFive JH7100 clint.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index a35952f48742..8d5f4687add9 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -25,6 +25,7 @@ properties:
     items:
       - enum:
           - sifive,fu540-c000-clint
+          - starfive,jh7100-clint
           - canaan,k210-clint
       - const: sifive,clint0
 
-- 
2.33.1

