Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA0243E2D93
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Aug 2021 17:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244380AbhHFPWS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Aug 2021 11:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244367AbhHFPWK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Aug 2021 11:22:10 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B157C06179B
        for <linux-gpio@vger.kernel.org>; Fri,  6 Aug 2021 08:21:54 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id c16so18655987lfc.2
        for <linux-gpio@vger.kernel.org>; Fri, 06 Aug 2021 08:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1EL13QEz0jQB5TyPm5EQVY1mhJsKtZswS+e8nPlFSmk=;
        b=xIdVeClSm5h+yaEEHwHmI3GqBB+wqqezAfScV34d1XkTvLZRrFAKkQkVA7iYInNuyd
         2uzs5o9wpyr4iuAX/aGNCTrc2UoJGgmY/wW0X+BhZltOB/Gw7k7tepcwk5u1zePvAl8r
         C6drAoqZMKRCRJdt4w614Rj1nI3mhYmV4XdwcINazOpL/cfkqrCs0vlXs/I9e0pxGryC
         f6+Ly3fv7wL8RwWoHVPFu2bw8vtAjzuUCirYn2OeupRGzFQW7JbMVIxF43GFjkWx8eUP
         Y4KNHl1+F01Yjqbj9O1ctIgrWG1RYpXEQUIaQG0NWLviKTXxXD/YMypIEj8024r9Go2U
         AzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1EL13QEz0jQB5TyPm5EQVY1mhJsKtZswS+e8nPlFSmk=;
        b=HBJ4MpL5duKbv1Pu3o8ppDBbXtAnVubavUEc1/gtZ+qe3KzhdCaLN41lcxE11CRKik
         y02l+Upo+Q5NEs2LGE+Q0UGS6CWTTv2hen/7qf1tbRBjZbwomtxiw77Ihdkk0V0AtjLA
         U87qs39tqbfFOfu3xoa11hsui0obX2s3plPQvG7tijyuHSo3MV3GgUR+a5bz1q5MK6DA
         XB2Yr8IM6R6ti2I1Qv7ydJ3O9GII6hmVm1MlQhd8oWySxDmVRq3roVKhYN7JkAo/nz9M
         6iZ81DmFydZJel7RRG/rZBBIR8BMtR4chF/Q4BZ3N75heEsSy9FC/GmEeq675s3eM6eR
         lGNQ==
X-Gm-Message-State: AOAM530Pxru9oB9GjAirWBEI5/rgaZsl3/b/EKkR8GJi2Uvj1x/35EKW
        HFkaWFOVZBEqb1sXVpHiK5Afgw==
X-Google-Smtp-Source: ABdhPJzrtuIMNwEbAEfRv2gXt1rLQY8sTcJq6ivzuavxVikoja9ulbZlZN0f+WV/0monIlJmcioKvg==
X-Received: by 2002:a19:6541:: with SMTP id c1mr7959645lfj.423.1628263312699;
        Fri, 06 Aug 2021 08:21:52 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id i8sm861500lfu.55.2021.08.06.08.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 08:21:52 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc:     Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH v2 3/8] dt-bindings: serial: samsung: Add Exynos850 doc
Date:   Fri,  6 Aug 2021 18:21:41 +0300
Message-Id: <20210806152146.16107-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210806152146.16107-1-semen.protsenko@linaro.org>
References: <20210806152146.16107-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add compatible string for Exynos850 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - None

 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index f064e5b76cf1..2940afb874b3 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -26,6 +26,7 @@ properties:
           - samsung,s3c6400-uart
           - samsung,s5pv210-uart
           - samsung,exynos4210-uart
+          - samsung,exynos850-uart
 
   reg:
     maxItems: 1
-- 
2.30.2

