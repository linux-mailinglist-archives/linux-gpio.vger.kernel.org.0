Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84C4971DEE
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2019 19:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388703AbfGWRnl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jul 2019 13:43:41 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38663 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388642AbfGWRnl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jul 2019 13:43:41 -0400
Received: by mail-lf1-f68.google.com with SMTP id h28so29928360lfj.5
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jul 2019 10:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QFTwoXxJunT2kH1Ot9eM9+cX7DrsPRtBTLu8N/TMz/U=;
        b=eEWJN/qpGbjQbRIR4evYZVPpITZL50hcxujFO284JFDN+o3or8Ykgaev/bDTqBYMLO
         FftCk6Gh8j/cq3c6CqHei6MWD+r+FFxRv+qL1ans9Hrl9BASeuwVTOpQdjCUEnI87171
         5vj/zAmE13otAcjYNbvKgxwG9GjkSvDR5tpE/EBMgTDGgJTVxCJ3rqiACh0NcP5TW0iO
         CnrcSS58UKLgrPdijY5tHH4QdSvLbqMaArahKdXEIEC/bHdvqMdFy8K6WE7gyI8RhZCH
         N0+UKXtR3D3+5DTbSBhiaPoMOQZy3kZ5LRjVWJuiv0MYvsl612AvoHtkxIcK7mcLNWpH
         g2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QFTwoXxJunT2kH1Ot9eM9+cX7DrsPRtBTLu8N/TMz/U=;
        b=YA2xZ/aAHXiGGespN+YAVGGAN96zV6NOp4tSr75MlqnHk1Xc7Yxk3CRdYSMPhQV5x5
         CdvFnVFSrOJiBaikW0SeYdLQT0gu9kU5Y+jcV8fqmJq09g18XkvYf8C9pgTuyu9G53Sw
         HDS2d2ppJVkH6LrBoNLqKP4VgAsazPYmmdctZvw+FUEFrBpsJUl9s2mjUjZM/AQjpzZ3
         OF3tWY1aOdhpU7SOYA4cQq5hJCFHPrPh6pO3CTecb6QGwIb33RAiE9JOyLnmZ8y+bwtK
         4J6BFDIC+LdBQMcw8FTpCGrBWrFLm/NoLgaFKOIspM9ibbBi5LrZgdE7bsnYtxLhMbMd
         BqWQ==
X-Gm-Message-State: APjAAAVv4rcgDvfXUuwmxhr4b7csbkJABgzbQ8cnSjiF4cDbrozv2HNv
        WI4J7GAw7GgqoCinGVyqrWnZYg==
X-Google-Smtp-Source: APXvYqwd1iXuZOIg6pMeytpJ6SoWUlo+7PrxeBtnYDqZeiCllLeRrRdw302zNWrWvjzA+NmGjRjMuw==
X-Received: by 2002:a19:e006:: with SMTP id x6mr35088127lfg.165.1563903819260;
        Tue, 23 Jul 2019 10:43:39 -0700 (PDT)
Received: from linux.local (c-2ccd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.44])
        by smtp.gmail.com with ESMTPSA id j7sm9042247lji.27.2019.07.23.10.43.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 23 Jul 2019 10:43:38 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Mike Lockwood <lockwood@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH] extcon: fsa9480: Support the FSA880 variant
Date:   Tue, 23 Jul 2019 19:43:01 +0200
Message-Id: <20190723174301.31278-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The older compatible variant of this chip is called FSA880
and works the same way, if we need some quirks in the future,
it is good to let it have its own compatible string.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt | 4 +++-
 drivers/extcon/extcon-fsa9480.c                             | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt b/Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt
index d592c21245f2..624bd76f468e 100644
--- a/Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt
+++ b/Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt
@@ -5,7 +5,9 @@ controlled using I2C and enables USB data, stereo and mono audio, video,
 microphone, and UART data to use a common connector port.
 
 Required properties:
- - compatible : Must be "fcs,fsa9480"
+ - compatible : Must be one of
+   "fcs,fsa9480"
+   "fcs,fsa880"
  - reg : Specifies i2c slave address. Must be 0x25.
  - interrupts : Should contain one entry specifying interrupt signal of
    interrupt parent to which interrupt pin of the chip is connected.
diff --git a/drivers/extcon/extcon-fsa9480.c b/drivers/extcon/extcon-fsa9480.c
index 350fb34abfa0..8405512f5199 100644
--- a/drivers/extcon/extcon-fsa9480.c
+++ b/drivers/extcon/extcon-fsa9480.c
@@ -363,6 +363,7 @@ MODULE_DEVICE_TABLE(i2c, fsa9480_id);
 
 static const struct of_device_id fsa9480_of_match[] = {
 	{ .compatible = "fcs,fsa9480", },
+	{ .compatible = "fcs,fsa880", },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, fsa9480_of_match);
-- 
2.21.0

