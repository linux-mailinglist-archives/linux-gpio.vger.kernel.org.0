Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 045E2217E22
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 06:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729539AbgGHEUj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 00:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728234AbgGHEUj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 00:20:39 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D5FEC061755;
        Tue,  7 Jul 2020 21:20:39 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id g67so20145462pgc.8;
        Tue, 07 Jul 2020 21:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mVj4QaRFJwXQOHlJdSKbib6tPQMBpikDxG7+0rwvolA=;
        b=EE1U1yNhhcYCS6KLQXJ0k6Z+EfWCmwq/wOP388r1k3FkJ9sDHSF2vbYHCxf51ToJuu
         agwOjcG24AZfqo/yRp8pNvgjxPxhHAYnxq7Z49jRuIKXHKs0hOQ0SPVIGQubjEdRfAD2
         x9IeAavAaGBnR2sgfgxII2w5BKsr/fPNdQ4JBrE309J0I4gujj9G2jY4r4PbSYXZy8VE
         2Wii6Q2uiqK0nYZ9wkhma5s9wuyKXzhmfqxUMvazda+9Mv3HbbjsjHcNiZLVdHaKpfkG
         J+7NVkO/p7dYcyV9AmeLmMXqPmOM6UequwPnFTTjeps/kh5JkjyiqQHMh415UZvUP/RH
         1nsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mVj4QaRFJwXQOHlJdSKbib6tPQMBpikDxG7+0rwvolA=;
        b=BciBnjFbTutriJ0tHerUr4GEhZQMtSn5Cw0Ky0zlFO6AafTzjzC3JnS8zP0YogxQZn
         c1guNotjBRDWoeSEQqp1vfUuMeyCl50LMDUmSrcssnMvsGV4qpz8kws+m0t1PiamQ/X6
         Nlmc+NtFYJoIJKCZEIm3me4dkWLdkWeYPPUZHg3M5l5Kr0JHBckYtcK4FTklCfIaIqmk
         nd/9QlD41PZD2pzb+PLGrmf4uZnhYJCEW8dRnQxYjxDNNSHotkbpsBEHOomCQ7l5eRaT
         5VhRGjEcbuvgb0I2WiYWo+9uec2oGYYWHX5sXjtE6BZm7kpX4Z9byoom0Z6EyGSuKbSr
         4Yxg==
X-Gm-Message-State: AOAM530Q6hqPNrFt1oLCO7z7jNN928l0P78o6gVD3FtoRYVB52JC7yho
        yk1yWomK4NafszrcewiCXsA4UIe1
X-Google-Smtp-Source: ABdhPJypq/1N6FLYLcVP+JDSn3TGAcsNDbAZ4/0YQdx2EJRZFcy2EeqlPQTXCcLM9NyMtg4fkVzDSA==
X-Received: by 2002:a63:405:: with SMTP id 5mr46148298pge.449.1594182038374;
        Tue, 07 Jul 2020 21:20:38 -0700 (PDT)
Received: from sol.lan (106-69-191-222.dyn.iinet.net.au. [106.69.191.222])
        by smtp.gmail.com with ESMTPSA id gx23sm3821951pjb.39.2020.07.07.21.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 21:20:37 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 15/17] tools: gpio: fix spurious close warning in lsgpio
Date:   Wed,  8 Jul 2020 12:15:58 +0800
Message-Id: <20200708041600.768775-16-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200708041600.768775-1-warthog618@gmail.com>
References: <20200708041600.768775-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix bogus close warning that occurs when opening the character device
fails.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/lsgpio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/gpio/lsgpio.c b/tools/gpio/lsgpio.c
index 8a71ad36f83b..b08d7a5e779b 100644
--- a/tools/gpio/lsgpio.c
+++ b/tools/gpio/lsgpio.c
@@ -94,7 +94,7 @@ int list_device(const char *device_name)
 	if (fd == -1) {
 		ret = -errno;
 		fprintf(stderr, "Failed to open %s\n", chrdev_name);
-		goto exit_close_error;
+		goto exit_free_name;
 	}
 
 	/* Inspect this GPIO chip */
@@ -141,6 +141,7 @@ int list_device(const char *device_name)
 exit_close_error:
 	if (close(fd) == -1)
 		perror("Failed to close GPIO character device file");
+exit_free_name:
 	free(chrdev_name);
 	return ret;
 }
-- 
2.27.0

