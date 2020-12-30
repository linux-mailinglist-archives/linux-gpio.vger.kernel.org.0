Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52BB32E7A86
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Dec 2020 16:43:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbgL3PnO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Dec 2020 10:43:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgL3PnN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Dec 2020 10:43:13 -0500
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8530BC06179B;
        Wed, 30 Dec 2020 07:42:33 -0800 (PST)
Received: by mail-qt1-x830.google.com with SMTP id 2so11130929qtt.10;
        Wed, 30 Dec 2020 07:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=gksk1aXwxYA/bWUDFXmTOZvpRAh0XcLj+0G7pkJFM9o=;
        b=auFWZBuWXjWKK4/q2IWjWYwMgtDLGLAh8xteNOxEyqu63aPirwQJC53hwiXt/yTeGB
         ZkS+aCUY71NA2ElYRqYYd2b8anOofopb0I+Vig0FAY62DMMD1L0R758nEEzfZUnTv/mi
         ypn8vCNzto65JyanZEN1sbqCMqxsZYt99axyZsTw1EirUctTaZvlJhqGIj3gu+f6pqhf
         NeaVlCV6eCiWzHwMuQS0st5dptiYD76TCnVwN9yx/M1sVWN1d3pPk59Kei/BjdeC0cTd
         bk1MtGSKb7onotyxWAvMVTyRtxBODql2f1g2gRBCUqmPCB6Aw05dCz4VkpUSpspEPsaQ
         /2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gksk1aXwxYA/bWUDFXmTOZvpRAh0XcLj+0G7pkJFM9o=;
        b=CmD384E/ACBrsZKyz+tH0CB85GZ3OIDBOp4Ar2tM3gBDl0qE1p5VxMkc+GDT4Gv/g0
         DUtw5Rt07AKrAIgJkH70y8e3HnG8jDiAKcG29HpbRb8KQYey+mjUQDlJ77DKc0n5Boty
         tAeV5zsOfuW4qu0FS2nkKpCjIKJ0JbbXdTca2aSkd8cO4a40qtXhgVB5lDFX0ds57qXa
         6L1fMW5RHuM28CLsf47rJlIHP1m105rBf6gCj1zVHWUQbS8OtKEwcC5Ayp+OVjKTijlP
         m6cE0Mn2Ulqlfb+p/cRsbppmsXhP4vi71L5IFcz5SGjDF4ptiwin/VriB671jTTiNhxE
         99eQ==
X-Gm-Message-State: AOAM532AMEDC5im6ccQioFlgPOcJHHUEqUStL09CMVtG6TdjeMruM0r1
        djy8YjFZZoE2lyJBwMcsrs0=
X-Google-Smtp-Source: ABdhPJzli+ijWqt6AUY6Ku1LH4/Im0AGcU2ccMRaiWuOL7+UkyH4ELDkjYWWIkJdevVYxuE10rZ8Ig==
X-Received: by 2002:ac8:6bc2:: with SMTP id b2mr53980683qtt.286.1609342952638;
        Wed, 30 Dec 2020 07:42:32 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:a80:d66:6051:ad08:aa32])
        by smtp.gmail.com with ESMTPSA id o4sm26694832qta.26.2020.12.30.07.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 07:42:31 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, sandor.yu@nxp.com,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/2] dt-bindings: gpio: 74x164: Introduce the 'registers-default' property
Date:   Wed, 30 Dec 2020 12:41:06 -0300
Message-Id: <20201230154107.4151-1-festevam@gmail.com>
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

