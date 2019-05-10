Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26B2719996
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2019 10:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727213AbfEJIX5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 May 2019 04:23:57 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46115 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727234AbfEJIXa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 May 2019 04:23:30 -0400
Received: by mail-wr1-f67.google.com with SMTP id r7so6038520wrr.13
        for <linux-gpio@vger.kernel.org>; Fri, 10 May 2019 01:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iSJwm6tn+7I484rTSQE+9G4s/2gB2UbS4DNi3jkBUBM=;
        b=oAZbHTeixjMVCdjaa3zL+b9as4L3V9Jsf1rfkcKP96iCk/Tx02/ml4qRjW36JHqNZ2
         EwijpHHTg3GHz08FdsJOkr/zkLGviT48ErIRITFIIcLHz6XMTm2KjR8BKl4Q3Ve5vlV8
         AozZ8aZekFk5odWod7o0X6yewGKcB6urj/CKd6G+oKOqyqM9sTuS0tPT/tHMbxTSTs7l
         ETuVPARWgw+N36Dmtql7QOkKJeJXeSfWbptLomabmWCtnLv8w4fb1kB5mx4ykrBIxMjX
         jPY0Yx3rxGqqR/OygtCyrjvRTycD9WlNpjNe9f3l0xQR3m59uTvq0tQET528LcvPv62m
         AaSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iSJwm6tn+7I484rTSQE+9G4s/2gB2UbS4DNi3jkBUBM=;
        b=pNqxoBLsfxWkzEnSiwQbIJNOufHY0EfM0yIxBdsxmDF9ERD1HJuTU+4RDyIH5g5Bg6
         NWu+x59kDCsvo3c9YfMQbNcfn/TFzXRHfw40ND0Yrx3puNn6zcqJPKfc0HyKWl+HQ3UR
         JwSGAvDO/omqPRSmWcoAtG0ZJ1VhGkJCDDqCi2nyem7H+P5sjrssEgbKebHs9OSUNOnX
         36/HT5motu2vA1h286/x+V3h+mko2VEK/eElckABouiVthdLaZReFQ4MUm8EmVQ2pDkI
         3w3Vsly8gpMLQfAFyMv24PWpYWWrmPmBgayOxsG+dHFB0Un/2C7OJaiUiXkDV//CD2+T
         QYtw==
X-Gm-Message-State: APjAAAX7z2LLMIUBrjyeyUrRLdYlY+Ef3DX+roGrsfgjKSk2myFlmCFR
        bMerCK5enFbIoc9r89uf40UaAA==
X-Google-Smtp-Source: APXvYqxlF/r5xHoMV1z98KMJEdYEWrKrgLBqt6pcdi39230iWP8YKfBjZ7KLcW4flbcD2DEVH1Mf6Q==
X-Received: by 2002:adf:ea86:: with SMTP id s6mr1579096wrm.44.1557476609735;
        Fri, 10 May 2019 01:23:29 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id z4sm3790285wmk.5.2019.05.10.01.23.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 May 2019 01:23:28 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     linus.walleij@linaro.org, khilman@baylibre.com
Cc:     jbrunet@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/6] dt-bindings: pinctrl: meson: Add drive-strength-microamp property
Date:   Fri, 10 May 2019 10:23:21 +0200
Message-Id: <20190510082324.21181-4-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510082324.21181-1-glaroque@baylibre.com>
References: <20190510082324.21181-1-glaroque@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add optional drive-strength-microamp property

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
index a47dd990a8d3..a7618605bf1e 100644
--- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
@@ -51,6 +51,10 @@ Configuration nodes support the generic properties "bias-disable",
 "bias-pull-up" and "bias-pull-down", described in file
 pinctrl-bindings.txt
 
+Optional properties :
+ - drive-strength-microamp: Drive strength for the specified pins in uA.
+			    This property is only valid for G12A and newer.
+
 === Example ===
 
 	pinctrl: pinctrl@c1109880 {
-- 
2.17.1

