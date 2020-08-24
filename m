Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A35A24FE86
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Aug 2020 15:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgHXNF4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Aug 2020 09:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbgHXNFz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Aug 2020 09:05:55 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F474C061573
        for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2020 06:05:55 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id 92so619846qtb.6
        for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2020 06:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=SvUmuq07cN6CHddvuhfu2zbq2U7tNZknk9FxYsDKjyI=;
        b=lmWphiTRpwMtzXCkCMpPT8DERX/x+QS5UPzIIoQxzPeVshJTTOM21E3bg7qhwtsP8L
         Y7XAkRlB3bTzqI0G2MsSEzUC8nXsMcEgjNN6NiHyEEh5ByG9ePRGanTLttf3333v7z/V
         /Tjbab0z4S7+7M+reyaIdqjuY/LSTcPJyukJYnGRFvD7mPk0bzCi3NUeLi4b+AcbhZOq
         evNu2k+KFls54qL3Y9Is3svzePsRwfEllHx3/VKI/yjQcODXcBIFcHm83YTtRbAQ6BG+
         trgP1c3kgDTepSQ0yZzzVdP3+F1ZUTWRsT+bT4D0MkhXj9CW+8bSqrkruEu2EAsi4oPe
         qa2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SvUmuq07cN6CHddvuhfu2zbq2U7tNZknk9FxYsDKjyI=;
        b=S0jkQncmfpnKTpDfUwGP2yIu2idB65pcLr6BG/ZNN5g1BB9f7328mpbzSlLQZflHw0
         S2s5GEqTL5Iy8SbSjLQsUr9Gio0I0CDZJSh9qj1fbyrFfczm0sYKcjlRYYmD/gSyPZnt
         ugGlL6e2OgUBgf6fMB121n+HsuqZiZuf6QVUiUOkymyiYF6XmzS3bcUozatFDiJP1Wv9
         PGmSDE1Marvb83GXe+gkSeZu906PB8INiSWQJUdJvH497GEcljBZXPBHt/l/HG1ljlYF
         ObM+j/6oL8bvD5h6PH8i85RYnXv13mGnguUJc4/IX8VJLb4HYnV49AwhTu8hBAD1VlCl
         P4ag==
X-Gm-Message-State: AOAM5328j+sX/JppYBRS/vpHf4tTtqfYBDjXRB+GBZ6s6xOoVut0M0DW
        ScP9oEqmGvpmw1OOK+NyDtw=
X-Google-Smtp-Source: ABdhPJyOiUxo6mM8agiybOhydZyZ6cxELeuuOYpiu7dGx6WsV+jeE+g6UJb/8iaEQrpoK3KJuzsztg==
X-Received: by 2002:ac8:724e:: with SMTP id l14mr4624776qtp.144.1598274354178;
        Mon, 24 Aug 2020 06:05:54 -0700 (PDT)
Received: from localhost.localdomain ([177.194.72.74])
        by smtp.gmail.com with ESMTPSA id 19sm1379622qkj.123.2020.08.24.06.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 06:05:53 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     linus.walleij@linaro.org
Cc:     grygorii.strashko@ti.com, khilman@kernel.org, tony@atomide.com,
        linux-gpio@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] gpio: omap: Pass __maybe_unused to the suspend()/resume() hooks
Date:   Mon, 24 Aug 2020 10:03:27 -0300
Message-Id: <20200824130327.21113-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When building a defconfig that does not have CONFIG_PM_SLEEP
selected, the following build warnings are seen:

drivers/gpio/gpio-omap.c:1531:12: warning: 'omap_gpio_resume' defined but not used [-Wunused-function]
drivers/gpio/gpio-omap.c:1519:12: warning: 'omap_gpio_suspend' defined but not used [-Wunused-function]

Pass __maybe_unused to avoid these warnings.

Fixes: f02a03985d06 ("gpio: omap: Add missing PM ops for suspend")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/gpio/gpio-omap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 7fbe0c9e1fc1..0ea640fb636c 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1516,7 +1516,7 @@ static int __maybe_unused omap_gpio_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int omap_gpio_suspend(struct device *dev)
+static int __maybe_unused omap_gpio_suspend(struct device *dev)
 {
 	struct gpio_bank *bank = dev_get_drvdata(dev);
 
@@ -1528,7 +1528,7 @@ static int omap_gpio_suspend(struct device *dev)
 	return omap_gpio_runtime_suspend(dev);
 }
 
-static int omap_gpio_resume(struct device *dev)
+static int __maybe_unused omap_gpio_resume(struct device *dev)
 {
 	struct gpio_bank *bank = dev_get_drvdata(dev);
 
-- 
2.17.1

