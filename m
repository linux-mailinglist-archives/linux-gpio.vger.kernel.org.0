Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A286179C505
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 06:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbjILEw3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 00:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjILEw2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 00:52:28 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82550E72
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 21:52:23 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-502153ae36cso8302692e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 21:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1694494341; x=1695099141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w90FUtPMI0czzU7H17II7VSdTXdjnYx+N94QP72v1PQ=;
        b=dKVEIer5m8Q99AOMcFYgITometDGlilno5OUcCA4SYvXn4/ib4VgjN3iceE1MG5PcN
         5QpFvKndsYgdrAZv5wzCj0aGx8uF6rz0QTh+C2BYhX/DzWzUWRQfW1BUPDbvQUC4V1Sw
         MNgfi80Ne+I1oOkerKvIeHuXM8pU7DREbYgGyVbylC2hnnH2RlPlaWvB2nvCpu6XLtpb
         FekDRtUzSOxpkok+rVJzM7RFs4AI3Z5TXexjk4b7h1ZbwVapnmpa+6yZ3f1f3ksZd69c
         mF2wWTT/qCd8ELJYdg1qZvvUKY/5Cw0W7xFkQ055mEomGhVCp1Y1BRj6QEwDuN9oJ49w
         ah7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694494341; x=1695099141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w90FUtPMI0czzU7H17II7VSdTXdjnYx+N94QP72v1PQ=;
        b=fR5oGmqd4NFIWj6+Pq744lxeHZXv4L4XxBr2Bio+GvX7ToRIwQcJYGVUJMnD3r5C8Y
         GXWwgmBcXtWjlg1TTyyIUS+pED323ViRcB06i2KWFip6NBuUM0fD+0PSj10q/AKRagUz
         RhTXHK0zgNEi0nmyuJFJVRZs69WdrDIRB6sOj7Uz3urAvjiG4r7pBKubIuVnquaq3Jru
         bc8qGw5HL4duV6gEbm5pl7n3jh4BnmdEOHKw+XoNQpGbb1pZ9EpjU5brQIhuyM4vOQxz
         INQSOcr4K6fzuKkueGY77S7BkUbsRiVPhzsoBgFfKZze7Qk00TES6aw1VjO9FPvXgmnk
         oAcg==
X-Gm-Message-State: AOJu0Yz41KQSskLyU8GytGGhFFjvca6z8ODXSnT4+UgkGGWZOgnX5oFv
        5a5/rz5cmpqQ4d8pyS3t4tNrlA==
X-Google-Smtp-Source: AGHT+IELmzsWU1otNTyeKxCyz+acJywZL+qAyX/1Qem3vil+a9S8qIts3JL61DCTWjnZD5Ll+knGnA==
X-Received: by 2002:a05:6512:3713:b0:4f9:556b:93c2 with SMTP id z19-20020a056512371300b004f9556b93c2mr8048220lfr.1.1694494341080;
        Mon, 11 Sep 2023 21:52:21 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id f21-20020a05640214d500b0051e22660835sm5422415edx.46.2023.09.11.21.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 21:52:20 -0700 (PDT)
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
Subject: [PATCH 02/37] dt-bindings: soc: renesas: document Renesas RZ/G3S SoC variants
Date:   Tue, 12 Sep 2023 07:51:22 +0300
Message-Id: <20230912045157.177966-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230912045157.177966-1-claudiu.beznea.uj@bp.renesas.com>
References: <20230912045157.177966-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document RZ/G3S (R9A08G045) SoC variants.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 53b95f348f8e..822faf081e84 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -474,6 +474,12 @@ properties:
               - renesas,rzv2mevk2   # RZ/V2M Eval Board v2.0
           - const: renesas,r9a09g011
 
+      - description: RZ/G3S (R9A08G045)
+        items:
+          - enum:
+              - renesas,r9a08g045s33 # PCIe support
+          - const: renesas,r9a08g045
+
 additionalProperties: true
 
 ...
-- 
2.39.2

