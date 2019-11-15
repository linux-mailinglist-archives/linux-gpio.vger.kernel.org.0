Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F554FE070
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 15:45:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727629AbfKOOpu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 09:45:50 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45358 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727427AbfKOOpu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 09:45:50 -0500
Received: by mail-pg1-f196.google.com with SMTP id k1so4803176pgg.12
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 06:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l8pvExKzv81RSRzZL9JexJ46sAgxZIhB5BLRMYlkMRc=;
        b=S7FkTgw8ofDxC585OEZfB49I2hcImPshD4Olm7Miv7pKboN3qCc0UQjj8nJrt4VRZ9
         EP01BVmDRh/LffR3K3ImRat6gE6P/a+RloZOyQxza3Sic4czBgzuDP+T51lTnuPSByfy
         j9hLuD5hRHmT+FnEDzpayCPteLDAuPc6Lf4CNN2gTn52fqGqNR38ClVHEyfBMJtyALaX
         tSe6xzcrvB9G3FzT1XMTLn2EqvhX1OJwlHaKuBPlWMpOk18QE9osOH77dfxnqzv6JwIy
         Vf0Hgl/zy6U/x2ALqOfL9vFb2eVVeUZpsgWzk87vhnTWsDRcMT4Tko9ChafWiGbMAjli
         gTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l8pvExKzv81RSRzZL9JexJ46sAgxZIhB5BLRMYlkMRc=;
        b=eaASmgPVEMxUgsG29Q1+f0qn2BRmZFEm/aXcH8k+BGQ+13joQA+fSMHwnxFm/mCiaJ
         ihuYxOQeY5pMmft/OkQ8TBp61fyiqL3B/ktU5lMBSI7qrXYn68XYJd6WXqym/Umi7ghE
         gZk9Bb7rCvuTNrMWQSbesHPq8gr9i8v87FKMDAXT85fXlLF6kdVLO0e8KgfIcPpKHZdz
         Gxeg7kAH/g3qefZmua9Z4NQV07UM7dOXg0RP0LuL2dvXHMGavNvIF/0qGRpUsNgC3ZgW
         70cLy8gcaqi8zBY1nudLFKrdLFBTsmm+Fp5NrSWjQ9k6jTKD7w6BOl3YkHTG8j9g4BPY
         zlaw==
X-Gm-Message-State: APjAAAUFIsBp/1pOeYC3w221hQPUpAlGNjR1/trkeJwmex5/jpvneSm4
        ywcQ7V5OGz9ca1PMA6WgjvxbW2lYo/Q=
X-Google-Smtp-Source: APXvYqx6trvXtWS2qjqUCHBpPY9aisotCLRtP0O0f3JfrI/lA6CVRHZfAI8kzUUGevMjlFbav4bdVg==
X-Received: by 2002:a63:368c:: with SMTP id d134mr16522018pga.321.1573829149363;
        Fri, 15 Nov 2019 06:45:49 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id y123sm10517726pfg.64.2019.11.15.06.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 06:45:48 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH 19/19] treewide: change "correspond with" to "correspond to"
Date:   Fri, 15 Nov 2019 22:43:55 +0800
Message-Id: <20191115144355.975-20-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115144355.975-1-warthog618@gmail.com>
References: <20191115144355.975-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Trivial grammar fix. "correspond with" can mean either being in agreement
with, happening at the same time, or communication between parties.
"correspond to" is used to mean equivalance, which is the intended use
throughout the documentation.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/python/gpiodmodule.c | 6 +++---
 include/gpiod.h               | 2 +-
 lib/core.c                    | 2 +-
 tests/mockup/gpio-mockup.c    | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index 4949b14..74fbea3 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -1330,7 +1330,7 @@ PyDoc_STRVAR(gpiod_LineBulk_get_values_doc,
 "get_values() -> list of integers\n"
 "\n"
 "Read the values of all the lines held by this LineBulk object. The index\n"
-"of each value in the returned list corresponds with the index of the line\n"
+"of each value in the returned list corresponds to the index of the line\n"
 "in this gpiod.LineBulk object.");
 
 static PyObject *gpiod_LineBulk_get_values(gpiod_LineBulkObject *self,
@@ -1385,7 +1385,7 @@ PyDoc_STRVAR(gpiod_LineBulk_set_values_doc,
 "\n"
 "The number of values in the list passed as argument must be the same as\n"
 "the number of lines held by this gpiod.LineBulk object. The index of each\n"
-"value corresponds with the index of each line in the object.\n");
+"value corresponds to the index of each line in the object.\n");
 
 static PyObject *gpiod_LineBulk_set_values(gpiod_LineBulkObject *self,
 					   PyObject *args)
@@ -1408,7 +1408,7 @@ static PyObject *gpiod_LineBulk_set_values(gpiod_LineBulkObject *self,
 	num_vals = PyObject_Size(val_list);
 	if (self->num_lines != num_vals) {
 		PyErr_SetString(PyExc_TypeError,
-				"Number of values must correspond with the number of lines");
+				"Number of values must correspond to the number of lines");
 		return NULL;
 	}
 
diff --git a/include/gpiod.h b/include/gpiod.h
index 4053fd2..6776852 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -779,7 +779,7 @@ gpiod_line_bulk_num_lines(struct gpiod_line_bulk *bulk)
  *
  * This is a variant of ::gpiod_line_bulk_foreach_line which uses an integer
  * variable (either signed or unsigned) to store the loop state. This offset
- * variable is guaranteed to correspond with the offset of the current line in
+ * variable is guaranteed to correspond to the offset of the current line in
  * the bulk->lines array.
  */
 #define gpiod_line_bulk_foreach_line_off(bulk, line, offset)		\
diff --git a/lib/core.c b/lib/core.c
index 2e54def..54ae09c 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -111,7 +111,7 @@ static bool is_gpiochip_cdev(const char *path)
 
 	/*
 	 * Make sure the major and minor numbers of the character device
-	 * correspond with the ones in the dev attribute in sysfs.
+	 * correspond to the ones in the dev attribute in sysfs.
 	 */
 	snprintf(devstr, sizeof(devstr), "%u:%u",
 		 major(statbuf.st_rdev), minor(statbuf.st_rdev));
diff --git a/tests/mockup/gpio-mockup.c b/tests/mockup/gpio-mockup.c
index e3a53da..fa27bd7 100644
--- a/tests/mockup/gpio-mockup.c
+++ b/tests/mockup/gpio-mockup.c
@@ -333,7 +333,7 @@ EXPORT int gpio_mockup_probe(struct gpio_mockup *ctx, unsigned int num_chips,
 	/*
 	 * We can't assume that the order in which the mockup gpiochip
 	 * devices are created will be deterministic, yet we want the
-	 * index passed to the test_chip_*() functions to correspond with the
+	 * index passed to the test_chip_*() functions to correspond to the
 	 * order in which the chips were defined in the TEST_DEFINE()
 	 * macro.
 	 *
-- 
2.24.0

