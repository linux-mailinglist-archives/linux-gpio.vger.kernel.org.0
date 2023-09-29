Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5ECA7B2BD2
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 07:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232893AbjI2Fm0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 01:42:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232919AbjI2Flq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 01:41:46 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2359FCDD
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 22:40:07 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9ae7383b7ecso64334266b.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 22:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1695966005; x=1696570805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xXiyKyVdmulgskvngsG0f4x+X8ooUvk8Z7/M7XiExk=;
        b=Eh0BMORPMv6+dxmW4W4x7kbsmtI5Ug63fZ4Uc3ntgapa0nXoKp/FXcTWvgVJa8x2mM
         oG4hEdVXqoLSrrarBROBQUjwV9653V94/sw3Z6hJL5WZlA/ApJD0UhEqq0aPxa9Zyl5a
         Bopyn2jocnZuBMBSF68+noJPp8FTgkLxEJF72mPpDBlPJpWLH0bLoZaYoD7+5FOSt0sf
         vBqOY2f/DYhrtC9OELIehG4hUyJLfW38X0iMhoVMO61rgkm4093XZ3aUymiUQjvs9b5r
         1uo9y2MZLD2jF1mMaP/rJoyuckHjyM2p3NUoc6dvZqds7W4/4JB+I3v0YxEyRkqCiS8t
         WK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695966005; x=1696570805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xXiyKyVdmulgskvngsG0f4x+X8ooUvk8Z7/M7XiExk=;
        b=N74WWJGWRxhSJV25hGWabw39z7zErn8c8/zkySzgLY47m1P4tEfttKFBPY1HkE44xV
         X23ueeXvAuvVX+XQMNXxtAC2NRmoFbR/bc4JGBRF472ksfrc3q8dSDdbnFOaIPKSMK6G
         7l/LGF+wof3zCKtC6beHat97trCAW+30WOPFAAC7l5SnW8Y/HkWaNlO3o+Hbp7uhI5df
         vDx+FoW13Zbv8hyEO0jWJLGUviRAOAst5zJ5Yf4pYZPa3M7JUVRWCvD9mnOeDH6s3Hia
         wmGNkWTuoheyOIzRVhOHuCGJg3YrJ8M3U6OA3IP4YIrJtdde+XIr0YCU0h5b8XZqOL0M
         i3TQ==
X-Gm-Message-State: AOJu0YyNAPCQx4bMEYHiPrz9obKHKAxGz1FjrXmCem1VQgFy1z+1p3Qd
        dHirC83zAvKleHk0WC8zqxm7KA==
X-Google-Smtp-Source: AGHT+IHv5+jFxKBL09urolkWpi8BIIK1xJDAniaPk6CdWJwEYb4I49/rTk0G06L8rsb9HDHO7NWXPA==
X-Received: by 2002:a17:906:9e:b0:9a5:d710:dea5 with SMTP id 30-20020a170906009e00b009a5d710dea5mr2713502ejc.17.1695966005473;
        Thu, 28 Sep 2023 22:40:05 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id z19-20020a1709063ad300b009a1a653770bsm11971992ejd.87.2023.09.28.22.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 22:40:05 -0700 (PDT)
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
Subject: [PATCH v2 23/28] dt-bindings: arm: renesas: document RZ/G3S SMARC SoM
Date:   Fri, 29 Sep 2023 08:39:10 +0300
Message-Id: <20230929053915.1530607-24-claudiu.beznea@bp.renesas.com>
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

Document Renesas RZ/G3S SMARC SoM board which is based on RZ/G3S
(R9A08G045S33) SoC.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- this patch is new in v2 and added as suggested by Geert

 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 822faf081e84..31d0539bb168 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -480,6 +480,12 @@ properties:
               - renesas,r9a08g045s33 # PCIe support
           - const: renesas,r9a08g045
 
+      - description: RZ/G3S SMARC Module (SoM)
+        items:
+          - const: renesas,rzg3s-smarcm # RZ/G3S SMARC Module (SoM)
+          - const: renesas,r9a08g045s33 # PCIe support
+          - const: renesas,r9a08g045
+
 additionalProperties: true
 
 ...
-- 
2.39.2

