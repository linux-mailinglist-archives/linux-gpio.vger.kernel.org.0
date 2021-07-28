Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 181473D8FCB
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 15:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233439AbhG1Nz4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 09:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233254AbhG1Nzz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 09:55:55 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BE05C061764;
        Wed, 28 Jul 2021 06:55:54 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id 190so2206447qkk.12;
        Wed, 28 Jul 2021 06:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p0c/IyLNYUcFRUNhIkMuU0AI+TpmMpaReD0iwylBw/k=;
        b=lI4HE7O3xfbrLZHlZEm6CLq8NrFgzrcXzQ+FCqH4bMco4nV+Hvz5agyILutqUHegUn
         o/Bjv/EaB5qT2qnagUeroiQWSXrMpTP6U12EHVinFY8m8E9ABcYNZlznekse8OFtpNTq
         t3oFf6NxAUCyBCOUO9UtD+/cJODji4nbwykjNY24dUPxbY/YaTTnjF+r+NTBdziyRRJB
         M17Q1QZZCJUAOVjylL/t4f4sv19oMepslZ1RZ+xLwjKNl0INSPXFtCRcdXwMKLPB7MnL
         CBhJ2vQoafmjKj0sqQ2i3HEfknj+CtwZ6pAEAMXJBjTI9Ancuu5gyLgdCAiyevy6lAUf
         N1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p0c/IyLNYUcFRUNhIkMuU0AI+TpmMpaReD0iwylBw/k=;
        b=pYJoec0JojxNfUQE26G9zxalXHoabs1Og2eMT8cz76PfbyIHtjshjQ1Z1KZkJINqsq
         7erE0ebgUORIPieSNd89vzxWKmBJZ20d++p2udaVeC4sRuXE8UhJkHU9hJ7pcoiUgETt
         LLSzV/8dLtKDy2cLoYaQLXiNBSVBUkKan2NS+hxe+clljV2m0alhlH/PG0I9jF3iqCkO
         rzJC/eEJhtzpLoKd6eDjIjDsaLfFJS3Jf3EI7jAibGQ+a3iRXeR+yKOmNnDbvmXoDOgE
         +ZsEK9kcLiS2AV1nMR7xT/vnTr5MM1W6tlQw+IX+0sTTxf8aQ7PGg00inmFggM7JFgwc
         xphA==
X-Gm-Message-State: AOAM532dn9yMw+Xy1CH0uB0xCRPgTV1Otc+C5adTb9YQgrN2LaeTqMh0
        +vnrG6zkmNTkRanBUA54sDQ=
X-Google-Smtp-Source: ABdhPJzoNpKc+OhcYe2emeCQDQYmrYhrUprg7KEWryMcCF76OXmFd+tXGIlTeIs5GjwINx54kLx8gg==
X-Received: by 2002:a37:62d2:: with SMTP id w201mr15042275qkb.318.1627480553423;
        Wed, 28 Jul 2021 06:55:53 -0700 (PDT)
Received: from master-laptop.sparksnet ([2601:153:980:85b1:b58:2ae8:d75f:660a])
        by smtp.gmail.com with ESMTPSA id t64sm27202qkd.71.2021.07.28.06.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 06:55:52 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH 1/9] dt-bindings: gpio: rockchip,gpio-bank: increase max clocks
Date:   Wed, 28 Jul 2021 09:55:26 -0400
Message-Id: <20210728135534.703028-2-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728135534.703028-1-pgwipeout@gmail.com>
References: <20210728135534.703028-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The rk356x adds a debounce clock to the gpio devices.
Increase the maximum clocks to account for it.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
index d993e002cebe..489a5263a7a1 100644
--- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
+++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
@@ -22,7 +22,7 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    maxItems: 2
 
   gpio-controller: true
 
-- 
2.25.1

