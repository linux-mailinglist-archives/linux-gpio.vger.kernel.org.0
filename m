Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A19661632A
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2019 13:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbfEGL5d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 May 2019 07:57:33 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34648 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbfEGL5d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 May 2019 07:57:33 -0400
Received: by mail-wr1-f67.google.com with SMTP id f7so11624595wrq.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 May 2019 04:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iSJwm6tn+7I484rTSQE+9G4s/2gB2UbS4DNi3jkBUBM=;
        b=mNEn/Vr/31eZbnej6Dg0h/hnFDWLlkBcEwMYlTvgR2fZfYHhc8C86b8PHfbQ10RhzE
         OTskncyXPrt0dQjKrKukwuPSxLnLMTzkzUR2z/Jkxb/a+6WDwCVt4lv3ZaF820tYaIob
         tuf16F2dSjNiqPkH5gm9OnbrpTFTKxf6LyzurPi+Va86c17sUsuCrBpGchuK5J17m5xO
         rg4PXE6327aNDlU7NbYNzBVWS91nqt5zldFzY21IhWqlP4FsirL85mUIAQg6/3AB0z9/
         NmnLL1w7VliMQj8ox1Vj6xZ0AB6ypbombWuknSOgJ9y351oasZ0zgBY6yh9HlysKvuq5
         8wZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iSJwm6tn+7I484rTSQE+9G4s/2gB2UbS4DNi3jkBUBM=;
        b=VZkT2d0b8T4Vfmay9DmvviSoK6na+N1l8t0Yoi6+PRJm1bnJRfBCULRR5xMJHaH2Uc
         ov+Cw2Eiz2z4mUTbLg+gaeKTK1we8CiKLddU9sLAiQ3VMtMdVUY4CNsWWfGSzabQ2XU6
         XgsXfB/Ro3ZTZUgytxvEl7fS3Im0KVlgJlzHTGh8wFDdWkqjPOPEUAFlgMRqDxAGJCb/
         vb+bpoNnpYGdhH9TL1gtF63bRXi1Y2kkKe1dQBLrK+28219hnwPPs7AuUqhWU5k2tEfH
         CL9nUAjOl8AuxJ2dZNJtTbRfz/IkWANViIkcvyHLwyYQAJCAHmOsxtdqkm8B+Bog5wdR
         cnMg==
X-Gm-Message-State: APjAAAV5VHFjPQiMJeqG+gTpUxbm524/vbNJ+D+sG+9189RZOIgU0xW3
        vXfR4tjhxoyeLsrPVyVfzkFfhQ==
X-Google-Smtp-Source: APXvYqxDAVU5GNWwoSpkR+LWWEpkvnXYCivvCs72/0tzaSmpcVNC5sOdYuZ8yVIH+uK3uM0DEJJXRw==
X-Received: by 2002:adf:eb50:: with SMTP id u16mr10188307wrn.54.1557230251531;
        Tue, 07 May 2019 04:57:31 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id s11sm7120274wrb.71.2019.05.07.04.57.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 04:57:30 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        khilman@baylibre.com
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] dt-bindings: pinctrl: meson: Add drive-strength-microamp property
Date:   Tue,  7 May 2019 13:57:23 +0200
Message-Id: <20190507115726.23714-4-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190507115726.23714-1-glaroque@baylibre.com>
References: <20190507115726.23714-1-glaroque@baylibre.com>
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

