Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8FFE9747
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 08:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbfJ3Hia (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 03:38:30 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40231 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfJ3Hi3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2019 03:38:29 -0400
Received: by mail-lj1-f193.google.com with SMTP id u22so1475882lji.7
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2019 00:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wLT2aJmyIBipkobiVKjOD3D+xARbiMMLNEpfLkE6WIw=;
        b=anGqsARCFXV34dsRpSzKtnFqfJrHNEoO72qnoKUUGS/5NJgmKiLFvDG+WJxxfoclJ0
         OhiJgjRegvPen5B8IUxKVWaW1CJ1TAfVLDhUjVFON2xgpXTZdpmJA7oaDEX9i8fXyuko
         Ydq8Sd1yBC7Hz4g8xeP1pcnfOn+3fu5H2Ej5uw7IY4SS1c110RaGDbM9xmYSYtxPzkmu
         y9J09I9JND/MA/P1Fdb2hsQ+NI7OkC/FrhmabK6/vDYEnxNxYOldF4jKTcQ6jZOHLrYf
         ZXF8UQfd7pKGUfq7OB4P7voUrFwNCiEFrPN7wA182rpe2NkRWocpVdz/n5CsFh0eJhvg
         ahuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wLT2aJmyIBipkobiVKjOD3D+xARbiMMLNEpfLkE6WIw=;
        b=IHuYtGJzLwLxEBGO11Dursi35zl6sB7zd0l0Te+PJv82P0sDwHoKPC1mIP65LuGDs3
         l636GhoBm4Te4cJfNPnzKhGW5U0yuAfpzKMDsL/nU80An/dqagnay3MgGB7bQt/zAYM8
         V6lBdQWw+4xd9CsjjjaPIT0qZ3Hfs1mraRPrtqI3wjszP4ceudRo3sLsIuNroI97Ne0v
         XXjU+UndahgIszJabrpwPzit4tjJL6V8q6IxoMOlt776rx/iZER5Ex6IKkidMbya0Oc/
         RZdSUdSu3EKCOc3yLe9EgCH2Y08kUcB8Y843E03NrEIBIOtQiOQWbroT8Ws0nUZFq0V2
         jOtw==
X-Gm-Message-State: APjAAAWMqBGA3lWucpyLFpdu34jLE2g4VhmRg2S3Ahf8MZ8yfVvROERe
        p5rntlQmXOR5vDwbEc5ErXfD8g==
X-Google-Smtp-Source: APXvYqyTat7r/x/jyQ3p5exvMBC2Bl3hV+C8x/dcGwdozw5z9olIYJVezIsqQmCHbjuondwZ9GrYSw==
X-Received: by 2002:a2e:481a:: with SMTP id v26mr504190lja.41.1572421107969;
        Wed, 30 Oct 2019 00:38:27 -0700 (PDT)
Received: from localhost.localdomain (c-79c8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.200.121])
        by smtp.gmail.com with ESMTPSA id x12sm573408lfq.52.2019.10.30.00.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 00:38:26 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] spi: zynq-qspi: Drop GPIO header
Date:   Wed, 30 Oct 2019 08:36:24 +0100
Message-Id: <20191030073624.23974-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver does not use any symbols from the legacy GPIO
header so drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/spi/spi-zynq-qspi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
index 5cf6993ddce5..8786054f4869 100644
--- a/drivers/spi/spi-zynq-qspi.c
+++ b/drivers/spi/spi-zynq-qspi.c
@@ -7,7 +7,6 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
-- 
2.21.0

