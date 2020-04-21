Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3461B30EA
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2020 22:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgDUUDP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Apr 2020 16:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgDUUDO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Apr 2020 16:03:14 -0400
X-Greylist: delayed 1174 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 21 Apr 2020 13:03:14 PDT
Received: from mx0.chaotikum.eu (mx0.chaotikum.eu [IPv6:2a01:4f8:c2c:ce71::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 972ACC0610D5
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2020 13:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=chaotikum.eu; s=20200128.mx0; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=4J/uhBsmSueDf7J7UxCslOdDuBGcNwM5BVcK6qAbN/o=; b=N4LjhhEQ5EP0LHLRfZ0Z7uLRBY
        guXJwUZzuTx7ApVCFIc4d9d+8x83ZqDBNq3U+HuDR59IPRHbD0IWD3OIPxUR4aUmmJ8nQOEQdfqi5
        fMMuNtUH93vBJg+7gCBWEj8UibF3lxExig+zfjnK6jSdMwPC+lyhDceeo4N3HuK2IEhFeJ6LYu0x/
        zYPR6aDoiHKkiAJedDu1A5/LAW79OCL7lLIXRbLwl46mPwDk+Rrns6iRExXw6mVPKN50BkkvyR0rZ
        el6jq7HMe5mbV6v/GKGG0UhFXJhAjcQ18qQP4O6SgQ5ULvKscRawq3vn0GgicU9gqEl34y69bcvkf
        UTi64USRguAcXRqWlcqyapZ73zRVk4RaoqMPzIsGKOmLNOfyNKm7y5Kh79qEkjtKXL777jz8D2t/V
        yoEKwIEsLQljjvjpjr+fDlQtkAR6qdGy81vGvQCY9sT3ZhGT+X3NdRdBzwLqYWRt42A+iASSUA2Dd
        rvNPJkMT6yJKknQvj11yeF4qLZJmA0fhNV9K/m/vVTkO5p19ptNVDp1q+wTuy6XvK7XBZQwbJBPsk
        CKnUkiXuIB8x2H4wTaYa6NctZNtu4YRgGVd/davMRRcxz9Bd6oLGY8IDSpzolDEtVVmNWUPhbQ/yc
        M3PsZlAq5uPATpWf2f1TnXzcpm1XCTKK9TGz4H4GY=;
X-Spam-Action: no action
X-Spam-Bar: ++
X-Spam-Report: Action: no action
 Symbol: ARC_NA(0.00)
 Symbol: RCVD_VIA_SMTP_AUTH(0.00)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: RCVD_COUNT_ONE(0.00)
 Symbol: FROM_EQ_ENVFROM(0.00)
 Symbol: ASN(0.00)
 Symbol: FORGED_RECIPIENTS(2.00)
 Symbol: RCVD_TLS_ALL(0.00)
 Message-ID: 20200421194314.1305802-1-qsx@chaotikum.eu
X-Spam-Score: 2.9 (++)
Received: from xdsl-87-78-166-154.nc.de ([87.78.166.154]:60736 helo=coruscant.chaotikum.eu)
        by mx0.chaotikum.eu with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <qsx@chaotikum.eu>)
        id 1jQynx-0004WZ-GY; Tue, 21 Apr 2020 21:43:37 +0200
From:   Thomas Schneider <qsx@chaotikum.eu>
To:     linux-gpio@vger.kernel.org
Cc:     Thomas Schneider <qsx@chaotikum.eu>
Subject: [libgpiod PATCH] Fix documentation for newer Doxygen versions
Date:   Tue, 21 Apr 2020 21:43:14 +0200
Message-Id: <20200421194314.1305802-1-qsx@chaotikum.eu>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

- The various groups used to be named __some_thing__, which was turned into
  <strong>…</strong>.  A later stage of Doxygen barfed on that, and thus it
  generated some warnings, and all documentation was in a group called “strong”.
- The PERL_PATH config item has been deprecated.  Remove it.

Signed-off-by: Thomas Schneider <qsx@chaotikum.eu>
---
 Doxyfile               |  1 -
 bindings/cxx/gpiod.hpp |  2 +-
 include/gpiod.h        | 26 +++++++++++++-------------
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/Doxyfile b/Doxyfile
index b194095..d72a334 100644
--- a/Doxyfile
+++ b/Doxyfile
@@ -106,4 +106,3 @@ GENERATE_XML           = YES
 TAGFILES               =
 GENERATE_TAGFILE       =
 ALLEXTERNALS           = NO
-PERL_PATH              =
diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index 07f465f..3238e4c 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -24,7 +24,7 @@ class line_iter;
 class chip_iter;
 
 /**
- * @defgroup __gpiod_cxx__ C++ bindings
+ * @defgroup gpiod_cxx C++ bindings
  * @{
  */
 
diff --git a/include/gpiod.h b/include/gpiod.h
index 9820362..a03f44a 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -46,7 +46,7 @@ struct gpiod_line_iter;
 struct gpiod_line_bulk;
 
 /**
- * @defgroup __common__ Common helper macros
+ * @defgroup common Common helper macros
  * @{
  *
  * Commonly used utility macros.
@@ -77,7 +77,7 @@ struct gpiod_line_bulk;
 /**
  * @}
  *
- * @defgroup __high_level__ High-level API
+ * @defgroup high_level High-level API
  * @{
  *
  * Simple high-level routines for straightforward GPIO manipulation without
@@ -539,7 +539,7 @@ int gpiod_ctxless_find_line(const char *name, char *chipname,
 /**
  * @}
  *
- * @defgroup __chips__ GPIO chip operations
+ * @defgroup chips GPIO chip operations
  * @{
  *
  * Functions and data structures dealing with GPIO chips.
@@ -676,12 +676,12 @@ int gpiod_chip_find_lines(struct gpiod_chip *chip, const char **names,
 /**
  * @}
  *
- * @defgroup __lines__ GPIO line operations
+ * @defgroup lines GPIO line operations
  * @{
  *
  * Functions and data structures dealing with GPIO lines.
  *
- * @defgroup __line_bulk__ Operating on multiple lines
+ * @defgroup line_bulk Operating on multiple lines
  * @{
  *
  * Convenience data structures and helper functions for storing and operating
@@ -792,7 +792,7 @@ gpiod_line_bulk_num_lines(struct gpiod_line_bulk *bulk)
 /**
  * @}
  *
- * @defgroup __line_info__ Line info
+ * @defgroup line_info Line info
  * @{
  *
  * Definitions and functions for retrieving kernel information about both
@@ -938,7 +938,7 @@ gpiod_line_needs_update(struct gpiod_line *line) GPIOD_API GPIOD_DEPRECATED;
 /**
  * @}
  *
- * @defgroup __line_request__ Line requests
+ * @defgroup line_request Line requests
  * @{
  *
  * Interface for requesting GPIO lines from userspace for both values and
@@ -1266,7 +1266,7 @@ bool gpiod_line_is_free(struct gpiod_line *line) GPIOD_API;
 /**
  * @}
  *
- * @defgroup __line_value__ Reading & setting line values
+ * @defgroup line_value Reading & setting line values
  * @{
  *
  * Functions allowing to read and set GPIO line values for single lines and
@@ -1321,7 +1321,7 @@ int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk,
 /**
  * @}
  *
- * @defgroup __line_config__ Setting line configuration
+ * @defgroup line_config Setting line configuration
  * @{
  *
  * Functions allowing modification of config options of GPIO lines requested
@@ -1437,7 +1437,7 @@ int gpiod_line_set_direction_output_bulk(struct gpiod_line_bulk *bulk,
 /**
  * @}
  *
- * @defgroup __line_event__ Line events handling
+ * @defgroup line_event Line events handling
  * @{
  *
  * Structures and functions allowing to poll lines for events and read them,
@@ -1551,7 +1551,7 @@ int gpiod_line_event_read_fd_multiple(int fd, struct gpiod_line_event *events,
 /**
  * @}
  *
- * @defgroup __line_misc__ Misc line functions
+ * @defgroup line_misc Misc line functions
  * @{
  *
  * Functions that didn't fit anywhere else.
@@ -1604,7 +1604,7 @@ struct gpiod_chip *gpiod_line_get_chip(struct gpiod_line *line) GPIOD_API;
  *
  * @}
  *
- * @defgroup __iterators__ Iterators for GPIO chips and lines
+ * @defgroup iterators Iterators for GPIO chips and lines
  * @{
  *
  * These functions and data structures allow easy iterating over GPIO
@@ -1728,7 +1728,7 @@ gpiod_line_iter_next(struct gpiod_line_iter *iter) GPIOD_API;
 /**
  * @}
  *
- * @defgroup __misc__ Stuff that didn't fit anywhere else
+ * @defgroup misc Stuff that didn't fit anywhere else
  * @{
  *
  * Various libgpiod-related functions.
-- 
2.26.1

