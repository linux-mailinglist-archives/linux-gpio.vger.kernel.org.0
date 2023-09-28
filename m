Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D44367B1FD3
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 16:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbjI1Ohi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 10:37:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbjI1Ohh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 10:37:37 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5EDBF9
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 07:37:35 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5333fb34be3so15778442a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 07:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695911854; x=1696516654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nl271QbtK8eF3rZh9aQr3lSeAmlYw2FvavGVw4unDuc=;
        b=LJw4gKTct4Vye+Ig7rRCrTtwkXod3dLXzZ2DtZvVWXOpCdv3k2dXjRRxo8eWJ+vhkg
         SRwBIAZ5f2Y9A2VLR9Wfj+M/Gg4Do64Iey6nD8PAxajQUuQwNFUSHoHWG61YvZlL2e4q
         WUzwZu1duYeSmUdhEH7WeXgdDR6kRPNhT8Hp0106utk9q8zjAjh6RDOHBT7aA6aSZ3Sa
         r6ltIRmFFzEgwDgIkHILuvRRjrK+fXMpsWO68oPSlNDW+vJN2CCts68tPvjllG5Gh7Co
         40nIM8gmdjvdDwmquEwrltS8Wbn19gpTNhMzQ3LU1ZI/YFmxZDiq0aJjZaAPdFC2W+om
         Jqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695911854; x=1696516654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nl271QbtK8eF3rZh9aQr3lSeAmlYw2FvavGVw4unDuc=;
        b=jdDqafmVfUvUrAOf0pFaA19l6Y5lnHHBQpKdg0Y7PqShZhTtsoQuKbICmX/rr+/ffh
         TRTq1cV7zvTS40MVPDA2BuyW2RsvuAQ7cvX7Od9T9cZQYDpECxwhINzzARObc2TT8cDB
         q5zd3SraYFWvPQvqXM3n87n9dChYNr0gwqObwkbgeEYhDfKr/KIiqSCRfGOaE2G8vXAy
         Nz+Gro6dJwi3TgdttFp7p4qGEGq7Sl7j7lcuXMB0b83Gtfwp18Rbo46Ux5h/w/mGxc/C
         kKoaF89AFZH42FB+yL9w/CGs9UvVJezx9lAVrySD2Q2iRPoRvu0KClS16uBVN5RtGHNm
         9lhQ==
X-Gm-Message-State: AOJu0YzfRiF9bHaemxfKAjQkmRlVfKsXM+KLd7SfExsYJfX/Wt7Kiacg
        ZFezaFuquZJfXnF8oo6WqLS6sw==
X-Google-Smtp-Source: AGHT+IGPS680xZ4SwUNqKBK5poyvE7e1wCmMUmc6Jd+PJeL0zEmtZQ4zO9WvBNquT2fW81jlbIn3Uw==
X-Received: by 2002:a50:fa85:0:b0:534:63e:d0b7 with SMTP id w5-20020a50fa85000000b00534063ed0b7mr1467350edr.23.1695911854353;
        Thu, 28 Sep 2023 07:37:34 -0700 (PDT)
Received: from [192.168.1.149] (i5C7438D4.versanet.de. [92.116.56.212])
        by smtp.gmail.com with ESMTPSA id d15-20020aa7d68f000000b005333922efb0sm9789688edr.78.2023.09.28.07.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 07:37:33 -0700 (PDT)
From:   Erik Schilling <erik.schilling@linaro.org>
Date:   Thu, 28 Sep 2023 16:37:29 +0200
Subject: [libgpiod][PATCH 2/3] doc: document thread safety guarantees
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230928-rust-send-trait-v1-2-30b4f59d13cb@linaro.org>
References: <20230928-rust-send-trait-v1-0-30b4f59d13cb@linaro.org>
In-Reply-To: <20230928-rust-send-trait-v1-0-30b4f59d13cb@linaro.org>
To:     Linux-GPIO <linux-gpio@vger.kernel.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695911851; l=2954;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=nR+zmqX4gKUQnG4QTHQSoiq4soz1CDiTU5rpMkJ4r7I=;
 b=NJi17dwY4kast7Ihi30zb7HHrHjW2fRS+MiKPdoAj7lhyuVjOY57AsAfPkQ4o6oGWES8NfzAx
 SiSP6kGOHTLDJU08VDMh2Aykykgdaj2LEcHpF5CFqbOPZ5sh5G9gvPL
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This mostly adds the information from the linked thread to the doxygen
documentation.

Summarized:
- libgpiod object's require synchronization
- individual objects may be used concurrently by different threds

Link: https://lore.kernel.org/r/CVHO091CC80Y.3KUOSLSOBVL0T@ablu-work
Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 include/gpiod.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/gpiod.h b/include/gpiod.h
index be51c3a..d86c6ac 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -42,6 +42,14 @@ extern "C" {
  * methods that take a pointer as any of the subsequent arguments, the handling
  * of a NULL-pointer depends on the implementation and may range from gracefully
  * handling it, ignoring it or returning an error.
+ *
+ * libgpiod is thread-aware but does not provide any further thread-safety
+ * guarantees. This requires the user to ensure that at most one thread may
+ * work with an object at any time. Sharing objects across threads is allowed
+ * if a suitable synchronization mechanism serializes the access. Different,
+ * standalone objects can safely be used concurrently. Most libgpiod objects
+ * are standalone. Exceptions - such as events allocated in buffers - exist and
+ * are noted in the documentation.
  */
 
 /**
@@ -624,6 +632,12 @@ uint64_t gpiod_info_event_get_timestamp_ns(struct gpiod_info_event *event);
  * @return Returns a pointer to the line-info object associated with the event.
  *         The object lifetime is tied to the event object, so the pointer must
  *         be not be freed by the caller.
+ * @warning Thread-safety:
+ *          Since the line-info object is tied to the event, different threads
+ *          may not operate on the event and line-info at the same time. The
+ *          line-info can be copied using ::gpiod_line_info_copy in order to
+ *          create a standalone object - which then may safely be used from a
+ *          different thread concurrently.
  */
 struct gpiod_line_info *
 gpiod_info_event_get_line_info(struct gpiod_info_event *event);
@@ -1297,6 +1311,12 @@ void gpiod_edge_event_buffer_free(struct gpiod_edge_event_buffer *buffer);
  * @return Pointer to an event stored in the buffer. The lifetime of the
  *         event is tied to the buffer object. Users must not free the event
  *         returned by this function.
+ * @warning Thread-safety:
+ *          Since events are tied to the buffer instance, different threads
+ *          may not operate on the buffer and any associated events at the same
+ *          time. Events can be copied using ::gpiod_edge_event_copy in order
+ *          to create a standalone objects - which each may safely be used from
+ *          a different thread concurrently.
  */
 struct gpiod_edge_event *
 gpiod_edge_event_buffer_get_event(struct gpiod_edge_event_buffer *buffer,

-- 
2.41.0

