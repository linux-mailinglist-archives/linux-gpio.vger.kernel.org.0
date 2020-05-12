Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E419A1CFF5F
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 22:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgELUfl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 16:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728882AbgELUfi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 May 2020 16:35:38 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAEE1C061A0E;
        Tue, 12 May 2020 13:35:37 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id m24so14098124wml.2;
        Tue, 12 May 2020 13:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gfYE1e6W8kjaePoAQJvSuLN/OYX7PHv4LVzW2vnvs4U=;
        b=I3BtlE50IX115X0cHcjGheao2fxSRSlgpqWGc8ZET71/zj63DBUKXHE/Wieum6e4c4
         VGdiXNtHVJBKEdPIuvVBf1ytH/bVZxmIr4ahCHaIFeNiUhS+rOMVJQqsiOv7l3IoPJoO
         A2VYw8mXegEyhDe5gjVmAOScnkhEaFkMEyq6sbUaB73qoGmqaQ5SpwvMNhz3m3QxWRji
         swhTBh8fq7iT3hZQem31dUbr9LXAf4EdqeG0nrvJAe7pz2ldzoziCtCUAKZ1K+/vvejU
         wSgCPwRtIEB78tyLvUk90dAy8K+qIrddX0ocsUJLtEUWTdfbLRBfgZE4LM9dBsQ/spzU
         zyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gfYE1e6W8kjaePoAQJvSuLN/OYX7PHv4LVzW2vnvs4U=;
        b=fjR/Ql1DCijc48G/gBDWQCGiXWg4uB9GqPVoaGiWUbNWqpafBRl2Ek7gDCi2u2q4ie
         dQiWy5zgO1kVhVwpzJYVNOkOODUxlgJdyumYz2Nyt68vvnjm53rN5Uc09ej7JSxPzG7z
         tMy9cSEj3G7fIb6tc/wWcWUxAv53PexjWjr3bET3HNCU6F9sIqLafE/sefUra/4+fG+c
         7kftMud4FnwX8j1z6v0W09WtI2/rJlpJQJQ/IIjrcal5WVqNFeK4hRShIiBVe72gl9gA
         kZMXag+o6v6MkOq22TW/5ax5ddWPMNFSoIHQV78SSMcYNhEr+11SfLhba33h1jsRB6Sw
         V1NQ==
X-Gm-Message-State: AGi0PuYEETlyQilmCN42Ctqjjmmpo7qUhyGsjb0klMiUxUWhph9OlvZN
        hw6c7WI75cR00kdfMM+AN+Q=
X-Google-Smtp-Source: APiQypKMLhrmlE4mch02mKHfNsvLNU5k6H13Y813A4y7x5vB6uvf/fomIIo8HMl3YQ+LDfVL83lRmw==
X-Received: by 2002:a1c:1d41:: with SMTP id d62mr18782392wmd.79.1589315734959;
        Tue, 12 May 2020 13:35:34 -0700 (PDT)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id k131sm418219wma.2.2020.05.12.13.35.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 May 2020 13:35:34 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: pinctrl: rockchip: update example
Date:   Tue, 12 May 2020 22:35:23 +0200
Message-Id: <20200512203524.7317-2-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200512203524.7317-1-jbx6244@gmail.com>
References: <20200512203524.7317-1-jbx6244@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Rockchip dtsi and dts files have been bulk-converted for the
remaining raw gpio numbers into their descriptive counterparts and
also got rid of the unhelpful RK_FUNC_x -> x and RK_GPIOx -> x
mappings, so update the example as well.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
index 2113cfaa2..d3eae61a3 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
@@ -110,8 +110,8 @@ pinctrl@20008000 {
 
 	uart2 {
 		uart2_xfer: uart2-xfer {
-			rockchip,pins = <RK_GPIO1 8 1 &pcfg_pull_default>,
-					<RK_GPIO1 9 1 &pcfg_pull_default>;
+			rockchip,pins = <1 RK_PB0 1 &pcfg_pull_default>,
+					<1 RK_PB1 1 &pcfg_pull_default>;
 		};
 	};
 };
-- 
2.11.0

