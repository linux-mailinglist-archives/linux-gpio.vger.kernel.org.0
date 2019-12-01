Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91B6110E048
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Dec 2019 04:25:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727406AbfLADZd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Nov 2019 22:25:33 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34553 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfLADZd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Nov 2019 22:25:33 -0500
Received: by mail-pg1-f195.google.com with SMTP id h26so1249312pgl.1
        for <linux-gpio@vger.kernel.org>; Sat, 30 Nov 2019 19:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sk5Gi1zcWJVjweSeoud/eHrJ5Lxu2HjKdzSV/aE9SMY=;
        b=lOKzdcfnRevxOrrU+v7JLazJVpLkQ3shXe3SdenNkiUaBTu9AxXZ1PrTZbY0ATDJoq
         sxNogSUHnbsps5OBebk4O6SRtBrq9M2pN18qAFFfvoBbLH04JJD9Ty/zLTn5yNQYf0QU
         zDpS25NZbkJBDRw6FP2YZ9pfQxPfGkLWWgkqd/7nbCBtRqcQ1x0Jf9BLaizTX0sTAZoV
         Wf/7lknkt42GVBVbyM6vnvH6tsLDR8z1g96zxKd4sNhgU/CS44cgbPo0Fp9lmFcQZxSM
         S+HZXEgmqQdBQHrSA/DOQf1pC4NGFysd94ejr7zl6xblj7GCp4EIVz0h1HFr3VndQrKs
         7RQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sk5Gi1zcWJVjweSeoud/eHrJ5Lxu2HjKdzSV/aE9SMY=;
        b=IC/6jICHZ+xR+tjw5aLU623QxcmJhC74kXxo0HVr8hy8l+sI6iA1viAMNwdkdGRy5e
         eAJVb5SlZKTTPu5Ny96yoty+82VwPS49bGKAGik2TFpfeLcvb4iFh1pKDQEkM/1IsbSp
         kkKC5PP8AAQimArWSfvgG96/Q5ffdRQcddkQ4F9kGeiXBie3S4f9Vn4/MjvuyQQOveHB
         gBba9EF+P80hCOdHBwbV8IJD/gS3N+CwtSDVt4eIDoPVyBX/XyQSVGNORHpQxJGYl0DZ
         Xk87QBXLlP9G6Ic2OxEZm7BhyeAWv9ivtS2fMVqMJyV2pgVmuplvQGVVNNFr2MuTCVyG
         tPMQ==
X-Gm-Message-State: APjAAAUX1sKdvURh8cjPYyDxOILqtDJG/RGGUURNawdZ0kTcB82MHWfp
        TPafBzvShmUbV0vMHILObFxBpzhc
X-Google-Smtp-Source: APXvYqxeDXJVmvtrdfwyYrBy8A/Sb/EHWt0dSmOkm0T47UleXVUoD56JQETQX1duNiQFUVB9/fp6qA==
X-Received: by 2002:a63:f743:: with SMTP id f3mr1783114pgk.28.1575170732729;
        Sat, 30 Nov 2019 19:25:32 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id z1sm30307655pfk.61.2019.11.30.19.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 19:25:32 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v4 19/20] bindings: cxx: fix indentation of wrapped field descriptions
Date:   Sun,  1 Dec 2019 11:24:06 +0800
Message-Id: <20191201032407.23589-20-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201032407.23589-1-warthog618@gmail.com>
References: <20191201032407.23589-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Minor formatting fix to make long text descriptions of params wrap under
the text, not under the param name.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/cxx/gpiod.hpp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index 514354d..a56bad1 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -670,7 +670,7 @@ public:
 	/**
 	 * @brief Set values of all lines held by this object.
 	 * @param values Vector of values to set. Must be the same size as the
-	 *        number of lines held by this line_bulk.
+	 *               number of lines held by this line_bulk.
 	 */
 	GPIOD_API void set_values(const ::std::vector<int>& values) const;
 
@@ -706,7 +706,7 @@ public:
 	/**
 	 * @brief Poll the set of lines for line events.
 	 * @param timeout Number of nanoseconds to wait before returning an
-	 *        empty line_bulk.
+	 *                empty line_bulk.
 	 * @return Returns a line_bulk object containing lines on which events
 	 *         occurred.
 	 */
-- 
2.24.0

