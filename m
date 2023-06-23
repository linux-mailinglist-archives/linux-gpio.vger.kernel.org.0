Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80EF373AF7D
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jun 2023 06:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbjFWEjl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jun 2023 00:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231281AbjFWEja (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jun 2023 00:39:30 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 708112126
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 21:39:25 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-38c35975545so164082b6e.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jun 2023 21:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687495164; x=1690087164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aoK00yeec6APSg9Ik1QujBFi/HkkdEKRwbIwZAAu4Cs=;
        b=WMKzgAZovnacf/xXuRAWLGzCq3wdv1okMb+W0FxjTM/SNdEbB0tIq/7DpO8ItP7L3i
         QsnNptVRaW2IkSUgZSJWjt1L5NBd2WIY2FjJBmYJu14jALzq/+VorP4ktuEwI4MAr+iy
         3+0nP+dL96SP8SitTccUC0s0GEZV1ar9iTNB9ln6HWz30u3EYh2QvhOCgAx/apbRCA/N
         tGJvo3MJkWi3nUqxB3oFZJvVNMrX9Njrw7t5pknXLPpHD1pky4lPhcNoasgOdJe28lML
         HceopcnLhz2RJHydgoFwnhhA0I849YZk0UdDdjJxcZgkQN4z2Y+5PvOBQ5p1N7t2dP3H
         tbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687495164; x=1690087164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aoK00yeec6APSg9Ik1QujBFi/HkkdEKRwbIwZAAu4Cs=;
        b=hzTBR/Z3IVqD/2YTD9VaZFO3t54IvL+Rqx5elzusPj4+h40x6dgz1qFl/svfL2EK/x
         HsWn0jq7ubtsmk9azBh0aQxsO9UXi/vTrYVjX/LDoHPX5b/YwUYX7N/N0Sn18cBpgHjt
         WLbvrEqFNX0RX4Y33Jatf3FSmpFHSGsqK8R6zMPs//oYd7YiG6X3DdOqqspLUJRXw0CD
         I0Z2hoS3Zy8YY6InHCuuDvzCqkPc07DW8qVWpFSQzFs6uVBpFI5yxirnupqB28EltrGZ
         0+/lRzuUqHVcf4p9jmdPPcYI18T9xSHfqFqD9C/C1eRFDaGdtHgNSKlvvqdUdFCh4Cd2
         U15w==
X-Gm-Message-State: AC+VfDwML0o0UGs+qXImOEul3gF6IsZWIDLhV+K5lyWzuNqy3HpP2aH6
        Ug30f2k06xC2oVh+49crG4rtmJYSHSc=
X-Google-Smtp-Source: ACHHUZ5Fk1+BI3KO5dAOlbpnecnccoWfc4La/Yk3O7wd0+iR1W5j2yfKvj3ADa7GW2exJBHKn2Dbmg==
X-Received: by 2002:a05:6808:2007:b0:39e:b986:6601 with SMTP id q7-20020a056808200700b0039eb9866601mr14347462oiw.28.1687495164631;
        Thu, 22 Jun 2023 21:39:24 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id q23-20020a17090ad39700b0025c2c398d33sm509463pju.39.2023.06.22.21.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 21:39:24 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 1/8] core: examples: consistency cleanups
Date:   Fri, 23 Jun 2023 12:38:54 +0800
Message-ID: <20230623043901.16764-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230623043901.16764-1-warthog618@gmail.com>
References: <20230623043901.16764-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A collection of minor cleanups to make the examples more consistent and
ease the addition of more examples:
 - reformat Makefile.am to simplify adding more examples
 - add line offset to value output
 - remove commas from edge event output
 - replace while(1) with for (;;)
 - fix a typo in Makefile.am
 - fix an error handling goto in toggle_line_value.c

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 examples/Makefile.am              |  8 ++++++--
 examples/async_watch_line_value.c |  6 +++---
 examples/get_line_value.c         | 11 +++++++----
 examples/toggle_line_value.c      | 17 ++++++++++-------
 examples/watch_line_value.c       |  6 +++---
 5 files changed, 29 insertions(+), 19 deletions(-)

diff --git a/examples/Makefile.am b/examples/Makefile.am
index 4ad124b..55dfe39 100644
--- a/examples/Makefile.am
+++ b/examples/Makefile.am
@@ -6,12 +6,16 @@ AM_CFLAGS += -Wall -Wextra -g -std=gnu89
 
 LDADD = $(top_builddir)/lib/libgpiod.la
 
-bin_PROGRAMS = async_watch_line_value get_line_value toggle_line_value watch_line_value
+noinst_PROGRAMS = \
+	async_watch_line_value \
+	get_line_value \
+	toggle_line_value \
+	watch_line_value
 
 async_watch_line_value_SOURCES = async_watch_line_value.c
 
 get_line_value_SOURCES = get_line_value.c
 
-toggle_line_valuer_SOURCES = toggle_line_value.c
+toggle_line_value_SOURCES = toggle_line_value.c
 
 watch_line_value_SOURCES = watch_line_value.c
