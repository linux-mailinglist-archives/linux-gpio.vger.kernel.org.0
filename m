Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2C03A97F5
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 03:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727156AbfIEBSN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 21:18:13 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43588 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbfIEBSN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 21:18:13 -0400
Received: by mail-pl1-f195.google.com with SMTP id 4so429094pld.10;
        Wed, 04 Sep 2019 18:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tOKMw2jcpWSfAVFD5eBvmEjvr87ebRMD2VX465NN5Sg=;
        b=seYXsDbBVkkBeGmoRMlnqWzqu6QQDunzxm9EqggJOSnwwAy/0PDId09u4eRbrfJSy9
         k0AbCRVfBIzoY/qzzVPXqzhIMhLGcdo4rtdRoulpGnQEwgTdeSoFrRLN/JzZfU6G25CD
         zskgEN2eTbkH0iv6cgQH5YPhUOP1FDSvm4BGkHa4Q4T4FRocntm6qf3zmRk1wjL40Jh5
         PkZrAR5lq5QVY5iI3KeSfWUlftcv8mSaFoLqeoz0XSJUQIxsAhSMdJihljDhzBJYpkK5
         vQ6IyvMvrOz7T6qmB5+X8qQ5clqOT+qPBJnk6oKrsJF4zVQylWrTRxwGX+uwshJb/FcD
         n9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tOKMw2jcpWSfAVFD5eBvmEjvr87ebRMD2VX465NN5Sg=;
        b=ORT9KsJnht52n2BYdMPTlpu25J7Pvj8adZxPqHjRWBl7/k53O0TPjEFsEdoR3Epqfp
         lxjyI1l6U+hdpqiaz39U3uc0F9XIGoQLd+guVnyG4RsPhsvLjR1PEbdJ29yl/3HmEhPr
         /xlQpin5zC4i+MxVPy5rBSPjAl9H8li/FtZFNLI/O2gneeo9L0zEkUnmsyC2YPEo1GZs
         GmLbaPgRWTz4hh3hAtMt114GXntfzMl7EUJuGVV/3ybHKqw3ezO2rudIqnD73BOoczVh
         aCDV/NrqffMI4DvILk57+axtnO/Ajh0M8diScRa5ljcGh2pRXdrCsjmXEOCsLiWNqzbl
         mu9g==
X-Gm-Message-State: APjAAAV1TxFvhtjH6GTk9qyy2Sc6C9mK+xr1TGvgpZWmNbwxgk5+pLYm
        3frVATwPXfrvJep2x1vWKWE=
X-Google-Smtp-Source: APXvYqx8uRB7lBCyyutl4aJiUHVVKVPeb3t1GNcMZplvM/Fu94gSyRW7iU7NMcCuQj+38WYmeNQvRA==
X-Received: by 2002:a17:902:b604:: with SMTP id b4mr679217pls.94.1567646292377;
        Wed, 04 Sep 2019 18:18:12 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
        by smtp.gmail.com with ESMTPSA id u24sm315924pgk.31.2019.09.04.18.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 18:18:11 -0700 (PDT)
From:   Rashmica Gupta <rashmica.g@gmail.com>
To:     linus.walleij@linaro.org
Cc:     Rashmica Gupta <rashmica.g@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] gpio: dt-bindings: Update documentation with ast2600 controllers
Date:   Thu,  5 Sep 2019 11:18:00 +1000
Message-Id: <20190905011800.16156-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The ast2600 is a new generation of SoC from ASPEED. Similarly to the
ast2400 and ast2500, it has a GPIO controller for it's 3.6V GPIO pins.
Additionally, it has a GPIO controller for 36 1.8V GPIO pins. These
voltages are fixed and cannot be configured via pinconf, so we have two
separate drivers for them.

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

