Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE8C2EC949
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 05:02:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbhAGEBg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jan 2021 23:01:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbhAGEBg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jan 2021 23:01:36 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A00EEC0612F0;
        Wed,  6 Jan 2021 20:00:55 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id l23so2965761pjg.1;
        Wed, 06 Jan 2021 20:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SNsVbA7u+z0WWeB295LnsjAzVRcGayLFDIRhpibGq3Q=;
        b=RvvIKT1oJj8v+i3uMoVYN9onjsn/nqYuXa0X3QjXX4cof8BZi+RjaQp6Dqp7Pn6unn
         QW3oNJd+t6+wfUmidtWwuSZXVIIZzZZtsNMqQ29UprXOTCylmz20QPq+TDd09phdsxQa
         YhuDeDIFru0kkOckLc2tHNeyaKTYRMp+ZM51h4KtE2njWDX0wYSgEhRkEdf+mO8Pn7eC
         JlQgHKxdxhsvYT87wfXFPvwrshdtODVTAD8NwXMFb1FvsFI0o34cyUmnXdNJvZ79jJNI
         IyFJZvdIjRWpmzpMsvIGv6bUKV0spRjUHkAco/eqaWmfBl/tcc3yvNfzB/QLMTWtxyg/
         UN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SNsVbA7u+z0WWeB295LnsjAzVRcGayLFDIRhpibGq3Q=;
        b=fjpaLCgJiz0Td5qYaRt3Yi1dgez4NQII6y+ITkBaAvN21AuHafjpnwNqbf2QFQpEqm
         /CJH1BxMVESPa5t1dLbZZ9CrP+JCrL8C8hhHF4sh5+FjsTPFb/rgYbDf9LgFYDVkxOWU
         g23gYWVtO5vI5B8j+qSCKzbWk08u6mHMn9Q30ftgqczz5rB0zsUfU5QOfY9n7WJ+IhdT
         oozjVm9ca84JNbOMS4oKiKHCtnACCe0w6wLvxvvlYjvAnbhhhxjfIJhZMJpd2uHpO0ua
         LuFVV88okFxCaElqxrKRrjNkgLYOXUoorGInGPm6DyNCaCYUv9Im048WyMzcofGdIK4i
         jUjQ==
X-Gm-Message-State: AOAM530n+mwsbbyLyjqSTsXTf8gs+Hr1OOcTxg8Jw9g1Fflgl3bkYDHH
        OfkOVqlw4NvV/Pp0oWhU9GexH40RbvEK5g==
X-Google-Smtp-Source: ABdhPJzEFtpl35rSXqNkGR82hcHdzFCjYpGtqHl77/+47ESvereTiLvT6BKBhXk4+IpLA8DqqzSgPA==
X-Received: by 2002:a17:902:d705:b029:db:fbbf:6145 with SMTP id w5-20020a170902d705b02900dbfbbf6145mr414283ply.7.1609992054840;
        Wed, 06 Jan 2021 20:00:54 -0800 (PST)
Received: from sol.lan (106-69-181-20.dyn.iinet.net.au. [106.69.181.20])
        by smtp.gmail.com with ESMTPSA id gk8sm3513551pjb.52.2021.01.06.20.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 20:00:54 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 2/2] tools: gpio: fix %llu warning in gpio-watch.c
Date:   Thu,  7 Jan 2021 12:00:20 +0800
Message-Id: <20210107040020.257671-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210107040020.257671-1-warthog618@gmail.com>
References: <20210107040020.257671-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some platforms, such as mips64, don't map __u64 to long long unsigned
int so using %llu produces a warning:

gpio-watch.c: In function ‘main’:
gpio-watch.c:89:30: warning: format ‘%llu’ expects argument of type ‘long long unsigned int’, but argument 4 has type ‘__u64’ {aka ‘long unsigned int’} [-Wformat=]
   89 |    printf("line %u: %s at %llu\n",
      |                           ~~~^
      |                              |
      |                              long long unsigned int
      |                           %lu
   90 |           chg.info.offset, event, chg.timestamp_ns);
      |                                   ~~~~~~~~~~~~~~~~
      |                                      |
      |                                      __u64 {aka long unsigned int}

Replace the %llu with PRIu64 and cast the argument to uint64_t.

Fixes: commit 33f0c47b8fb4 ("tools: gpio: implement gpio-watch")
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/gpio-watch.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/gpio/gpio-watch.c b/tools/gpio/gpio-watch.c
index f229ec62301b..41e76d244192 100644
--- a/tools/gpio/gpio-watch.c
+++ b/tools/gpio/gpio-watch.c
@@ -10,6 +10,7 @@
 #include <ctype.h>
 #include <errno.h>
 #include <fcntl.h>
+#include <inttypes.h>
 #include <linux/gpio.h>
 #include <poll.h>
 #include <stdbool.h>
@@ -86,8 +87,8 @@ int main(int argc, char **argv)
 				return EXIT_FAILURE;
 			}
 
-			printf("line %u: %s at %llu\n",
-			       chg.info.offset, event, chg.timestamp_ns);
+			printf("line %u: %s at %" PRIu64 "\n",
+			       chg.info.offset, event, (uint64_t)chg.timestamp_ns);
 		}
 	}
 
-- 
2.30.0

