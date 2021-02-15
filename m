Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D02A031B9C7
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Feb 2021 13:51:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbhBOMuy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Feb 2021 07:50:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbhBOMuO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2021 07:50:14 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D02C4C061574
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2021 04:49:33 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id l18so3865997pji.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2021 04:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ej+JwfiLrGVBZczn7pQZZw/pvRzkrr5E9glHAS483S8=;
        b=mT1EAbgoy9tEo2N0HxBaSpUty5J3s/9P9o/1l7wIp1IU99x5qAApBMZsWthBjRjehn
         dtrVdS8ZxAhYv6lG2F0A7t9yPPrk+KXwJ6ItYqbpkTWZX3DBmCh+K9i2WE7WPU54fgYE
         ilIYu2i/EXObMIu6uPUErxKKZNSqyquAmpdOT8gYj9MZ4+wQz161MfUDPQoSNyMFaW0u
         IcBwmjgXPHpcucpzUJMdPTy8c3DJBGaFLmmLHBPIZELtfUQt8q4iK7mqgKGf0Bm0VtGE
         xF8vZQ2hqYmxCaCzTDh8Ll2eESNMZZCD6FB7vabFzIe89oHznksSs7so2ej+3WZbQeG0
         /OpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ej+JwfiLrGVBZczn7pQZZw/pvRzkrr5E9glHAS483S8=;
        b=mPrAiYHeB7w0HBlvt9F/k9Ixku1p66WNBTQzeeepfqeG+M+aHFU7e29sAxMrPup6LA
         4TWav8cf5TCpvT0LGEJnfq/duhJJrAR9ziRh9JxuV0b8yopFigvV0/x1xoYFam5JPZMj
         baE92zIquQRV/hEWOpfOj3SzhHM58RPBNT+j16ib/yryGOMVDq+RL9bo4c7yDOFKLom0
         AqxLHmdPfb7gLlh9UBqpuWnYUW3AONlzftgCfI5CX5h3uh+w65rdE/xt6TS2N+y1pzs5
         9/mpm2fCxQQD4tNmGJDk91Jg4ADu/QktTmDQzk5r9VboYE6eNeXY8RURj+8D+KYtpq5d
         ircQ==
X-Gm-Message-State: AOAM532Ne3nVw0QaJvWfI9QvusZOd8QU8LDhR3rW1MVqXRBPd5PlgwKN
        7p966wnx28j7g0B1pcTgHShxCYI5YDGYVQ==
X-Google-Smtp-Source: ABdhPJzy1JQXy2bz2pVjH8So3oBuEWsk8UJ+wxDiC6OG3jnqASvN/3cXAkkYIKveT2bTjE8aJV24ZQ==
X-Received: by 2002:a17:90a:5d0d:: with SMTP id s13mr15880389pji.156.1613393373000;
        Mon, 15 Feb 2021 04:49:33 -0800 (PST)
Received: from sol.lan (106-69-179-46.dyn.iinet.net.au. [106.69.179.46])
        by smtp.gmail.com with ESMTPSA id p29sm18829331pgm.64.2021.02.15.04.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 04:49:32 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>,
        Pedro Botella <pbotella@gmail.com>
Subject: [lingpiod][PATCH] bindings: python: fix uninitialized default_vals being passed to gpiod_LineBulk_request()
Date:   Mon, 15 Feb 2021 20:48:31 +0800
Message-Id: <20210215124831.60707-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If "default_vals" is not provided in the kwds then default_vals are
passed uninitialized to gpiod_line_request_bulk(), so rename the
existing default_vals to vals and introduce a new default_vals that
points to vals, or NULL if no defaults have been passed.

Fixes: 96c524c4951c (bindings: implement python bindings)
Reported-by: Pedro Botella <pbotella@gmail.com>
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/python/gpiodmodule.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index fee4c32..832787d 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -1327,12 +1327,13 @@ static PyObject *gpiod_LineBulk_request(gpiod_LineBulkObject *self,
 				  NULL };
 
 	int rv, type = gpiod_LINE_REQ_DIR_AS_IS, flags = 0,
-	    default_vals[GPIOD_LINE_BULK_MAX_LINES], val;
+	    vals[GPIOD_LINE_BULK_MAX_LINES], val;
 	PyObject *def_vals_obj = NULL, *iter, *next;
 	struct gpiod_line_request_config conf;
 	struct gpiod_line_bulk bulk;
 	Py_ssize_t num_def_vals;
 	char *consumer = NULL;
+	const int *default_vals = NULL;
 	Py_ssize_t i;
 
 	if (gpiod_LineBulkOwnerIsClosed(self))
@@ -1348,7 +1349,7 @@ static PyObject *gpiod_LineBulk_request(gpiod_LineBulkObject *self,
 	gpiod_MakeRequestConfig(&conf, consumer, type, flags);
 
 	if (def_vals_obj) {
-		memset(default_vals, 0, sizeof(default_vals));
+		memset(vals, 0, sizeof(vals));
 
 		num_def_vals = PyObject_Size(def_vals_obj);
 		if (num_def_vals != self->num_lines) {
@@ -1375,8 +1376,9 @@ static PyObject *gpiod_LineBulk_request(gpiod_LineBulkObject *self,
 				return NULL;
 			}
 
-			default_vals[i] = !!val;
+			vals[i] = !!val;
 		}
+		default_vals = vals;
 	}
 
 	Py_BEGIN_ALLOW_THREADS;
-- 
2.30.0

