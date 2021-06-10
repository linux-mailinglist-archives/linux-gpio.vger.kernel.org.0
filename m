Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69FBE3A2CE6
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 15:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbhFJN1F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 09:27:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbhFJN1E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 09:27:04 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89BCFC061760;
        Thu, 10 Jun 2021 06:25:08 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id r7so18624853edv.12;
        Thu, 10 Jun 2021 06:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4KUvLwhdU/9cW6PmDzGD8cIpCLm/nTK5EPGoTz6gWB4=;
        b=qYoS5ZhMiREtvyo8gfjIGqiojqvJ1Sq72ImF6yi6J6hcs89TfT/zmU1Gz5OswmI31t
         AkQl1/YNmSL63z8XPuht0OX6mClWtUoF1+M6ZsfUaKTKhefM/45+Q1qDR5r4jwjYI1ZQ
         E/ozrrkTjW6QZ/vgr/uPw1S8KcLugIlpV1BIdvRFNfmd640Ox2vsFlVKthJmsOjv97TE
         WLkUS/L0vX0pbt8JjeoPmeJRvB3f9sAi9L8FjfCqySxlVW4QCoNHVvizZkyGvdQ/7tTb
         wZARuooC8oVw9xTDNnGgq6Ik7FzmO7WJsZnm0u+BifgQRJY3xmH/nV27BGbaMf2mVYBu
         Be2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4KUvLwhdU/9cW6PmDzGD8cIpCLm/nTK5EPGoTz6gWB4=;
        b=c5Aq4ZIHqvsNzff7A7h8EnRTYU8WU34OB9QL3uN/c2c3ovSv7g6Vh3PlsZFUORwbuT
         pXgvD7q8pK1NlTW+AdIO4gNwiOmL/rNjE+O3PhF0dz0O8+cDqyD4hPlwCytlCeEg+bH+
         8f+Pttyv/qceuG87O7/aRWtx3DWKNd8TpEaK2+/6GDmS3erKXOgYamX/mYnmW9V/D6c8
         8ciL4GsVN6pJ1quec6w24RNPJTFf1YsgaBw9qn1xxMCEuaPEf/z5OqH0nQtn8dkpk49F
         Llv/mSHoL2GMRyGsAeIvf+5KqXoByvA7rqIQmRcad7MS02UCrypf7NEDi5rfCG5ZtGKa
         1wlw==
X-Gm-Message-State: AOAM533G6fvc9uwfsX6GPWUgVuZQbqnW96wYxNuZ9Dgt6L2JfJQtlHSi
        bX5NhzuVesYOmT0fhsCmJSM=
X-Google-Smtp-Source: ABdhPJw4uUQLR+U8Z8nJSii0cu3NIlIcHWk4BovrkPCYJWOpQAO5hoaObTRZXwK1zGMPwTOsaZ1IsQ==
X-Received: by 2002:a05:6402:42cb:: with SMTP id i11mr3445086edc.242.1623331507180;
        Thu, 10 Jun 2021 06:25:07 -0700 (PDT)
Received: from lab-pc01.sra.uni-hannover.de (lab.sra.uni-hannover.de. [130.75.33.87])
        by smtp.gmail.com with ESMTPSA id du16sm999619ejc.42.2021.06.10.06.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 06:25:06 -0700 (PDT)
From:   Andreas Kaessens <akaessens@gmail.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     linux-kernel@i4.cs.fau.de, Andreas Kaessens <akaessens@gmail.com>,
        Darian Biastoch <d.biastoch@gmail.com>
Subject: [PATCH 2/2] dt-bindings: pinctrl: mcp23s08: add documentation for reset-gpios
Date:   Thu, 10 Jun 2021 15:24:38 +0200
Message-Id: <20210610132438.3085841-2-akaessens@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610132438.3085841-1-akaessens@gmail.com>
References: <20210610132438.3085841-1-akaessens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The reset-gpios property is added to the optional dt-bindings and
also an example for it's usage.

Signed-off-by: Andreas Kaessens <akaessens@gmail.com>
Signed-off-by: Darian Biastoch <d.biastoch@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
index 6ec3c8d79f49..2fa5edac7a35 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
@@ -49,6 +49,7 @@ Optional properties:
 - interrupt-controller: Marks the device node as a interrupt controller.
 - drive-open-drain: Sets the ODR flag in the IOCON register. This configures
         the IRQ output as open drain active low.
+- reset-gpios: Corresponds to the active-low RESET# pin for the chip
 
 Optional device specific properties:
 - microchip,irq-mirror: Sets the mirror flag in the IOCON register. Devices
@@ -135,6 +136,7 @@ gpio21: gpio@21 {
 	microchip,irq-mirror;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2cgpio0irq>, <&gpio21pullups>;
+	reset-gpios = <&gpio6 15 GPIO_ACTIVE_LOW>;
 
 	gpio21pullups: pinmux {
 		pins =	"gpio0", "gpio1", "gpio2", "gpio3",
-- 
2.25.1

