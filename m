Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99CDE23F726
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Aug 2020 12:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgHHKAP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 8 Aug 2020 06:00:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbgHHKAM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 8 Aug 2020 06:00:12 -0400
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [IPv6:2001:67c:2050::465:202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5273C061756
        for <linux-gpio@vger.kernel.org>; Sat,  8 Aug 2020 03:00:11 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4BNyQG2whvzQkmD
        for <linux-gpio@vger.kernel.org>; Sat,  8 Aug 2020 12:00:06 +0200 (CEST)
Authentication-Results: spamfilter02.heinlein-hosting.de (amavisd-new);
        dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
        header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1596880804;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PV1Hn/WlD/sJxa47E1hgtDLytmZM5I85FSh903NMmic=;
        b=yqCpzd8fLntcMVeu4Z3G8SN75crKX5Wgn6RjNm1PruI4nHHUFC6NQ9771Qr0BZEb1fbQKJ
        5H2MQZ69jXMC+HCYIDm4rIGIZnYjqBR8lxBOj2h5+jtwxLmaFg7sBQZ4PA4/3brYRsA5Wl
        q/dOc/G00a94+tSWshQLaatd8oJQX/mLxP7wTQ9pJscpIU6Y1XxXJRnuG3clH6ll2X0ena
        ZuU+4kZwWNRBnxVBk3o+8qmtQnn89wUO8vgHvmPsb/iMjoGNE+PCtxByeC90sfNSqd9Cjw
        hXdYl+1hhrDvMoH4OWg90NkFiR9fI7Lcfb9BDhQk/g7T7YqeRNODRaaK9J5k/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:mime-version:references:in-reply-to
        :message-id:date:date:subject:subject:from:from:received; s=
        mail20150812; t=1596880803; bh=p+tt1BT/xADWhsfNGHUecc2oXHoRSX1w5
        fDRRK0s5+I=; b=udEaFCxuPoNrZwR2xU039QYGIN8Rz2biIRxrfkiXptUHyKtVC
        izYGWO01GZYaSUT50+N0AkBpyWoDqCII1toxjzF0DLg9RdpR5nWpZxxkfYVkfkkG
        mB9KhYP/NDDseQTQ13jy4S+ct9Y5kwgwa0/jKOZAFE0lrl+IxXL47sKVJjLIy7RA
        VDU+PCipalubCVr9XpSPiysrZeVvPbP9nSfDVWIKLBC32wAmTteaDFNFPrqRYnty
        0UCJxWDsMN7rwWXpNBSgV4Fvcjn4+ygWi6KmVHco/8KeZYDwSq4eWZVwLcvGTLq5
        5uUrJCg/BRfXBClWQMziHGYvTm6RjkoRRqzIQ==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de [80.241.56.116]) (amavisd-new, port 10030)
        with ESMTP id UnMgxq9EBw1b; Sat,  8 Aug 2020 12:00:03 +0200 (CEST)
From:   Alexander Stein <alexander.stein@mailbox.org>
To:     linux-gpio@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@mailbox.org>
Subject: [libgpiod] [PATCH 1/5] doc: Fix doxygen warnings
Date:   Sat,  8 Aug 2020 11:59:40 +0200
Message-Id: <20200808095944.188479-2-alexander.stein@mailbox.org>
In-Reply-To: <20200808095944.188479-1-alexander.stein@mailbox.org>
References: <20200808095944.188479-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -5.40 / 15.00 / 15.00
X-Rspamd-Queue-Id: 7A6EB17BE
X-Rspamd-UID: d3d1c8
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Apparently __<name>__ is not supported for @defgroup commands. This results
in the following warning (printed multiple time):
gpiod.h:79: warning: group strong: ignoring title ">high_level</strong> High-level
API" that does not match old title ">common</strong> Common helper macros"
Also the module list is broken.

Fix this my removing the underscores.

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
 bindings/cxx/gpiod.hpp |  2 +-
 include/gpiod.h        | 26 +++++++++++++-------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index 5155bdd..59719aa 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -24,7 +24,7 @@ class chip_iter;
 struct line_event;
 
 /**
- * @defgroup __gpiod_cxx__ C++ bindings
+ * @defgroup gpiod_cxx C++ bindings
  * @{
  */
 
diff --git a/include/gpiod.h b/include/gpiod.h
index c83ebf7..58de66f 100644
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
@@ -548,7 +548,7 @@ int gpiod_ctxless_find_line(const char *name, char *chipname,
 /**
  * @}
  *
- * @defgroup __chips__ GPIO chip operations
+ * @defgroup chips GPIO chip operations
  * @{
  *
  * Functions and data structures dealing with GPIO chips.
@@ -691,12 +691,12 @@ int gpiod_chip_find_lines(struct gpiod_chip *chip, const char **names,
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
@@ -807,7 +807,7 @@ gpiod_line_bulk_num_lines(struct gpiod_line_bulk *bulk)
 /**
  * @}
  *
- * @defgroup __line_info__ Line info
+ * @defgroup line_info Line info
  * @{
  *
  * Definitions and functions for retrieving kernel information about both
@@ -955,7 +955,7 @@ gpiod_line_needs_update(struct gpiod_line *line) GPIOD_API GPIOD_DEPRECATED;
 /**
  * @}
  *
- * @defgroup __line_request__ Line requests
+ * @defgroup line_request Line requests
  * @{
  *
  * Interface for requesting GPIO lines from userspace for both values and
@@ -1283,7 +1283,7 @@ bool gpiod_line_is_free(struct gpiod_line *line) GPIOD_API;
 /**
  * @}
  *
- * @defgroup __line_value__ Reading & setting line values
+ * @defgroup line_value Reading & setting line values
  * @{
  *
  * Functions allowing to read and set GPIO line values for single lines and
@@ -1338,7 +1338,7 @@ int gpiod_line_set_value_bulk(struct gpiod_line_bulk *bulk,
 /**
  * @}
  *
- * @defgroup __line_config__ Setting line configuration
+ * @defgroup line_config Setting line configuration
  * @{
  *
  * Functions allowing modification of config options of GPIO lines requested
@@ -1454,7 +1454,7 @@ int gpiod_line_set_direction_output_bulk(struct gpiod_line_bulk *bulk,
 /**
  * @}
  *
- * @defgroup __line_event__ Line events handling
+ * @defgroup line_event Line events handling
  * @{
  *
  * Structures and functions allowing to poll lines for events and read them,
@@ -1568,7 +1568,7 @@ int gpiod_line_event_read_fd_multiple(int fd, struct gpiod_line_event *events,
 /**
  * @}
  *
- * @defgroup __line_misc__ Misc line functions
+ * @defgroup line_misc Misc line functions
  * @{
  *
  * Functions that didn't fit anywhere else.
@@ -1624,7 +1624,7 @@ struct gpiod_chip *gpiod_line_get_chip(struct gpiod_line *line) GPIOD_API;
  *
  * @}
  *
- * @defgroup __iterators__ Iterators for GPIO chips and lines
+ * @defgroup iterators Iterators for GPIO chips and lines
  * @{
  *
  * These functions and data structures allow easy iterating over GPIO
@@ -1748,7 +1748,7 @@ gpiod_line_iter_next(struct gpiod_line_iter *iter) GPIOD_API;
 /**
  * @}
  *
- * @defgroup __misc__ Stuff that didn't fit anywhere else
+ * @defgroup misc Stuff that didn't fit anywhere else
  * @{
  *
  * Various libgpiod-related functions.
-- 
2.28.0

