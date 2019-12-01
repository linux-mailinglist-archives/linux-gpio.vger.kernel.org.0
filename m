Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C837C10E049
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Dec 2019 04:25:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbfLADZh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Nov 2019 22:25:37 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33266 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfLADZh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Nov 2019 22:25:37 -0500
Received: by mail-pf1-f195.google.com with SMTP id y206so8003583pfb.0
        for <linux-gpio@vger.kernel.org>; Sat, 30 Nov 2019 19:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bk21P0O+CWMNBF/ILMSUKAFjmN/UYnF2M4cvSE4e2Fs=;
        b=T7ZF7r/KpHY9sq+njF5EPnEE0IjnvljcmnX4SuaOdPPUxtpMja+grVW/s3364UFVVm
         EapV/cclbME+H5OYUitRrNqlsA4CsvkYBovGC//NHczcZIT3xIahjeLqgTQFdE4yibGT
         8sZrBxj5Qarn2qlYH8AoHA6FiOu8nUc4e3SmVXiKJBDosASRSg3b5stj+6rv0j55EV9u
         6WjGB5GQGJ71A5bwVPtB+p3IokJFIIY+yPeyR8MScSiKIt2esj09T7fa53RwAGIdBIP1
         0UYrzG1/9Nwi42RBxJ1hnLpV1kdxr8pUSFv8hL6NZ2+emCSq2rqk3AXWSi/C4XhGiGh6
         VQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bk21P0O+CWMNBF/ILMSUKAFjmN/UYnF2M4cvSE4e2Fs=;
        b=cuweY7k9QcLWXf0tRaEobPpnyYVp4tF2NdrsOEGWRV8xeRJLLzzCcrlwIR832B7aRI
         feESi9vmZaujRqTFYqsiZMI09XFBGhHXDEgXz7HdjPQkoEtqYWV1s2zE4mO0cYazEopb
         54M/kWOipeNCFzGbZDvtW1ddZWnHqRwSACSHeGpgXpK7B/YM62JmivS38rG6E2aNbxdk
         xqOcMyxWnKhQpF1HCd9a1ss9Ibx/MiFlUm6RCG94Hh6Ku7hX0fTeGKzzMEValpUcxqWJ
         SXJ1S++2b0YiDheJD9msMPSXTWfAdhz0FYjnv3Ie9ZGvdkU5ud5vEKJ8AHYqvyda2s8B
         88cA==
X-Gm-Message-State: APjAAAVzelx7yZY33ErVX9ZTY6RCse0dBaDCxwzkrGM0ShEmPaYoJKmb
        N5TTpYwaKV//rnPX8I9vUtA5XGLt
X-Google-Smtp-Source: APXvYqxeMAwc+onPDeKursoT465KO2yfhE6Kt2Ngb1pRnEoilXwGpR2cDlSKfNdnkGUzdI3GqeVviQ==
X-Received: by 2002:a63:5206:: with SMTP id g6mr25585918pgb.49.1575170735118;
        Sat, 30 Nov 2019 19:25:35 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id z1sm30307655pfk.61.2019.11.30.19.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 19:25:34 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v4 20/20] bindings: python: make vals in gpiod_Line_set_value consistent with other functions
Date:   Sun,  1 Dec 2019 11:24:07 +0800
Message-Id: <20191201032407.23589-21-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201032407.23589-1-warthog618@gmail.com>
References: <20191201032407.23589-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Change the vals in gpiod_Line_set_value from a tuple of tuples to just a
tuple.  This brings it into line with other vals in the module such as
gpiod_Line_set_config and gpiod_Line_set_direction_output.

The previous usage made the vals equivalent to an args (a tuple of
arguments equivalent to argc,argv in C), as per gpiod_Line_set_flags.

Renaming vals to args in gpiod_Line_set_value was not an option as there
is already an args parameter.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/python/gpiodmodule.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index 6086715..5f74513 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -585,14 +585,14 @@ static PyObject *gpiod_Line_set_value(gpiod_LineObject *self, PyObject *args)
 	if (!bulk_obj)
 		return NULL;
 
-	vals = Py_BuildValue("((O))", val);
+	vals = Py_BuildValue("(O)", val);
 	if (!vals) {
 		Py_DECREF(bulk_obj);
 		return NULL;
 	}
 
 	ret = PyObject_CallMethod((PyObject *)bulk_obj,
-				  "set_values", "O", vals);
+				  "set_values", "(O)", vals);
 	Py_DECREF(bulk_obj);
 	Py_DECREF(vals);
 
-- 
2.24.0

