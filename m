Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFEBA7B2BBB
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 07:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232766AbjI2FmG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 01:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232786AbjI2Fl3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 01:41:29 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FF851B3
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 22:39:59 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9ad8a822508so1827984166b.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 22:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1695965998; x=1696570798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=up2XNokZoiA5TPtK9O+gQhlckgwCOolxXgSc1vLyaO8=;
        b=YknDKgl04XH/fGUl3cvgX27rH4ko0OA9ftaLD7CgqH6+DtQASHK/hWamd29DMk6O4u
         yP17ENutevN+8+7RAaJyzS1rvaNr5k/gZCM8g9+Rb4QA3qA2QHzewSIurB+++KbkDjvi
         iQLL3L6PyDmpmOIqpucAxPZ2+WrE7YNWtSymIcaAoHjhxDtVN8g+Ys2lN+dP8CGkENN+
         Faxcoyf21DvMFS/j9BJ97CZpSbRkLbYrJ9j6UZrVcJJFmkGtQOujh6eMTlO7b5v9VALm
         2xfrm1yZ4AhnQphANBOicIZQ9wXjXnFfXwe4oSQ8VukitbLtPTyoNvP5szo9Bt9w7itc
         MMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695965998; x=1696570798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=up2XNokZoiA5TPtK9O+gQhlckgwCOolxXgSc1vLyaO8=;
        b=DYH2Fx0GcAnpZYACGqh4QWtuksxJQHB0se6l7Hpf5oyIqIcWXH2ub3gROkF1ohxKKt
         GPHs3c972xd1A9CDmeCWs/pdLrog3ftSSTB7A2GOICeN4jtQPj69/UMbBnLTIU0TU4ut
         jk4C96180kE6QzUBjbW1oaQubvJgd5l8hxUOTSkg/sZw6zigdo93UuSBqzQIQ9Mgx1GD
         NWJmxZoFCLL6ACW8qZYMnoiisGPow7nzGtGqzt8a1TSjzo7VvDw6oZ+z0VkJtF7V1MV7
         pPcoNIcy5esvcHkxATTAXlGyFvmi+CFiL4T1O1Zy7TOiDnuH6B4Iz0Vf9je0kdOnFDgu
         zhLw==
X-Gm-Message-State: AOJu0YyrWL25+AX2VrudQ3jV6cpyJJB6Yi9ZkPMe4bqIDcQMBNkcHR2U
        oKMEZujFzN1MJE2mfgiPGhyd8g==
X-Google-Smtp-Source: AGHT+IHWGRdKt18vqmb08FW6Gqil2AJFzy4wYogTFWvh2EtAsEFK8s2z8hF1JCvsa15u5k7BOdpWVQ==
X-Received: by 2002:a17:906:cc1:b0:9a2:28dc:4166 with SMTP id l1-20020a1709060cc100b009a228dc4166mr2898785ejh.75.1695965997654;
        Thu, 28 Sep 2023 22:39:57 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id z19-20020a1709063ad300b009a1a653770bsm11971992ejd.87.2023.09.28.22.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 22:39:57 -0700 (PDT)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea@bp.renesas.com>
To:     geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        magnus.damm@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        quic_bjorande@quicinc.com, konrad.dybcio@linaro.org, arnd@arndb.de,
        neil.armstrong@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        biju.das.jz@bp.renesas.com
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 19/28] dt-bindings: pinctrl: renesas: set additionalProperties: false
Date:   Fri, 29 Sep 2023 08:39:06 +0300
Message-Id: <20230929053915.1530607-20-claudiu.beznea@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230929053915.1530607-1-claudiu.beznea@bp.renesas.com>
References: <20230929053915.1530607-1-claudiu.beznea@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Set additionalProperties: false.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- this patch is new in v2 and added as suggested by Rob

 .../devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index 4782f96feb7e..eb726770f571 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -106,8 +106,7 @@ additionalProperties:
         line-name: true
 
     - type: object
-      additionalProperties:
-        $ref: "#/additionalProperties/anyOf/0"
+      additionalProperties: false
 
 allOf:
   - $ref: pinctrl.yaml#
-- 
2.39.2

