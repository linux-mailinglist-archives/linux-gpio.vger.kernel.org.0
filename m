Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0369332717
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 14:27:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbhCIN0r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 08:26:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbhCIN0o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 08:26:44 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D913C06174A
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 05:26:44 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id r10-20020a05600c35cab029010c946c95easo6252656wmq.4
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 05:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BZ2U1VkcTDAB3eVL/HI2CHKpWdfRVZxi57li2qH8vZk=;
        b=bTDokHHD8fHZeOz3eMMfC8BQAB66GJgp4I37iUmseIS/odTGbnA69mPmxRVUQDmmMi
         6REjalQe0H69NqmQD5T51ExSyFgOCHRLCiJ8+i509sp/fXkEr9G6Ixan0dOvrDhkSEjc
         Wql8Fdwkcy8+T21otAzpbIAVxTG1IMRaAA3un/h9w2ik6Qfhqj0+ZDFFOtgGn1tPrNm/
         b2s3L3IO5wsYHUb4XJ1iARDmm9Th3ut9ldBe9bjsdsihHXYtTi1q7Uis3Et5QSqYaoKH
         xwl1zfIZavsrBwzoBnzX24RusgEFuCtZ/FtNarL/5T41kUcBs2KQN21xEnDniudQru0x
         Q3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BZ2U1VkcTDAB3eVL/HI2CHKpWdfRVZxi57li2qH8vZk=;
        b=S/kvGjNFuhDPzXBtZwAvdgtAF0qtixR7SLm/eTfLXJF1w117hskBGiKLGLWSiSohtE
         nHh5AEUY3VlZvCidArI8PrLaXa1vcj2DLAMTsz1CRvjDRCIK/PUhBJ9g9ZcTOMCGHcvh
         8vGcmxCJN72c6dFs8JAb7nH0oDLyJIku4/y/+u3jCXBRdayzlvsW6PsHkDwjWkL7tOhK
         jLoFLRCrsxzzlJivm0iJwKNjNvE5BnGJtg3AUh4aZ6yc4Avzagtm8yxNRSumYFLViwvy
         6nfRT5mm6eFaSWZo3/hfIaGLaimBQlLn2DJRzRFhLuyg0i2CXk2kgsmRpMOxTUQrPacw
         eEyg==
X-Gm-Message-State: AOAM530MEDl019h/hNc7qiUK4C1IyEVQ4yqbFD8aw+Nn/YdiBwhj4O6l
        WXM+Qc/NCW7yN6IyWGSFTkGoiQfo9rV76g==
X-Google-Smtp-Source: ABdhPJyzj5ZgTp+gb8QvBwuQ13oGjSakoEQKwsJtODfT4jQP4+gTPfRbXLd4dmvZLBUl/bDWaWgdFg==
X-Received: by 2002:a1c:498b:: with SMTP id w133mr4199295wma.134.1615296403168;
        Tue, 09 Mar 2021 05:26:43 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id u23sm4123366wmn.26.2021.03.09.05.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 05:26:42 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 3/6] core: switch to reference counting for gpio chip objects
Date:   Tue,  9 Mar 2021 14:26:36 +0100
Message-Id: <20210309132639.29069-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309132639.29069-1-brgl@bgdev.pl>
References: <20210309132639.29069-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The preferred approach in low-level system libraries is to make all
exposed data structures opaque and use reference counting for their
memory management. This changes the chip objects to only close their
underlying character device and release all resources once the reference
count goes down to 0. We remove the gpiod_chip_close() function and
replace it with gpiod_chip_ref() and gpiod_chip_unref().

Other objects in the API will either be removed or are not opaque yet
and will be reworked later.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/cxx/chip.cpp         |  2 +-
 bindings/python/gpiodmodule.c |  4 ++--
 include/gpiod.h               | 12 ++++++++++--
 lib/core.c                    | 15 ++++++++++++++-
 tests/gpiod-test.h            |  2 +-
 tools/gpiodetect.c            |  2 +-
 tools/gpiofind.c              |  2 +-
 tools/gpioget.c               |  2 +-
 tools/gpioinfo.c              |  4 ++--
 tools/gpiomon.c               |  2 +-
 tools/gpioset.c               |  2 +-
 11 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/bindings/cxx/chip.cpp b/bindings/cxx/chip.cpp
index 527fb34..0886717 100644
--- a/bindings/cxx/chip.cpp
+++ b/bindings/cxx/chip.cpp
@@ -13,7 +13,7 @@ namespace {
 
 void chip_deleter(::gpiod_chip* chip)
 {
-	::gpiod_chip_close(chip);
+	::gpiod_chip_unref(chip);
 }
 
 } /* namespace */
diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index ac0fd83..e54c3ad 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -1953,7 +1953,7 @@ static int gpiod_Chip_init(gpiod_ChipObject *self,
 static void gpiod_Chip_dealloc(gpiod_ChipObject *self)
 {
 	if (self->chip)
-		gpiod_chip_close(self->chip);
+		gpiod_chip_unref(self->chip);
 
 	PyObject_Del(self);
 }
@@ -1981,7 +1981,7 @@ static PyObject *gpiod_Chip_close(gpiod_ChipObject *self,
 	if (gpiod_ChipIsClosed(self))
 		return NULL;
 
-	gpiod_chip_close(self->chip);
+	gpiod_chip_unref(self->chip);
 	self->chip = NULL;
 
 	Py_RETURN_NONE;
diff --git a/include/gpiod.h b/include/gpiod.h
index 6ed9c6c..71abb2a 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -81,10 +81,18 @@ bool gpiod_is_gpiochip_device(const char *path) GPIOD_API;
 struct gpiod_chip *gpiod_chip_open(const char *path) GPIOD_API;
 
 /**
- * @brief Close a GPIO chip handle and release all allocated resources.
+ * @brief Increase the refcount on this GPIO object.
  * @param chip The GPIO chip object.
+ * @return Passed reference to the GPIO chip.
  */
-void gpiod_chip_close(struct gpiod_chip *chip) GPIOD_API;
+struct gpiod_chip *gpiod_chip_ref(struct gpiod_chip *chip) GPIOD_API;
+
+/**
+ * @brief Decrease the refcount on this GPIO object. If the refcount reaches 0,
+ *        close the chip device and free all associated resources.
+ * @param chip The GPIO chip object.
+ */
+void gpiod_chip_unref(struct gpiod_chip *chip) GPIOD_API;
 
 /**
  * @brief Get the GPIO chip name as represented in the kernel.
diff --git a/lib/core.c b/lib/core.c
index 077ea3e..bab438f 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -64,6 +64,8 @@ struct gpiod_line {
 };
 
 struct gpiod_chip {
+	int refcount;
+
 	struct gpiod_line **lines;
 	unsigned int num_lines;
 
@@ -297,6 +299,7 @@ struct gpiod_chip *gpiod_chip_open(const char *path)
 
 	chip->fd = fd;
 	chip->num_lines = info.lines;
+	chip->refcount = 1;
 
 	/*
 	 * GPIO device must have a name - don't bother checking this field. In
@@ -324,11 +327,21 @@ err_close_fd:
 	return NULL;
 }
 
-void gpiod_chip_close(struct gpiod_chip *chip)
+struct gpiod_chip *gpiod_chip_ref(struct gpiod_chip *chip)
+{
+	chip->refcount++;
+	return chip;
+}
+
+void gpiod_chip_unref(struct gpiod_chip *chip)
 {
 	struct gpiod_line *line;
 	unsigned int i;
 
+	chip->refcount--;
+	if (chip->refcount > 0)
+		return;
+
 	if (chip->lines) {
 		for (i = 0; i < chip->num_lines; i++) {
 			line = chip->lines[i];
diff --git a/tests/gpiod-test.h b/tests/gpiod-test.h
index 2688d3c..a093f83 100644
--- a/tests/gpiod-test.h
+++ b/tests/gpiod-test.h
@@ -22,7 +22,7 @@
 typedef struct gpiod_chip gpiod_chip_struct;
 typedef struct gpiod_line_bulk gpiod_line_bulk_struct;
 
-G_DEFINE_AUTOPTR_CLEANUP_FUNC(gpiod_chip_struct, gpiod_chip_close);
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(gpiod_chip_struct, gpiod_chip_unref);
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(gpiod_line_bulk_struct, gpiod_line_bulk_free);
 
 /* These are private definitions and should not be used directly. */
diff --git a/tools/gpiodetect.c b/tools/gpiodetect.c
index 7a2015e..9f4c28c 100644
--- a/tools/gpiodetect.c
+++ b/tools/gpiodetect.c
@@ -80,7 +80,7 @@ int main(int argc, char **argv)
 		       gpiod_chip_label(chip),
 		       gpiod_chip_num_lines(chip));
 
-		gpiod_chip_close(chip);
+		gpiod_chip_unref(chip);
 		free(entries[i]);
 	}
 
diff --git a/tools/gpiofind.c b/tools/gpiofind.c
index 0fc07d9..83af76b 100644
--- a/tools/gpiofind.c
+++ b/tools/gpiofind.c
@@ -77,7 +77,7 @@ int main(int argc, char **argv)
 		if (offset >= 0) {
 			printf("%s %u\n",
 			       gpiod_chip_name(chip), offset);
-			gpiod_chip_close(chip);
+			gpiod_chip_unref(chip);
 			return EXIT_SUCCESS;
 		}
 	}
diff --git a/tools/gpioget.c b/tools/gpioget.c
index 527dc22..ceeec56 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -123,7 +123,7 @@ int main(int argc, char **argv)
 	printf("\n");
 
 	gpiod_line_release_bulk(lines);
-	gpiod_chip_close(chip);
+	gpiod_chip_unref(chip);
 	gpiod_line_bulk_free(lines);
 	free(values);
 	free(offsets);
diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index 84588bc..eba8c72 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -230,7 +230,7 @@ int main(int argc, char **argv)
 
 			list_lines(chip);
 
-			gpiod_chip_close(chip);
+			gpiod_chip_unref(chip);
 		}
 	} else {
 		for (i = 0; i < argc; i++) {
@@ -240,7 +240,7 @@ int main(int argc, char **argv)
 
 			list_lines(chip);
 
-			gpiod_chip_close(chip);
+			gpiod_chip_unref(chip);
 		}
 	}
 
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 8bf2c70..dda9f6f 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -306,7 +306,7 @@ done:
 	gpiod_line_release_bulk(lines);
 	gpiod_line_bulk_free(lines);
 	gpiod_line_bulk_free(evlines);
-	gpiod_chip_close(chip);
+	gpiod_chip_unref(chip);
 
 	return EXIT_SUCCESS;
 }
diff --git a/tools/gpioset.c b/tools/gpioset.c
index 7e9d88f..a088ec6 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -305,7 +305,7 @@ int main(int argc, char **argv)
 	mode->callback(&cbdata);
 
 	gpiod_line_release_bulk(lines);
-	gpiod_chip_close(chip);
+	gpiod_chip_unref(chip);
 	gpiod_line_bulk_free(lines);
 	free(offsets);
 	free(values);
-- 
2.30.1

