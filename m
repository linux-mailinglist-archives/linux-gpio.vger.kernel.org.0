Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC687C5BDB
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 20:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235212AbjJKStn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 14:49:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233104AbjJKSt2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 14:49:28 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32267101
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 11:49:24 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-313e742a787so59320f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 11:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050162; x=1697654962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgJ/7naBRQKhRElToskQM4otc1CmC67cgJuQduNWUps=;
        b=HqWmYC1avMOyVGAOb4vEY3ObZYrmdm7yB7fU7FnWSOdmVyg9dxjjiMRoaIylNZy6g9
         R660hdz9bNEzbmUs81PuP9pSE/X+Z7IQks3VKkVOLSFz96+HvV7Iqdh/6R4OuzvF+++b
         E5On0joeeHymbTY64MPVRPf5Wc70i3vIgWMtLHpO2qOinwRNCGbKZpV2Khht81Z69gOX
         dxlV1GAeryvhRdSZdfrnGGkq3QT6gRZtX7hyk66/SkEhbG8uexwpHL/5PNqaDadSVsw5
         HjYU7QQJ4zJuXRtR7dgsJVEkL+wilvIws1/bE4x4+eMlYxfqN1esMddpORsry+5G0lVJ
         Dnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050162; x=1697654962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgJ/7naBRQKhRElToskQM4otc1CmC67cgJuQduNWUps=;
        b=VLPnFx82Y8v2ebUCwp9MXnhxbVrjb7yA7SxFh38aoN+vBADhDYsU/Mmn5mZDQstj2+
         2bG3BpO6KYBlpLXPbo7BXeGT80lFCyxbJV7zGsMe7mq+FHdipAWYQOm11vavKnTFI6bW
         QC0tWmTQcT4CZrgu5Ab5fsF15VgXRea9SBNv/t634Vz2Jjt5ZJ6yGM0WwGIE22mgh3XV
         /aoP9WgWqg2qQKE9mOfhykvHdbkwO28rUVp3IPoLWFz1t+ex1Kz9lPiMU4Tijd7hDoYI
         /2LJ6emEe/BXQ73NOnrCLRYDNnejX0zNNs1aUw8odbP/v1BESalkwfSEsrH6oAcLDBiV
         g+ZA==
X-Gm-Message-State: AOJu0YxYR4wlZqFmmlMiBNbqWCPxvKJ0CTdR1yOR89g+if8csK3LZru5
        h56aEzBk5SHiKAuu3aBCSMNXtw==
X-Google-Smtp-Source: AGHT+IGXIncbrSVnXFsw31+dPbUFZsuW5LP+KcoSDBk5dbYHKJ5XXEJEcavVBGvEpxx1gudGoyEOoA==
X-Received: by 2002:a5d:4449:0:b0:323:31a6:c1db with SMTP id x9-20020a5d4449000000b0032331a6c1dbmr16126566wrr.21.1697050162608;
        Wed, 11 Oct 2023 11:49:22 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:22 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v3 08/20] dt-bindings: serial: samsung: Add google-gs101-uart compatible
Date:   Wed, 11 Oct 2023 19:48:11 +0100
Message-ID: <20231011184823.443959-9-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add dedicated google-gs101-uart compatible to the dt-schema for
representing uart of the Google Tensor gs101 SoC.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index 8bd88d5cbb11..6e807b1b4d8c 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -24,6 +24,7 @@ properties:
       - enum:
           - apple,s5l-uart
           - axis,artpec8-uart
+          - google,gs101-uart
           - samsung,s3c2410-uart
           - samsung,s3c2412-uart
           - samsung,s3c2440-uart
-- 
2.42.0.655.g421f12c284-goog

