Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 920D622D4C2
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 06:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbgGYEWu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 00:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbgGYEWu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jul 2020 00:22:50 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 039BFC0619D3;
        Fri, 24 Jul 2020 21:22:50 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f185so1407947pfg.10;
        Fri, 24 Jul 2020 21:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tGkltFit3K7g7k1//vgFEgQZYISfSUhb2iX/G5hqJHY=;
        b=Gix36+EVtDY759LpUVWtuQ/+pO0KCgnmqRqpxyozUFBxBIkCt44rIS2/k34VJSzHkz
         DBPfJRutBMNOlJlLlQmiy9QsILKOP9D7HmjsuIEE+QqcNaS5NtnuEjkLIMnvyV1yQZb8
         V6bnxlTRyasZmxYRaYBXdfhi+edXAp5LpRlHUotFhKs6vCAkMqi7ExQtWP/ZFY+fzEUk
         f69ztX+r+eOZgoRgzDGDacfVxrjdYHrt8UC/0SPUURTVwugLE0rN2qid+uu+GN+cOaDv
         ZXbcNWmIAli9EH54YQkC886b0RXbqvfvAAGUHPjf+r+477vsAmNXBjIVeg33a++Ith6r
         A9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tGkltFit3K7g7k1//vgFEgQZYISfSUhb2iX/G5hqJHY=;
        b=M2BTGVwqfrKdBgKnpo9m5jlDmQ0GN0V6M9iTWxB5skCfWd+sHnWUc7+JAMThMTO06W
         ke0njQljJtS5QcJ54NTkRUH+tm5lzpRj0eyMb4OkXUK5+ruV5nunYIFZHeQClkdQ3SzN
         hb0X0Y4HxJY6CscludvmMjVIF2dj8h25OwdCjrw3N6gtjNxbzBzlipyH08EyqO39Jud5
         QQThqxsgcNIde+Sx021wts8C0rlrJUdjgUqotCR5eFwUu1obDLX9PMiAUferb3onqoeq
         SS02SmKeSLab3pjNbTH2fNOJPakmym2qQeJuqyFYpKUAFiTm3LppQr5tGBJ1Dm9l91Dk
         7wYA==
X-Gm-Message-State: AOAM533kS4CkDJhroZcYFNj1TM5ddyzpeMgEoepdZ0gPDQ5dWCCgDQ4F
        h3i1rbJ4TY784kqYbiYy4xqJZczr
X-Google-Smtp-Source: ABdhPJwMoWcv+6rMavrFGpvHTAxSGpRBTkHmpK2RsegNL0ldijDoGj26Pe19yPrpJOwb2wh3+6NlBQ==
X-Received: by 2002:a63:1b4b:: with SMTP id b11mr10833796pgm.243.1595650969162;
        Fri, 24 Jul 2020 21:22:49 -0700 (PDT)
Received: from sol.lan (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id p1sm885320pjp.10.2020.07.24.21.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 21:22:48 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 17/18] tools: gpio: add debounce support to gpio-event-mon
Date:   Sat, 25 Jul 2020 12:19:54 +0800
Message-Id: <20200725041955.9985-18-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200725041955.9985-1-warthog618@gmail.com>
References: <20200725041955.9985-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for debouncing monitored lines to gpio-event-mon.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/gpio-event-mon.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index 5da980f78881..b64427d78942 100644
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
 
@@ -147,11 +148,11 @@ int main(int argc, char **argv)
 	unsigned int line = -1;
 	unsigned int loops = 0;
 	struct gpioline_config config;
-	int c;
+	int c, attr;
 
 	memset(&config, 0, sizeof(config));
 	config.flags = GPIOLINE_FLAG_V2_INPUT;
-	while ((c = getopt(argc, argv, "c:n:o:dsrf?")) != -1) {
+	while ((c = getopt(argc, argv, "c:n:o:b:dsrf?")) != -1) {
 		switch (c) {
 		case 'c':
 			loops = strtoul(optarg, NULL, 10);
@@ -162,6 +163,14 @@ int main(int argc, char **argv)
 		case 'o':
 			line = strtoul(optarg, NULL, 10);
 			break;
+		case 'b':
+			attr = config.num_attrs;
+			config.num_attrs++;
+			gpiotools_set_bit(config.attrs[attr].mask, 0);
+			config.attrs[attr].attr.id = GPIOLINE_ATTR_ID_DEBOUNCE;
+			config.attrs[attr].attr.debounce_period =
+				strtoul(optarg, NULL, 10);
+			break;
 		case 'd':
 			config.flags |= GPIOLINE_FLAG_V2_OPEN_DRAIN;
 			break;
-- 
2.27.0