diff --git a/examples/async_watch_line_value.c b/examples/async_watch_line_value.c
index 3292dda..f35fb1a 100644
--- a/examples/async_watch_line_value.c
+++ b/examples/async_watch_line_value.c
@@ -74,7 +74,7 @@ static const char *edge_event_type_str(struct gpiod_edge_event *event)
 {
 	switch (gpiod_edge_event_get_event_type(event)) {
 	case GPIOD_EDGE_EVENT_RISING_EDGE:
-		return "Rising ";
+		return "Rising";
 	case GPIOD_EDGE_EVENT_FALLING_EDGE:
 		return "Falling";
 	default:
@@ -117,7 +117,7 @@ int main(void)
 	pollfd.fd = gpiod_line_request_get_fd(request);
 	pollfd.events = POLLIN;
 
-	while (1) {
+	for (;;) {
 		ret = poll(&pollfd, 1, -1);
 		if (ret == -1) {
 			fprintf(stderr, "error waiting for edge events: %s\n",
@@ -134,7 +134,7 @@ int main(void)
 		for (i = 0; i < ret; i++) {
 			event = gpiod_edge_event_buffer_get_event(event_buffer,
 								  i);
-			printf("offset: %d, type: %s, event #%ld\n",
+			printf("offset: %d  type: %-7s  event #%ld\n",
 			       gpiod_edge_event_get_line_offset(event),
 			       edge_event_type_str(event),
 			       gpiod_edge_event_get_line_seqno(event));
diff --git a/examples/get_line_value.c b/examples/get_line_value.c
index 08e263a..1de9901 100644
--- a/examples/get_line_value.c
+++ b/examples/get_line_value.c
@@ -64,12 +64,12 @@ close_chip:
 	return request;
 }
 
-static int print_value(enum gpiod_line_value value)
+static int print_value(unsigned int offset, enum gpiod_line_value value)
 {
 	if (value == GPIOD_LINE_VALUE_ACTIVE)
-		printf("Active\n");
+		printf("%d=Active\n", offset);
 	else if (value == GPIOD_LINE_VALUE_INACTIVE) {
-		printf("Inactive\n");
+		printf("%d=Inactive\n", offset);
 	} else {
 		fprintf(stderr, "error reading value: %s\n",
 			strerror(errno));
@@ -97,7 +97,10 @@ int main(void)
 	}
 
 	value = gpiod_line_request_get_value(request, line_offset);
-	ret = print_value(value);
+	ret = print_value(line_offset, value);
+
+	/* not strictly required here, but if the app wasn't exiting... */
+	gpiod_line_request_release(request);
 
 	return ret;
 }
diff --git a/examples/toggle_line_value.c b/examples/toggle_line_value.c
index 63d7fb9..6e522d6 100644
--- a/examples/toggle_line_value.c
+++ b/examples/toggle_line_value.c
@@ -40,7 +40,7 @@ request_output_line(const char *chip_path, unsigned int offset,
 	ret = gpiod_line_config_add_line_settings(line_cfg, &offset, 1,
 						  settings);
 	if (ret)
-		goto free_settings;
+		goto free_line_config;
 
 	if (consumer) {
 		req_cfg = gpiod_request_config_new();
@@ -72,12 +72,15 @@ static enum gpiod_line_value toggle_line_value(enum gpiod_line_value value)
 						    GPIOD_LINE_VALUE_ACTIVE;
 }
 
-static void print_value(enum gpiod_line_value value)
+static const char * value_str(enum gpiod_line_value value)
 {
 	if (value == GPIOD_LINE_VALUE_ACTIVE)
-		printf("Active\n");
-	else
-		printf("Inactive\n");
+		return "Active";
+	else if (value == GPIOD_LINE_VALUE_INACTIVE) {
+		return "Inactive";
+	} else {
+		return "Unknown";
+	}
 }
 
 int main(void)
@@ -97,8 +100,8 @@ int main(void)
 		return EXIT_FAILURE;
 	}
 
-	while (1) {
-		print_value(value);
+	for (;;) {
+		printf("%d=%s\n", line_offset, value_str(value));
 		sleep(1);
 		value = toggle_line_value(value);
 		gpiod_line_request_set_value(request, line_offset, value);
diff --git a/examples/watch_line_value.c b/examples/watch_line_value.c
index d962f20..879b09b 100644
--- a/examples/watch_line_value.c
+++ b/examples/watch_line_value.c
@@ -73,7 +73,7 @@ static const char *edge_event_type_str(struct gpiod_edge_event *event)
 {
 	switch (gpiod_edge_event_get_event_type(event)) {
 	case GPIOD_EDGE_EVENT_RISING_EDGE:
-		return "Rising ";
+		return "Rising";
 	case GPIOD_EDGE_EVENT_FALLING_EDGE:
 		return "Falling";
 	default:
@@ -112,7 +112,7 @@ int main(void)
 		return EXIT_FAILURE;
 	}
 
-	while (1) {
+	for (;;) {
 		/* Blocks until at least one event is available. */
 		ret = gpiod_line_request_read_edge_events(request, event_buffer,
 							  event_buf_size);
@@ -124,7 +124,7 @@ int main(void)
 		for (i = 0; i < ret; i++) {
 			event = gpiod_edge_event_buffer_get_event(event_buffer,
 								  i);
-			printf("offset: %d, type: %s, event #%ld\n",
+			printf("offset: %d  type: %-7s  event #%ld\n",
 			       gpiod_edge_event_get_line_offset(event),
 			       edge_event_type_str(event),
 			       gpiod_edge_event_get_line_seqno(event));
-- 
2.41.0

