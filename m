Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75B772EC947
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 05:02:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726507AbhAGEBa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jan 2021 23:01:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbhAGEBa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jan 2021 23:01:30 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DFCFC0612F3;
        Wed,  6 Jan 2021 20:00:50 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id x12so2802648plr.10;
        Wed, 06 Jan 2021 20:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hDA/uULkDvI6EhqblCMC0A+pznSnR5WfzYl1DK+QJzA=;
        b=tAPGeZe6jjf3u2R2PvzEeXf32ItDvpUCX2MWOR2nZRRoMgBlaColscjUKm7EKsduwP
         CKeT/JaSdymNQBRXpZpq6vY3lkiWJmwbVtcHpO9EdxFpdODQcri7FewhOx8am0PHDAZ4
         4gf4yv3eFz9QFwT+PfyT91S00dUH6HJU0D2zhEfdpwVo2NBt34doxs1TH3sQKv0/Z33G
         EeqiPmsKFa6+71RRJbneHfZgqZTy0QY0hE+4sN2DzSY0ap0iN1BPEDgJaJmY8sHYBmUS
         vgQ/POKUlNcV3JEmHNg2IAiW+HqBThXseZBd1qbQQso5mFqbLDT7d+43HSw0ajGcOdPk
         paiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hDA/uULkDvI6EhqblCMC0A+pznSnR5WfzYl1DK+QJzA=;
        b=arNQEKKAPQxVTWlFCOGroCSuWVzMXVJP8Llcg/w5zGQw/KQn0ppA8w7bdg62piGjlP
         KMmeHjq67QQHNNRqj1xX64Uw4ViS7+0bLSzDahBLwndPenoNDL7wgSdVl1DRBjYwDQFS
         twv++27Pl1EkXn/+mQ/ib6wGtnpL7J4HodV7wF+aW6x/WqW+2k4txbSFcu0R8dP1lcpu
         AaOTlJP9mnMJWSEKYl1e5x+yM3UysxxIao0QFjZUZ7JCabF1ZnF7sycDPNb7C6DuKWde
         WvgUZNnAK9auAe2D/KZ9iolpa4TUzQiD9u2J1dtCQMGCAxrBbFafyh4P+KiZHNFlHnQe
         6uNA==
X-Gm-Message-State: AOAM533x1W++W/KhqNJRLRp27mHpnc/QQVIo1t73YVdElysqgFdMz15d
        QGCR8dSW3CvKuXa3EMPk9CUzYDmjwHdN/w==
X-Google-Smtp-Source: ABdhPJzHRfvyZFjeIO9aOL4YwSqjNCddGaZ7QGs5g4I85Qzvn3e/yVz4hCuGrn3HuLLQ15W4JFXyPg==
X-Received: by 2002:a17:90a:d90e:: with SMTP id c14mr7227670pjv.85.1609992049526;
        Wed, 06 Jan 2021 20:00:49 -0800 (PST)
Received: from sol.lan (106-69-181-20.dyn.iinet.net.au. [106.69.181.20])
        by smtp.gmail.com with ESMTPSA id gk8sm3513551pjb.52.2021.01.06.20.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 20:00:49 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 1/2] tools: gpio: fix %llu warning in gpio-event-mon.c
Date:   Thu,  7 Jan 2021 12:00:19 +0800
Message-Id: <20210107040020.257671-2-warthog618@gmail.com>
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

gpio-event-mon.c:110:37: warning: format ‘%llu’ expects argument of type ‘long long unsigned int’, but argument 3 has type ‘__u64’ {aka ‘long unsigned int’} [-Wformat=]
  110 |   fprintf(stdout, "GPIO EVENT at %llu on line %d (%d|%d) ",
      |                                  ~~~^
      |                                     |
      |                                     long long unsigned int
      |                                  %lu
  111 |    event.timestamp_ns, event.offset, event.line_seqno,
      |    ~~~~~~~~~~~~~~~~~~
      |         |
      |         __u64 {aka long unsigned int}

Replace the %llu with PRIu64 and cast the argument to uint64_t.

Fixes: commit 03fd11b03362 ("tools/gpio/gpio-event-mon: fix warning")
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/gpio-event-mon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index cacd66ad7926..a2b233fdb572 100644
--- a/tools/gpio/gpio-event-mon.c
+++ b/tools/gpio/gpio-event-mon.c
@@ -107,8 +107,8 @@ int monitor_device(const char *device_name,
 			ret = -EIO;
 			break;
 		}
-		fprintf(stdout, "GPIO EVENT at %llu on line %d (%d|%d) ",
-			event.timestamp_ns, event.offset, event.line_seqno,
+		fprintf(stdout, "GPIO EVENT at %" PRIu64 " on line %d (%d|%d) ",
+			(uint64_t)event.timestamp_ns, event.offset, event.line_seqno,
 			event.seqno);
 		switch (event.id) {
 		case GPIO_V2_LINE_EVENT_RISING_EDGE:
-- 
2.30.0

