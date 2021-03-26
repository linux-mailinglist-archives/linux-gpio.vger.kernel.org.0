Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C204B34A30C
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Mar 2021 09:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbhCZIQH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Mar 2021 04:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbhCZIPk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Mar 2021 04:15:40 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D982C0613AA
        for <linux-gpio@vger.kernel.org>; Fri, 26 Mar 2021 01:15:40 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 15so6466710ljj.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 Mar 2021 01:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w9N1329UZmS+6nXYreX7M8TWALnQ3fNu1nppI5AsscM=;
        b=jS6eVx849dxmWICSBs3aac97aluTFE0Ahc9aYiPclV37rl0l10z2MOtK8NzFPba3/g
         vRpIcbAz5kSYvwwt/Bj8b+Q8NR1DijRaxx5RLxjd71eQ2acgTLvXhADu9q9VvnKeiOGY
         WFwqvu1sS1Ifd1IHOzpCvx62gtNjYoP4B3o8FtURYJLnwRKU3YSfrTr+QLSbqS5Lnyjb
         Yspkb2V4EsU8fCQ2TyQelnnuBPeG+gm/8aDlnoRZA9AvTS0C/3FQ9IcMZjSOaA16KsXx
         +ml/n74ODxRUepMgpDMvbed82IqeKlgFyzyzFiFf+HSTbu+Wh7O6ysr7Q6ydpqGOnPny
         M1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w9N1329UZmS+6nXYreX7M8TWALnQ3fNu1nppI5AsscM=;
        b=Ibp2o45Uk2LyOOp6U1w80l2/pdJIrOF3FdlLgnboxvLbRTx+sVElhu/qCKUKH15yDm
         YzCeRieqxwEIEYIbP6d2ZTeVN/OHcRIdmptVSpDhRt5JMQBTPUcEnhO1KrmAczpIA+B9
         cveLHYpBsK1lyH7rpjG2CTTON7COlApU41q9BuelTaIvu02yOGN5Qr5R79NYu+E1ZU0B
         r0kBawstGP6t6R/xdpIQ2oiL30HhMb6d+enuUrJ567gW1AD6HrADged22t8hnt368AgK
         EW3krIFuwD5+93ZWNHWV4g2li1kd47NOgXPjC68pXVwNgRPfxHV8bheHGcv3rMNfIG4v
         3yIw==
X-Gm-Message-State: AOAM530qiaQIlO5eJ0Wi8WlbfEzwHjqN4b2rSPR0YlTI4rlZRlcs/ecl
        3NIwAmqGU1teMYY+PE9B7vJhqHn+j/LLy+12nq4=
X-Google-Smtp-Source: ABdhPJzBdI1L//YoRq4kZ5aBctUxYORuCZqMF4QeSoDO5MQfHINZaf7S/wyOeiJCo6vIYbXpLKC/cA==
X-Received: by 2002:a05:651c:339:: with SMTP id b25mr8209738ljp.406.1616746538377;
        Fri, 26 Mar 2021 01:15:38 -0700 (PDT)
Received: from localhost.localdomain (c-14cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.20])
        by smtp.gmail.com with ESMTPSA id f9sm787100lft.242.2021.03.26.01.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 01:15:37 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: Mention GPIO MUX in docs
Date:   Fri, 26 Mar 2021 09:15:35 +0100
Message-Id: <20210326081535.1679507-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is now a GPIO multiplexer, so mention this in the document
about drivers using GPIO as backend.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/driver-api/gpio/drivers-on-gpio.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/driver-api/gpio/drivers-on-gpio.rst b/Documentation/driver-api/gpio/drivers-on-gpio.rst
index 41ec3cc72d32..af632d764ac6 100644
--- a/Documentation/driver-api/gpio/drivers-on-gpio.rst
+++ b/Documentation/driver-api/gpio/drivers-on-gpio.rst
@@ -96,6 +96,12 @@ hardware descriptions such as device tree or ACPI:
   way to pass the charging parameters from hardware descriptions such as the
   device tree.
 
+- gpio-mux: drivers/mux/gpio.c is used for controlling a multiplexer using
+  n GPIO lines such that you can mux in 2^n different devices by activating
+  different GPIO lines. Often the GPIOs are on a SoC and the devices are
+  some SoC-external entities, such as different components on a PCB that
+  can be selectively enabled.
+
 Apart from this there are special GPIO drivers in subsystems like MMC/SD to
 read card detect and write protect GPIO lines, and in the TTY serial subsystem
 to emulate MCTRL (modem control) signals CTS/RTS by using two GPIO lines. The
-- 
2.29.2

