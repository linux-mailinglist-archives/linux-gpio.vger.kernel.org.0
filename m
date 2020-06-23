Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2138120485D
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 06:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732351AbgFWEDe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 00:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732407AbgFWEDd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 00:03:33 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E6E1C061573;
        Mon, 22 Jun 2020 21:03:33 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id p3so6572895pgh.3;
        Mon, 22 Jun 2020 21:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+tTmPQpunlSSbQK0Pbq+5tZ7Bo8k9MZ8zGXj11uq1g8=;
        b=W+zyW+cG1VvApwhl64/raneJjBUL+tYXKS9S6IdEmJtu3zVoyBU1N3B7Ysh4+e5Lxs
         yFjzrPnpGewZDLHupG1XmgCCfiULOjNf7rn3JurZ07ZaS2AGrfnUMDqtX5EM4L4rONB4
         09Zy1092ZyJ6hW/EIJZ1HMXJbAxphKntkfnBqvcWgNqNyDhwUIJRZYN4aKiYuA7K2w0g
         bvUtr+5dXAfuNTIPqfWvbyOYcRlnJL3b383f855IJMWZw+VyXJ2Fcxy3nwsAceYB+8dS
         AheD5b3GKsgwaoy0KgaXGV0k2oWU/+uE1pFvaEJUv12+8LzK/SiKnRpBqpeYXjrATnam
         +c6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+tTmPQpunlSSbQK0Pbq+5tZ7Bo8k9MZ8zGXj11uq1g8=;
        b=ZDz6JS594HXmnZjqvReJYVkpnK8houaP4tf/xDY29T2Kda2dng7FyIwYDwTRogqs29
         pr6uGN6yZLqoLGL6rygySRvGeGLzT59XjXIE9SDtuJcgacule7BgoDZoonkYIOylI86W
         tjQaSrvReu5GIaP7a1NrUaNUX/hb6bb0iTkVsm+2l5+cEDppPac3Um23v1wld2d2wtZi
         JRa5cu2huBzPfvchE4vrsIzCIl/eo42zZAUIbFo4BNsSLeZ/NdKHspNCQHUO5qXH53eA
         5v+DjXG8FqluQxgu0mJpxuy6m6mQPaxdPenFJra1z3SXslJaiWkXckkuJbdoPzLlF1w1
         u9vQ==
X-Gm-Message-State: AOAM531fgBze3V0mhDvr2oVyWqEsbtsfvUdAe2B6okzJWCEezjrJtzLP
        Rjz5zzVP0fUHzY/BmnL2K1ank4llDZE=
X-Google-Smtp-Source: ABdhPJwf2KKQ/2r78LLFpFtpaXxhAQqRcwNvV4WHmgpvmvPmkMakJbOiMK0CaEWk4IVrmz18L4q38Q==
X-Received: by 2002:a63:214d:: with SMTP id s13mr14987506pgm.277.1592885012642;
        Mon, 22 Jun 2020 21:03:32 -0700 (PDT)
Received: from sol.lan (220-235-126-59.dyn.iinet.net.au. [220.235.126.59])
        by smtp.gmail.com with ESMTPSA id n64sm12442315pga.38.2020.06.22.21.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 21:03:32 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 21/22] tools: gpio: add debounce support to gpio-event-mon
Date:   Tue, 23 Jun 2020 12:01:06 +0800
Message-Id: <20200623040107.22270-22-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623040107.22270-1-warthog618@gmail.com>
References: <20200623040107.22270-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for debouncing monitored lines to gpio-event-mon.

Signed-off-by: Kent Gibson <warthog618@gmail.com>

---
 tools/gpio/gpio-event-mon.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index d8d692f67b9e..ec90e44389dc 100644
--- a/tools/gpio/gpio-event-mon.c
+++ b/tools/gpio/gpio-event-mon.c
@@ -129,11 +129,12 @@ void print_usage(void)
 		"  -s         Set line as open source\n"
 		"  -r         Listen for rising edges\n"
 		"  -f         Listen for falling edges\n"
+		"  -b <n>     Debounce the line with period n microseconds\n"
 		" [-c <n>]    Do <n> loops (optional, infinite loop if not stated)\n"
 		"  -?         This helptext\n"
 		"\n"
 		"Example:\n"
-		"gpio-event-mon -n gpiochip0 -o 4 -r -f\n"
+		"gpio-event-mon -n gpiochip0 -o 4 -r -f -b 10000\n"
 	);
 }
 
@@ -148,7 +149,7 @@ int main(int argc, char **argv)
 	memset(&config, 0, sizeof(config));
 	config.flags = GPIOLINE_FLAG_V2_DIRECTION | GPIOLINE_FLAG_V2_EDGE_DETECTION;
 	config.direction = GPIOLINE_DIRECTION_INPUT;
-	while ((c = getopt(argc, argv, "c:n:o:dsrf?")) != -1) {
+	while ((c = getopt(argc, argv, "c:n:o:b:dsrf?")) != -1) {
 		switch (c) {
 		case 'c':
 			loops = strtoul(optarg, NULL, 10);
@@ -159,6 +160,10 @@ int main(int argc, char **argv)
 		case 'o':
 			line = strtoul(optarg, NULL, 10);
 			break;
+		case 'b':
+			config.flags |= GPIOLINE_FLAG_V2_DEBOUNCE;
+			config.debounce_period = strtoul(optarg, NULL, 10);
+			break;
 		case 'd':
 			config.flags |= GPIOLINE_FLAG_V2_DRIVE;
 			config.drive = GPIOLINE_DRIVE_OPEN_DRAIN;
-- 
2.27.0

