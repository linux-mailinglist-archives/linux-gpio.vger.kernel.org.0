Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0387572F349
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jun 2023 05:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231878AbjFNDzE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jun 2023 23:55:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbjFNDzD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jun 2023 23:55:03 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF81C2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 20:55:01 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-54f87d5f1abso1733232a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jun 2023 20:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686714896; x=1689306896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPEVNoMAUXuTCCovRsFfa/0BThxmBEVnBPBOpQtkC4M=;
        b=r//pll9V4wIN0d5LdPb3gUhPGkm6aNggMCQXBUXGjK1YQoUifjy29jlNT4JMAVQ5AH
         Hwd5Bw4VNrkXt75i6Km/GJuKjgCFYLv0Zko6/4WP+dxfkjOdYWqmtDNzh0VtDOaZvisK
         12BeH5DeOmgZazyU+XBEvBeFXSwV4oKce5FzpvSdXwGwqn4m7CiBq2OigEjdFFqmM60O
         I8XtBsG+gVk863Lq+/aw+nyuivlqZii+92k9uOe9YQ10eL74hIZ9jFj2bH8x2e+Cak/c
         s0tUqF5UZRp7UYq2VTP38hm1uvj1FjHQNkWNf5hoS2S9lKV59Kjx5j14SnQ5cKbs8twH
         MRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686714896; x=1689306896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPEVNoMAUXuTCCovRsFfa/0BThxmBEVnBPBOpQtkC4M=;
        b=jj7bPkafdEKEeXS7Eo68xqgGPDhajL7LsB5rg5lxQ82TjPUiMPKQIycJqc/U7bjEHE
         tldkLJsF4uwzYBtgvoUOOGLOOiNvvhw/UVSGJNzBNJunhqS3fLBCFlPNVO90Yx3mPJbU
         tKuOXJL2i1TWO147r4MWGVvGAHfzHhvHfwteTP4N53CWnBqj9wc7GbAI/TctRnwn/Kad
         //FC6H+CNBlRqB7bRYRGKqaTZmAIwalmwrhwqAbtRAhQY5AlIaksLyCSpIPW6gEzK6cJ
         DXkyCWlOVg92n7FNlXEGBJWx5Gz3HGwvKBFsDYRs5ApOr5LBi0pwvOddWiKyx3HLyg3k
         Z8VQ==
X-Gm-Message-State: AC+VfDxKfBQXjktPjURoxkedS5LF/vX7YcsEIIE38KvCGS2y8GN3Md/Y
        xEYMrzs399V6uwqBC7E4dEC//or3GSY=
X-Google-Smtp-Source: ACHHUZ65v24yGZ9jMXs5fR7A7Jb+ANw49aE+E8U42C/HlplBKSXcW4hekxyC2zqK6PaL/9bShBT1jA==
X-Received: by 2002:a05:6a21:2c8a:b0:10f:500b:18a2 with SMTP id ua10-20020a056a212c8a00b0010f500b18a2mr361478pzb.48.1686714895743;
        Tue, 13 Jun 2023 20:54:55 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id l12-20020a170903120c00b001ae6fe84244sm10967412plh.243.2023.06.13.20.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 20:54:55 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 1/4] core: examples: add dedicated examples
Date:   Wed, 14 Jun 2023 11:54:23 +0800
Message-Id: <20230614035426.15097-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614035426.15097-1-warthog618@gmail.com>
References: <20230614035426.15097-1-warthog618@gmail.com>
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

The tools have served as example code, but have become too complicated
to serve that purpose.

Add a set of examples that have no purpose other than providing minimal
examples of common use cases.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 Makefile.am                       |   6 ++
 configure.ac                      |   1 +
 examples/.gitignore               |   7 ++
 examples/Makefile.am              |  17 ++++
 examples/async_watch_line_value.c | 136 ++++++++++++++++++++++++++++++
 examples/get_line_value.c         |  97 +++++++++++++++++++++
 examples/toggle_line_value.c      | 106 +++++++++++++++++++++++
 examples/watch_line_value.c       | 127 ++++++++++++++++++++++++++++
 8 files changed, 497 insertions(+)
 create mode 100644 examples/.gitignore
 create mode 100644 examples/Makefile.am
 create mode 100644 examples/async_watch_line_value.c
 create mode 100644 examples/get_line_value.c
 create mode 100644 examples/toggle_line_value.c
 create mode 100644 examples/watch_line_value.c

