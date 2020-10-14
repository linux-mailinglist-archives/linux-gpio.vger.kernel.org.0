Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE6BF28EA54
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 03:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389122AbgJOBji (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 21:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389064AbgJOBjh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 21:39:37 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46EC8C05113F;
        Wed, 14 Oct 2020 16:12:32 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id q21so581227pgi.13;
        Wed, 14 Oct 2020 16:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=35fYZ5fGVbU2fwG24QMeC4xi8klfAcZjjBgE7NnhZ48=;
        b=RwuteCnhfi17fv1zs7LBl62j31eLJVMldVwMOoSc28MyYP3Cy9Z0BEGi2Wgbcs74aO
         Cn6pyJReUkmWJmGuDMr9/16AmqxOUcLd7ZEB49fJPU8kM9xDNVgk4rUncysh7b0orHLz
         L+fTJ8W17W169El0IrNg1HIc9To9j8UUiJjpJau9BEOwxaAP5G8eXNP3i/RW22uiNUes
         VczmcP6zrmERwxYOW5NUkbvQEVp0ciSoKomgsNdBY2q1zzmXjAHHP/9Txm0uyiwCR+0g
         x0GrHfn+zdR9mVrQ8w0HfBI3TXV6NFuz8dibsmy19fEjhSRacXYIG/mdqhwrlNOZLxJV
         bH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=35fYZ5fGVbU2fwG24QMeC4xi8klfAcZjjBgE7NnhZ48=;
        b=tTCahFcFkKoG8VAmT6C/4lAGXrcJF/TJfT+tbpd5OE5ST9yKneVKPakOCWoKe7OAKO
         nCqtd1S1v3jfG7Yr/TLd2YB3A3BNrY5ZqFff8yHK0JhFQ+W0TCZPalJ+kVi5HguBNZ0J
         CU36kvQjV3E1FRGtS5D3FXD1q9I2X0aNnS7HtR7PMi1Wh6rfRYxc9w/4OErIcV1fLVzY
         RaHkcQAEZfBZjoxTOdbHBLJH4qqxvEetOZs2qOSBojupV6Ap2lrGUbs8W6NoCIwt1DHa
         8XE6Lv0sncmd4LCMDbfUt2L9EguCrOzuZX4heARJ3HOMU1eIUBmIYKbqz0LXSHq/c+BO
         ln/w==
X-Gm-Message-State: AOAM530vWffDJ9xUfJxuxtO/hR+YwtFPVfp5q6OvMREyBAfmtB2S5EFj
        Ur3dZgQJKC8KHTyWEXqE1sTGalF0Wk9PiA==
X-Google-Smtp-Source: ABdhPJzPhzFk5l2hKTgx58KjumsE5OHLnayybtAifx5PWFJjAtI7gS2r8EVq6abFbQXDNcG1xNb6+Q==
X-Received: by 2002:a62:7cd4:0:b029:154:f9ee:320b with SMTP id x203-20020a627cd40000b0290154f9ee320bmr1505877pfc.26.1602717151392;
        Wed, 14 Oct 2020 16:12:31 -0700 (PDT)
Received: from sol.lan (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id e5sm723157pjd.0.2020.10.14.16.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 16:12:30 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 3/3] tools: gpio: add option to report wall-clock time to gpio-event-mon
Date:   Thu, 15 Oct 2020 07:11:58 +0800
Message-Id: <20201014231158.34117-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201014231158.34117-1-warthog618@gmail.com>
References: <20201014231158.34117-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for selecting the realtime clock for events.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/gpio-event-mon.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index 90c3155f05b1..cacd66ad7926 100644
--- a/tools/gpio/gpio-event-mon.c
+++ b/tools/gpio/gpio-event-mon.c
@@ -148,6 +148,7 @@ void print_usage(void)
 		"  -s         Set line as open source\n"
 		"  -r         Listen for rising edges\n"
 		"  -f         Listen for falling edges\n"
+		"  -w         Report the wall-clock time for events\n"
 		"  -b <n>     Debounce the line with period n microseconds\n"
 		" [-c <n>]    Do <n> loops (optional, infinite loop if not stated)\n"
 		"  -?         This helptext\n"
@@ -173,7 +174,7 @@ int main(int argc, char **argv)
 
 	memset(&config, 0, sizeof(config));
 	config.flags = GPIO_V2_LINE_FLAG_INPUT;
-	while ((c = getopt(argc, argv, "c:n:o:b:dsrf?")) != -1) {
+	while ((c = getopt(argc, argv, "c:n:o:b:dsrfw?")) != -1) {
 		switch (c) {
 		case 'c':
 			loops = strtoul(optarg, NULL, 10);
@@ -204,6 +205,9 @@ int main(int argc, char **argv)
 		case 'f':
 			config.flags |= GPIO_V2_LINE_FLAG_EDGE_FALLING;
 			break;
+		case 'w':
+			config.flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
+			break;
 		case '?':
 			print_usage();
 			return -1;
-- 
2.28.0

