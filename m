Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2502CE9FA
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Dec 2020 09:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727479AbgLDIiT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Dec 2020 03:38:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbgLDIiT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Dec 2020 03:38:19 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99E67C061A52
        for <linux-gpio@vger.kernel.org>; Fri,  4 Dec 2020 00:37:38 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id s9so5636186ljo.11
        for <linux-gpio@vger.kernel.org>; Fri, 04 Dec 2020 00:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kb+N/BiD+8VZLhG5BIu1MXMjUnmAPmkEZ70mPpWWHns=;
        b=Qu9ZyLYSlaTnUm0W8h/57N0QTm49ArZCAa2ep9KVOBgAJpoylLFQuJ3Xx7mfZ/tznJ
         kH+HIrhIm/q4iOC9lPVvnYUgYORIWqqa1U0aYtZloFV4ZkCh+T2Al6Lxuvtg/B08BYxP
         nt6L7HC92fX3/4PbgQHaPGBKolmyCPDYv6F0HFZi9njJ1Hb6Sq0LOU163xVlSpk8kfOe
         m0E3q7z4quHZ/p2AkzzSORWdBBnQlACZESgfpS5Vs49pc2kKQY2KUauuDEShJm+rdE2C
         wQp2s75yV/at9d7IGMcmJnOqofcpNeMxZzmaYhU/wnWHDPEto3NPUxx6vzC4inBhWjK+
         av1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kb+N/BiD+8VZLhG5BIu1MXMjUnmAPmkEZ70mPpWWHns=;
        b=gMTrZiiPgIhSMMcKgi2ulQvZsi0/xNedyHJ6bXk/i4q2DRuSvEwq5UOvLNP+99hfx6
         ipHUPoruTP1eDL11ZCURQPyQPcblOW3CwMWqQVu8B4gFGnb40Kx1hsYyZLaxp2Z/wsMD
         8v330bhLJJz5Mb6sdnXZWUeUabvIGB7w8Hl2SoJFK45eqQNy2EysHtIEeB8PqaZleGQy
         dOyrXuxb9xUx9DEmj/voL9D7ZR6MI3gfBgj0k8LYj77igGcuaqWEeF8szpYDAhMIx2nG
         +hxvEKZc6op+Got2zEjgtVT6lgDZ3N6rsXc59e4dydfETvp+/gmLYHe/er7MDYpyxj37
         Txgg==
X-Gm-Message-State: AOAM531O7AYNW80mKG/UsK/sLT0yO5Z7NejsNqFfxgNOjxvQYSkT8Crq
        FuSmzmcMtpYa0SAJ4+Y9lUoIeLAXS3G30Xf0
X-Google-Smtp-Source: ABdhPJza8rjFOxM2B4TjmFeYzFseMOaK8uDrVu+u6np2VgctFAo1tsj7PBUVot135ScLMiY/nMqXDA==
X-Received: by 2002:a2e:8496:: with SMTP id b22mr2994298ljh.252.1607071056990;
        Fri, 04 Dec 2020 00:37:36 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id q5sm1426795ljc.46.2020.12.04.00.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 00:37:36 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: Add TODO item for debugfs interface
Date:   Fri,  4 Dec 2020 09:35:33 +0100
Message-Id: <20201204083533.65830-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The idea to create a debugfs to replace the aging and
dangerous sysfs ABI for hacking and tinkering came up
on the list.

Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/TODO | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index cd04e0b60159..b49ad263c516 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -142,3 +142,39 @@ use of the global GPIO numbers. Once the above is complete, it may
 make sense to simply join the subsystems into one and make pin
 multiplexing, pin configuration, GPIO, etc selectable options in one
 and the same pin control and GPIO subsystem.
+
+
+Debugfs in place of sysfs
+
+The old sysfs code that enables simple uses of GPIOs from the
+command line is still popular despite the existance of the proper
+character device. The reason is that it is simple to use on
+root filesystems where you only have a minimal set of tools such
+as "cat", "echo" etc.
+
+The old sysfs still need to be strongly deprecated and removed
+as it relies on the global GPIO numberspace that assume a strict
+order of global GPIO numbers that do not change between boots
+and is independent of probe order.
+
+To solve this and provide an ABI that people can use for hacks
+and development, implement a debugfs interface to manipulate
+GPIO lines that can do everything that sysfs can do today: one
+directory per gpiochip and one file entry per line:
+
+/sys/kernel/debug/gpiochip/gpiochip0
+/sys/kernel/debug/gpiochip/gpiochip0/0
+/sys/kernel/debug/gpiochip/gpiochip0/1
+/sys/kernel/debug/gpiochip/gpiochip0/2
+/sys/kernel/debug/gpiochip/gpiochip0/3
+...
+/sys/kernel/debug/gpiochip/gpiochip1
+/sys/kernel/debug/gpiochip/gpiochip1/0
+/sys/kernel/debug/gpiochip/gpiochip1/1
+...
+
+The exact files and design of the debugfs interface can be
+discussed but the idea is to provide a low-level access point
+for debugging and hacking and to expose all lines without the
+need of any exporting. Also provide ample ammunition to shoot
+oneself in the foot, because this is debugfs after all.
-- 
2.26.2