diff --git a/Makefile.am b/Makefile.am
index 10d6a9a..941d7e8 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -16,6 +16,12 @@ EXTRA_DIST = \
 	LICENSES/LGPL-3.0-or-later.txt \
 	LICENSES/BSD-3-Clause.txt
 
+if WITH_EXAMPLES
+
+SUBDIRS += examples
+
+endif
+
 if WITH_TOOLS
 
 SUBDIRS += tools man
diff --git a/configure.ac b/configure.ac
index c1005a9..dde2fa5 100644
--- a/configure.ac
+++ b/configure.ac
@@ -268,6 +268,7 @@ AC_CONFIG_FILES([Makefile
 		 lib/Makefile
 		 lib/libgpiod.pc
 		 contrib/Makefile
+		 examples/Makefile
 		 tools/Makefile
 		 tests/Makefile
 		 tests/gpiosim/Makefile
diff --git a/examples/.gitignore b/examples/.gitignore
new file mode 100644
index 0000000..bdfde9a
--- /dev/null
+++ b/examples/.gitignore
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+async_watch_line_value
+get_line_value
+toggle_line_value
+watch_line_value
diff --git a/examples/Makefile.am b/examples/Makefile.am
new file mode 100644
index 0000000..4ad124b
--- /dev/null
+++ b/examples/Makefile.am
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+AM_CFLAGS = -I$(top_srcdir)/include/ -include $(top_builddir)/config.h
+AM_CFLAGS += -Wall -Wextra -g -std=gnu89
+
+LDADD = $(top_builddir)/lib/libgpiod.la
+
+bin_PROGRAMS = async_watch_line_value get_line_value toggle_line_value watch_line_value
+
+async_watch_line_value_SOURCES = async_watch_line_value.c
+
+get_line_value_SOURCES = get_line_value.c
+
+toggle_line_valuer_SOURCES = toggle_line_value.c
+
+watch_line_value_SOURCES = watch_line_value.c
diff --git a/examples/async_watch_line_value.c b/examples/async_watch_line_value.c
new file mode 100644
index 0000000..de15c97
--- /dev/null
+++ b/examples/async_watch_line_value.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of asynchronously watching for edges on a single line */
+
+#include <errno.h>
+#include <gpiod.h>
+#include <poll.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+/* request a line as input with edge detection */
+struct gpiod_line_request *request_input_line(const char *chip_path,
+					      unsigned int offset,
+					      const char *consumer)
+{
+	struct gpiod_line_settings *settings;
+	struct gpiod_line_request *request = NULL;
+	struct gpiod_request_config *req_cfg = NULL;
+	struct gpiod_line_config *line_cfg;
+	struct gpiod_chip *chip;
+	int ret;
+
+	chip = gpiod_chip_open(chip_path);
+	if (!chip)
+		return NULL;
+
+	settings = gpiod_line_settings_new();
+	if (!settings)
+		goto close_chip;
+
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
+	/* assume a button connecting the pin to ground, so pull it up... */
+	gpiod_line_settings_set_bias(settings, GPIOD_LINE_BIAS_PULL_UP);
+	/* ... and provide some debounce. */
+	gpiod_line_settings_set_debounce_period_us(settings, 10000);
+
+	line_cfg = gpiod_line_config_new();
+	if (!line_cfg)
+		goto free_settings;
+
+	ret = gpiod_line_config_add_line_settings(line_cfg, &offset, 1,
+						  settings);
+	if (ret)
+		goto free_line_config;
+
+	if (consumer) {
+		req_cfg = gpiod_request_config_new();
+		if (!req_cfg)
+			goto free_line_config;
+
+		gpiod_request_config_set_consumer(req_cfg, consumer);
+	}
+
+	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+
+	gpiod_request_config_free(req_cfg);
+free_line_config:
+	gpiod_line_config_free(line_cfg);
+free_settings:
+	gpiod_line_settings_free(settings);
+close_chip:
+	gpiod_chip_close(chip);
+
+	return request;
+}
+
+const char *edge_event_type_str(struct gpiod_edge_event *event)
+{
+	enum gpiod_edge_event_type eet = gpiod_edge_event_get_event_type(event);
+
+	if (eet == GPIOD_EDGE_EVENT_RISING_EDGE)
+		return "Rising ";
+	if (eet == GPIOD_EDGE_EVENT_FALLING_EDGE)
+		return "Falling";
+	return "Unknown";
+}
+
+int main(void)
+{
+	struct gpiod_line_request *request;
+	struct gpiod_edge_event_buffer *event_buffer;
+	struct gpiod_edge_event *event;
+	struct pollfd pollfd;
+	int i, ret, event_buf_size;
+	/* example configuration - customize to suit your situation */
+	const char *chip_path = "/dev/gpiochip0";
+	int line_offset = 5;
+
+	request = request_input_line(chip_path, line_offset,
+				     "async-watch-line-value");
+	if (!request) {
+		fprintf(stderr, "failed to request line: %s\n",
+			strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	/* a larger buffer is an optimisation for reading bursts of events from
+	 * the kernel, but that is not necessary in this case, so 1 is fine.
+	 */
+	event_buf_size = 1;
+	event_buffer = gpiod_edge_event_buffer_new(event_buf_size);
+	if (!event_buffer) {
+		fprintf(stderr, "failed to create event buffer: %s\n",
+			strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	pollfd.fd = gpiod_line_request_get_fd(request);
+	pollfd.events = POLLIN;
+	while (1) {
+		ret = poll(&pollfd, 1, -1);
+		if (ret == -1) {
+			fprintf(stderr, "error waiting for edge events: %s\n",
+				strerror(errno));
+			return EXIT_FAILURE;
+		}
+		ret = gpiod_line_request_read_edge_events(request, event_buffer,
+							  event_buf_size);
+		if (ret == -1) {
+			fprintf(stderr, "error reading edge events: %s\n",
+				strerror(errno));
+			return EXIT_FAILURE;
+		}
+		for (i = 0; i < ret; i++) {
+			event = gpiod_edge_event_buffer_get_event(event_buffer,
+								  i);
+			printf("offset: %d, type: %s, event #%ld\n",
+			       gpiod_edge_event_get_line_offset(event),
+			       edge_event_type_str(event),
+			       gpiod_edge_event_get_line_seqno(event));
+		}
+	}
+}
diff --git a/examples/get_line_value.c b/examples/get_line_value.c
new file mode 100644
index 0000000..fc96a5b
--- /dev/null
+++ b/examples/get_line_value.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of reading a single line. */
+
+#include <errno.h>
+#include <gpiod.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+/* request a line as input */
+struct gpiod_line_request *request_input_line(const char *chip_path,
+					      unsigned int offset,
+					      const char *consumer)
+{
+	struct gpiod_line_settings *settings;
+	struct gpiod_line_request *request = NULL;
+	struct gpiod_request_config *req_cfg = NULL;
+	struct gpiod_line_config *line_cfg;
+	struct gpiod_chip *chip;
+	int ret;
+
+	chip = gpiod_chip_open(chip_path);
+	if (!chip)
+		return NULL;
+
+	settings = gpiod_line_settings_new();
+	if (!settings)
+		goto close_chip;
+
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
+
+	line_cfg = gpiod_line_config_new();
+	if (!line_cfg)
+		goto free_settings;
+
+	ret = gpiod_line_config_add_line_settings(line_cfg, &offset, 1,
+						  settings);
+	if (ret)
+		goto free_line_config;
+
+	if (consumer) {
+		req_cfg = gpiod_request_config_new();
+		if (!req_cfg)
+			goto free_line_config;
+
+		gpiod_request_config_set_consumer(req_cfg, consumer);
+	}
+
+	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+
+	gpiod_request_config_free(req_cfg);
+free_line_config:
+	gpiod_line_config_free(line_cfg);
+free_settings:
+	gpiod_line_settings_free(settings);
+close_chip:
+	gpiod_chip_close(chip);
+
+	return request;
+}
+
+int print_value(enum gpiod_line_value value)
+{
+	if (value == GPIOD_LINE_VALUE_ACTIVE)
+		printf("Active\n");
+	else if (value == GPIOD_LINE_VALUE_INACTIVE) {
+		printf("Inactive\n");
+	} else {
+		fprintf(stderr, "error reading value: %s\n",
+			strerror(errno));
+		return EXIT_FAILURE;
+	}
+	return EXIT_SUCCESS;
+}
+
+int main(void)
+{
+	struct gpiod_line_request *request;
+	enum gpiod_line_value value;
+	int ret;
+	/* example configuration - customize to suit your situation */
+	const char *chip_path = "/dev/gpiochip0";
+	int line_offset = 5;
+
+	request = request_input_line(chip_path, line_offset, "get-line-value");
+	if (!request) {
+		fprintf(stderr, "failed to request line: %s\n",
+			strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	value = gpiod_line_request_get_value(request, line_offset);
+	ret = print_value(value);
+	return ret;
+}
diff --git a/examples/toggle_line_value.c b/examples/toggle_line_value.c
new file mode 100644
index 0000000..ada163e
--- /dev/null
+++ b/examples/toggle_line_value.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of toggling a single line. */
+
+#include <errno.h>
+#include <gpiod.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+struct gpiod_line_request *request_output_line(const char *chip_path,
+					       unsigned int offset,
+					       enum gpiod_line_value value,
+					       const char *consumer)
+{
+	struct gpiod_line_settings *settings;
+	struct gpiod_line_request *request = NULL;
+	struct gpiod_request_config *req_cfg = NULL;
+	struct gpiod_line_config *line_cfg;
+	struct gpiod_chip *chip;
+	int ret;
+
+	chip = gpiod_chip_open(chip_path);
+	if (!chip)
+		return NULL;
+
+	settings = gpiod_line_settings_new();
+	if (!settings)
+		goto close_chip;
+
+	gpiod_line_settings_set_direction(settings,
+					  GPIOD_LINE_DIRECTION_OUTPUT);
+	gpiod_line_settings_set_output_value(settings, value);
+
+	line_cfg = gpiod_line_config_new();
+	if (!line_cfg)
+		goto free_settings;
+
+	ret = gpiod_line_config_add_line_settings(line_cfg, &offset, 1,
+						  settings);
+	if (ret)
+		goto free_settings;
+
+	if (consumer) {
+		req_cfg = gpiod_request_config_new();
+		if (!req_cfg)
+			goto free_line_config;
+
+		gpiod_request_config_set_consumer(req_cfg, consumer);
+	}
+
+	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+
+	gpiod_request_config_free(req_cfg);
+free_line_config:
+	gpiod_line_config_free(line_cfg);
+free_settings:
+	gpiod_line_settings_free(settings);
+close_chip:
+	gpiod_chip_close(chip);
+
+	return request;
+}
+
+enum gpiod_line_value toggle_line_value(enum gpiod_line_value value)
+{
+	return (value == GPIOD_LINE_VALUE_ACTIVE) ? GPIOD_LINE_VALUE_INACTIVE :
+						    GPIOD_LINE_VALUE_ACTIVE;
+}
+
+void print_value(enum gpiod_line_value value)
+{
+	if (value == GPIOD_LINE_VALUE_ACTIVE)
+		printf("Active\n");
+	else
+		printf("Inactive\n");
+}
+
+int main(void)
+{
+	struct gpiod_line_request *request;
+	enum gpiod_line_value value = GPIOD_LINE_VALUE_ACTIVE;
+	/* example configuration - customize to suit your situation */
+	const char *chip_path = "/dev/gpiochip0";
+	int line_offset = 5;
+
+	request = request_output_line(chip_path, line_offset, value,
+				      "toggle-line-value");
+	if (!request) {
+		fprintf(stderr, "failed to request line: %s\n",
+			strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	while (1) {
+		print_value(value);
+		sleep(1);
+		value = toggle_line_value(value);
+		gpiod_line_request_set_value(request, line_offset, value);
+	}
+
+	gpiod_line_request_release(request);
+	return EXIT_SUCCESS;
+}
diff --git a/examples/watch_line_value.c b/examples/watch_line_value.c
new file mode 100644
index 0000000..011943e
--- /dev/null
+++ b/examples/watch_line_value.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
+
+/* Minimal example of watching for edges on a single line. */
+
+#include <errno.h>
+#include <gpiod.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+/* request a line as input with edge detection */
+struct gpiod_line_request *request_input_line(const char *chip_path,
+					      unsigned int offset,
+					      const char *consumer)
+{
+	struct gpiod_line_settings *settings;
+	struct gpiod_line_request *request = NULL;
+	struct gpiod_request_config *req_cfg = NULL;
+	struct gpiod_line_config *line_cfg;
+	struct gpiod_chip *chip;
+	int ret;
+
+	chip = gpiod_chip_open(chip_path);
+	if (!chip)
+		return NULL;
+
+	settings = gpiod_line_settings_new();
+	if (!settings)
+		goto close_chip;
+
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_edge_detection(settings, GPIOD_LINE_EDGE_BOTH);
+	/* assume a button connecting the pin to ground, so pull it up... */
+	gpiod_line_settings_set_bias(settings, GPIOD_LINE_BIAS_PULL_UP);
+	/* ... and provide some debounce. */
+	gpiod_line_settings_set_debounce_period_us(settings, 10000);
+
+	line_cfg = gpiod_line_config_new();
+	if (!line_cfg)
+		goto free_settings;
+
+	ret = gpiod_line_config_add_line_settings(line_cfg, &offset, 1,
+						  settings);
+	if (ret)
+		goto free_line_config;
+
+	if (consumer) {
+		req_cfg = gpiod_request_config_new();
+		if (!req_cfg)
+			goto free_line_config;
+
+		gpiod_request_config_set_consumer(req_cfg, consumer);
+	}
+
+	request = gpiod_chip_request_lines(chip, req_cfg, line_cfg);
+
+	gpiod_request_config_free(req_cfg);
+free_line_config:
+	gpiod_line_config_free(line_cfg);
+free_settings:
+	gpiod_line_settings_free(settings);
+close_chip:
+	gpiod_chip_close(chip);
+
+	return request;
+}
+
+const char *edge_event_type_str(struct gpiod_edge_event *event)
+{
+	enum gpiod_edge_event_type eet = gpiod_edge_event_get_event_type(event);
+
+	if (eet == GPIOD_EDGE_EVENT_RISING_EDGE)
+		return "Rising ";
+	if (eet == GPIOD_EDGE_EVENT_FALLING_EDGE)
+		return "Falling";
+	return "Unknown";
+}
+
+int main(void)
+{
+	struct gpiod_line_request *request;
+	struct gpiod_edge_event_buffer *event_buffer;
+	struct gpiod_edge_event *event;
+	int i, ret, event_buf_size;
+	/* example configuration - customize to suit your situation */
+	const char *chip_path = "/dev/gpiochip0";
+	int line_offset = 5;
+
+	request = request_input_line(chip_path, line_offset,
+				     "watch-line-value");
+	if (!request) {
+		fprintf(stderr, "failed to request line: %s\n",
+			strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	/* a larger buffer is an optimisation for reading bursts of events from
+	 * the kernel, but that is not necessary in this case, so 1 is fine.
+	 */
+	event_buf_size = 1;
+	event_buffer = gpiod_edge_event_buffer_new(event_buf_size);
+	if (!event_buffer) {
+		fprintf(stderr, "failed to create event buffer: %s\n",
+			strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	while (1) {
+		/* blocks until at least one event is available */
+		ret = gpiod_line_request_read_edge_events(request, event_buffer,
+							  event_buf_size);
+		if (ret == -1) {
+			fprintf(stderr, "error reading edge events: %s\n",
+				strerror(errno));
+			return EXIT_FAILURE;
+		}
+		for (i = 0; i < ret; i++) {
+			event = gpiod_edge_event_buffer_get_event(event_buffer,
+								  i);
+			printf("offset: %d, type: %s, event #%ld\n",
+			       gpiod_edge_event_get_line_offset(event),
+			       edge_event_type_str(event),
+			       gpiod_edge_event_get_line_seqno(event));
+		}
+	}
+}
-- 
2.40.1

