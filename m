Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C73AA7B4E
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2019 08:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728781AbfIDGNa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 02:13:30 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38937 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727881AbfIDGN3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 02:13:29 -0400
Received: by mail-pf1-f194.google.com with SMTP id s12so5550963pfe.6;
        Tue, 03 Sep 2019 23:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/J2boyPn+qcY/K0vnmvhFTTJFIHHHtzjypsfGFGhgdk=;
        b=T+AzYIEUXfUowK7oaDioOyQfgljXCgF5OaLeVOZDs5si9YNS62iHvZYF7QPPWxoMuD
         6HZoj9lzZMst3evVF0QG+nXAFRWyTTfNe+b4E+h9aBaBl8CaInKHf+pZGjQktMzzlEyS
         HPNpOSDNvBsS1d0T59kOyxX0yOuiQVzLIo1D/hymPSUPqgY+ZFRe3b3dSJPdOMgWbONz
         XvbCScG2k/yOAyjE4AfT144iEbaku+wFeuwj856zrB+uPkd+g7LsFBwlQVtZxyT5dwXx
         hb3V4Ke7j/tgHPb2wYdr0vtUMJXXvKhK8Lz9SZ5Ad7ed0rq0j23lIoyWDfziHTJgqVtW
         vamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/J2boyPn+qcY/K0vnmvhFTTJFIHHHtzjypsfGFGhgdk=;
        b=Uc+/RrKaejOFzQq5K2W7Y6LJbehBm7dSaZPIdRngsapDqCYicNTH0OR+Fzb4xnM49A
         R0hBmdl28s43b5YSzr3WGbgHicCz0UklT+g+iY8LKatIRe5Eu0URKh5V3+3dlCDYqUDo
         31Sov4PyGwI9h6LqpP1w121NJ/11Fu43QStz0slB2sAoRfN6bOMfwTO4FzQctZHgmHOH
         PgW/8osfW4TayrjdVD2OZ+K9kY2LPqBTeOERkfwEuhbGzDaWGG7IYivc1ZXquadzxSqK
         q/dyuDJwd0Qo4haZjp5x01GxSKbgCDw9QTZ7BYZ08UsesnLW2Dv4QtwekBaH2kJUn8Jz
         zL1g==
X-Gm-Message-State: APjAAAUbtGtY5kn23kkzCfXcE/itW32Lr3sTlc1UHoQoP2MjyK13v1ZW
        aprShgIDMjFFVUzwDC8l3OqFNfPiQy0=
X-Google-Smtp-Source: APXvYqx0ThSaW+fHUBqyw3dqUD0Oa30Gmx83hxepmA1ZcStILNrjdla4WSXq4PxIDnAoPGKQ4jNvJQ==
X-Received: by 2002:a65:5a8c:: with SMTP id c12mr32988229pgt.73.1567577609134;
        Tue, 03 Sep 2019 23:13:29 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
        by smtp.gmail.com with ESMTPSA id i9sm42443093pgo.46.2019.09.03.23.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 23:13:28 -0700 (PDT)
From:   Rashmica Gupta <rashmica.g@gmail.com>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        joel@jms.id.au, andrew@aj.id.au,
        Rashmica Gupta <rashmica.g@gmail.com>
Subject: [PATCH 4/4] gpio: Update documentation with ast2600 controllers
Date:   Wed,  4 Sep 2019 16:12:45 +1000
Message-Id: <20190904061245.30770-4-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904061245.30770-1-rashmica.g@gmail.com>
References: <20190904061245.30770-1-rashmica.g@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
---
 Documentation/devicetree/bindings/gpio/gpio-aspeed.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
index 7e9b586770b0..cd388797e07c 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
@@ -2,7 +2,8 @@ Aspeed GPIO controller Device Tree Bindings
 -------------------------------------------
 
 Required properties:
-- compatible		: Either "aspeed,ast2400-gpio" or "aspeed,ast2500-gpio"
+- compatible		: Either "aspeed,ast2400-gpio", "aspeed,ast2500-gpio",
+					  "aspeed,ast2600-gpio", or "aspeed,ast2600-1-8v-gpio"
 
 - #gpio-cells 		: Should be two
 			  - First cell is the GPIO line number
-- 
2.20.1

