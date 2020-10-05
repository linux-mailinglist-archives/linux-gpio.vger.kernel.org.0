Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D03BF283F54
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Oct 2020 21:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727960AbgJETJw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Oct 2020 15:09:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbgJETJw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2020 15:09:52 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D8E6C0613CE;
        Mon,  5 Oct 2020 12:09:52 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id p15so576593wmi.4;
        Mon, 05 Oct 2020 12:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nc/EoWSskfJwFiPqwL0OQo4dD0QX3BcE0Pr9s1Q9WEU=;
        b=X8u/q3gLehIM1K5Gk2w7zWIotH1xU0VjCs36cpIivMarOSBHyWFeMrgN1swQBcCU/m
         bzyPfCz64Cv3mGOKSpq7pHI6z60ZZq6kspsZ+ilmXrLgBwOvWlhCh+nGJjnDG0FqOUY0
         yNgnBi8umO2oIpYfkN8dK12AwsoU/UfDOaD8qUEbT65PsVPRrvTkd/ZlkR+dQXWWBVAd
         lPWzzGhgCc6KqPwR0Vm0CmUVtp8PF4cgqy/MMu/heOYph+AnE9/YauSXOwhi/2x7tB1E
         YtT7P9jjAc3u3hrSmyfmMzdt6JEpxM77gqoY76UFoltp/1ChbIUxep143nK64lNCkeuc
         RCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nc/EoWSskfJwFiPqwL0OQo4dD0QX3BcE0Pr9s1Q9WEU=;
        b=YFNZzmb57hSujpfssowEqDA+LQE355bniuVu4gJFPWzDUluRyheIjqZ7gfO4EsKQVn
         stsDhVkxCksCIf1AXrRITgY9iGCfQthrrw3TQYZF23P4noDVJBw7h2JiecAqOa8XwPDP
         QBgsBMPEZL6uCICo92ptcFXvc+rXW1MtQqyPgsWtBvvtxu6Q5eS3uCQe6pxTS0TBTFz8
         cLvXza+80DvxCwAzYMcjAbm0edRdkW0RRdMaIV+eYqMGSh4DaaPmLHqwoulHX4mR/t5V
         lW0THjiHZ6Z3kQKY/48M4E9bEZjtGleHwbE3iOBx+BJ1EZki5acDtwHgBmoXiBQsKHVi
         EDHg==
X-Gm-Message-State: AOAM531fOMoV/5uxMk73ipqhZ1pouw9DqJHGQEK8kuJnqXJc8zPJQAQi
        wqbdxNSARvjx/DIzA1cru2U=
X-Google-Smtp-Source: ABdhPJz7v8BcJ5QlHjdc0rMtUeLTUeLkqK5T44k5Odo5n2379Mr3PpcHv9UKYsIli0dKdWFWPjdzeg==
X-Received: by 2002:a1c:2901:: with SMTP id p1mr865861wmp.170.1601924990861;
        Mon, 05 Oct 2020 12:09:50 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr (213-245-241-245.rev.numericable.fr. [213.245.241.245])
        by smtp.gmail.com with ESMTPSA id i33sm1195402wri.79.2020.10.05.12.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 12:09:50 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Yangtao Li <frank@allwinnertech.com>,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: sunxi: Allow pinctrl with more interrupt banks
Date:   Mon,  5 Oct 2020 21:09:39 +0200
Message-Id: <20201005190939.21016-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Recently introduced Allwinner A100 pinctrl block has 7 interrupts.

This trig a warning when running dtb_checks:
sun50i-a100-allwinner-perf1.dt.yaml: pinctrl@300b000: interrupts: [...] is too long
	From schema: .../allwinner,sun4i-a10-pinctrl.yaml

Fix this by allowing up to 7 interrupts.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 34a17d5c6135..5240487dfe50 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -61,7 +61,7 @@ properties:
 
   interrupts:
     minItems: 1
-    maxItems: 5
+    maxItems: 7
     description:
       One interrupt per external interrupt bank supported on the
       controller, sorted by bank number ascending order.
-- 
2.25.1

