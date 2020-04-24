Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C64A1B7A4A
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2020 17:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726849AbgDXPlc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Apr 2020 11:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbgDXPla (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Apr 2020 11:41:30 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2377C09B045;
        Fri, 24 Apr 2020 08:41:30 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id e6so4022943pjt.4;
        Fri, 24 Apr 2020 08:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iANNSEEtaSdoRSb2NNbyW8qHMADG1+A2MJpwz58Ug8Y=;
        b=g/zPeq/0IgKGHMnnK66V+XlBJiNYIA1IcF/dqTUCZLPnLc+dEq56MmCwH6kNfk4bfS
         uJ6v3z/mgcGzhiPwf1FOyzyylKrdIEjKP9q365Y+/IYca0/C4jIMe11nwjsY1G+QRX4x
         5TppbOlc/rpJ/fW+EAhMRJ0krlF5ZxT2gninv84+462CZaPFeLSp1FKzVawx6QegrcWs
         skCnCHGOVMKT8iMpcSK4Q+4CELwV5HkrymiyflOS0G/EDGFhh2yorAKePtT+vnsQuYdn
         r0kvV+tH9NdnPJWZG2cfIuaD0P7V6tUvKyZfSdVtID/XIqphpOT03S3TXDnIZXEQZpZR
         gvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iANNSEEtaSdoRSb2NNbyW8qHMADG1+A2MJpwz58Ug8Y=;
        b=XzYUu2xi7m7EUDKfAe0cWj2YiJ1rEq7K68tXNOYIf6jhVPrXp/TPmZKTETm8uY3qsn
         2NL8IR1wTUyHU8EBZIahG5BMaTKv335EcRnVWsAz+/LSNQBiJ11MhWR3+RN23L3bVx3A
         OtXUpmNxspu05iEz72q/iUXmXQ9fGnAbalWzS81kmhUfxQnYvU0nuFb/r1DmGMUzMLJi
         if6qZ1NUb8MMYSn9VgHt/BznE+X+w0J6GQrRiVmf3CMTwJZKJH8yPRMGtfkHEYNN+1kZ
         3oGEbqG9YTtMCEa2v7jhPZrHfatq48tFeCocZI138Hb3vJwwg8qCS3daqQMD2x413RrP
         f+lg==
X-Gm-Message-State: AGi0PubegWJeD+Kfbxf4b3hOzHea+nYBxv/kBJicji7IDeSRjLsXbXgw
        uRTSELL0WcbqexzDKrKeYjw=
X-Google-Smtp-Source: APiQypIurSVxcZoMKqJhRcYDDnKJwoTiQRqndMEEaH891ipAoHbHiqPjN2M+/VJuKxUxvZc535v+kw==
X-Received: by 2002:a17:902:222:: with SMTP id 31mr10117218plc.108.1587742890302;
        Fri, 24 Apr 2020 08:41:30 -0700 (PDT)
Received: from localhost (176.122.158.64.16clouds.com. [176.122.158.64])
        by smtp.gmail.com with ESMTPSA id d14sm6087728pfr.35.2020.04.24.08.41.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Apr 2020 08:41:29 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 1/2] gpio: ftgpio010: Fix small typo
Date:   Fri, 24 Apr 2020 23:41:02 +0800
Message-Id: <20200424154103.10311-2-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200424154103.10311-1-zhengdejin5@gmail.com>
References: <20200424154103.10311-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix a spelling typo in gpio-ftgpio010.c by codespell
s/desireable/desirable/

Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v1 -> v2:
	- split patch v1 (only one patch) into patches for each driver
	  by Bartosz's suggestion. thanks Bartosz.

 drivers/gpio/gpio-ftgpio010.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
index fbddb1662428..4031164780f7 100644
--- a/drivers/gpio/gpio-ftgpio010.c
+++ b/drivers/gpio/gpio-ftgpio010.c
@@ -193,7 +193,7 @@ static int ftgpio_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 	if (val == deb_div) {
 		/*
 		 * The debounce timer happens to already be set to the
-		 * desireable value, what a coincidence! We can just enable
+		 * desirable value, what a coincidence! We can just enable
 		 * debounce on this GPIO line and return. This happens more
 		 * often than you think, for example when all GPIO keys
 		 * on a system are requesting the same debounce interval.
-- 
2.25.0

