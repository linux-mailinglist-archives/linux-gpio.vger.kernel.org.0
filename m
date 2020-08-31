Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B11F7257212
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 05:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgHaDVb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 Aug 2020 23:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727017AbgHaDV2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Aug 2020 23:21:28 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE447C061573;
        Sun, 30 Aug 2020 20:21:27 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id o20so950709pfp.11;
        Sun, 30 Aug 2020 20:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fedQaMAad6gJKi/QRC5xP0GL2BO40HvVvA1rAXDD1oY=;
        b=uMpewtv7PaRVZb3Mcp0C6UTqYyOUR6X6XXIfkXciLP0li4oIkRv03CUX8tE26X3lPF
         lgq98XHKd+659g+6UeBfsf2035wsBs6r5fOdD0JT3vQUILl9y/eIGyC99Y9Q4bFlVdef
         8bLb71Idz/A0K6PasF2giFy/LAO+JfKpRDX9c+TYgJJVIJcNW3UaTdT/7ScqvFor83E4
         HpyncVvDHb0K8sGyy2Swtcl/LIRZwHmO9S8IL4OJggbisx9r4hwpeYYmxO1fxbIZt9jL
         gUnkSTOhvOZhSy0r8jUHBOd7VP2OH/DTOKtb6WBQGXvbiI4KTAeGPWDiIimHMkEVlot2
         AWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fedQaMAad6gJKi/QRC5xP0GL2BO40HvVvA1rAXDD1oY=;
        b=m+PSq4BZdAjQ4tLTP2yhnp9IteHx3tvBN2JIZOyPducPHwPfOFvZHnz+S6se0L/apG
         jvPxdBH3x3VozgGvVRrk/Hz80FSVPeF5q/EeCIe8CEzIdR1hPvSMRMbJwT9dKRU8tAGR
         B0Dwd6M64u6d3Pvfu0yXcmu0qHKYk55jMPMILi87Y6lKi9hmYlb0HdLqEzX33xZMR9r7
         R0Fjyid7pmULC2ycvh30DA6XboRBweWrFPUHuq4zwr/OZUsktu2N9ya/xQF+IReQqTWo
         RWMRdMuzvK/3FMfnTj8dVW1HhxPp27Tgp78YNVFj7JTHo7iAHgRX8I5tatOj3uG4zaAn
         1KXw==
X-Gm-Message-State: AOAM533+ei/fubxg7H1D7M52bFsvaLyhDAvs/7/TMDEyeYJusffV+mWn
        GaZHA7Lx8ELtYM7gpVn53i8v+3gv354=
X-Google-Smtp-Source: ABdhPJxT3m0YGzOaOuE9LBz1QIeV2n+QEULjKqrylCX3NLzGhQgi8zcDjecHEmYKBwICqVNj3cofUA==
X-Received: by 2002:a63:fe54:: with SMTP id x20mr6550021pgj.438.1598844087031;
        Sun, 30 Aug 2020 20:21:27 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id z17sm6095733pfq.38.2020.08.30.20.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 20:21:26 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v6 01/20] gpiolib: cdev: desc_to_lineinfo should set info offset
Date:   Mon, 31 Aug 2020 11:19:47 +0800
Message-Id: <20200831032006.1019978-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831032006.1019978-1-warthog618@gmail.com>
References: <20200831032006.1019978-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Set the value of the line info offset in desc_to_lineinfo, rather than
relying on it being passed in the info.  This makes the function behave
as you would expect from the name - it generates the line info
corresponding to a given GPIO desc.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

There are some instances where this results in the offset being set when
it is already set in the info, but this is clearer especially considering
that, as part of the replacement of strncpy with strscpy and to ensure
kernel stack cannot be leaked to userspace, the info is initially zeroed
in a subsequent patch.

 drivers/gpio/gpiolib-cdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index e6c9b78adfc2..e95e3eab9867 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -752,6 +752,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	bool ok_for_pinctrl;
 	unsigned long flags;
 
+	info->line_offset = gpio_chip_hwgpio(desc);
 	/*
 	 * This function takes a mutex so we must check this before taking
 	 * the spinlock.
@@ -933,7 +934,6 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 		return NOTIFY_DONE;
 
 	memset(&chg, 0, sizeof(chg));
-	chg.info.line_offset = gpio_chip_hwgpio(desc);
 	chg.event_type = action;
 	chg.timestamp = ktime_get_ns();
 	gpio_desc_to_lineinfo(desc, &chg.info);
-- 
2.28.0

