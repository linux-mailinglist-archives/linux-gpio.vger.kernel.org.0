Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64E0A4901EE
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jan 2022 07:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232546AbiAQG0A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jan 2022 01:26:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231851AbiAQG0A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jan 2022 01:26:00 -0500
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F96C061574
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jan 2022 22:26:00 -0800 (PST)
Received: by mail-ua1-x930.google.com with SMTP id c36so28497788uae.13
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jan 2022 22:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FO4j8KLwE8gKUbzhAFnlAjvOPvLIjD9leIua54zdSlk=;
        b=hFnC6KRFkrwiaOJznuqImV/SF6vApa+d3xf0nZ+eNfda5TSmv32TaLw//owePnZZaL
         rf9KmsnS/w2Tmxg5hNFYk9eEIPSJx+wXRo1F7uzukT/j7wjLuKFGHBtgDmNXGfs9t1gX
         ZoR46nIzFBYqjFl7Kdk82JkQ+CyiyZEoQVL6j2vjaGI8OdW80Eri36mcrjdd96SXJ0Ch
         RcOeq/MsPajysLoxF900nh9bm5TeA5isXtZAoL55GpZW/0BRkgXfUksoCi5DtjxQt4aW
         c0+Vm4SvPkFXFkCfVFJji1DDF8vZuSATnxKVpLG73BK4GytiR+/4jUK+PY2IRST6pjN6
         7INQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=FO4j8KLwE8gKUbzhAFnlAjvOPvLIjD9leIua54zdSlk=;
        b=avhY81ErBa5t9Vd/aeb2gKws1Fx7xv97szTk4VY3A7PXptL3haTklWlt3J8QwA9OqH
         3OaRH+4r5kgyKwZAcnzdbzIr3b8wfqfkE8ROomDWjidsTfAtXl4SHUbVBtqEAq9VTavz
         r2oahnlFQTEzJtjhf3KQjYQnlY72fJb5LbC4vCLzLVMRF5Mf31D3sjs0AIQTlRNh0Ih1
         DashAKKJ0kbOv8fJt7HVpRH7m6lSFBOXwUYKmDHvHHbQUZsv4Ev98/P1R0/UVKm2tIFF
         dwpTIiZD0pGN/vRm+kxiBXACQt2Fb6DWKQJFlvCU4xTbHPSYARDkwLMfoEbX5r7f9NSJ
         mUPA==
X-Gm-Message-State: AOAM5306T13mt4S+ylrFGRhAFdYDZC7KD55QhgadzPeeRSXjX62fdEXE
        M58q00v//8vy5Byc0WYkanU=
X-Google-Smtp-Source: ABdhPJyG58RYYZ1b3ghIyFRZk49CudAZzL+G+q6tQNrOKHNOMPi0A7r2tZHSAFhBy3DzleeLZRr56Q==
X-Received: by 2002:a05:6102:50ac:: with SMTP id bl44mr7280169vsb.63.1642400759474;
        Sun, 16 Jan 2022 22:25:59 -0800 (PST)
Received: from kubuntu-desktop.. ([67.8.38.84])
        by smtp.gmail.com with ESMTPSA id u7sm332653vsg.34.2022.01.16.22.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jan 2022 22:25:58 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
From:   Julian Braha <julianbraha@gmail.com>
To:     linus.walleij@linaro.org, jonas.gorski@gmail.com,
        noltari@gmail.com, f.fainelli@gmail.com, rdunlap@infradead.org,
        rafal@milecki.pl
Cc:     linux-gpio@vger.kernel.org, fazilyildiran@gmail.com
Subject: [PATCH] pinctrl: bcm63xx: fix unmet dependency on REGMAP for GPIO_REGMAP
Date:   Mon, 17 Jan 2022 01:25:57 -0500
Message-Id: <20220117062557.89568-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When PINCTRL_BCM63XX is selected,
and REGMAP is not selected,
Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for GPIO_REGMAP
  Depends on [n]: GPIOLIB [=y] && REGMAP [=n]
  Selected by [y]:
  - PINCTRL_BCM63XX [=y] && PINCTRL [=y]

This is because PINCTRL_BCM63XX
selects GPIO_REGMAP without selecting or depending on
REGMAP, despite GPIO_REGMAP depending on REGMAP.

This unmet dependency bug was detected by Kismet,
a static analysis tool for Kconfig. Please advise
if this is not the appropriate solution.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/pinctrl/bcm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
index 5123f4c33854..ac1e400bbbac 100644
--- a/drivers/pinctrl/bcm/Kconfig
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -35,6 +35,7 @@ config PINCTRL_BCM63XX
 	select PINCONF
 	select GENERIC_PINCONF
 	select GPIOLIB
+	select REGMAP
 	select GPIO_REGMAP
 
 config PINCTRL_BCM6318
-- 
2.32.0

