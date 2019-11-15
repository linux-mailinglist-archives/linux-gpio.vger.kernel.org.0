Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5702BFE05D
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 15:44:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727561AbfKOOop (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 09:44:45 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41654 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727556AbfKOOop (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 09:44:45 -0500
Received: by mail-pl1-f196.google.com with SMTP id d29so4795161plj.8
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 06:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YkiGHbSvQlu3pN7juLuHrz+s6lf9aoweXl5F5rXKzDM=;
        b=ZCH47zhuToHyK0gclPDaUSzuOgawXiNyCwFDudeNN2ZcQy+TSTwUpJJbuDOt5IEbTf
         BCP6Knr6KzesUSXzJ9zY2Xa8/4YZmKdipSp049bK963T5uUK6KizfWhsJA5ZqV3Cbx6K
         aetoV3yGNsM2EqQZtEJs2nMB4wBs36h/VacTchPYB7T4Z3S8FIoKMBfoj6UJqlivZ5EF
         hY3GF1pxynzfvG359Wy0aRgZVOIgUeRXj2gM2y0qM7kKN2PWWixhPMzlBzFzEiUX/LO4
         6nYxrtPmT12GG1uT6o2GrsckyB424U/dJRWmO/wg7QGhYoCyo5khrWZL6gkdrLWAwFAc
         iyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YkiGHbSvQlu3pN7juLuHrz+s6lf9aoweXl5F5rXKzDM=;
        b=ivl70kP1lL0GSL4kls02TpYNxFcjRuTbU4jCZob252tNJyHNymjF00QhNfxUB/vRLz
         rOgHNnT5nbF/DOWW/0aH7fCcFxKX47vt4apcWcgCtwrMcBbPdEUJqjd0RBCJcLJFozWN
         24VrCpL3ufcNnNuA2sbS3wZWnzd5TXmuDKkwHHk0veCMqSKkwYniFA+s2jlB8gTOKu+g
         hNOrX/XnGNUUDoSiizBU5/M6KfvDEkgsngG0v1qq+T9Dh6t4AQpDit30pLu0le4xE8Kx
         MdeSop6pobj/2vjEBi3dlnWf9NmumrU4cQMKbjLpOLnDb08ALRz7kBd12QxP08wEKGWI
         DcrA==
X-Gm-Message-State: APjAAAUApbX5LOqA/A/38/yxsaUuB0ZAvD2r93zyPCJYLjflCm4E4H9n
        CdAs7gbXRJ8gSdTUDxiRRvKPFEye6uI=
X-Google-Smtp-Source: APXvYqzTy6SyctLiur3DLqYqbyaC1JLxLbVdoAWzpdpuwijThqM97hNg6f12Mf59inD8oCKqZj4y8A==
X-Received: by 2002:a17:902:6802:: with SMTP id h2mr15129561plk.135.1573829084287;
        Fri, 15 Nov 2019 06:44:44 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id y123sm10517726pfg.64.2019.11.15.06.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 06:44:43 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH 03/19] core: fix misspelling of parameter
Date:   Fri, 15 Nov 2019 22:43:39 +0800
Message-Id: <20191115144355.975-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115144355.975-1-warthog618@gmail.com>
References: <20191115144355.975-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Trivial fix to bring gpiod_ctxless_event_monitor_multiple documentation
into line with gpiod_ctxless_event_monitor_multiple_ext.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/gpiod.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 0f01cab..159d745 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -460,7 +460,7 @@ int gpiod_ctxless_event_monitor_ext(const char *device, int event_type,
  *       back to a basic, ppoll() based callback.
  *
  * Internally this routine opens the GPIO chip, requests the set of lines for
- * the type of events specified in the event_type paramter and calls the
+ * the type of events specified in the event_type parameter and calls the
  * polling callback in a loop. The role of the polling callback is to detect
  * input events on a set of file descriptors and notify the caller about the
  * fds ready for reading.
-- 
2.24.0

