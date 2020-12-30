Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E95C2E7CDC
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Dec 2020 22:50:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgL3VuK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Dec 2020 16:50:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbgL3VuK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Dec 2020 16:50:10 -0500
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C5BAC061573;
        Wed, 30 Dec 2020 13:49:30 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id b64so15028429qkc.12;
        Wed, 30 Dec 2020 13:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Mm8nM7CToM51wXdb4iLEoycLNQXyeLoy+WUeSYYHM5Q=;
        b=lDcIbFcLFOZWQEnDUQmgWWiZtP1U0GdAEIrWoSrfE+5nXYc7wlL39X2fwyVD+rghM+
         36cuXoi3DEuq0MciSylurn9IWF4nNXxOc2sZL2W58/s36geIdE0PCCHDV3LqbdtVr9NE
         gm4mlw1ZhZ64Qie2RurwyLJjqT76ZszIaOsz6iW82YrQKI3pu3rr+5KITBJndeL0Gp0N
         LOJ9SCgy3ND4akDotyT/AK4u/DtVIR5kKp/3aKVX2gc7ybpyWZtQvAsImQQe6ba4+1LK
         FaqgvBA1ykYdTJAeSoetirvxMM3tDlxIoGzCd7A8GSo8AlNsPkTWgI/EKiR11MpX2GMn
         0tnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Mm8nM7CToM51wXdb4iLEoycLNQXyeLoy+WUeSYYHM5Q=;
        b=HJaMS9ASOpJjV9RMPszGcwe4ihcuZoSe7Osz74dzxCTsC3QZrzoovEzYQ1T8hbU90g
         rzx/nCkMDvFF8Lk1bv6OSTZmkqVU0SosN23Vp8iYXO4K5PZ0IuQKaB8+w8E1zPrNbnwy
         08/4/EXNy9MaJI+e7NTe/c5XYwt719XrpDQmAVCk+urrLjmCKGDP8l1FINlCKVKJwHat
         IH1EAqACSNeVphAcEcg5y8dKChvH7/w6LfZebeJ47Y2soO9FWDnGU5oWwgPS3CvYhDxD
         AvbavYtn8QydEsLR2oJXjrbSTdeWwVlMZh68bylMlNGZUJqyCBfbzdMjt2GSN0bCGUk/
         X12g==
X-Gm-Message-State: AOAM5318wFnO7JpVD1ulKu0abPsLbAiLxV4Otco9Ac+U/T1JWvWvKQWN
        39jltFMJqpY/jAAUFwo7rEw=
X-Google-Smtp-Source: ABdhPJyVcp3//guCGdD36PKtsXY8tTxUNihIjIpSeDX3i7dpnDqvUJi3HlYKp39VgXJFKxKdAucF2A==
X-Received: by 2002:a37:584:: with SMTP id 126mr54900278qkf.332.1609364969401;
        Wed, 30 Dec 2020 13:49:29 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:a80:d66:6051:ad08:aa32])
        by smtp.gmail.com with ESMTPSA id k26sm28973590qtb.41.2020.12.30.13.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 13:49:28 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, sandor.yu@nxp.com,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: gpio: 74x164: Introduce the 'registers-default' property
Date:   Wed, 30 Dec 2020 18:49:17 -0300
Message-Id: <20201230214918.17133-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are cases where a certain default output value in the 74x164
output is needed.

For example: the imx6ul-evk board has the Ethernet PHY reset controlled
by the 74x164 chip.

After enabling the OE pin, the output pins of the 74x164 chip go to
zero by default, which makes the Ethernet PHY not to be detected.

Add a new optional property called 'registers-default' that allows
describing the default output value for each shift register.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v2:
- None

 Documentation/devicetree/bindings/gpio/gpio-74x164.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-74x164.txt b/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
index 2a97553d8d76..bf8f45896018 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-74x164.txt
@@ -14,6 +14,8 @@ Required properties:
 
 Optional properties:
 - enable-gpios: GPIO connected to the OE (Output Enable) pin.
+- registers-default: An array of 8-bit values describing the default output
+value of each shift registers.
 
 Example:
 
@@ -24,4 +26,5 @@ gpio5: gpio5@0 {
 	#gpio-cells = <2>;
 	registers-number = <4>;
 	spi-max-frequency = <100000>;
+	registers-default = /bits/ 8 <0x57 0xF0 0xFF 0xF0>;
 };
-- 
2.17.1

