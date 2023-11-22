Return-Path: <linux-gpio+bounces-386-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F9D7F539C
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 23:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3464CB20E69
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 22:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3521CFA9;
	Wed, 22 Nov 2023 22:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B63E1B9;
	Wed, 22 Nov 2023 14:44:33 -0800 (PST)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7a683bd610dso7796739f.1;
        Wed, 22 Nov 2023 14:44:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700693072; x=1701297872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AsulCrhxZ7G9yLtOFYjz5J3XHpWYX0HKpY0GS2vn+G4=;
        b=SDLAq9M8cOeIgcAD/Ac8mjKiJbypnvCijoxe+//28TP6RolCxSk5x+Xx2SP0uE3tf4
         ARewSCbKj3PO/uss6Z7xl7Rg3ocs7rX9ToizeKcHOszRhOo38WzEmnUoPf5vz4d0nfvz
         sPx/CedYYvYdla5V/aCj2Pp/d2RuYiomREujxdohQYukgJthLjhEsw9LrSdrYE1P/edm
         POus1Ir2q+pzkTqMMSD03AoubDK6VXN5dHUri8tLF1/HFBDBDwgKRfnYTWhVOP0EGK5r
         JyN2MFeijchlkSytGfS2V1rzp6ioiTdNt+Ve5UKsgREDEeCD9ERR50gdxdM28H4AKN6D
         j9ew==
X-Gm-Message-State: AOJu0YxQmz8kQ/1j3StFrFWbLfJEYo72B2a4rQmwkNw0/6AYqdY/JxDO
	kmki2VbDcUnIM7MvYMyZRA==
X-Google-Smtp-Source: AGHT+IFrSfixUsrmT9b6CuYsw86rvPA+WGQxs4IHWd430ncNwPXZe4MqVFGDBRB1XpkPGggXgrT7hg==
X-Received: by 2002:a05:6e02:1786:b0:35c:21a7:ded7 with SMTP id y6-20020a056e02178600b0035c21a7ded7mr1673761ilu.24.1700693072307;
        Wed, 22 Nov 2023 14:44:32 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id l16-20020a92d950000000b0035b120fe6f2sm177284ilq.67.2023.11.22.14.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 14:44:31 -0800 (PST)
Received: (nullmailer pid 2809718 invoked by uid 1000);
	Wed, 22 Nov 2023 22:44:30 -0000
From: Rob Herring <robh@kernel.org>
To: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: brcmstb: drop unneeded quotes
Date: Wed, 22 Nov 2023 15:44:24 -0700
Message-ID: <20231122224424.2809523-1-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop unneeded quotes over simple string values to fix a soon to be
enabled yamllint warning:

  [error] string value is redundantly quoted with any quotes (quoted-strings)

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
index 4a896ff7edc5..a1e71c974e79 100644
--- a/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
@@ -72,7 +72,7 @@ required:
   - reg
   - gpio-controller
   - "#gpio-cells"
-  - "brcm,gpio-bank-widths"
+  - brcm,gpio-bank-widths
 
 additionalProperties: false
 
-- 
2.42.0


