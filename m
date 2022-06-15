Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB67D54C604
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jun 2022 12:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237884AbiFOK0Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jun 2022 06:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235119AbiFOK0P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2022 06:26:15 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64D4F387B4
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 03:26:14 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id s12so22301743ejx.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 03:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=EmkszcqMBBGb1OdTUkLSlyQ821UY1SMh3X7FzjT1xOY=;
        b=C3zTY81tZvxuplpN0hxMvdeadqDsWg7dxtVJRGa/6z6ZDXoJyll1p9exDczfsFS6dF
         PpSQaX8TWq5kzhhJLU3VOfHN7Hzm5j0WoRF2Bu2n5coRTAoSOyDwk7UBXGVyYKOerkTe
         pxojttFUcIMjNqkpALXHZJ1Ks2bT+ihNbQyBe2zeW4VEvGXoQAaB26HoHGUJ6D74P5xb
         D44K+PoS7bBXcjpeySNJARRgE2cBhmHrrXbdsoiTGeFfAW77OUd7knVjdWKR+dNiw2WN
         Gqlvcux1LhDo8KHHJphhWlBPYslK0NWH7sORKuk23i1WGNIQoqqz0MPjG82j1uPYy8DS
         NJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=EmkszcqMBBGb1OdTUkLSlyQ821UY1SMh3X7FzjT1xOY=;
        b=o8zfm0bS1OhoFlfx/HGr21JjXyiqbjEK04IhEIFtXDcMwih3Mp3NRiP91LPkYbtU6x
         MTY66nVVVMPPB/IopBS+0nGJY4CCSYy430asHhWwElHEsNf/s+ubz4MkEimAmCuxacrN
         I6mgDbNoUx4yRi9fBkiJh7naKr3mHXNwh8zL95Lt7+ZiOZIuMaGqzzIkrud2VtW/C3+I
         pklemqAUdKzinO9pGiaPIjzaSNFph4IGa36UMrbq3DEBQNR9oWfAzvw0Z/fhnphBM4+J
         1veRlCTdh4c6OTdhZEbMoZZA7U/NY8A/iMCDUOzYyMGeZWxTb9qduWEWd+YEo74N4CRi
         EI+w==
X-Gm-Message-State: AOAM533JhgRfxsi4UwBaTTMIXBpfScXrwVMd1WKYpa80vEsrcc6aC3km
        8FhrNf8A4EwPaot3L2rhkOo3F5uvElWMdw==
X-Google-Smtp-Source: ABdhPJzvrj2dRU0qcK2OujZ3/6V7DAdAXck3obnligUjwZaeMcZgCm128EFaoHaVdZYFJWQ8+zlGQg==
X-Received: by 2002:a17:907:d24:b0:712:1c03:c04 with SMTP id gn36-20020a1709070d2400b007121c030c04mr8205799ejc.375.1655288772679;
        Wed, 15 Jun 2022 03:26:12 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id k24-20020a1709062a5800b006f3ef214dcdsm6137927eje.51.2022.06.15.03.26.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jun 2022 03:26:12 -0700 (PDT)
From:   yegorslists@googlemail.com
To:     linux-gpio@vger.kernel.org
Cc:     brgl@bgdev.pl, Yegor Yefremov <yegorslists@googlemail.com>
Subject: [libgpiod][PATCH] treewide: fix typos found with codespell
Date:   Wed, 15 Jun 2022 12:26:08 +0200
Message-Id: <20220615102608.11230-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 NEWS                                     | 6 +++---
 bindings/cxx/gpiod.hpp                   | 2 +-
 bindings/python/tests/gpiomockupmodule.c | 2 +-
 include/gpiod.h                          | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/NEWS b/NEWS
index c843c3c..0e173f8 100644
--- a/NEWS
+++ b/NEWS
@@ -52,7 +52,7 @@ New features:
 
 Improvements:
 - constified function arguments where applicable in libgpiomockup
-- fixed the name of the test exeucutable displayed at build time
+- fixed the name of the test executable displayed at build time
 - improved the function pointer casting in Python bindings to avoid warnings
   emitted by GCC8
 - switched to using the KERNEL_VERSION() macro in tests instead of handcoded
@@ -65,7 +65,7 @@ Improvements:
   using it to set the pull of dummy lines
 - add several new test cases
 - improved Python example programs (made gpiomon's output similar to the
-  original tool, make gpioset wait for an ENTER pres by default)
+  original tool, make gpioset wait for an ENTER press by default)
 - fixed the major:minor number comparison between the device and sysfs
 - deprecated the gpiod_line_needs_update() function and removed the logic
   behind it from the library
@@ -233,7 +233,7 @@ Bug fixes:
   gpioget
 - fix a line test case: don't use open-drain or open-source flags for input
   mode
-- fix the flags passed to ar in order to supress a build warning
+- fix the flags passed to ar in order to suppress a build warning
 - set the last error code in gpiod_chip_open_by_label() to ENOENT if a chip
   can't be found
 - fix checking the kernel version in the test suite
diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index e3ce2fc..87ecf41 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -282,7 +282,7 @@ public:
 
 	/**
 	 * @brief Get the offset of this line.
-	 * @return Offet of this line.
+	 * @return Offset of this line.
 	 */
 	unsigned int offset(void) const;
 
diff --git a/bindings/python/tests/gpiomockupmodule.c b/bindings/python/tests/gpiomockupmodule.c
index 761d431..46737c2 100644
--- a/bindings/python/tests/gpiomockupmodule.c
+++ b/bindings/python/tests/gpiomockupmodule.c
@@ -61,7 +61,7 @@ static PyObject *gpiomockup_Mockup_probe(gpiomockup_MockupObject *self,
 		return NULL;
 	} else if (num_chips == 0) {
 		PyErr_SetString(PyExc_TypeError,
-				"Number of chips must be greater thatn 0");
+				"Number of chips must be greater than 0");
 		return NULL;
 	}
 
diff --git a/include/gpiod.h b/include/gpiod.h
index a4ce01f..6a20a7d 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -114,7 +114,7 @@ unsigned int gpiod_chip_get_num_lines(struct gpiod_chip *chip);
  * @brief Get the handle to the GPIO line at given offset.
  * @param chip The GPIO chip object.
  * @param offset The offset of the GPIO line.
- * @return Pointer to the GPIO line handle or NULL if an error occured.
+ * @return Pointer to the GPIO line handle or NULL if an error occurred.
  */
 struct gpiod_line *
 gpiod_chip_get_line(struct gpiod_chip *chip, unsigned int offset);
-- 
2.17.0

