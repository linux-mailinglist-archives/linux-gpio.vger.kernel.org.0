Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1C92217E26
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 06:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbgGHEUw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 00:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgGHEUw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 00:20:52 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF01BC061755;
        Tue,  7 Jul 2020 21:20:51 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id t6so21062631pgq.1;
        Tue, 07 Jul 2020 21:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=egk+b4CpekAWqka2nnTyP0i/HLlHstZqWKBVVCAFgOw=;
        b=Z8ED5p0wPKOE2B9FZBZrGFuJ42CqwOXGrDF9EGZKa3dP6wBx6evE1eomArA4ipTfYj
         zVjMtoTf24ukjgsVT/DqSLU8fPZZu8AFURtosfCqn5u4Btu7KPTI9dLzAm3lZU7EfEA3
         pacbPPtu17xs+txtYl2FTNxpc2hd9abpHYne03eqD4wiY3agMO188f3IvdPvdDNyZOVC
         i/SfaND2TLucgpejQCopHtxFRXRohQtSEiE2sy4TSbTABH7gzzyKGGmOTBZzoG/J6i4A
         zM2w7+1jx9q6aW5OWqW/NSlYel1wAgCunbds1jiGLAfZXV5GbyFm64wxDX1bK2D+XHMv
         zbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=egk+b4CpekAWqka2nnTyP0i/HLlHstZqWKBVVCAFgOw=;
        b=C/+etWUoX7aJpAC/ryocSud7NUMuFVnIdV+oL6PMxoYcKQO2FNYia9LOQlh4hTpjO9
         Pv80FEfJH9dtfqGdMORb0UavtyMTKspSDE+FEQAL6oED5GUY4WrQ/KuNFJ6tM3yRtovq
         TduUPZORfpZqtX/qPl5pw6Ua96txo7il+eZqy7Eo745kdEwSghDK8tI1H4i/E/e5+Usn
         o69O0mJGZ6gQ6l2bZutjOWVIfshnqeNzBdcL4bea4V/t42p4K90bPlBmy76fRlh2Isjo
         WrdH8wAHsk7gkq3AyIASxij8D3RMl2kcUqassEyttBMJHOo2kAT2TWQuvLk5hcKSsRVa
         PLWQ==
X-Gm-Message-State: AOAM530+BazsbJMppzxq5EoQd8OcqLFODPZ55qNCHP9dK3FAn9k03YSS
        5fVJ0JYXBRBNxAKrQXY9cFkcZoqP
X-Google-Smtp-Source: ABdhPJwckR3poTs2P1cQ2XQvhbyLS2/XfcJpqyI9gauer+gWsJapxPSfMNRZ66PscqeVwCFiYCfRkg==
X-Received: by 2002:aa7:9e5c:: with SMTP id z28mr39520244pfq.49.1594182051118;
        Tue, 07 Jul 2020 21:20:51 -0700 (PDT)
Received: from sol.lan (106-69-191-222.dyn.iinet.net.au. [106.69.191.222])
        by smtp.gmail.com with ESMTPSA id gx23sm3821951pjb.39.2020.07.07.21.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 21:20:50 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 17/17] tools: gpio: fix spurious close warning in gpio-event-mon
Date:   Wed,  8 Jul 2020 12:16:00 +0800
Message-Id: <20200708041600.768775-18-warthog618@gmail.com>
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
 tools/gpio/gpio-event-mon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index 30ed0e06f52a..1a303a81aeef 100644
--- a/tools/gpio/gpio-event-mon.c
+++ b/tools/gpio/gpio-event-mon.c
@@ -45,7 +45,7 @@ int monitor_device(const char *device_name,
 	if (fd == -1) {
 		ret = -errno;
 		fprintf(stderr, "Failed to open %s\n", chrdev_name);
-		goto exit_close_error;
+		goto exit_free_name;
 	}
 
 	req.lineoffset = line;
@@ -117,6 +117,7 @@ int monitor_device(const char *device_name,
 exit_close_error:
 	if (close(fd) == -1)
 		perror("Failed to close GPIO character device file");
+exit_free_name:
 	free(chrdev_name);
 	return ret;
 }
-- 
2.27.0

