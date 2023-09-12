Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 593B979C4F4
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 06:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbjILEw2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 00:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjILEwY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 00:52:24 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99969E6F
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 21:52:20 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-31c5c06e8bbso5229750f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 21:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1694494339; x=1695099139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70blZEKYbPkUhjmz5mQWqO3PukYEZHU7HfQH/TSApUo=;
        b=kqfJUrg1n+l53/ypRls1jEYBEQS1yM5qC72Ce83Pw3OSGQAkUGD1/8DxeiKx6pKL/O
         75RwVZ/Cjwgs4HQ29MeiI6n4d/Uf4TNyT9rjxyNDXvIUNLxIqi+hBQF/bKYlEm2/fI1B
         +NhCoUqXP4M1WfChUkI0cXzUF5x/R+IK4VYTJTi7s+N/5aBee5ULv/ySPuOaoRd5u3DB
         RgL15fkwQRAfR2VdN2rR4nWFzjT8bILkCynNm4MVv3C4/JiWV/nqdjm3sx1IJHWaCQg/
         8eINlhMZo/fDx1fPojLruX7ffY9YNj87/N1wKYRNmfTvTXc9N5s3pDXGcjQF1IbjTGTa
         od4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694494339; x=1695099139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70blZEKYbPkUhjmz5mQWqO3PukYEZHU7HfQH/TSApUo=;
        b=JIwvyeCEnVgN8jj3LwfiFHWTd9uHQQ88WeB8V0xJgbqDPmkLMGLKjV7B+3ZBSJmo4R
         iSPz4A2GcUc4dJ5xjEfi1Tuw+2mKX/b7SWCVZPSDwB4YQ8LwzxalDO8+gv3F9mQbUegS
         49FtasKZQ6zHwx77HgdEeVEX2GrzOz/c7bNauViEMiwyRaYD1ibMGYDc9bL5Ip2/MBpP
         hGXyjxkbyhq9A7zELxxKtH7PK/GfhCnwn1nUGvQuwm9okH0+Ocuuk8hFC5/b2iaBHl7A
         3quKiL6HrpQJXkJShevFMUHgqL392KeiSRiIot9ir3PnpPqoKKObLn8umFAwEcViw/YY
         Yb/A==
X-Gm-Message-State: AOJu0YxXsV9+mlnivvGbYz8i9KPeOM1lEyTmwsu5HsH51V32ZzQJ8xOd
        7+Tepyd1QOFyOuhvmES8N7Qn+Q==
X-Google-Smtp-Source: AGHT+IHq4NsElZT5XJXLX6atbe5JezA+r31z/sk8n97Du/yTxrrOfNS/FcxRiNTwh32QYFqy3lq2Eg==
X-Received: by 2002:a05:6000:ca:b0:319:8a21:6f9a with SMTP id q10-20020a05600000ca00b003198a216f9amr8919668wrx.63.1694494338959;
        Mon, 11 Sep 2023 21:52:18 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id f21-20020a05640214d500b0051e22660835sm5422415edx.46.2023.09.11.21.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 21:52:18 -0700 (PDT)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To:     geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, ulf.hansson@linaro.org,
        linus.walleij@linaro.org, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, magnus.damm@gmail.com,
        catalin.marinas@arm.com, will@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        biju.das.jz@bp.renesas.com, quic_bjorande@quicinc.com,
        arnd@arndb.de, konrad.dybcio@linaro.org, neil.armstrong@linaro.org,
        nfraprado@collabora.com, rafal@milecki.pl,
        wsa+renesas@sang-engineering.com
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 01/37] dt-bindings: serial: renesas,scif: document r9a08g045 support
Date:   Tue, 12 Sep 2023 07:51:21 +0300
Message-Id: <20230912045157.177966-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230912045157.177966-1-claudiu.beznea.uj@bp.renesas.com>
References: <20230912045157.177966-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document support for the Serial Communication Interface with FIFO (SCIF)
available in the Renesas RZ/G3S (R9A08G045) SoC. SCIF interface in
Renesas RZ/G3S is similar to the one available in RZ/G2L.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 Documentation/devicetree/bindings/serial/renesas,scif.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
index 99030fc18c45..4610a5bd580c 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
@@ -79,6 +79,7 @@ properties:
           - enum:
               - renesas,scif-r9a07g043      # RZ/G2UL and RZ/Five
               - renesas,scif-r9a07g054      # RZ/V2L
+              - renesas,scif-r9a08g045      # RZ/G3S
           - const: renesas,scif-r9a07g044   # RZ/G2{L,LC} fallback
 
   reg:
-- 
2.39.2

