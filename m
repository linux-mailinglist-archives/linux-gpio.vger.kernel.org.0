Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 053AB10E047
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Dec 2019 04:25:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727405AbfLADZc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Nov 2019 22:25:32 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45574 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfLADZc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Nov 2019 22:25:32 -0500
Received: by mail-pf1-f194.google.com with SMTP id z4so16611404pfn.12
        for <linux-gpio@vger.kernel.org>; Sat, 30 Nov 2019 19:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EM8w2yJCMjm4W7j5L/vZnozWlnbYl3M3J4amIhT7a6w=;
        b=SGfwg0NIRI9RQR83287wbggPaK4+6jqZFHYXBobjoO+UhXk9r2OQDTApBbHTF2wmsP
         Frp8fv+xvzNFjJ6OU275Z44vhdciLPQLeJ2fdvw2M/uDjbrGCDaDXjRXK4PTZ1PajRtO
         bBHIuFyTiVW0yUGE8jtb97Re5WzOs8iC6ezCGHJZZPt4w1m3RD2plKBI6uFu7hXE3tJE
         3kh5W0op6Xp2pi9syfH2/AAja6vL11t1AD1I56aCJRWXPtx9KtI7hDvPme2icOaiYZ00
         U1GMq2uJYjQ8ROXV21r/SdSGPpOUw5eJ1xVWSxmRLweo2sy7GUyU+osU2H/YKybBRUOP
         O/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EM8w2yJCMjm4W7j5L/vZnozWlnbYl3M3J4amIhT7a6w=;
        b=kjvywkjHBbcotrepqQa7jlaK8BiTAlQ22FTrqoX923Ke+8NcvaoqGytjis6ix1wd7s
         D+fdb4rDuIozbkHKAPaln10gXEhOtlbZPVZqgZlg+iAqq/49yPh9OeFYIHGwwvjTQxpX
         YHUmDCXUh3wpJQLtCypVaBzidJN63LtYjruFLVNt7dJvdKEdcdRuZHpj7EcY3Mrfkt3z
         YybDkY44+EI4US5Y362R6mvzomiO6G5hH15MPiERwBvD78RocV641ZFqsnUWe8p1+HZO
         EPyHuA3YeA/cn0nGRpNrqAMilzbfYdbP3HE82rfxa8PBKYB9NvWQnCr9ZVLtszMxCokT
         zJ2g==
X-Gm-Message-State: APjAAAUrKxsXyfNCCydX80B4BRqqWDVL0TfaRjezF2U5hGXjtNXmEFvI
        HvZnVz6sZwoRyU2EhOT9NddPifTB
X-Google-Smtp-Source: APXvYqw7L5MrJ2iUoru/15DCkBuD6bt+yvmkbit8wcm29T9mUH1dvLtkRoGS+x/69PhrRqQJqZU4Ww==
X-Received: by 2002:a62:7dd2:: with SMTP id y201mr66354510pfc.90.1575170730317;
        Sat, 30 Nov 2019 19:25:30 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id z1sm30307655pfk.61.2019.11.30.19.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 19:25:29 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v4 18/20] core: document gpiod_line_set_value_bulk NULL values behaviour
Date:   Sun,  1 Dec 2019 11:24:05 +0800
Message-Id: <20191201032407.23589-19-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201032407.23589-1-warthog618@gmail.com>
References: <20191201032407.23589-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The handling of NULL values by gpiod_line_set_value_bulk has been changed
to interpret NULL as low values for all lines.  This patch updates the
documentation of the function to describe that.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/gpiod.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/gpiod.h b/include/gpiod.h
index 41527d3..0e9f125 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -1296,6 +1296,7 @@ int gpiod_line_set_value(struct gpiod_line *line, int value) GPIOD_API;
  * @brief Set the values of a set of GPIO lines.
  * @param bulk Set of GPIO lines to reserve.
  * @param values An array holding line_bulk->num_lines new values for lines.
+ *               A NULL pointer is interpreted as a logical low for all lines.
  * @return 0 is the operation succeeds. In case of an error this routine
  *         returns -1 and sets the last error number.
  *
-- 
2.24.0

