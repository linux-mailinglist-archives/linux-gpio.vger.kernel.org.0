Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C863020F5C3
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 15:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732879AbgF3Ne1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 09:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388188AbgF3NeC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 09:34:02 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EB87C03E97E
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 06:34:01 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z15so8920569wrl.8
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 06:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Aqos2NxgL6TqV6vtAHFj09o8FM67bpNGP+lJI0qHUic=;
        b=tUr7wg3Wznr91hdBXq50eNTGAccm33bM6tBl1CH1AYKPp7JvNXSuZ0fLootAup+nLZ
         7xkoMJq1lUn19jzjKvVfTuaHmloQm+V871dkMcRy9T/bH3j7+hJYql6Pv+wj15mhtdHE
         z+p3HQuk511W60JvRiiE4ZaHUMC3YYw6cpfddvAPSL7oz94GQ5JxL/eIwpYYN7AI7zER
         02C7um3AfjHlBzqoZ7eQY2pLhJAu4hgYRRVaj6miRKRa0ZaL2ZCGcKELxqLOX9qJJhcc
         kU1S0ht8R33R/0IqyPDqJyOcr1Rc3GifN2tOTQKD40fTDw1T9liHtszfTp2Uvn3pJlru
         HMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Aqos2NxgL6TqV6vtAHFj09o8FM67bpNGP+lJI0qHUic=;
        b=WBpfl2CUbuBTkDAfmgN/HgEhfT0O+4Txma16EA5EUfq4jrlpcgHBc3MeMAWlG5iGI7
         JNwPDPdKcYFWOW44CNZ4iubGwnxiSs/hbEG42krpJF+C/Dk0QP4i251frr3SmKFkS8/g
         plQm3+A8C0QpyGx4b99ZxNR0pus67W8AAEHyhs9K6idcKPB+hpWU30S2ul1sAjXmMC4w
         b5b3olrD84G8D3qxaWcWzl43A4EAm9klYz3hZA67CtYcTre+TVXyVvDRItqC53vfQ/io
         n2kWIfnPJ4F55oQaNoBMEN4xtukucf3ZVPIxsfr8ay3UhddmqYm3LPPE9YGNH2bFpaxS
         4gSQ==
X-Gm-Message-State: AOAM533wfPO23oiArj5cLECEQYon9d09RrgpYGMkGNhzkJwEQgJ62hBd
        uhqREm7FKxgLd+m+F2cfPG5smA==
X-Google-Smtp-Source: ABdhPJx9WxsVZ5j6ppbW2LpfgLfGN/iYhXnS9SqvRlEbRO7i3cfvBgwP5qkADNjWMaQO/b1FJ/QXnQ==
X-Received: by 2002:a5d:68c7:: with SMTP id p7mr23139275wrw.16.1593524039424;
        Tue, 30 Jun 2020 06:33:59 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id z16sm3682464wrr.35.2020.06.30.06.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 06:33:58 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Asmaa Mnebhi <Asmaa@mellanox.com>
Subject: [PATCH 10/10] gpio: gpio-mlxbf2.c: Provide __releases() annotation to stop confusing Sparse
Date:   Tue, 30 Jun 2020 14:33:45 +0100
Message-Id: <20200630133345.2232932-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200630133345.2232932-1-lee.jones@linaro.org>
References: <20200630133345.2232932-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sparse cannot peer into other functions to see when and if locks are
acquired and released, thus it simply warns that a 'context imbalance'
is detected instead.  Let's be kind to Sparse and let it know that
this behaviour is intentional.

 drivers/gpio/gpio-mlxbf2.c:125:12: warning: context imbalance in 'mlxbf2_gpio_lock_acquire' - different lock contexts for basic block
 drivers/gpio/gpio-mlxbf2.c:151:13: warning: context imbalance in 'mlxbf2_gpio_lock_release' - unexpected unlock

Cc: Asmaa Mnebhi <Asmaa@mellanox.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpio/gpio-mlxbf2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index 861a8d0a84be0..befa5e1099439 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -149,6 +149,8 @@ static int mlxbf2_gpio_lock_acquire(struct mlxbf2_gpio_context *gs)
  * Release the YU arm_gpio_lock after changing the direction mode.
  */
 static void mlxbf2_gpio_lock_release(struct mlxbf2_gpio_context *gs)
+	__releases(&gs->gc.bgpio_lock)
+	__releases(yu_arm_gpio_lock_param.lock)
 {
 	writel(YU_ARM_GPIO_LOCK_RELEASE, yu_arm_gpio_lock_param.io);
 	spin_unlock(&gs->gc.bgpio_lock);
-- 
2.25.1

