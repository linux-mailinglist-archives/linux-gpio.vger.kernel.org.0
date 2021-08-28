Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41ADD3FA597
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Aug 2021 14:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233999AbhH1MLG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 28 Aug 2021 08:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233646AbhH1MLF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Aug 2021 08:11:05 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67BB9C061756;
        Sat, 28 Aug 2021 05:10:15 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id dm15so13979529edb.10;
        Sat, 28 Aug 2021 05:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9HhIK54AGWzBDeJbtkac7rFYNxv2dm4g1nGUaF4jiys=;
        b=LLaSrDdw/XsSEGWew/5HiNsDUf4ckqEcisOTs/R6p/n0z+Ic4XgmNXCDiZq5kJD5ZC
         oD0FbAoY2j/nM9MNWIJHwfFCQ+La2CfAdg23GgS5vYWmucbQZYxfgjyFIPA0e7e/b1Nc
         YyXQPG6hvqZqaBqOtHFxT7oz8ydKC+qjgWcdntglfYYP5Gp28ZAhVJSGNTY2tLLz00V0
         N71tSuMx4X0fPJsYQe8406bbN5pfYxUIjk7LB4UTJDKVJlmcEHL/C1ZOGEt40xk49SjB
         IJrpKRyrKlD7UB+W578XflpABs0MN5tPMPs6O7HchQIBkyLW7lm0HK2Z6QQ4XZdub7QB
         FS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9HhIK54AGWzBDeJbtkac7rFYNxv2dm4g1nGUaF4jiys=;
        b=Bq0OHYkL3Y0Iz5OMpB3vs8HZg08UZjcRE1l4t6PpSv8tqokkMp+JZTAi5Awi3kr7I7
         OzY9D8b0ndjJRDqELW3q2If99yxg/8IYZLcFbW3MG/z4nPEp6I5LnvfS6tGizzGbbBIq
         AXaoyGyGfZtBqUEHEm26WljvUBO84t4tSi3dCT4iPIA7egnB/eLYGwTbGz13e4Zl2EOX
         30m7tPuHugXz+bv642NP+R/WaeP7qca0sHaTgQxEf9M31P9tcN/ybdHY0ZyKzAzwMtgb
         IfkceYtqNJBT+KyansKxm6HWUEnAgbjgdxIR8uUjwMOJxh0gzqZxOLu0ErI3V+Vsp457
         O2hA==
X-Gm-Message-State: AOAM5327wYvIph2hKJiI25Xdf1USQJN5xHbibUb0z9W3KVd7ko2fBtZq
        sbO2JTOgveayRc1ccP9uRdE=
X-Google-Smtp-Source: ABdhPJx0+wK7fWPp5Hv+wMocus2PrJup2Vhy39ZlTiCIOvxouNrRI0kG1Igi7cW/tlsfsCK4uHaXKg==
X-Received: by 2002:a05:6402:1653:: with SMTP id s19mr13890586edx.163.1630152613976;
        Sat, 28 Aug 2021 05:10:13 -0700 (PDT)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id h10sm4706922edb.74.2021.08.28.05.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 05:10:13 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: add gpio-line-names to rockchip,gpio-bank.yaml
Date:   Sat, 28 Aug 2021 14:10:07 +0200
Message-Id: <20210828121007.14865-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some people and companies may want to add more description
to there gpio pins. Add a gpio-line-names property to the
rockchip,gpio-bank.yaml file to reduce the notifications
from the existing mainline DT.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
index 0d62c28fb..d4e42c2b9 100644
--- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
+++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
@@ -29,6 +29,8 @@ properties:
 
   gpio-controller: true
 
+  gpio-line-names: true
+
   "#gpio-cells":
     const: 2
 
-- 
2.20.1

