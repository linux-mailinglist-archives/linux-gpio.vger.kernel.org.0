Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B7243BB485
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jul 2021 02:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbhGEAqn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Jul 2021 20:46:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhGEAql (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Jul 2021 20:46:41 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 449DAC061574;
        Sun,  4 Jul 2021 17:44:05 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id ie21so8953027pjb.0;
        Sun, 04 Jul 2021 17:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RoRwu7X2cHfz4D8K4O6Qb/qjVmxWtGhql31qve1wJtc=;
        b=Mg4l4CqceddtxvDKqhh/j1/QTCzmCACoz3E8YktiPGHfMXGGj+yrXiF2qW40jFjIVe
         0RRuJmvXrCUDSbP7Oh1zxy4wxITe8rofVwwedmY1rVZXukNyFSbLZAslTJajNKTIxKjL
         ocnqGz33yeGmpbsBlMnQpsZwoxVywqyAUx0ppUqzXjrqfwLvyxxiU6OU7dJiRVD2kbgT
         m0vpgCow4UV2ZI6rIcHRorNCuLajeN4pFOB2O9umlULwqs4SIoRZeR4EL57V+k2eGx07
         VeYLlmntlB/2LPi4QEulCKms41vN3ni5+1UmXaM22OfyIegNtRkH7KY4gHSe0P7F6J/h
         YClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RoRwu7X2cHfz4D8K4O6Qb/qjVmxWtGhql31qve1wJtc=;
        b=dQ/j9fO+sF3LsKB7++rXShXhM43BibHiAOF1xNtJePtRukwJzZntDDoeMiaJk3ozQc
         zQ9GBlRBCT4Pv06F6MjyyDdAObelBUqdeho+Zk0E1Xp9Enr1cMtMwpLJOq7CTIz/PSeq
         Xim6WquJsBkzZFfiVoyN2FgzZLg/Z3rRlhh0SptXQQsnTlMKGet1sHdHQFL5+k71+XXZ
         wD3JdZqNiT7jY9h2itFzKW0vRGoFDsbtdWi7GzSDU0oLNX8Y/wji3vWdAKujQcTKs1zW
         Cihtnt2JPcQQBNiCsYZIXeOL2Y95yglgnh42p52xjCKORcKIAZ8DhSPGe5cAPIVVINgo
         5fGQ==
X-Gm-Message-State: AOAM530TveVzQqf3L6i87rLSkA/6icPJPWNNpjF0ZLyRAruzNs8fnErH
        I3O4/ibb2trKWzv2ELIL3g8Ab30bMrzf9IwGTy0=
X-Google-Smtp-Source: ABdhPJxIiefTGClOgL6uKzDoW9dPMszv+sGDg2sP/uj3oquM0INw+a4VAWftKgyGxyrvyig7wGAOfg==
X-Received: by 2002:a17:90a:4586:: with SMTP id v6mr12088253pjg.36.1625445844499;
        Sun, 04 Jul 2021 17:44:04 -0700 (PDT)
Received: from localhost.lan ([2400:4070:175b:7500::7a7])
        by smtp.gmail.com with ESMTPSA id j2sm10848631pfb.53.2021.07.04.17.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 17:44:03 -0700 (PDT)
Received: from x2.lan (localhost [127.0.0.1])
        by localhost.lan (Postfix) with ESMTPSA id 8FC44900773;
        Mon,  5 Jul 2021 00:44:01 +0000 (GMT)
From:   Vincent Pelletier <plr.vincent@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: gpio: driver.rst: Remove gpiochip_irqchip_add mention
Date:   Mon,  5 Jul 2021 00:43:59 +0000
Message-Id: <5d1823c503629694de74ccd2d823188507c54706.1625445811.git.plr.vincent@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This function was removed in commit f1f37abbe6fc ("gpio: Retire the
explicit gpio irqchip code") but this mention was left behind.
Also, mention that .set_type() only has to set a line handler if the chip
is cascaded, as opposed to hierarchical.

Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>
---
 Documentation/driver-api/gpio/driver.rst | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index d6b0d779859b..bbc53920d4dd 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -547,13 +547,10 @@ To use the helpers please keep the following in mind:
   the irqchip can initialize. E.g. .dev and .can_sleep shall be set up
   properly.
 
-- Nominally set all handlers to handle_bad_irq() in the setup call and pass
-  handle_bad_irq() as flow handler parameter in gpiochip_irqchip_add() if it is
-  expected for GPIO driver that irqchip .set_type() callback will be called
-  before using/enabling each GPIO IRQ. Then set the handler to
-  handle_level_irq() and/or handle_edge_irq() in the irqchip .set_type()
-  callback depending on what your controller supports and what is requested
-  by the consumer.
+- Nominally set gpio_irq_chip.handler to handle_bad_irq. Then, if your irqchip
+  is cascaded, set the handler to handle_level_irq() and/or handle_edge_irq()
+  in the irqchip .set_type() callback depending on what your controller
+  supports and what is requested by the consumer.
 
 
 Locking IRQ usage
-- 
2.32.0

