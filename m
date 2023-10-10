Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 520797C449D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 00:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343944AbjJJWuD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 18:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234533AbjJJWtz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 18:49:55 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 145BAB6
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 15:49:52 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-32d81864e3fso427254f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 15:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696978190; x=1697582990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/2N9VEhdnqQrQEGyRgCM8Oc2C7+rGrmYFce8KXEeog=;
        b=mQG6Hrl2svn//Fh9BHCehWkSnfcO9drzRrmCY3TLZ0Czl966zNTPOTMz/ASKtpQM2U
         fOZm/3I2L3NVpOuDtdnwA2a+XFsJmb7vh58H/2njPPcsak97ZFU2FzPHO4y/20Atxf6k
         E+nCDdYXKOorZ7WB7axTYwedyx8etr271Rt20ddiyIg5K6l590C32rYLx5oB7SuSC9nw
         6mLngp4ea+ofjRb/ew9he2r8/41K20nVrusk7KwySiL5v7tkQwvQvQ0aa+oL+e3wk9r9
         jeOH2bXICaUgN/JW7xkJKlwoxIxQ7XXXKOPCk3ORSe0p3Z8UZJ/NQqKRNrcxUg8AwjE3
         qAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978190; x=1697582990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/2N9VEhdnqQrQEGyRgCM8Oc2C7+rGrmYFce8KXEeog=;
        b=Q+fW67BVN6Kmm72e0yDT1J1bz6fRaFVj2gESMQ7Tgo4WZmQKJ9cx7SeW2p6lbuGCQL
         aEw1Qpzb+JxHc5IBFeB0DZuzIQ7q/AWwjycN7g8FBaWEmWsyzO+hd/adkBaukwofRvo2
         bcbHEOEefCiSAAXVp2n0KZFVtmHEvoVyBkONHjS8C7fvrEM8/wbkaqRB2X5GxCNxVS5X
         uLdIXyCJKHGqSYj3LfWQoe1yXuVuS/Xl5CRR8+okntnvQSfTamBudlsFao/e9dptMvQt
         oxaqy7DmGOB5nj2qNRjuXp/EdI+gwCQTec2LaKBddk4vrWFjjSAVehqzJ8ITrkg2tbXf
         o9dw==
X-Gm-Message-State: AOJu0YyGYTYeTVIPL+KDstq9RSqBTlJ0g3sJPz47CbrrlXPpnfE3EWIS
        Z+Mx2DZoX6eKXg3kikClxY1cBQ==
X-Google-Smtp-Source: AGHT+IH1+og7p5DzPPNzbqtLXyKGZvyfOjkS230zHmB92OxNHH9j/4yprSuLLOFfyAZIXF/2zZl1mw==
X-Received: by 2002:adf:e383:0:b0:323:39d2:5803 with SMTP id e3-20020adfe383000000b0032339d25803mr16775641wrm.3.1696978190529;
        Tue, 10 Oct 2023 15:49:50 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id j13-20020adfe50d000000b003196b1bb528sm13689547wrm.64.2023.10.10.15.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:49:50 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v2 03/20] dt-bindings: soc: google: exynos-sysreg: add dedicated SYSREG compatibles to GS101
Date:   Tue, 10 Oct 2023 23:49:11 +0100
Message-ID: <20231010224928.2296997-4-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
In-Reply-To: <20231010224928.2296997-1-peter.griffin@linaro.org>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GS101 has three different SYSREG controllers, add dedicated
compatibles for them to the documentation.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 163e912e9cad..dbd12a97faad 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -30,6 +30,12 @@ properties:
               - samsung,exynos5433-fsys-sysreg
           - const: samsung,exynos5433-sysreg
           - const: syscon
+      - items:
+          - enum:
+              - google,gs101-peric0-sysreg
+              - google,gs101-peric1-sysreg
+              - google,gs101-apm-sysreg
+          - const: syscon
       - items:
           - enum:
               - samsung,exynos5433-sysreg
-- 
2.42.0.609.gbb76f46606-goog

